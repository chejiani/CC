package edu.jxau.cjn.schedule.config;

import com.dangdang.ddframe.job.api.simple.SimpleJob;
import com.dangdang.ddframe.job.config.JobCoreConfiguration;
import com.dangdang.ddframe.job.config.simple.SimpleJobConfiguration;
import com.dangdang.ddframe.job.event.JobEventConfiguration;
import com.dangdang.ddframe.job.lite.api.JobScheduler;
import com.dangdang.ddframe.job.lite.config.LiteJobConfiguration;
import com.dangdang.ddframe.job.lite.spring.api.SpringJobScheduler;
import com.dangdang.ddframe.job.reg.zookeeper.ZookeeperRegistryCenter;
import edu.jxau.cjn.schedule.job.BidJob;
import edu.jxau.cjn.schedule.job.OrderCancelJob;
import edu.jxau.cjn.service.order.BidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 分布式作业统一配置。配置所有分片的作业和调度器实例
 */
@Configuration
public class JobConfig {

    @Autowired
    private ZookeeperRegistryCenter regCenter;

    @Autowired
    private JobEventConfiguration jobEventConfiguration;

    @Bean(value = "bidJob")
    public SimpleJob bidJob() {
        return new BidJob();
    }

    @Bean(value = "orderCancelJob")
    public SimpleJob orderCancelJob(){
        return new OrderCancelJob();
    }

    @Bean(initMethod = "init")
    public JobScheduler bidJobScheduler(@Autowired @Qualifier(value = "bidJob") final SimpleJob bidJob, @Value("${simpleJob.cron}") final String cron,
                                        @Value("${simpleJob.shardingTotalCount}") final int shardingTotalCount,
                                        @Value("${simpleJob.shardingItemParameters}") final String shardingItemParameters) {
        return new SpringJobScheduler(bidJob, regCenter, getLiteJobConfiguration(bidJob.getClass(),
                cron, shardingTotalCount, shardingItemParameters), jobEventConfiguration);
    }

    @Bean(initMethod = "init")
    public JobScheduler orderCancelJobScheduler(@Autowired @Qualifier(value = "orderCancelJob")  final SimpleJob orderCancelJob, @Value("${simpleJob.cron}") final String cron,
                                        @Value("${simpleJob.shardingTotalCount}") final int shardingTotalCount,
                                        @Value("${simpleJob.shardingItemParameters}") final String shardingItemParameters) {
        return new SpringJobScheduler(orderCancelJob, regCenter, getLiteJobConfiguration(orderCancelJob.getClass(),
                cron, shardingTotalCount, shardingItemParameters), jobEventConfiguration);
    }

    private LiteJobConfiguration getLiteJobConfiguration(final Class<? extends SimpleJob> jobClass, final String cron,
                                                         final int shardingTotalCount, final String shardingItemParameters) {
        JobCoreConfiguration jobCoreConfiguration = JobCoreConfiguration.newBuilder(
                jobClass.getName(), cron, shardingTotalCount)
                .shardingItemParameters(shardingItemParameters)
                .build();
        SimpleJobConfiguration simpleJobConfiguration = new SimpleJobConfiguration(jobCoreConfiguration,
                jobClass.getCanonicalName());
        return LiteJobConfiguration.newBuilder(simpleJobConfiguration)
                .overwrite(true)
                .build();
    }

}

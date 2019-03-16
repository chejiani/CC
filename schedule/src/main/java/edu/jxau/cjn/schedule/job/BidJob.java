package edu.jxau.cjn.schedule.job;

import com.dangdang.ddframe.job.api.ShardingContext;
import com.dangdang.ddframe.job.api.simple.SimpleJob;
import edu.jxau.cjn.service.order.BidService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 竞拍作业。操作完成竞拍的商品生成最后的订单
 */
public class BidJob implements SimpleJob {

    @Autowired
    private BidService bidService;

    @Override
    public void execute(ShardingContext shardingContext) {
        // TODO 生成竞拍订单
        System.out.println("in this, will be do something");
    }

}

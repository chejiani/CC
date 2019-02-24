package edu.jxau.cjn.schedule.job;

import com.dangdang.ddframe.job.api.ShardingContext;
import com.dangdang.ddframe.job.api.simple.SimpleJob;

public class ShipJob implements SimpleJob {

    @Override
    public void execute(ShardingContext shardingContext) {
        // TODO 发货
    }

}

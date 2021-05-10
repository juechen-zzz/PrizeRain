package com.itheima.prize.job.task;

import com.dangdang.ddframe.job.api.ShardingContext;
import com.dangdang.ddframe.job.api.simple.SimpleJob;
import com.itheima.prize.job.annotation.ElasticSimpleJob;
import com.itheima.prize.job.annotation.ElasticSimpleJob;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

/**
 * 分片调度测试
 * ribbon调度测试
 * 启动多个实例，会发现不同分片运行到不同实例上
 * 关闭后，分片被重新调度到存活的机器
 * 证明elastic-job是分布式的，可分片的。
 */
@ElasticSimpleJob(cron = "0/1 * * * * ?",
        jobName = "firstJob",
        shardingTotalCount = 2,
        jobParameter = "测试参数",
        shardingItemParameters = "0=A,1=B",
        dataSource = "datasource")
//@Component
public class MyJob implements SimpleJob {

    @Autowired
    RestTemplate template;

    @Override
    public void execute(ShardingContext shardingContext) {
        System.out.println(String.format("jobtest------>Thread ID: %s, 任务总片数: %s, " +
                        "当前分片项: %s,当前参数: %s," +
                        "当前任务名称: %s,当前任务参数: %s,"+
                        "当前任务的id: %s"
                ,
                //获取当前线程的id
                Thread.currentThread().getId(),
                //获取任务总片数
                shardingContext.getShardingTotalCount(),
                //获取当前分片项
                shardingContext.getShardingItem(),
                //获取当前的参数
                shardingContext.getShardingParameter(),
                //获取当前的任务名称
                shardingContext.getJobName(),
                //获取当前任务参数
                shardingContext.getJobParameter(),
                //获取任务的id
                shardingContext.getTaskId()
        ));

    }
}

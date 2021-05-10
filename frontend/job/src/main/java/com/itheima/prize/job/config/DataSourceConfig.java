package com.itheima.prize.job.config;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * 描述
 *
 * @ProjectName: framework_v2_idea2
 * @Package: com.itheima.prize.job.config
 * @ClassName: DataSourceConfig
 * @Author: JackWang
 * @CreateDate: 2019/1/11 0011 9:40
 * @UpdateUser: JackWang
 * @UpdateDate: 2019/1/11 0011 9:40
 * @Version: 1.0
 */
@Configuration
public class DataSourceConfig {

    @Bean("datasource")
    @ConfigurationProperties("spring.datasource")
    public DataSource dataSourceTow(){
        return DruidDataSourceBuilder.create().build();
    }
}
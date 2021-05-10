package com.itheima.prize.job.annotation;

import org.springframework.core.annotation.AliasFor;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
public @interface ElasticSimpleJob {

    @AliasFor("cron")
    public abstract String value() default "";

    @AliasFor("value")
    public abstract String cron() default "";

    public abstract String jobName() default "";

    public abstract int shardingTotalCount() default 1;

    public abstract String shardingItemParameters() default "";

    public abstract String jobParameter() default "";

    public abstract String dataSource() default "";

    public abstract String description() default "";

    public abstract boolean disabled() default false;

    public abstract boolean overwrite() default true;
}

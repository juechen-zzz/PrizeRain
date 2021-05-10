package com.itheima.prize.commons.db.mapper;

import com.itheima.prize.commons.db.entity.JobExecutionLog;
import com.itheima.prize.commons.db.entity.JobExecutionLogExample;
import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

public interface JobExecutionLogMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table JOB_EXECUTION_LOG
     *
     * @mbg.generated
     */
    long countByExample(JobExecutionLogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table JOB_EXECUTION_LOG
     *
     * @mbg.generated
     */
    int deleteByExample(JobExecutionLogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table JOB_EXECUTION_LOG
     *
     * @mbg.generated
     */
    @Delete({
        "delete from JOB_EXECUTION_LOG",
        "where id = #{id,jdbcType=VARCHAR}"
    })
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table JOB_EXECUTION_LOG
     *
     * @mbg.generated
     */
    @Insert({
        "insert into JOB_EXECUTION_LOG (job_name, task_id, ",
        "hostname, ip, sharding_item, ",
        "execution_source, failure_cause, ",
        "is_success, start_time, ",
        "complete_time)",
        "values (#{jobName,jdbcType=VARCHAR}, #{taskId,jdbcType=VARCHAR}, ",
        "#{hostname,jdbcType=VARCHAR}, #{ip,jdbcType=VARCHAR}, #{shardingItem,jdbcType=INTEGER}, ",
        "#{executionSource,jdbcType=VARCHAR}, #{failureCause,jdbcType=VARCHAR}, ",
        "#{isSuccess,jdbcType=INTEGER}, #{startTime,jdbcType=TIMESTAMP}, ",
        "#{completeTime,jdbcType=TIMESTAMP})"
    })
    @SelectKey(statement="SELECT LAST_INSERT_ID()", keyProperty="id", before=false, resultType=String.class)
    int insert(JobExecutionLog record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table JOB_EXECUTION_LOG
     *
     * @mbg.generated
     */
    int insertSelective(JobExecutionLog record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table JOB_EXECUTION_LOG
     *
     * @mbg.generated
     */
    List<JobExecutionLog> selectByExample(JobExecutionLogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table JOB_EXECUTION_LOG
     *
     * @mbg.generated
     */
    @Select({
        "select",
        "id, job_name, task_id, hostname, ip, sharding_item, execution_source, failure_cause, ",
        "is_success, start_time, complete_time",
        "from JOB_EXECUTION_LOG",
        "where id = #{id,jdbcType=VARCHAR}"
    })
    @ResultMap("com.itheima.prize.commons.db.mapper.JobExecutionLogMapper.BaseResultMap")
    JobExecutionLog selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table JOB_EXECUTION_LOG
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") JobExecutionLog record, @Param("example") JobExecutionLogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table JOB_EXECUTION_LOG
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") JobExecutionLog record, @Param("example") JobExecutionLogExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table JOB_EXECUTION_LOG
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(JobExecutionLog record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table JOB_EXECUTION_LOG
     *
     * @mbg.generated
     */
    @Update({
        "update JOB_EXECUTION_LOG",
        "set job_name = #{jobName,jdbcType=VARCHAR},",
          "task_id = #{taskId,jdbcType=VARCHAR},",
          "hostname = #{hostname,jdbcType=VARCHAR},",
          "ip = #{ip,jdbcType=VARCHAR},",
          "sharding_item = #{shardingItem,jdbcType=INTEGER},",
          "execution_source = #{executionSource,jdbcType=VARCHAR},",
          "failure_cause = #{failureCause,jdbcType=VARCHAR},",
          "is_success = #{isSuccess,jdbcType=INTEGER},",
          "start_time = #{startTime,jdbcType=TIMESTAMP},",
          "complete_time = #{completeTime,jdbcType=TIMESTAMP}",
        "where id = #{id,jdbcType=VARCHAR}"
    })
    int updateByPrimaryKey(JobExecutionLog record);
}
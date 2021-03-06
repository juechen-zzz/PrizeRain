package com.itheima.prize.commons.db.entity;

import java.io.Serializable;
import java.util.Date;

public class JobStatusTraceLog implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column JOB_STATUS_TRACE_LOG.id
     *
     * @mbg.generated
     */
    private String id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column JOB_STATUS_TRACE_LOG.job_name
     *
     * @mbg.generated
     */
    private String jobName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column JOB_STATUS_TRACE_LOG.original_task_id
     *
     * @mbg.generated
     */
    private String originalTaskId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column JOB_STATUS_TRACE_LOG.task_id
     *
     * @mbg.generated
     */
    private String taskId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column JOB_STATUS_TRACE_LOG.slave_id
     *
     * @mbg.generated
     */
    private String slaveId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column JOB_STATUS_TRACE_LOG.source
     *
     * @mbg.generated
     */
    private String source;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column JOB_STATUS_TRACE_LOG.execution_type
     *
     * @mbg.generated
     */
    private String executionType;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column JOB_STATUS_TRACE_LOG.sharding_item
     *
     * @mbg.generated
     */
    private String shardingItem;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column JOB_STATUS_TRACE_LOG.state
     *
     * @mbg.generated
     */
    private String state;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column JOB_STATUS_TRACE_LOG.message
     *
     * @mbg.generated
     */
    private String message;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column JOB_STATUS_TRACE_LOG.creation_time
     *
     * @mbg.generated
     */
    private Date creationTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table JOB_STATUS_TRACE_LOG
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column JOB_STATUS_TRACE_LOG.id
     *
     * @return the value of JOB_STATUS_TRACE_LOG.id
     *
     * @mbg.generated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column JOB_STATUS_TRACE_LOG.id
     *
     * @param id the value for JOB_STATUS_TRACE_LOG.id
     *
     * @mbg.generated
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column JOB_STATUS_TRACE_LOG.job_name
     *
     * @return the value of JOB_STATUS_TRACE_LOG.job_name
     *
     * @mbg.generated
     */
    public String getJobName() {
        return jobName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column JOB_STATUS_TRACE_LOG.job_name
     *
     * @param jobName the value for JOB_STATUS_TRACE_LOG.job_name
     *
     * @mbg.generated
     */
    public void setJobName(String jobName) {
        this.jobName = jobName == null ? null : jobName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column JOB_STATUS_TRACE_LOG.original_task_id
     *
     * @return the value of JOB_STATUS_TRACE_LOG.original_task_id
     *
     * @mbg.generated
     */
    public String getOriginalTaskId() {
        return originalTaskId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column JOB_STATUS_TRACE_LOG.original_task_id
     *
     * @param originalTaskId the value for JOB_STATUS_TRACE_LOG.original_task_id
     *
     * @mbg.generated
     */
    public void setOriginalTaskId(String originalTaskId) {
        this.originalTaskId = originalTaskId == null ? null : originalTaskId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column JOB_STATUS_TRACE_LOG.task_id
     *
     * @return the value of JOB_STATUS_TRACE_LOG.task_id
     *
     * @mbg.generated
     */
    public String getTaskId() {
        return taskId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column JOB_STATUS_TRACE_LOG.task_id
     *
     * @param taskId the value for JOB_STATUS_TRACE_LOG.task_id
     *
     * @mbg.generated
     */
    public void setTaskId(String taskId) {
        this.taskId = taskId == null ? null : taskId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column JOB_STATUS_TRACE_LOG.slave_id
     *
     * @return the value of JOB_STATUS_TRACE_LOG.slave_id
     *
     * @mbg.generated
     */
    public String getSlaveId() {
        return slaveId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column JOB_STATUS_TRACE_LOG.slave_id
     *
     * @param slaveId the value for JOB_STATUS_TRACE_LOG.slave_id
     *
     * @mbg.generated
     */
    public void setSlaveId(String slaveId) {
        this.slaveId = slaveId == null ? null : slaveId.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column JOB_STATUS_TRACE_LOG.source
     *
     * @return the value of JOB_STATUS_TRACE_LOG.source
     *
     * @mbg.generated
     */
    public String getSource() {
        return source;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column JOB_STATUS_TRACE_LOG.source
     *
     * @param source the value for JOB_STATUS_TRACE_LOG.source
     *
     * @mbg.generated
     */
    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column JOB_STATUS_TRACE_LOG.execution_type
     *
     * @return the value of JOB_STATUS_TRACE_LOG.execution_type
     *
     * @mbg.generated
     */
    public String getExecutionType() {
        return executionType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column JOB_STATUS_TRACE_LOG.execution_type
     *
     * @param executionType the value for JOB_STATUS_TRACE_LOG.execution_type
     *
     * @mbg.generated
     */
    public void setExecutionType(String executionType) {
        this.executionType = executionType == null ? null : executionType.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column JOB_STATUS_TRACE_LOG.sharding_item
     *
     * @return the value of JOB_STATUS_TRACE_LOG.sharding_item
     *
     * @mbg.generated
     */
    public String getShardingItem() {
        return shardingItem;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column JOB_STATUS_TRACE_LOG.sharding_item
     *
     * @param shardingItem the value for JOB_STATUS_TRACE_LOG.sharding_item
     *
     * @mbg.generated
     */
    public void setShardingItem(String shardingItem) {
        this.shardingItem = shardingItem == null ? null : shardingItem.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column JOB_STATUS_TRACE_LOG.state
     *
     * @return the value of JOB_STATUS_TRACE_LOG.state
     *
     * @mbg.generated
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column JOB_STATUS_TRACE_LOG.state
     *
     * @param state the value for JOB_STATUS_TRACE_LOG.state
     *
     * @mbg.generated
     */
    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column JOB_STATUS_TRACE_LOG.message
     *
     * @return the value of JOB_STATUS_TRACE_LOG.message
     *
     * @mbg.generated
     */
    public String getMessage() {
        return message;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column JOB_STATUS_TRACE_LOG.message
     *
     * @param message the value for JOB_STATUS_TRACE_LOG.message
     *
     * @mbg.generated
     */
    public void setMessage(String message) {
        this.message = message == null ? null : message.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column JOB_STATUS_TRACE_LOG.creation_time
     *
     * @return the value of JOB_STATUS_TRACE_LOG.creation_time
     *
     * @mbg.generated
     */
    public Date getCreationTime() {
        return creationTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column JOB_STATUS_TRACE_LOG.creation_time
     *
     * @param creationTime the value for JOB_STATUS_TRACE_LOG.creation_time
     *
     * @mbg.generated
     */
    public void setCreationTime(Date creationTime) {
        this.creationTime = creationTime;
    }
}
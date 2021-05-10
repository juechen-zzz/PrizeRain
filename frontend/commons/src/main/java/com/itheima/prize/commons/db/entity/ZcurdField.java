package com.itheima.prize.commons.db.entity;

import java.io.Serializable;
import java.util.Date;

public class ZcurdField implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.id
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.head_id
     *
     * @mbg.generated
     */
    private Integer headId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.field_name
     *
     * @mbg.generated
     */
    private String fieldName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.column_name
     *
     * @mbg.generated
     */
    private String columnName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.column_length
     *
     * @mbg.generated
     */
    private Integer columnLength;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.data_type
     *
     * @mbg.generated
     */
    private String dataType;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.input_type
     *
     * @mbg.generated
     */
    private String inputType;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.is_show_list
     *
     * @mbg.generated
     */
    private Integer isShowList;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.is_allow_detail
     *
     * @mbg.generated
     */
    private Integer isAllowDetail;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.is_allow_add
     *
     * @mbg.generated
     */
    private Integer isAllowAdd;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.is_allow_update
     *
     * @mbg.generated
     */
    private Integer isAllowUpdate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.is_search
     *
     * @mbg.generated
     */
    private Integer isSearch;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.is_allow_null
     *
     * @mbg.generated
     */
    private Integer isAllowNull;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.dict_sql
     *
     * @mbg.generated
     */
    private String dictSql;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.order_num
     *
     * @mbg.generated
     */
    private Integer orderNum;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.search_type
     *
     * @mbg.generated
     */
    private Integer searchType;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.is_sum
     *
     * @mbg.generated
     */
    private Integer isSum;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.default_value
     *
     * @mbg.generated
     */
    private String defaultValue;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column zcurd_field.create_time
     *
     * @mbg.generated
     */
    private Date createTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table zcurd_field
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.id
     *
     * @return the value of zcurd_field.id
     *
     * @mbg.generated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.id
     *
     * @param id the value for zcurd_field.id
     *
     * @mbg.generated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.head_id
     *
     * @return the value of zcurd_field.head_id
     *
     * @mbg.generated
     */
    public Integer getHeadId() {
        return headId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.head_id
     *
     * @param headId the value for zcurd_field.head_id
     *
     * @mbg.generated
     */
    public void setHeadId(Integer headId) {
        this.headId = headId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.field_name
     *
     * @return the value of zcurd_field.field_name
     *
     * @mbg.generated
     */
    public String getFieldName() {
        return fieldName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.field_name
     *
     * @param fieldName the value for zcurd_field.field_name
     *
     * @mbg.generated
     */
    public void setFieldName(String fieldName) {
        this.fieldName = fieldName == null ? null : fieldName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.column_name
     *
     * @return the value of zcurd_field.column_name
     *
     * @mbg.generated
     */
    public String getColumnName() {
        return columnName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.column_name
     *
     * @param columnName the value for zcurd_field.column_name
     *
     * @mbg.generated
     */
    public void setColumnName(String columnName) {
        this.columnName = columnName == null ? null : columnName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.column_length
     *
     * @return the value of zcurd_field.column_length
     *
     * @mbg.generated
     */
    public Integer getColumnLength() {
        return columnLength;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.column_length
     *
     * @param columnLength the value for zcurd_field.column_length
     *
     * @mbg.generated
     */
    public void setColumnLength(Integer columnLength) {
        this.columnLength = columnLength;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.data_type
     *
     * @return the value of zcurd_field.data_type
     *
     * @mbg.generated
     */
    public String getDataType() {
        return dataType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.data_type
     *
     * @param dataType the value for zcurd_field.data_type
     *
     * @mbg.generated
     */
    public void setDataType(String dataType) {
        this.dataType = dataType == null ? null : dataType.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.input_type
     *
     * @return the value of zcurd_field.input_type
     *
     * @mbg.generated
     */
    public String getInputType() {
        return inputType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.input_type
     *
     * @param inputType the value for zcurd_field.input_type
     *
     * @mbg.generated
     */
    public void setInputType(String inputType) {
        this.inputType = inputType == null ? null : inputType.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.is_show_list
     *
     * @return the value of zcurd_field.is_show_list
     *
     * @mbg.generated
     */
    public Integer getIsShowList() {
        return isShowList;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.is_show_list
     *
     * @param isShowList the value for zcurd_field.is_show_list
     *
     * @mbg.generated
     */
    public void setIsShowList(Integer isShowList) {
        this.isShowList = isShowList;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.is_allow_detail
     *
     * @return the value of zcurd_field.is_allow_detail
     *
     * @mbg.generated
     */
    public Integer getIsAllowDetail() {
        return isAllowDetail;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.is_allow_detail
     *
     * @param isAllowDetail the value for zcurd_field.is_allow_detail
     *
     * @mbg.generated
     */
    public void setIsAllowDetail(Integer isAllowDetail) {
        this.isAllowDetail = isAllowDetail;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.is_allow_add
     *
     * @return the value of zcurd_field.is_allow_add
     *
     * @mbg.generated
     */
    public Integer getIsAllowAdd() {
        return isAllowAdd;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.is_allow_add
     *
     * @param isAllowAdd the value for zcurd_field.is_allow_add
     *
     * @mbg.generated
     */
    public void setIsAllowAdd(Integer isAllowAdd) {
        this.isAllowAdd = isAllowAdd;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.is_allow_update
     *
     * @return the value of zcurd_field.is_allow_update
     *
     * @mbg.generated
     */
    public Integer getIsAllowUpdate() {
        return isAllowUpdate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.is_allow_update
     *
     * @param isAllowUpdate the value for zcurd_field.is_allow_update
     *
     * @mbg.generated
     */
    public void setIsAllowUpdate(Integer isAllowUpdate) {
        this.isAllowUpdate = isAllowUpdate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.is_search
     *
     * @return the value of zcurd_field.is_search
     *
     * @mbg.generated
     */
    public Integer getIsSearch() {
        return isSearch;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.is_search
     *
     * @param isSearch the value for zcurd_field.is_search
     *
     * @mbg.generated
     */
    public void setIsSearch(Integer isSearch) {
        this.isSearch = isSearch;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.is_allow_null
     *
     * @return the value of zcurd_field.is_allow_null
     *
     * @mbg.generated
     */
    public Integer getIsAllowNull() {
        return isAllowNull;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.is_allow_null
     *
     * @param isAllowNull the value for zcurd_field.is_allow_null
     *
     * @mbg.generated
     */
    public void setIsAllowNull(Integer isAllowNull) {
        this.isAllowNull = isAllowNull;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.dict_sql
     *
     * @return the value of zcurd_field.dict_sql
     *
     * @mbg.generated
     */
    public String getDictSql() {
        return dictSql;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.dict_sql
     *
     * @param dictSql the value for zcurd_field.dict_sql
     *
     * @mbg.generated
     */
    public void setDictSql(String dictSql) {
        this.dictSql = dictSql == null ? null : dictSql.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.order_num
     *
     * @return the value of zcurd_field.order_num
     *
     * @mbg.generated
     */
    public Integer getOrderNum() {
        return orderNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.order_num
     *
     * @param orderNum the value for zcurd_field.order_num
     *
     * @mbg.generated
     */
    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.search_type
     *
     * @return the value of zcurd_field.search_type
     *
     * @mbg.generated
     */
    public Integer getSearchType() {
        return searchType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.search_type
     *
     * @param searchType the value for zcurd_field.search_type
     *
     * @mbg.generated
     */
    public void setSearchType(Integer searchType) {
        this.searchType = searchType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.is_sum
     *
     * @return the value of zcurd_field.is_sum
     *
     * @mbg.generated
     */
    public Integer getIsSum() {
        return isSum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.is_sum
     *
     * @param isSum the value for zcurd_field.is_sum
     *
     * @mbg.generated
     */
    public void setIsSum(Integer isSum) {
        this.isSum = isSum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.default_value
     *
     * @return the value of zcurd_field.default_value
     *
     * @mbg.generated
     */
    public String getDefaultValue() {
        return defaultValue;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.default_value
     *
     * @param defaultValue the value for zcurd_field.default_value
     *
     * @mbg.generated
     */
    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue == null ? null : defaultValue.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column zcurd_field.create_time
     *
     * @return the value of zcurd_field.create_time
     *
     * @mbg.generated
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column zcurd_field.create_time
     *
     * @param createTime the value for zcurd_field.create_time
     *
     * @mbg.generated
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
package com.zcurd.account.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BaseZcurdField<M extends BaseZcurdField<M>> extends Model<M> implements IBean {

	public M setId(java.lang.Long id) {
		set("id", id);
		return (M)this;
	}

	public java.lang.Long getId() {
		return get("id");
	}

	public M setHeadId(java.lang.Integer headId) {
		set("head_id", headId);
		return (M)this;
	}

	public java.lang.Integer getHeadId() {
		return get("head_id");
	}

	public M setFieldName(java.lang.String fieldName) {
		set("field_name", fieldName);
		return (M)this;
	}

	public java.lang.String getFieldName() {
		return get("field_name");
	}

	public M setColumnName(java.lang.String columnName) {
		set("column_name", columnName);
		return (M)this;
	}

	public java.lang.String getColumnName() {
		return get("column_name");
	}

	public M setColumnLength(java.lang.Integer columnLength) {
		set("column_length", columnLength);
		return (M)this;
	}

	public java.lang.Integer getColumnLength() {
		return get("column_length");
	}

	public M setDataType(java.lang.String dataType) {
		set("data_type", dataType);
		return (M)this;
	}

	public java.lang.String getDataType() {
		return get("data_type");
	}

	public M setInputType(java.lang.String inputType) {
		set("input_type", inputType);
		return (M)this;
	}

	public java.lang.String getInputType() {
		return get("input_type");
	}

	public M setIsShowList(java.lang.Integer isShowList) {
		set("is_show_list", isShowList);
		return (M)this;
	}

	public java.lang.Integer getIsShowList() {
		return get("is_show_list");
	}

	public M setIsAllowDetail(java.lang.Integer isAllowDetail) {
		set("is_allow_detail", isAllowDetail);
		return (M)this;
	}

	public java.lang.Integer getIsAllowDetail() {
		return get("is_allow_detail");
	}

	public M setIsAllowAdd(java.lang.Integer isAllowAdd) {
		set("is_allow_add", isAllowAdd);
		return (M)this;
	}

	public java.lang.Integer getIsAllowAdd() {
		return get("is_allow_add");
	}

	public M setIsAllowUpdate(java.lang.Integer isAllowUpdate) {
		set("is_allow_update", isAllowUpdate);
		return (M)this;
	}

	public java.lang.Integer getIsAllowUpdate() {
		return get("is_allow_update");
	}

	public M setIsSearch(java.lang.Integer isSearch) {
		set("is_search", isSearch);
		return (M)this;
	}

	public java.lang.Integer getIsSearch() {
		return get("is_search");
	}

	public M setIsAllowNull(java.lang.Integer isAllowNull) {
		set("is_allow_null", isAllowNull);
		return (M)this;
	}

	public java.lang.Integer getIsAllowNull() {
		return get("is_allow_null");
	}

	public M setDictSql(java.lang.String dictSql) {
		set("dict_sql", dictSql);
		return (M)this;
	}

	public java.lang.String getDictSql() {
		return get("dict_sql");
	}

	public M setOrderNum(java.lang.Integer orderNum) {
		set("order_num", orderNum);
		return (M)this;
	}

	public java.lang.Integer getOrderNum() {
		return get("order_num");
	}

	public M setSearchType(java.lang.Integer searchType) {
		set("search_type", searchType);
		return (M)this;
	}

	public java.lang.Integer getSearchType() {
		return get("search_type");
	}

	public M setIsSum(java.lang.Integer isSum) {
		set("is_sum", isSum);
		return (M)this;
	}

	public java.lang.Integer getIsSum() {
		return get("is_sum");
	}

	public M setDefaultValue(java.lang.String defaultValue) {
		set("default_value", defaultValue);
		return (M)this;
	}

	public java.lang.String getDefaultValue() {
		return get("default_value");
	}

	public M setCreateTime(java.util.Date createTime) {
		set("create_time", createTime);
		return (M)this;
	}

	public java.util.Date getCreateTime() {
		return get("create_time");
	}

}

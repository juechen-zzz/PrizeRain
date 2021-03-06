package com.zcurd.common.base;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.zcurd.account.model.SysUser;
import com.zcurd.account.model.ZcurdHead;
import com.zcurd.common.ZcurdConst;
import com.zcurd.common.util.Pager;
import com.zcurd.common.util.StringUtil;
import com.zcurd.online.model.SysOplog;
import com.zcurd.online.vo.QueryParamVO;

public class BaseController extends Controller {
	
	protected void renderDatagrid(Page<?> pageData) {
		Map<String, Object> datagrid = new HashMap<String, Object>();
		datagrid.put("rows", pageData.getList());
		datagrid.put("total", pageData.getTotalRow());
		renderJson(datagrid);
	}
	
	protected void renderDatagrid(List<?> list, int total) {
		renderDatagrid(list, total, null);
	}
	
	protected void renderDatagrid(List<?> list, int total, List<Map<String, Object>> footer) {
		Map<String, Object> datagrid = new HashMap<String, Object>();
		datagrid.put("rows", list);
		datagrid.put("total", total);
		if(footer != null && footer.size() > 0) {
			datagrid.put("footer", footer);
		}
		renderJson(datagrid);
	}
	
	protected void renderDatagrid(List<Record> list) {
		Map<String, Object> datagrid = new HashMap<String, Object>();
		datagrid.put("rows", list);
		renderJson(datagrid);
	}
	
	protected void renderSuccess() {
		renderSuccess(null);
	}
	
	protected void renderSuccess(String msg) {
		renderSuccess(msg, null);
	}
	
	protected void renderSuccess(String msg, Object data) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "success");
		result.put("msg", msg);
		result.put("data", data);
		renderJson(result);
	}
	
	protected void renderFailed(String msg) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "fail");
		result.put("msg", msg);
		renderJson(result);
	}
	
	protected void renderFailed(String msg, Object data) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "fail");
		result.put("msg", msg);
		result.put("data", data);
		renderJson(result);
	}
	
	protected void renderFailed() {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", "fail");
		renderJson(result);
	}
	
	protected SysUser getSessionUser() {
		return getSessionAttr(ZcurdConst.ADMIN_SESSIOIN_USER_KEY);
	}
	
	protected Pager getPager() {
		Pager pager = new Pager();
		pager.setPage(getParaToInt("page", 0));
		pager.setRows(getParaToInt("rows", 0));
		return pager;
	}
	
	/**
	 * ??????????????????
	 */
	protected Object[] getQueryParams() {
		QueryParamVO vo = getQueryParamsVO();
		return new Object[]{vo.getProperties().toArray(new String[]{}), vo.getSymbols().toArray(new String[]{}), vo.getValues().toArray(new Object[]{}), vo.getWhereSql()};
	}
	
	/**
	 * ??????????????????
	 */
	protected QueryParamVO getQueryParamsVO() {
		List<String> properties = new ArrayList<String>();
		List<String> symbols = new ArrayList<String>();
		List<Object> values = new ArrayList<Object>();
		
		Map<String, String[]> paraMap = getParaMap();
		for (String paraName : paraMap.keySet()) {
			String prefix = "queryParams[";
			if(paraName.startsWith(prefix)) {
				String field = paraName.substring(prefix.length(), paraName.length() - 1);
				String symbol = "=";
				String value = paraMap.get(paraName)[0];
				
				//??????????????????
				if(field.startsWith("_start_")) {
					field = field.replaceAll("^_start_", "");
					symbol = ">=";
				}else if(field.startsWith("_end_")) {
					field = field.replaceAll("^_end_", "");
					symbol = "<=";
				}
				
				//??????????????????
				if(value.startsWith("*") && value.endsWith("*")) {
					value = "%" + value.substring(1, value.length() - 1) + "%";
					symbol = "like";
				}else if(value.startsWith("*")) {
					value = "%" + value.substring(1);
					symbol = "like";
				}else if(value.endsWith("*")) {
					value = value.substring(0, value.length() - 1) + "%";
					symbol = "like";
				}
				
				properties.add(field);
				symbols.add(symbol);
				values.add(value);
			}
		}
		return new QueryParamVO(properties, symbols, values, getAuthDataRule());
	}
	
	/**
	 * ??????????????????
	 */
	protected String getAuthDataRule() {
		return getAttrForStr("authDataRule");
	}
	
	/**
	 * ????????????
	 */
	protected String getOrderBy() {
		String sqlOrderBy = ""; 
		Map<String, String[]> paraMap = getParaMap();
		if(paraMap.get("sort") != null && paraMap.get("sort").length > 0) {
			String[] sort = paraMap.get("sort")[0].split(",");
			String[] order = paraMap.get("order")[0].split(",");
			sqlOrderBy = sort[0] + " " + order[0];
			for (int i = 1; i < sort.length; i++) {
				sqlOrderBy += ", " + sort[i] + " " + order[i];
			}
		}
		return sqlOrderBy;
	}
	
	protected String getOrderBy(String defaultOrderBy) {
		String orderBy = getOrderBy();
		if(StringUtil.isEmpty(orderBy)) {
			orderBy = defaultOrderBy;
		}
		return orderBy;
	}

	/**
	 * ??????????????????
	 * @param opContent ????????????
	 */
	protected void addOpLog(String opContent) {
		SysOplog.me
			.remove("id")
			.set("user_id", getSessionUser().getId())
			.set("op_content", opContent)
			.set("ip", getRemoteAddress())
			.set("create_time", new Date())
			.save();
	}
	
	/**
	 * ??????ip??????
	 */
	protected String getRemoteAddress() {
		String ip = getRequest().getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = getRequest().getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = getRequest().getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || ip.equalsIgnoreCase("unknown")) {
			ip = getRequest().getRemoteAddr();
		}
		return ip;
	}
}

/**
 *====================================================
 * 文件名称: AmortizationInitializationAction.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2017年7月14日		陈光毅(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.web.action;

import java.util.List;

import javax.annotation.Resource;

import lombok.Getter;
import lombok.Setter;

import com.knight.core.filter.QueryFilter;
import com.knight.core.log.ActionLog;
import com.knight.core.util.GsonUtil;
import com.knight.core.web.action.BaseAction;
import com.knight.emms.model.AmortizationInitialization;
import com.knight.emms.service.AmortizationInitializationService;

/**
 * @ClassName: AmortizationInitializationAction
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 陈光毅
 * @date 2017年7月14日
 */
public class AmortizationInitializationAction extends BaseAction {

	private static final long serialVersionUID = 1L;

	@Getter
	@Setter
	private Long initializationId;
	
	@Getter
	@Setter
	private AmortizationInitialization amortizationInitialization;
	
	@Resource
	private AmortizationInitializationService amortizationInitializationService;
	
	public String list() {
		QueryFilter filter = new QueryFilter(getRequest());
		List<AmortizationInitialization> list = amortizationInitializationService.queryTranslateAll(filter);
		StringBuffer buff = new StringBuffer("{success:true,'totalCounts':").append(filter.getPagingBean().getTotalItems()).append(",result:");
		buff.append(GsonUtil.toJson(list, false));
		buff.append("}");
		this.jsonString = buff.toString();
		return SUCCESS;
	}
	
	public String load() {
		AmortizationInitialization a = amortizationInitializationService.getTranslate(initializationId);
		StringBuffer sb = new StringBuffer("{success:true,data:[");
		sb.append(GsonUtil.toJson(a, GsonUtil.SINCE_VERSION_20, false));
        sb.append("]}");
        setJsonString(sb.toString());
		return SUCCESS;
	}
	
	@ActionLog(description = "新增或更新周材摊销初始化")
	public String save() {
		if (amortizationInitialization.getInitializationId() == null) {
			int notyetAmortizedMonths = Integer.parseInt(amortizationInitialization.getMaterialsAmortization().getTotalAmortizationMonths()) - Integer.parseInt(amortizationInitialization.getAmortizedMonths());
			double notyetAmortizedAmount = Double.parseDouble(amortizationInitialization.getOriginalValue()) - Double.parseDouble(amortizationInitialization.getAmortizedAmount());
			amortizationInitialization.setNotyetAmortizedMonths(Integer.toString(notyetAmortizedMonths));
			amortizationInitialization.setNotyetAmortizedAmount(Double.toString(notyetAmortizedAmount));
			amortizationInitializationService.save(amortizationInitialization);
		} else {
			int notyetAmortizedMonths = Integer.parseInt(amortizationInitialization.getMaterialsAmortization().getTotalAmortizationMonths()) - Integer.parseInt(amortizationInitialization.getAmortizedMonths());
			double notyetAmortizedAmount = Double.parseDouble(amortizationInitialization.getOriginalValue()) - Double.parseDouble(amortizationInitialization.getAmortizedAmount());
			amortizationInitialization.setNotyetAmortizedMonths(Integer.toString(notyetAmortizedMonths));
			amortizationInitialization.setNotyetAmortizedAmount(Double.toString(notyetAmortizedAmount));
		 	amortizationInitializationService.merge(amortizationInitialization);
		}
		return SUCCESS;
	}
	
	@ActionLog(description = "删除周材摊销初始化")
	public String multiDel() {
		String[] ids = getRequest().getParameterValues("ids");
        for (String id : ids) {
        	amortizationInitializationService.remove(new Long(id));
        }
		return SUCCESS;
	}
}

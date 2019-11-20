package com.knight.emms.model;
// Generated 2017-7-18 13:57:11 by Hibernate Tools 3.6.0.Final

import java.util.HashSet;
import java.util.Set;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.Since;
import com.google.gson.reflect.TypeToken;
import com.knight.core.model.ExportModel;
import com.knight.core.table.CodeFieldDeclare;
import com.knight.core.table.PersistantDeclare;
import com.knight.core.util.GsonUtil;
import com.knight.emms.constant.Constant;
import com.knight.emms.core.BusinessModel;
import com.knight.emms.core.model.SerialNumberStrategy;

import lombok.Data;
import lombok.ToString;

/**
 * TCeaseReport generated by hbm2java
 */
@Data
@ToString(callSuper = false, doNotUseGetters = true)
@PersistantDeclare(isExportable = true, exportName = "报停管理", sheetName = "报停管理信息")
@SerialNumberStrategy(name = "ceaseSerial", strategy = "BTGL{yyyyMMdd}", maxseq = 999)
public class CeaseReport extends BusinessModel implements ExportModel{

	private static final long serialVersionUID = 1L;

	@Expose
	private Long ceaseId;
	
	@Expose
	private String ceaseSerial;
	
	@Expose
	private Long userId;
	
	@Expose
	private String userName;
	
	//生效失效
	@Expose
	@CodeFieldDeclare(codeId = "EFFECTIVE_FLAG", valueField = "statusName")
	private String status;
	
	@Expose
	private String statusName;
	
	@Expose
	private ContractMaterials contractMaterials;
	
	@Expose
	private String ceaseTitle;
	
	@Expose
	private String startDate;
	
	@Expose
	private String endDate;
	
	@Expose
	private String applyDate;
	
	@Expose
	private String settledAmount;
	
	@Expose
	private String finishAmount;
	
	@Expose
	private String backOff;

	@Expose
	@CodeFieldDeclare(codeId = "TRANPORT_CACULATE_TYPE", valueField = "tranportCaculateTypeName")
	private String tranportCaculateType;
	
	@Expose
	private String tranportCaculateTypeName;
	
	//统计规则
	@Expose
	@CodeFieldDeclare(codeId = "CACULATE_RULE", valueField = "caculateRuleName")
	private String caculateRule;
	
	@Expose
	private String caculateRuleName;
		
	private String delFlag = Constant.ENABLED;
	

	public void setModelSerial(String serial) {
		this.ceaseSerial = serial;
	}
	
	public String ceaseReportDetails ="";
	
	@Expose(deserialize = false, serialize = false)
	@Since(value = 2.0)
	public Set<CeaseReportDetail> ceaseReportDetailSet = new HashSet<CeaseReportDetail>();

	public void setSubCeaseReport() {
		Set<CeaseReportDetail> ceaseReportDetailSet = GsonUtil.fromJson(this.getCeaseReportDetails(), new TypeToken<Set<CeaseReportDetail>>() {});
		if (ceaseReportDetailSet != null) {
			for (CeaseReportDetail p : ceaseReportDetailSet) {
				p.setCeaseId(this.ceaseId);
			}
		}
		this.setCeaseReportDetailSet(ceaseReportDetailSet);
	}
}
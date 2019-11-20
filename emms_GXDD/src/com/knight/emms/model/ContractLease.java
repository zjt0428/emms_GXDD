/**
 *====================================================
 * 文件名称: ContractLease.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2013-7-7			chenxy(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.Since;
import com.google.gson.reflect.TypeToken;
import com.knight.core.model.ExportModel;
import com.knight.core.table.CodeFieldDeclare;
import com.knight.core.table.PersistantDeclare;
import com.knight.core.util.DateUtil;
import com.knight.core.util.GsonUtil;
import com.knight.emms.core.ApplyforState;
import com.knight.emms.core.model.SerialNumberStrategy;
import com.knight.system.constant.SystemConstant;
import com.knight.system.model.Department;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

/**
 * @ClassName: ContractLease
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author chenxy
 * @date 2013-7-7 下午9:36:30
 */
@Data
@ToString(callSuper = false, doNotUseGetters = true)
@PersistantDeclare(isExportable = true, exportName = "合同信息汇总", sheetName = "合同信息")
@EqualsAndHashCode(callSuper = false)
@SerialNumberStrategy(name = "contractSerial", strategy = "HT-{yyyyMMdd}", maxseq = 999999)
public class ContractLease extends ApplyforState implements ExportModel {

	private static final long serialVersionUID = 1L;

	@Expose
	private Long contractId;
	
	@Expose
	private Long arrangeId;

	@Expose
	private String contractSerial;

	@Expose
	private String contractTheme;

	@CodeFieldDeclare(codeId = "contractCategory", valueField = "contractCategoryName")
	private String contractCategory;

	@Expose
	private String contractCategoryName;

	@Expose
	private String subcontract;

	@Expose
	@CodeFieldDeclare(codeId = "FUND_TYPE", valueField = "fundTypeName")
	private String fundType;

	@Expose
	private String fundTypeName;

	@Expose
	private Long paEnt;

	@Expose
	private String paModule;

	@Expose
	private String paEntName;

	@Expose
	private String paEntLinkMan;

	private String paEntLinkTel;

	@Expose
	private Long pbEnt;

	@Expose
	private String pbModule;

	@Expose
	private String pbEntName;

	@Expose
	private String pbEntLinkMan;

	private String pbEntLinkTel;

	@Expose
	private String enterpriseSerial;

	private BigDecimal overallHeight;

	private Integer buildingQuantity;
	
	@Expose
	private String quantity;

	@Expose
	private BigDecimal cover;

	@Expose
	private Long salesmanId;

	@Expose
	private String salesman;

	private String salesmanTel;

	@Expose
	private String collectionRatio;

	@Expose
	private Long projectId;

	@Expose
	private String projectSerial;

	@Expose
	private String projectName;

	@Expose
	private String address;
	
	@Expose
	private String sumRefreshTime;

	@Expose
	private String signingTime;

	@Expose
	private BigDecimal contractAmount;

	private BigDecimal debitReceivable;

	private Short segmentQty;

	private Short wallAttacheQty;

	private String deduct;

	private String deductDesc;

	private String remark;

	private String squareUpDate;

	@Expose
	@CodeFieldDeclare(codeId = "CONTRACT_APPLYFOR_STATUS", valueField = "applyforStateName")
	private String applyforState;

	@Expose
	private String applyforStateName;
	
	@Expose
	@CodeFieldDeclare(codeId = "belongToArea", valueField = "belongToAreaName")
	private String belongToArea;
	
	@Expose
	private String belongToAreaName;

	private String effective;
	
	@Expose
	private Short equipCount;

	private Short practiCount;

	private String delFlag;

	private Long userId;

	@Expose
	private String userName;

	@Expose
	private String providedDate;
	
	@Expose
	@CodeFieldDeclare(codeId = "assetsProperty", valueField = "assetsPropertyName")
	private String assetsProperty;
	
	@Expose
	private String assetsPropertyName;
	
	@Expose
	private String sentEquipQuantity;
	
	@Expose
	private String installEquipQuantity;
	
	@Expose
	private String usedQuantity;
	
	@Expose
	private String removeQuantity;
	
	@Expose
	private String buildingArea;

	private Department department;

	private String bargain;
	
	@Expose
	private String equipSpecificNames;
	
	//合同编号（手输）
	@Expose
	private String contractNo;
	
	//项目主管部门
	@Expose
	private Long competentDepartmentId;
	
	//项目主管部门
	@Expose
	private String competentDepartment;
	
	//计税方式
	@CodeFieldDeclare(codeId = "TAX_MODE", valueField = "taxModeName")
	private String taxMode;
	
	@Expose
	private String taxModeName;
	
	//适用税率
	@Expose
	private String applicableTaxRate;
	
	//签订地点
	@Expose
	private String signedArea;
	
	@Expose
	private Long billUnitId;
	
	@Expose
	private String billUnitName;
	
	/**最近一次结算的月份*/
	private String settleMonthDate;
	
	@Expose
	private String materialPractiName;
	
	/**所有设备都拆卸的月份*/
	private String equipAllDismantleMonth;
	
	@Expose
	private String settleType;//上一期结算类型
	

	/**合同类型*/
	@Expose
	@CodeFieldDeclare(codeId = "CONTRACT_TYPE", valueField = "contractTypeName")
	private String contractType;

	private String contractTypeName;
	
	private Project project;
	
	/**合作方式*/
	@Expose
	@CodeFieldDeclare(codeId = "COOPERATION_WAY", valueField = "cooperationWayName")
	private String cooperationWay;
	
	private String cooperationWayName;
	
	/** 开票类型 */
	@CodeFieldDeclare(codeId = "invoiceType", valueField = "invoiceTypeName")
	private String invoiceType;

	private String invoiceTypeName;
	
	/** 修订审批状态 （0：修订待审批）*/
	@Expose
	private String editApproveState;
	
	@Expose
	private Long leaseVersionId;
	
	@Expose(deserialize = false, serialize = false)
	@Since(value = 2.0)
	private Set<InstallPriceSet> installPriceSet = new HashSet<InstallPriceSet>(0);

	private String installPriceSets = "";
	
	@Expose(deserialize = false, serialize = false)
	@Since(value = 2.0)
	private Set<TruckCranePriceSet> truckCranePriceSet = new HashSet<TruckCranePriceSet>(0);

	private String truckCranePriceSets = "";

	@Expose(deserialize = false, serialize = false)
	@Since(value = 2.0)
	private Set<ContractEquipBrief> contractEquipBriefSet = new HashSet<ContractEquipBrief>(0);

	private String contractEquipBriefs = "";

	@Expose(deserialize = false, serialize = false)
	@Since(value = 2.0)
	private Set<ContractEquip> contractEquipSet = new HashSet<ContractEquip>(0);

	private String contractEquips = "";

	@Expose(deserialize = false, serialize = false)
	@Since(value = 2.0)
	private Set<ContractEquipOutlay> contractEquipOutlaySet = new HashSet<ContractEquipOutlay>(0);

	private String contractEquipOutlays = "";

	@Expose(deserialize = false, serialize = false)
	@Since(value = 2.0)
	private Set<ContractEquipCost> contractEquipCostSet = new HashSet<ContractEquipCost>(0);

	private String contractEquipCosts = "";

	@Expose(deserialize = false, serialize = false)
	@Since(value = 2.0)
	private Set<ContractPractiBrief> contractPractiBriefSet = new HashSet<ContractPractiBrief>(0);

	private String contractPractiBriefs = "";

	@Expose(deserialize = false, serialize = false)
	@Since(value = 2.0)
	private Set<ContractCostitem> contractCostitemSet = new HashSet<ContractCostitem>(0);

	private String contractCostitems = "";
	
	@Expose(deserialize = false, serialize = false)
	@Since(value = 2.0)
	private Set<SafetyMonitorSettleList> safetyMonitorSettleListSet = new HashSet<SafetyMonitorSettleList>(0);
	
	private String safetyMonitorSettleLists = "";	
		
	@Expose(deserialize = false, serialize = false)
	@Since(value = 2.0)
	private Set<ContractInoutFree> contractInoutFreeSet = new HashSet<ContractInoutFree>(0);

	private String contractInoutFrees = "";	
	
	@Expose(deserialize = false, serialize = false)
	@Since(value = 2.0)
	private Set<ContractOperatorFree> contractOperatorFreeSet = new HashSet<ContractOperatorFree>(0);

	private String contractOperatorFrees = "";	
	// ===============================================================================//
	private boolean fillContent = false;

	public Long getApplyforId() {
		return this.contractId;
	}

	public void setModelSerial(String serial) {
		this.contractSerial = serial;
	}

	public String getModelSerial() {
		return this.contractSerial;
	}

	public Long getInstalmentRelationId() {
		return this.contractId;
	}

	public String getInstalmentRelationSerial() {
		return this.contractSerial;
	}

	public String getInstalmentRelationModule() {
		return SystemConstant.MODULE_CONTRACT_LEASE;
	}

	public Long getReceivementRelationId() {
		return this.contractId;
	}

	public String getReceivementRelationSerial() {
		return this.contractSerial;
	}

	public String getReceivementRelationModule() {
		return SystemConstant.MODULE_CONTRACT_LEASE;
	}

	// ===============================================================================//
	public void setSubContractLease() {
		short equipCount = (short) 0;
		short practiCount = (short) 0;
		Set<ContractInoutFree> contractInoutFreeSet = GsonUtil.fromJson(this.getContractInoutFrees(),new TypeToken<Set<ContractInoutFree>>(){},DateUtil.LINK_DISPLAY_DATE);
		if(contractInoutFreeSet != null){
			for(ContractInoutFree p : contractInoutFreeSet){
				p.setContractId(this.getContractId());
			}
		}
		this.setContractInoutFreeSet(contractInoutFreeSet);
		
		Set<ContractOperatorFree> contractOperatorFreeSet = GsonUtil.fromJson(this.getContractOperatorFrees(),new TypeToken<Set<ContractOperatorFree>>(){},DateUtil.LINK_DISPLAY_DATE);
		if(contractOperatorFreeSet != null){
			for(ContractOperatorFree p : contractOperatorFreeSet){
				p.setContractId(this.getContractId());
			}
		}
		this.setContractOperatorFreeSet(contractOperatorFreeSet);
		
		Set<InstallPriceSet> installPriceSet = GsonUtil.fromJson(this.getInstallPriceSets(), new TypeToken<Set<InstallPriceSet>>() {}, DateUtil.LINK_DISPLAY_DATE);
		if (installPriceSet != null) {
			for (InstallPriceSet p : installPriceSet) {
				p.setContractId(this.getContractId());
			}
		}
		this.setInstallPriceSet(installPriceSet);
		
		Set<TruckCranePriceSet> truckCranePriceSet = GsonUtil.fromJson(this.getTruckCranePriceSets(), new TypeToken<Set<TruckCranePriceSet>>() {}, DateUtil.LINK_DISPLAY_DATE);
		if (truckCranePriceSet != null) {
			for (TruckCranePriceSet p : truckCranePriceSet) {
				p.setContractId(this.getContractId());
			}
		}
		this.setTruckCranePriceSet(truckCranePriceSet);
		
		
		Set<ContractEquipBrief> contractEquipBriefSet = GsonUtil.fromJson(this.getContractEquipBriefs(), new TypeToken<Set<ContractEquipBrief>>() {}, DateUtil.LINK_DISPLAY_DATE);
		if (contractEquipBriefSet != null) {
			for (ContractEquipBrief p : contractEquipBriefSet) {
				p.setContractId(this.getContractId());
				equipCount += p.getQuantity();
			}
		}
		this.setContractEquipBriefSet(contractEquipBriefSet);

		Set<ContractEquip> contractEquipSet = GsonUtil.fromJson(this.getContractEquips(), new TypeToken<Set<ContractEquip>>() {}, DateUtil.LINK_DISPLAY_DATE);
		if (contractEquipSet != null) {
			for (ContractEquip p : contractEquipSet) {
				p.setContractId(this.getContractId());
				equipCount++;
			}
		}
		this.setContractEquipSet(contractEquipSet);

		Set<ContractEquipOutlay> contractEquipOutlaySet = GsonUtil.fromJson(this.contractEquipOutlays, new TypeToken<Set<ContractEquipOutlay>>() {}, DateUtil.LINK_DISPLAY_DATE);
		if (contractEquipOutlaySet != null) {
			for (ContractEquipOutlay p : contractEquipOutlaySet) {
				p.setContractId(this.contractId);
			}
		}
		this.setContractEquipOutlaySet(contractEquipOutlaySet);

		Set<ContractEquipCost> contractEquipCostSet = GsonUtil.fromJson(this.contractEquipCosts, new TypeToken<Set<ContractEquipCost>>() {}, DateUtil.LINK_DISPLAY_DATE);
		if (contractEquipCostSet != null) {
			for (ContractEquipCost p : contractEquipCostSet) {
				p.setContractId(this.contractId);
			}
		}
		this.setContractEquipCostSet(contractEquipCostSet);

		Set<ContractPractiBrief> contractPractiBriefSet = GsonUtil.fromJson(this.getContractPractiBriefs(), new TypeToken<Set<ContractPractiBrief>>() {}, DateUtil.LINK_DISPLAY_DATE);
		if (contractPractiBriefSet != null) {
			for (ContractPractiBrief p : contractPractiBriefSet) {
				p.setContractId(this.getContractId());
				practiCount += p.getQuantity();
			}
		}
		this.setContractPractiBriefSet(contractPractiBriefSet);

		Set<ContractCostitem> contractCostitemSet = GsonUtil.fromJson(this.getContractCostitems(), new TypeToken<Set<ContractCostitem>>() {}, DateUtil.LINK_DISPLAY_DATE);
		if (contractCostitemSet != null) {
			for (ContractCostitem p : contractCostitemSet) {
				p.setContractId(this.getContractId());
			}
		}
		this.setContractCostitemSet(contractCostitemSet);

		this.setEquipCount(equipCount);
		this.setPractiCount(practiCount);
			
		Set<SafetyMonitorSettleList> safetyMonitorSettleListSet = GsonUtil.fromJson(this.getSafetyMonitorSettleLists(), new TypeToken<Set<SafetyMonitorSettleList>>() {}, DateUtil.LINK_DISPLAY_DATE);
		if (safetyMonitorSettleListSet != null) {
			for (SafetyMonitorSettleList p : safetyMonitorSettleListSet) {
				p.setContractId(this.getContractId());
			}
		}
		this.setSafetyMonitorSettleListSet(safetyMonitorSettleListSet);		
	}

}
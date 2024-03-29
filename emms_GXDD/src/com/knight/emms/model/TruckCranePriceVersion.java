package com.knight.emms.model;
// Generated 2017-7-25 10:42:46 by Hibernate Tools 3.6.0.Final

import com.google.gson.annotations.Expose;
import com.knight.core.model.BaseModel;
import com.knight.core.table.CodeFieldDeclare;
import com.knight.core.table.PersistantDeclare;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = false, doNotUseGetters = true)
@PersistantDeclare
public class TruckCranePriceVersion  extends BaseModel {

	private static final long serialVersionUID = 1L;
	
	@Expose
	private Long craneVersionId;
	
	@Expose
	private Long leaseVersionId;

	@Expose
	private Long priceId;
	
	@Expose
	@CodeFieldDeclare(codeId = "belongToArea", valueField = "belongToAreaName")
	private String belongToArea;
	
    @Expose
    private String belongToAreaName;
	
	
	@Expose
	@CodeFieldDeclare(codeId = "truckCraneSpecific", valueField = "truckCraneSpecificName")
	private String truckCraneSpecific;
	
	
	@Expose
    private String truckCraneSpecificName;
	
	
	@Expose
	private Long projectPrice;
	
	@Expose
	private Long teamPrice;
	
	
	private String delFlag;

}
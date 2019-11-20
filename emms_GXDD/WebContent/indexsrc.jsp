<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="kfn" uri="http://www.knight.com/jsp/jstl/functions"%>
<%@ taglib prefix="aps" uri="http://www.knight.com/taglib/security"%>
<%@ page import="com.knight.system.application.ApplicationContainer" %>
<%
	String basePath=request.getContextPath();
	//登录成功后，需要把该用户显示至在线用户
	ApplicationContainer.addOnlineUser(request.getSession().getId(), ApplicationContainer.getCurrentUser(),"1");
	if(ApplicationContainer.getCurrentUser().getRights().contains("__ALL")){
		request.setAttribute("IS_MANAGER",true);
	}
	//防止浏览器缓存
	ApplicationContainer.reloadSysConfig();
	//String timestamp = String.valueOf(ApplicationContainer.getSystemParam("updateTimestamp"));
	String timestamp = String.valueOf(Math.random());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta http-equiv="msthemecompatible" content="no" />
	<title>广西大都管理服务平台</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/ext3.4/resources/css/ext-all.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/ext3.4/ux/css/Portal.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/core/ux/uploaddialog/css/UploadDialog.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/core/ux/css/ActionColumn.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/core/ux/css/lovcombo.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/ext3.4/ux/css/ux-all.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/admin.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/btn.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/menu.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/btn_business.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/menu_business.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/desktop.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/ext3.4/ux/css/Spinner.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/ext3.4/ux/css/tab-scroller-menu.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/navigations.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/base.css"/>

    <!-- load lodop print libary -->
    <script type="text/javascript" src="<%=basePath%>/js/print/LodopFuncs.js"></script>
    <!-- <script type="text/javascript" src="http://Localhost:8000/CLodopfuncs.js"></script> -->

	<!-- load the extjs libary -->
	<script type="text/javascript" src="<%=basePath%>/ext3.4/adapter/ext/ext-base.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ext-all-debug.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ext-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ext-basex.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/print/Printer-all.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/export/Exporter-all.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/RowEditor.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/XmlTreeLoader.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/CheckColumn.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/Portal.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/PortalColumn.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/Portlet.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/RowExpander.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/MultiSelect.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/ItemSelector.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/Spinner.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/SpinnerField.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/TabCloseMenu.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/TabScrollerMenu.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/DataViewTransition.js"></script>

	<script type="text/javascript" src="<%=basePath%>/js/core/ui/ext-ui-combo-pagesize.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/UploadDialog.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/IconCombob.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/Toast.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/ActionColumn.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/SystemCalendar.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/TreeSelector.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/date.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/DynamicCheckboxGroup.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/DynamicRadioGroup.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/TreeCombo.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/TreePanelEditor.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/TreeXmlLoader.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/WebOffice.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/AdvancedQueryWin.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/IndexPagePortlet.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/SearchGridPanel.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/FormPanelWindow.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/DateTimeField.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/RelationModule.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/RelationSelector.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/RelationCompositeMenuButtonField.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/RelationCompositeField.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/SubModuleBaseGrid.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/LovCombo.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/SimpleCombo.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/CheckTreePanel.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/ClearableTextField.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/BaseReportView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/KnightDateMenu.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/BaiduMapPanel.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/SubordinationGrid.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/Env.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/uploader/swfupload.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/uploader/SwfUploadPanel.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/AreaCompositeField.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/AppUtil.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/KnightUtil.date.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/KnightUtil.math.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ScrollText.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ScriptMgr.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/TabTitle.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/TreeComboWithChild.js"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/dynamic.jsp"></script>
	<script type="text/javascript" src="<%=basePath%>/js/sound/soundmanager2.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/App.import.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/BusinessConfigure.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/ObjectFieldMapping.js?<%=timestamp%>"></script>

	<script type="text/javascript" src="<%=basePath%>/js/selector/IndexPortletSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/UserSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/DepartmentSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/RoleSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/OnlineUserSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/UserSimpleSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/CorpSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/CorpAccountSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/PractitionerSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/CustomerSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/CustomerLinkerSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/CustomerAccountSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/SupplierSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/SupplierLinkerSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/SupplierAccountSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipTSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipRepairSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ComponentSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ComponentJoinStoreHouseSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipLostHandleSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ProjectSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ProjectComponSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ContractLeaseSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ContractDispatchEquipSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/DispatchSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/DispatchPractiSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/DispatchEquipSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipFlowSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipFlowInstallSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipFlowActivateSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipFlowEmploySelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipFlowDismantleSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipDetectSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipInspectSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipMaintSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/PickupSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/PurchaseSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/BorrowSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/MoneyLendSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/MoneyBackSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ReceivementSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/InstalmentSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/DispatchComponSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/InsureEquipSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/SettleContractSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/AccidentSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/RiskSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/CarSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/VerifyItemSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipFlowComponDiarySelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipWarehouseSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/LogisticsTransportSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/LogisticsBacksportSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/TeamsAccountSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/RentContractSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/DispatchAutocraneSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/StoreHouseSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/PractiCertSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/CorpCertSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ConstructOperationSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/AutocraneSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ProjectComponSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ComponIntoSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ComponIntoStoreSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ContractApplicationSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/IndisSchemaSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/AppUserSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/MaterialsInfoSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ProjectMaterialsStoreSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/MaterialsInitSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ScrapApplySelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ScrapContractSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/MaterialsCommoditySelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/MaterialsAmortizationSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/BaseDepotSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ContractMaterialsSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/MaterialsPlanSelector.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/selector/BaseDepotSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/BaseLocationSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/DispatchAllocateInitSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/MaterialsDispatchSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/MaterialsPackSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/AnnexDetailSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ProjectDepotInitSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ProjectDepotInitDetailSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/LeaseApplicationSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/LeaseContractSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/LeaseSettlementSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/MaterialsStoreSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/BaseDepotInitSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ApplyMakeSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/LeaseStockSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/LeaseMaterialsRecordSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/BaseDepotJoinUserSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ReturnTempStoreSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ContractMaterialsSecondSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/LeaseContractMaterialsSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/MaterialsStoreByDateSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipDiarySelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/ApplyConstructOperationSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/EquipInsuranceClaimSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/TechnicalDisclosureSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/LaborSettleSelector.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/StoreHouseAllSelector.js?<%=timestamp%>"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/InstalmentGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ReceivementGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractEquipGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractEquipOutlayGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractEquipCostGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractEquipBriefGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/InstallPriceGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/TruckCranePriceGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractPractiBriefGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractCostitemGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/MaterialsDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/PriceSettingGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/MatDamageGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/CostHandleGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/CompensationScrapGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/DispatchPractiGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/DispatchEquipGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/DispatchComponGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/DispatchAutocraneGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/PickupComponentGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/PurchaseBriefGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/PurchasePlanInquiryGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/PurchaseAcceptanceGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/BorrowComponentGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/BorrowEquipGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/BorrowAcceptanceGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/PractiDiaryGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/InsureClaimGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/CorpAccountGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/CustomerAccountGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/CustomerLinkerGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SupplierLinkerGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SupplierAccountGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AmountReceiveShareGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AmountPaymentShareGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/DeductPractiGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SalaryPractiGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ReimburseTicketGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ComponDiaryGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/DeductScaleGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AnnounceCategoryGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/InventoryCategoryGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SettleEquipBriefGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SettleComponBriefGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SettleItemBriefGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AmountEquipShareGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipmentComponGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipmentDiaryGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SettleFeeGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/RentFeeDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/InstallFeeDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AutoCraneFeeDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LostFeeDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/OtherFeeDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/VerifyItemDemandGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/CarExpenseGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ProjectExpenseGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LogisticsTrandetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LogisticsBackdetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/VerifyStandardGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipWarehouseAbnormalComponGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipWarehouseComponGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipInspectDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/CostInspectGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipRepairComponGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipRepairLocationGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipDetectStatementGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipMaintDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/IndisProtocolEquipGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContingencyWorkerGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/MemoDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/MemoDeputyGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipFlowEmployGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/TeamsAccountAutocraneGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/TeamsAccountKnotGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/TeamsAccountLogisticsGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/TeamsAccountOtherGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/TeamsAccountPractiGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/TeamsAccountWallGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractArrangeEquipmentGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractArrangeSituationGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/RentEquipBriefGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/RentComponBriefGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/RentItemBriefGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/RentDeductBriefGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipmentAffiliatedGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/DispatchAllocateGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LogisticsBackcarfeeGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LogisticsTrancarfeeGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/DestributionGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/TranDistributionbutionGrid.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ConstructOperationTaskGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipRepairVehicleGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AutocraneExpenseGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ProjectComponGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ComponIntoStoreDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AttachmentStorageGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AmountReceiveGrid.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LogisticsBackdetailGrid2.js"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AmountPaymentGrid.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EnterFactoryEquipGrid.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ExitFactoryEquipGrid.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/BasicPreEmbeddingEquipGrid.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/IndisSchemaPractiGrid.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/IndisNoticePractiGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ConstructManagersGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ConstructPractiGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipMaintComponGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SafeCheckGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/DemandDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/DemandDetailForExeuntPlanGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/BaseDepotInitDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ProjectDepotInitDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ReceiveManageDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LostCompensationDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/OtherBusinessDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/OtherBetsDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AfterMaterialsRepairGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/BeforeMaterialsRepairGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/RecycleManageDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/RecycleManageFeeGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/CompensationDamageGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ProductMakeGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/StoreDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LostDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipBlockUpGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/PackageDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/CostDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/DispatchMaterialsGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AllocationDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AllocationDepotDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LostDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipBlockUpGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipActivateSearchFormGrid.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/InstallFeeGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AutocraneFeeGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/InstallDismantelTeamGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AutocraneUnitGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeaseListGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeaseMaterialsInventoryGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeasePriceSettingGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeaseSpoiledIndemnityGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeaseExpenseHandlingGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/RecipientListGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ReturnListGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SettlementListGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SettlementInfoGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/MaterialsInputCountGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/MaterialsRecycleCountTempGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ApplicationDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/BaldetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/MakeProductGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ConsumeProductGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/MaterialsStoreDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeaseScrapCompensationGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/BeforeRemodelGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/AfterRemodelGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ScrapDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SettleMaterialsDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeaseRepairBeforeGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeaseRepairAfterGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ProjectRepairBeforeGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ProjectRepairAfterGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SettleMaterialsDetailSecondGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SettleMaterialsDetailOtherFeeGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeasedLostCompensationDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/InsideSettlementListGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeasedLostDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/TemporaryStorageGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/TemporaryReturnDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ChargeHandleGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/CeaseReportDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SettleMaterialsDetailCeaseReportGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeaseBlockUpDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/OtherLeaseDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeaseOtherBusinessDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeaseSettlementBlockUpGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/InsideBlockUpDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/LeaseSettlementInsideBlockUpGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/OperatorSalaryStatementGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/OtherExpenseStatementGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/SafetyMonitorSettleStatementGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/SafetyMonitorSettleListGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipInsureClaimRecordGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipInsureRecordGrid.js?<%=timestamp%>"></script>   
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipInsuranceDetailGrid.js?<%=timestamp%>"></script> 
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/PractiContractDiaryGrid.js?<%=timestamp%>"></script> 
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/PractiInsuranceDetailGrid.js?<%=timestamp%>"></script> 
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractInoutFreeGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractOperatorFreeGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/EquipInsureClaimDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/InspectSelfInitDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/PractiInsureClaimRecordGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/PractiInsureRecordGrid.js?<%=timestamp%>"></script>   
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/PractiInsureClaimDetailGrid.js?<%=timestamp%>"></script>  
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/InspectProjectRecordGrid.js?<%=timestamp%>"></script>    
	<script type="text/javascript" src="<%=basePath%>/js/selector/grid/ClosedSettleInfoGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/LaborPayDetailGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractEquipBriefsGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractInoutFreesGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/SafetyMonitorSettleListsGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractOperatorFreesGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractEquipBriefVersionGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractInoutFreeVersionGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/SafetyMonitorSettleListVersionGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/ContractOperatorFreeVersionGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/TransfersDetailGrid.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/selector/grid/TransfersEquipDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/search/SearchForm.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/preview/EquipmentPreview.js"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/info/MessageWindows.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/info/MessageReplyWindows.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/info/MessageSendListView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/info/MessageReceiveListView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/info/MessageFormWindows.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/info/MessageDetailWindows.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/info/PersonalTipsView.js"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/system/FileAttachDetail.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/AppUserKeyListView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/AppUserKeyForm.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/AppUserForm.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/LabourAppUserForm.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/ResetPasswordForm.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/AppUserListView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/LabourAppUserListView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/ProfileForm.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/DepartmentForm.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/DepartmentView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/LabourDepartmentView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/AppRoleView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/AppRoleForm.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/DicCodeListView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/DicDetailView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/RoleGrantRightView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/SystemLogListView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/system/SysConfigView.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/system/PersonnelAuthorizationForm.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/system/PersonnelAuthorization4BasedepotForm.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/system/MaterialsInputCountWindow.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/system/ContractGrantedWin.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/system/ContractGrantedView.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/system/ProjectUserListView.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/system/RoleGrantDepartmentView.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/system/RoleGrantLabourPermissionView.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/system/AppUserBatchPermSetForm.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/system/RoleGrantEquipPermissionView.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/system/RoleGrantLabourPermissionView.js"></script>

	<script type="text/javascript" src="<%=basePath%>/js/form/HandleForComments.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/form/BusinessMessageListView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/form/AnnounceForm.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/form/AnnounceListView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/form/AnnounceUserForm.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/form/AnnounceUserListView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/form/InventoryForm.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/form/InventoryListView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/form/MemoForm.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/form/MemoListView.js"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/archive/CorpListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/CorpInfoForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/CorpCertForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractitionerForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/CorpCertListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractitionerListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiCertForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiCertListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/SupplierListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/SupplierForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ComponentHoldForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/CustomerListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/CustomerForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/BranchCustomerListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ProjectListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ProjectForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ComponentListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ComponentForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/StoreDetailForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ComponentDetails.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/EquipmentListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/EquipmentForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/EquipmentView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/EquipmentDistributionView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiResumeListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiCreditListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiCreditForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/CorpInfoView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractitionerView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/StoreEquipListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/StoreComponListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/StoreEquipStockListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/StoreComponStockListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/StoreHouseForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/StoreHouseListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/CarForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/CarListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/FileAttachListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/InfoFileAttachListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/StoreManageView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/StoreProjectListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ProjectComponListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/MaterialsProjectStoreListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ProjectMaterialsStoreListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ComponentExamineForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/EnterFactoryNoticeListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/EnterFactoryNoticeForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ExitFactoryNoticeListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ExitFactoryNoticeForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/BasicPreEmbeddingNoticeListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/BasicPreEmbeddingNoticeForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/AnnexDetailsListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ProjectRepairListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ProjectRepairForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ChangeContractNumForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ChangeCustomerArchivesForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ChangeProjectArchivesForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ChangeEquipArchivesForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ChangeStoreArchivesForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiInsuranceFrom.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiInsuranceListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiServiceContractDetailListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/ChangeContractCategoryForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiInsuranceEastView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiInsuranceSouthView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiInsuranceDetailForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiInsuranceClaimForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/SafeClarificationListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/SafeClarificationFrom.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/SafetyEducationListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/SafetyEducationFrom.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiDispatchForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiDispatchListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiEvaluationFrom.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiEvaluationListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiLeaveForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractiLeaveListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/PractitionerBlackListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/archive/InspectProjectImageForm.js?<%=timestamp%>"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractLeaseListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractLeaseForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractLeaseForm2.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractLeasesForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractLeaseVersionForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractMaterialsListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractMaterialsForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractMaterialsForm2.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractSubcontractForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractSubcontractListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/DispatchListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/DispatchForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/DispatchContractForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/DispatchEquipDismantleForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/DispatchEquipEmployForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/DispatchEquipInstallForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/LogisticsBacksportForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/LogisticsBacksportListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/LogisticsTransportForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/LogisticsTransportListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/PickupListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/PickupForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/PurchaseListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/PurchaseForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/PurchasePlanListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/PurchasePlanForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/PurchaseAcceptanceForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/BorrowAcceptanceForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/BorrowForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/BorrowListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/SettleContractForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/SettleContractsForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/SettleContractListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/SettleContractRecordListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ClosedSettleInfoView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/OpenSettleInfoView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/SettleProjectForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/SettleFeeDetailForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/SettleProjectListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/FinanceSettleContractListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/TeamsAccountListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/TeamsAccountQueryForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/TeamsAccountForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractArrangeDerivedForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractArrangeDerivedListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractArrangeForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractArrangeListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractArrangeSituationForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ContractArrangeSituationListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/MaterialsPlanListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/MaterialsPlanForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/TruckPlanListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/TruckPlanForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/SettleContractEquipListView.js?<%=timestamp%>"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ExeuntPlanListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ExeuntPlanForm.js?<%=timestamp%>"></script>

	<script type="text/javascript" src="<%=basePath%>/js/dispatch/OverduePaymentForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/OverduePaymentListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/RentContractForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/RentContractListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ConstructOperationForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/ConstructOperationListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/AutocraneForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/AutocraneListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/DispatchAllocateInitListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/DispatchAllocateInitForm.js?<%=timestamp%>"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/LaborPaidListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/LaborPayForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/LaborPayListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/LaborPayView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/LaborSettleApproveListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/LaborSettleForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/LaborSettleListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/LaborSettleSubmitListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/dispatch/LaborSettleView.js?<%=timestamp%>"></script>

<!-- 生产计划 -->
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipActivateForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipContractLeaseForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipActivateListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipContractLeaseListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipBlockupActivateForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipBlockupForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipBlockupListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInstallForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInstallListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipEmployForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipEmployListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipEmployDispatchListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipDismantleForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipDismantleListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipWarehouseForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipWarehouseListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipWarehouseAbnormalForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipWarehouseAbnormalListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipDetectForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipDetectListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipVerifyForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipVerifyListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInspectSchemaBatchForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInspectSchemaForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInspectSchemaListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInspectSchemaEmployListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInspectForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInspectListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInspectEmployListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInspectSuperviseListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipMaintSchemaForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipMaintSchemaListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipMaintSchemaEmployListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipMaintForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipMaintListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipMaintEmployListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipMaintSuperviseListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipHitchForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipHitchListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipHitchSuperviseListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/InsureEquipForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/InsureEquipListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipRepairForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipRepairListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/MaterialGatherPrintPanel.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/InstallManageForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/InstallManageListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/DismantleManageForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/DismantleManageListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/InspectManageForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/InspectManageListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInstallLhForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInstallJjListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/ComponIntoStoreForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/ComponIntoStoreListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/LostHandleForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/LostHandleListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipMaintSchemaBatchForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipBlockupBatchForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipActivateSearchForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/ContractRelateEquipView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInsuranceListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInsuranceFrom.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipmentInsuranceView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipmentInsuranceForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipmentInsuranceInfoForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipmentInsuranceDetailForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipmentInsuranceClaimForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipmentInsuranceForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInspectSelfListView.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipmentCheckListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/InspectSelfInitListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/InspectSelfInitForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/InspectSelfChooseListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/InspectSelfChooseForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/InspectSelfInitDetailListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/InspectSelfInitDetailForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipAddForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipReduceForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/equip/EquipInstallReviewForm.js?<%=timestamp%>"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/lease/MaterialsDispatchListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/lease/MaterialsDispatchForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/lease/MaterialsPackageListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/lease/MaterialsPackageForm.js?<%=timestamp%>"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/scrap/ScrapApplyListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/scrap/ScrapApplyForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/scrap/ScrapContractListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/scrap/ScrapContractForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/scrap/ScrapHandleForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/scrap/ScrapHandleListView.js?<%=timestamp%>"></script>

	<script type="text/javascript" src="<%=basePath%>/js/verify/VerifyItemListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/verify/VerifySelfForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/verify/LiftVerifySelfForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/verify/TowerCraneVerifySelfForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/verify/VerifySelfListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/verify/InstallVerifySelfListView.js?<%=timestamp%>"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/fund/MoneyLendForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/MoneyLendListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/MoneyBackForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/MoneyBackListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/InvoiceIssueForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/InvoiceIssueListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/InvoiceCollectForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/InvoiceCollectListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/AmountReceiveForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/AmountReceiveListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/AmountPaymentForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/AmountPaymentListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/DeductForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/DeductListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/SalaryForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/SalaryListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/FinanceSalaryListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/ReimburseForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/ReimburseListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/DeductScaleForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/AdvanceReceiveForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/fund/AdvanceReceiveListView.js?<%=timestamp%>"></script>

	<script type="text/javascript" src="<%=basePath%>/js/diary/ComponDiaryListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/diary/EquipDiaryListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/diary/PractiDiaryListView.js?<%=timestamp%>"></script>

	<script type="text/javascript" src="<%=basePath%>/js/report/FinancialSummary.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/CashFlowStatement.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/IncomeExpenseListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/AccountDue.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/SettleAccountReceivable.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/ConstructionWork.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/AccountReceivable.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/AccountPayable.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/CustomerMargin.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/EquipSummary.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/EquipMargin.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/CollarMaterial.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/EquipVacancyRate.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/RentalFeeApplication.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/EquipRepair.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/PractiVacancyRate.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/EquipmentRate.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/ProjectConstruct.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/ProjectBalancePayments.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/ProjectInstallStatics.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/Reimburse.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/EquipmentBalancePayments.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/ComponetStocks.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/KnotDispatch.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/AttendamceRpt.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/report/ApprovalStatus.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/report/InstallDetails.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/report/ComponetDistribution.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/EquipmentInRentRate.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/PurchaseMateDetail.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/UsePurposeSummary.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/LogisticsCostSummary.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/PurchaseMateSummary.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/EquipUseMateStatistics.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/UseMateDetail.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/UseEquipList.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/SparePartsList.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/ReceivedPayments.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/AttendamceDetailRpt.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/RentalFee.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/AutoCraneCost.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/TeamSettle.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/MaterialsOutStock.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/MaterialsInStock.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/ProjectDepotInOut.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/MaterialsStoreReport.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/MaterialsGeneralLedger.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/LeasedDepotInOut.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/TemporaryStoreQuery.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/SettleMaterialsQuery.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/SettleMaterialsQueryDetail.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/MaterialsInRentDistribution.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/MaterialsHandingChargeReport.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/MaterialsWorkSiteOccupancy.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/MaterialsLostCompensationReport.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/LostCompensationDetailReport.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/LostCompensationDetailWin.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/CompensationDamageReport.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/LeaseCostAccountingReport.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/SettleProjectQuery.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/SettleProjectQueryDetail.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/AccountReceivableDetail.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/AccountsReceivableSummary.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/AccountsReceivableReportWin.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/EquipOutputValueDetail.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/EquipOutputValueSummary.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/PractiInsuranceInfoQuery.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/AccountsReceivableQuery.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/report/AmountReceiveDetail.js?<%=timestamp%>"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/safety/RiskForm.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/safety/AntiFallDetectionForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/RiskListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/RiskReportForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/RiskReportListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/AccidentForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/AccidentListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/AccidentReportForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/AccidentReportListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/SecureProtocolForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/SecureProtocolListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/InstallSecureProtocolListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/DismantleSecureProtocolListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/IndisProtocolForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/IndisProtocolListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/InstallIndisProtocolListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/DismantleIndisProtocolListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/IndisSchemaForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/IndisSchemaListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/InstallIndisSchemaListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/EmployIndisSchemaListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/DismantleIndisSchemaListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/ContingencyPlanForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/ContingencyPlanListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/InstallContingencyPlanListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/DismantleContingencyPlanListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/IndisPrecheckForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/IndisPrecheckListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/InstallIndisPrecheckListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/SafeCheckListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/SafeCheckForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/DismantleIndisPrecheckListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/IndisBasecheckForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/IndisBasecheckListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/InstallIndisBasecheckListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/DismantleIndisBasecheckListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/TechnicalDisclosureForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/TechnicalDisclosureListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/InstallTechnicalDisclosureListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/AntiFallDetectionListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/EmployTechnicalDisclosureListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/DismantleTechnicalDisclosureListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/IndisNoticeForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/IndisNoticeListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/InstallIndisNoticeListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/DismantleIndisNoticeListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/SideStationListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/EquipAddDetailListView.js?<%=timestamp%>"></script>
    <script type="text/javascript" src="<%=basePath%>/js/safety/EquipReduceDetailListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/safety/SideStationForm.js?<%=timestamp%>"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsCommodityListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsCommodityForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsSpecificationsListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsSpecificationsForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsInfoListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsDamageListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsDamageForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsScrapListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsScrapForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/AssembleAndDisassembleFeeListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/AssembleAndDisassembleFeeForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsAmortizationListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsAmortizationForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/AmortizationInitializationListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/AmortizationInitializationForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsInfoListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/BaseDepotListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/BaseDepotForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/BaseLocationListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/BaseLocationForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/CeaseReportListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/CeaseReportForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsRepairListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsRepairForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/ApplyMakeListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/ApplyMakeForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/InstallDismantlePriceListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/InstallDismantlePriceForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/BaseDepotInitListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/BaseDepotInitForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/ProjectDepotInitListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/ProjectDepotInitForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/ReceiveManageListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/ReceiveManageForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LostCompensationListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LostCompensationForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/RecycleManageListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/RecycleManageForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/AllocationProjectListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/AllocationProjectForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/AllocationDepotListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/AllocationDepotForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/OtherBusinessListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/OtherBusinessForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/OtherBetsListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/OtherBetsForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/TruckCranePriceListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/TruckCranePriceForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/OutStockListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeaseApplicationListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeaseApplicationForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeaseContractListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeaseContractForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/GoodsRecipientListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/GoodsRecipientForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/ReturnGoodsListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/ReturnGoodsForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeaseSettlementListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeaseSettlementForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeasePaymentListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeasePaymentForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/OutStockListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/SettleMaterialsForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/SettleMaterialsListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/StoreMaterialsListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/OtherMaterialStockListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/OtherMaterialStockForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/HandleMakeListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/HandleMakeForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsInfoForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsRemodelForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/MaterialsRemodelListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeaseRepairListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeaseRepairForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/SettleMaterialsFeeDetailForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeasedLostCompensationListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeasedLostCompensationForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeaseSettlementFormMultiAdd.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/TemporaryReturnListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/TemporaryReturnForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/RecycleChangeDateForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/SettleMaterialsDetailWindow.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeaseBlockUpForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/LeaseBlockUpListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/OtherLeaseBusinessForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/OtherLeaseBusinessListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/DepotTransfersForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/materials/DepotTransfersListView.js?<%=timestamp%>"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/pump/PumpTruckListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/pump/PumpTruckForm.js?<%=timestamp%>"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/takestock/TakeStockListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/takestock/TakeStockForm.js?<%=timestamp%>"></script>

	<script type="text/javascript" src="<%=basePath%>/js/APP/LocationDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/AttendamceForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/AttendamceListView.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/APP/FlowApproveGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/FlowForm.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/APP/FlowDefineListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/FlowDefineForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/FlowDefineGrid.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/APP/MyApplyListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/MyApproveListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/CopyToMyListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/TranFinishListView.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/APP/AppDispatchForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/AppDispatchComGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/AppDispatchListView.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/APP/AppRepairComGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/AppRepairCostGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/AppRepairForm.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/APP/AppRepairListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/AttendamceSetForm.js?<%=timestamp%>"></script>	
	<script type="text/javascript" src="<%=basePath%>/js/APP/AppDispatchEquipGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/AppLogisticsListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/AppLogisticsForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/AppLogisticsEquipGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/AppLogisticsComGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/PhotoDetailGrid.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/SideSystemListView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/SideSystemForm.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/APP/SideReportingGrid.js?<%=timestamp%>"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/bigData/DataAnalysisView.js?<%=timestamp%>"></script>
	<script type="text/javascript" src="<%=basePath%>/js/info/BindingFormWindows.js?<%=timestamp%>"></script>
	
	<script type="text/javascript">
		if(window.name == 0) {
			var src = "<script type='text/javascript' src='" + "js/App.js'><" + "/script>";
			document.write(src);
		}
		if (window.name == 1) {
			var src = "<script type='text/javascript' src='" + "js/App.js'><" + "/script>";
			document.write(src);
		}
		if (window.name == 2) {
			var src = "<script type='text/javascript' src='" + "js/App.js'><" + "/script>";
			document.write(src);
		}
		if (window.name == 3) {
			var src = "<script type='text/javascript' src='" + "js/App.js'><" + "/script>";
			document.write(src);
		}
		var __companyName="<%=ApplicationContainer.getCompanyName()%>";
		Ext.onReady(function() {
		   	  var storeTheme=getCookie('theme');
		   	  if (storeTheme==null || storeTheme=='') {
			   	  storeTheme='ext-all';
		   	  }
		      Ext.util.CSS.swapStyleSheet("theme", __ctxPath+"/ext3.4/resources/css/"+storeTheme+".css");  
	    });
		var __basePath = "<%=request.getScheme()+":/"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()%>";
		var hkey_key;
		var hkey_root = "HKEY_CURRENT_USER";
		var hkey_path = "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
		try {
			var RegWsh = new ActiveXObject("WScript.Shell");
			hkey_key = "header";
			RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "");
			hkey_key = "footer";
			RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "");
		} catch (e) {}
	</script>
	<script type="text/javascript" src="<%=basePath%>/js/AppHomeView.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/AppHomeShowView.js"></script>
	
	<script type="text/javascript" src="<%=basePath%>/js/AppNavigationView.js?<%=timestamp%>"></script>
	<%-- <script type="text/javascript" src="<%=basePath%>/js/App.js"></script> --%>
	<script type="text/javascript" src="<%=basePath%>/js/IndexPage.js"></script>
	
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/Spinner.js"></script>
	<script type="text/javascript" src="<%=basePath%>/ext3.4/ux/SpinnerField.js"></script>
	<script type="text/javascript" src="<%=basePath%>/js/core/ux/DateTimeField.js"></script>
</head>
<body>
	<OBJECT classid=clsid:C7672410-309E-4318-8B34-016EE77D6B58 id=ePass name=ePass STYLE="LEFT: 0px; TOP: 0px" width=0 height=0></OBJECT>
	<div id="loading">
            <div class="loading-indicator">
                 <img src="<%=basePath %>/img/loading.gif" alt="" width="153" height="16" style="margin-right:8px;" align="absmiddle"/>
                 <div class="clear"></div>
        		    正在加载，请稍候......
            </div>
	</div>
	<div id="loading-mask"></div>
		<div id="app-header" class="header">
		<div style="float:left;margin-top:15px;margin-left:40px;"><img width="40px" height="40px" src="./images/header_logo.png" /></div>
		<div class="name">广 西 大 都 租 赁 管 理 服 务 平 台
			<!-- <span class="bureau">——天元集团</span> -->
		</div>
		<div class="nav">
            <!-- <a class="twig" href="#" onclick="App.MyDesktopClick()">
                <span class="icon zicon-home"></span>
                <span class="text">首页</span>
            </a> -->
          <!--  <a class="twig" href="/help/manual.zip">
                <span class="icon zicon-help"></span>
                <span class="text">帮助</span>
            </a> -->
            <a class="twig" href="#" onclick="App.clickTopTab('SysConfigView')">
                <span class="icon zicon-set"></span>
            </a>
          	<a class="twig" href="#" onclick="App.clickTopTab('BusinessMessageListView')">
               <span class="icon"><img width="22px" height="22px" src="./images/xiaoxi.png" /></span>
            </a> 
            <a class="twig" href="#" onclick="hidePopup(event)">
                <span class="icon"><img width="22px" height="22px" src="./images/wode.png" /></span>
            </a>
        </div>
        </div>
	<div class="mapCue" id="popup">
		<div class="myMap">
			<div>
				<div>
					<a class="twig" href="#" onclick="App.clickTopTab('SysConfigView');hidePopup(event)">设置</a>
				</div>
				<div>
					<a class="twig" href="#" onclick="App.clickTopTab('BusinessMessageListView');hidePopup(event)">后台消息</a>
				</div>
			</div>
			<div class="cue" style="border-bottom: none"><a class="twig" href="<%=basePath%>/logout.do" >退出</a></div>
		</div>
	</div>
	<%
		String view = request.getParameter("view");
	%>
	<script>
		document.addEventListener('click', function() {
			 var x=document.getElementById("popup");
			 if( x.style.display == "block") {
				 x.style.display = "none";
			 }
		}) 
		function hidePopup(evt)  {
			evt.stopPropagation?evt.stopPropagation():evt.cancelBubble=true;
			  var x=document.getElementById("popup");
			  if( x.style.display == "" ||  x.style.display == "none") {
				  x.style.display = "block";
			  }else{
				  x.style.display = "none";
			  }
		}
		window.onload == function() {
			/* var array = [ "BigDataAnalysis", "EquipmentManagement",
				"xnodeAssetManagementEquip", "SystemSetting" ];
			var a = Ext.getCmp(array[window.name]);
			a.expand(true); */
			document.getElementsByTagName("body")[0].onkeydown = function() {
				var elem = event.relatedTarget || event.srcElement
						|| event.target || event.currentTarget;
				if (event.keyCode == 8) {
					var elem = event.srcElement || event.currentTarget;
					var name = elem.nodeName;
					if (name != 'INPUT' && name != 'TEXTAREA') {
						return $stopIt(event);
					}
					var type_e = elem.type.toUpperCase();
					if (name == 'INPUT'
							&& (type_e != 'TEXT' && type_e != 'TEXTAREA'
									&& type_e != 'PASSWORD' && type_e != 'FILE')) {
						return $stopIt(event);
					}
					if (name == 'INPUT'
							&& (elem.readOnly == true || elem.disabled == true)) {
						return $stopIt(event);
					}
				}
			}
		}
	</script>
</body>
</html>
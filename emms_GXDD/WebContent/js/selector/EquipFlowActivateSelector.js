var EquipFlowActivateSelector = function(a) {
	Ext.apply(this, a || {});
	this.params = {};
	Ext.apply(this.params, a.params || {});
	if(!isGranted("__ALL")) {
		this.params["QVO_contractLease.permissionFlag_S_LK"] = curUserInfo.dataPermission;
	}
	// ====================================this.searchPanel===============================================//
	var generalItems = [ {
		lable : "备案编号",
		name : "Q_[equipDiary.recordId]_S_LK"
	}, {
		lable : "出厂编号",
		name : "Q_[equipDiary.exwSerial]_S_LK"
	}, {
		lable : "项目名称",
		name : "Q_[equipDiary.projectName]_S_LK"
	}, {
		lable : "启用编号",
		name : "Q_[equipActivate.activateSerial]_S_LK"
	}, {
		lable : "设备自编号",
		name : "Q_[equipDiary.equipSerial]_S_LK"
	}, {
		lable : "项目地址",
		xtype : "areaCompositeField",
		defaultMargins : "11 2 0 0",
		style : {
			marginLeft : "795px"
		},
		skipLastItemMargin : false,
		provinceName :  "Q_equipDiary.province_S_EQ",
		cityName : "Q_equipDiary.city_S_EQ",
		countyName : "Q_equipDiary.county_S_EQ"
	} ];
	var datagrid_config = {
		single : this.single,
		store : {
			fields : EquipFlowListViewField
		},
		columns : [ {
			header : "安装时间",
			dataIndex : "equipInstall",
			renderer : function(n) {
				return n.startinDate;
			}
		}, {
			header : "启用日期",
			dataIndex : "equipActivate",
			renderer : function(n) {
				return n.activateDate;
			}
		}, {
			header : "拆卸时间",
			dataIndex : "equipDismantle",
			renderer : function(n) {
				return n.startdisDate;
			}
		}, {
			header : "楼号",
			dataIndex : "equipDiary",
			renderer : function(n) {
				return n.buildingNum;
			}
		}, {
			header : "设备自编号",
			dataIndex : "equipDiary",
			renderer : function(n) {
				return n.equipSerial;
			}
		}, {
			header : "出厂编号",
			dataIndex : "equipDiary",
			renderer : function(n) {
				return n.exwSerial;
			}
		}, {
			header : "备案编号",
			dataIndex : "equipDiary",
			renderer : function(n) {
				return n.recordId;
			}
		}, {
			header : "设备名称",
			dataIndex : "equipDiary",
			renderer : function(n) {
				return n.equipGenericName;
			}
		}, {
			header : "规格型号",
			dataIndex : "equipDiary",
			renderer : function(n) {
				return n.equipSpecificName;
			}
		}, {
			header : "合同编号",
			dataIndex : "equipInstall",
			renderer : function(n) {
				return n.contractSerial;
			}
		}, {
			header : "项目名称",
			dataIndex : "equipDiary",
			renderer : function(n) {
				return n.projectName;
			}
		} ],
	};
	// ==================================this.favoritesPanel=============================================//
	var target = null;
	var searchActionItems = [];
	if (this.collectEnable) {
		target = {
			title : "已选内容",
			single : this.single,
			collect : true,
			fields : EquipFlowListViewField,
			columns : [ {
				header : "启用编号",
				dataIndex : "equipActivate",
				renderer : function(n) {
					return n.activateSerial;
				}
			}, {
				header : "启用日期",
				dataIndex : "equipActivate",
				renderer : function(n) {
					return n.activateDate;
				}
			}, {
				header : "备案编号",
				dataIndex : "equipDiary",
				renderer : function(n) {
					return n.recordId;
				}
			}, {
				header : "项目名称",
				dataIndex : "equipDiary",
				renderer : function(n) {
					return n.projectName;
				}
			} ]
		};
		searchActionItems.push({
			xtype : "button",
			iconCls : "btn-ok",
			text : "一键全选",
			handler : this.selectAll.createDelegate(this)
		});
	}
	EquipFlowActivateSelector.superclass.constructor.call(this, {
		configView : {
			title :this.title!=null?this.title:"设备启用信息"
		},
		source : {
			url : __ctxPath + "/equip/listEquipFlow.do",
			base_params : this.params,
			search_config : {
				preLableHidden : true,
				generalItems : generalItems,
				searchActionItems : searchActionItems
			},
			datagrid_view : {
				enableHdMenu : false,
				viewConfig : {
					forceFit : !this.collectEnable,
					enableRowBody : false,
					showPreview : false
				}
			},
			datagrid_config : datagrid_config
		},
		target : target
	});
};
Ext.extend(EquipFlowActivateSelector, Knight.ux.RelationSelector, {
	
	selectAll : function() {
		//获取查询条件 params
		var params = this.sourcePanel.ownerCt.searchPanel.getForm().getValues(false);
//		params.limit = this.sourcePanel.getStore().totalLength;
		Ext.apply(params,{
			"QUERY_ALL_WITHOUT_LIMIT" : "Y"
		});
		var datas = $ajaxSyncCall(__ctxPath + "/equip/listEquipFlow.do",params);
		var data= datas.result;
		for (var i = 0; i < data.length; i++) {
			this.addCollectStore(data[i]);
		}
	}
});
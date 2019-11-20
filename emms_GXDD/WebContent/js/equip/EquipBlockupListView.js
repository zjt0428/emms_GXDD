var EquipBlockupListView = function(a) {
	Ext.apply(this, a || {});
	this.params = {};
	this.params.Q_delFlag_S_EQ = "1";
	if(!isGranted("__ALL")) {
		this.params['QVO_equipFlow.contractLease.permissionFlag_S_LK'] = curUserInfo.dataPermission;
	}
	Ext.apply(this.params, (a && a.params) || {});
	// =====================================================================//
	var generalItems = null;
	if (!this.searchDisenable) {
		generalItems = [ {
			lable : "备案编号",
			name : "Q_[equipFlow.equipDiary.recordId]_S_LK"
		}, {
			lable : "出厂编号",
			name : "Q_[equipFlow.equipDiary.exwSerial]_S_LK"
		}, {
			lable : "项目名称",
			name : "Q_[equipFlow.equipDiary.projectName]_S_LK"
		}, {
			lable : "报停日起",
			editable : false,
			xtype : "datefield",
			format : "Y-m-d",
			name : "Q_blockupDate_DL_GE"
		}, {
			lable : "至",
			editable : false,
			xtype : "datefield",
			format : "Y-m-d",
			name : "Q_blockupDate_DG_LE"
		},{
			lable : "设备自编号",
			name : "Q_[equipFlow.equipDiary.equipSerial]_S_LK"
		} ];
	}
	var actionItems = [ {
		iconCls : "btn-grid-read",
		text : "查看",
		qtip : "明细",
		handler : this.loadEquipBlockup
	} ];
	if (!this.actionDisenable) {
		this.initRowActionItems(actionItems);
	}
	var tbarItems = null;
	if (!this.tbarDisenable) {
		tbarItems = this.initTopBarActionItems();
	}
	var datagrid_config = {
		store : {
			fields : EquipBlockupListViewField
		},
		rowAction : {
			width : 60,
			actionItems : actionItems
		},
		tbarItems : tbarItems,
		columns : [ {
			width : 40,
			header : "楼号",
			dataIndex : "equipFlow",
			renderer : function(n) {
				return n.equipDiary.buildingNum;
			}
		}, {
			header : "停用编号",
			dataIndex : "blockupSerial"
		}, {
			header : "停用日期",
			dataIndex : "blockupDate",
			renderer : function(n) {
				return Ext.util.Format.date(n, 'Y-m-d');
			}
		}, {
			header : "停用类别",
			dataIndex : "blockupTypeName",
			renderer :function(){
				var blockupType = this.scope.defineRenderer.arguments[2].data.blockupType;
				if(blockupType==0){
					var blockupTypeName = '拆卸报停';
					return blockupTypeName;
				}else if(blockupType==1){
					var blockupTypeName = '中途报停';
					return blockupTypeName;
				}
			}
		}, {
			header : "设备名称",
			dataIndex : "equipFlow",
			renderer : function(n) {
				return n.equipDiary.equipGenericName;
			}
		}, {
			header : "设备型号",
			dataIndex : "equipFlow",
			renderer : function(n) {
				return n.equipDiary.equipSpecificName;
			}
		},{
			header : "设备自编号",
			dataIndex : "equipFlow",
			renderer : function(n) {
				return n.equipDiary.equipSerial;
			}
		},{
			header : "合同编号",
			dataIndex : "equipFlow",
			renderer : function(n) {
				return n.contractLease.contractNo;
			}
		},{
			header : "合同编号",
			dataIndex : "equipFlow",
			renderer : function(n) {	
				return n.contractLease.contractSerial;
			}
		},  {
			header : "项目名称",
			dataIndex : "equipFlow",
			renderer : function(n) {
				return n.equipDiary.projectName;
			}
		}, {
			width : 60,
			header : "生效状态",
			dataIndex : "effectiveName"
		}, {
			header : "恢复日期",
			dataIndex : "reactivateDate"
		} ,{
			header : "备注",
			dataIndex : "remark"
		} ]
	};
	// =====================================================================//
	EquipBlockupListView.superclass.constructor.call(this, Ext.apply({
		id : "EquipBlockupListView",
		title : TabTitle.EQUIP_BLOCKUP_LIST,
		iconCls : "menu-business-equipblockup",
		url : __ctxPath + "/equip/listEquipBlockup.do",
		base_params : this.params,
		search_config : {
			generalItems : generalItems
		},
		datagrid_config : datagrid_config
	}, a));
};
Ext.extend(EquipBlockupListView, Knight.ux.SearchGridPanel, {
//	getRowClass : function(record, rowIndex, rowParams, store) {
//		if (!Ext.isEmpty(record.data.reactivateDate)) {
//			return;
//		}
//		var blockupDate = Date.parseDate(record.data.blockupDate, "Y-m-d H:i:s");
//		var days = ((new Date()).getTime() - blockupDate.getTime()) / (1000 * 60 * 60 * 24) + 1;
//		if (days < 30) {
//			var task = new Ext.util.DelayedTask(function() {
//				this.dataGridPanel.getView().addRowClass(rowIndex, "x-grid-back-red");
//			}.createDelegate(this));
//			task.delay(10);
//		}
//	},
	initTopBarActionItems : function() {
		var tbarItems = [];
		if (isGranted("_EquipmentMultiBlockup")) {
			tbarItems.push({
				iconCls : "btn-stop",
				text : "停用",
				handler : this.blockupEquipment.createDelegate(this)
			});
		}
		if (isGranted("_EquipmentMultiBlockupSupply")) {
			tbarItems.push({
				iconCls : "btn-stop",
				text : "停用补录",
				handler : this.blockupSupplyEquipment.createDelegate(this)
			});
		}
		if (isGranted("_EquipmentMultiActivate")) {
			tbarItems.push({
				iconCls : "btn-play",
				text : "恢复",
				handler : this.activateEquipment.createDelegate(this)
			});
		}
		if (isGranted("_EquipmentMultiBatchAdd")) {
			tbarItems.push({
				iconCls : "btn-head-add",
				text : "批量报停",
				handler : this.batchAddEquipmentBlock.createDelegate(this)
			});
		}
		if (isGranted("_EquipmentMultiBlockups")) {
			tbarItems.push({
				iconCls : "btn-stop",
				text : "拆卸报停",
				handler : this.blockupsEquipment.createDelegate(this)
			});
		}
		if (isGranted("_EquipmentBlockupEdit")) {
			tbarItems.push({
				iconCls : "btn-head-edit",
				text : "修改",
				handler : this.editEquipBlockup.createDelegate(this)
			});
		}
		if (isGranted("_EquipBlockupMultiEffective")) {
			tbarItems.push({
				iconCls : "btn-head-lock",
				text : "生效",
				handler : this.effectiveEquipBlockup.createDelegate(this)
			});
		}
		if (isGranted("_EquipBlockupMultiLoseEffective")) {
			tbarItems.push({
				iconCls : "btn-head-lock",
				text : "失效",
				handler : this.loseEffectiveEquipBlockup.createDelegate(this)
			});
		}
		if (isGranted("_EquipBlockupMultiDel")) {
			tbarItems.push({
				iconCls : "btn-head-del",
				text : "删除",
				handler : this.deleteEquipBlockup.createDelegate(this)
			});
		}
		tbarItems.push("->");
		if (isGranted("_EquipBlockupPrint")) {
			tbarItems.push({
				iconCls : "btn-head-print",
				text : "打印",
				handler : this.printEquipBlockup.createDelegate(this)
			});
		}
		return tbarItems;
	},
	speciallyGridAction : function(g, id, url, op, va, cmm) {
		var msg1 = "请选择要【" + op + "】的停用设备！";
		var msg2 = cmm ? cmm : "您确认要【" + op + "】所选的停用设备吗？";
		var msg3 = "成功【" + op + "】所选的停用设备！";
		$baseGridAction(g, msg1, id, msg2, url, msg3, null, va);
	},
	loadEquipBlockup : function(a) {
		new EquipBlockupForm(a).show();
	},
	editEquipBlockup : function() {
		$editGridrowSelecte(this.dataGridPanel, function(a) {
			if (!Ext.isEmpty(a.reactivateDate)) {
				Ext.MessageBox.alert("操作信息", "该停用信息已经【恢复】不允许修改！");
				return false;
			}
			if ("1" == a.effective) {
				Ext.MessageBox.alert("操作信息", "该停用信息已经【生效】不允许修改！");
				return false;
			}
			return true;
		}.createDelegate(this), function(a) {
			new EquipBlockupForm(a.data, {
				saveable : true,
				callback : function() {
					this.dataGridPanel.getStore().reload();
				}.createDelegate(this)
			}).show();
		}.createDelegate(this));
	},
	blockupSupplyEquipment : function() {
		new EquipFlowActivateSelector({
			single : true,
			title : "设备停用信息",
			params : {
				"Q_blokup_S_EQ" : "0",
				"Q_flowState_S_GT" : "5",
				"Q_equipment.delFlag_S_EQ" : "1",
				"Q_activateId_L_NOTNULL" : "1",
				"Q_equipActivate.effective_S_EQ" : "1"
			},
			callback : function(d) {
				var data = d[0].data;
				$request({
					url : __ctxPath + "/equip/loadEquipFlow.do",
					params : {
						flowId : data.flowId,
						blockupSort : '1'
					},
					success : function(g, h) {
						var resp = Ext.util.JSON.decode(g.responseText);
						new EquipBlockupForm(resp.data[0], {
							saveable : true,
							applove : false,
							callback : function() {
								this.dataGridPanel.getStore().reload();
							}.createDelegate(this)
						}).show();
					}.createDelegate(this)
				});
			}.createDelegate(this)
		}).show();
	},
	blockupEquipment : function() {
		new EquipFlowActivateSelector({
			single : true,
			title : "设备停用信息",
			params : {
				"Q_flowState_S_LE" : "7",
				"Q_equipment.businessStatus_S_NEQ" : "7",//设备业务状态不为  报停
				"Q_equipment.status_S_NEQ" : "4",//设备零部件不为 停用
				"Q_equipment.delFlag_S_EQ" : "1",
				"Q_activateId_L_NOTNULL" : "1",
				"Q_equipActivate.effective_S_EQ" : "1"
			},
			callback : function(d) {
				var data = d[0].data;
				$request({
					url : __ctxPath + "/equip/loadEquipFlow.do",
					params : {
						flowId : data.flowId,
					},
					success : function(g, h) {
						var resp = Ext.util.JSON.decode(g.responseText);
						new EquipBlockupForm(resp.data[0],{
							saveable : true,
							applove : true,
							callback : function() {
								this.dataGridPanel.getStore().reload();
							}.createDelegate(this)
						}).show();
					}.createDelegate(this)
				});
			}.createDelegate(this)
		}).show();
	},
	blockupsEquipment : function() {
		new EquipWarehouseSelector({
			single : true,
			title : "入库停用信息",
			params : {
				"Q_isScraped_S_EQ" : "0",
				"Q_applyforState_S_EQ" : "3",
				"Q_equipFlow.equipment.businessStatus_S_NEQ" : "7",//设备业务状态不为  报停
				"Q_equipFlow.equipment.status_S_NEQ" : "4",//设备零部件不为 停用
				"Q_equipFlow.activateId_L_NOTNULL" : "1"			
			   },
			callback : function(d) {
				var data = d[0].data;
				$request({
					url : __ctxPath + "/equip/loadEquipWarehouse.do",
					params : {
						warehouseId : data.warehouseId
					},
					success : function(g, h) {
						var resp = Ext.util.JSON.decode(g.responseText);
						new EquipBlockupForm(resp.data[0], {
							saveable : true,
							Disassemble : true,
							isScraped : true,
							callback : function() {
								this.dataGridPanel.getStore().reload();
							}.createDelegate(this)
						}).show();
					}.createDelegate(this)
				});
			}.createDelegate(this)
		}).show();
	},
	batchAddEquipmentBlock : function() {
			new EquipBlockupBatchForm({
				relateEquipFlowGrid : new EquipBlockUpGrid(),
				relateModule : RelationModule.equipEmploy.relateModule
			}, {
				saveable : true,
				callback : function() {
					this.dataGridPanel.getStore().reload();
				}.createDelegate(this)
			}).show();
		},
	activateEquipment : function() {
		var a = this.dataGridPanel.getSelectionModel().getSelections();
		if (a.length == 0) {
			return;
		}
		var e = Array();
		for (var c = 0; c < a.length; c++) {
			e.push(a[c].data["blockupId"]);
		}
		new EquipBlockupActivateForm({
			ids : e,
			callback : function() {
				this.dataGridPanel.getStore().reload();
			}.createDelegate(this)
		}).show();
	},
	effectiveEquipBlockup : function() {
		this.speciallyGridAction(this.dataGridPanel, "blockupId", __ctxPath + "/equip/multiEffectiveEquipBlockup.do", "生效", function(a) {
			if ("0" == a.effective) {
				return true;
			}
			$toast("该启用信息已经【生效】！");
			return false;
		}.createDelegate(this), "是否确认生效，生效后数据将不能进行修改");
	},
	loseEffectiveEquipBlockup : function() {
		this.speciallyGridAction(this.dataGridPanel, "blockupId", __ctxPath + "/equip/multiLoseEffectiveEquipBlockup.do", "失效", null, "是否确认失效");
	},
	printEquipBlockup : function() {
		$print(this.dataGridPanel, function(a) {
			return __ctxPath + "/equip/printEquipBlockup.do?formpage=EquipBlockup&blockupId=" + a[0].data["blockupId"];
		});
	},
	deleteEquipBlockup : function() {
		this.speciallyGridAction(this.dataGridPanel, "blockupId", __ctxPath + "/equip/multiDelEquipBlockup.do", "删除", function(a) {
			if ("1" == a.effective) {
				$toast("所选数据【已生效】无法删除");
				return false;
			}
			return true;
		}.createDelegate(this));
	}
});
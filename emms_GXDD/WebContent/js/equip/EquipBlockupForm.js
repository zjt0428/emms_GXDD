var EquipBlockupForm = function(a, b) {
	Ext.apply(this, a || {});
	Ext.apply(this, b || {});
	this.saveable = this.saveable; // 保存/重置功能按钮
	this.isScraped = this.isScraped; 
	
	var fileAttachContainer = this.initFileAttachContainer({
		relateId : this.blockupId,
		relateModule : RelationModule.equipBlockup.relateModule,
		saveable : this.saveable
	});
	var blockupTypeCombo = $initComboBoxField("停用类别","equipBlockup.blockupType",  "BLOCKUP_TYPE", {
		editable : this.saveable,
		defaultValueIndex : this.Disassemble?0:null
	});
	
	var items = [ {
		xtype : "fieldset",
		title : "填报人信息",
		anchor : "98%",
		collapsible : true,
		items : [ {
			xtype : "panel",
			layout : "column",
			items : [ {
				layout : "form",
				columnWidth : 0.33,
				defaultType : "textfield",
				items : [ {
					maxLength : 20,
					width : 130,
					readOnly : true,
					fieldLabel : "填报人",
					name : "equipBlockup.userName"
				}, {
					xtype : "datetimefield",
					format : "Y-m-d H:i:s",
					width : 130,
					editable : false,
					allowBlank : false,
					fieldLabel : "停用日期",
					name : "equipBlockup.blockupDate",
				},blockupTypeCombo ]
			}, {
				layout : "form",
				columnWidth : 0.33,
				defaultType : "textfield",
				items : [ {
					xtype : "datefield",
					format : "Y-m-d",
					width : 130,
					editable : false,
					fieldLabel : "填报日期",
					name : "equipBlockup.providedDate",
					value : new Date()
				}, {
					width : 130,
					readOnly : true,
					fieldLabel : "停用单号",
					name : "equipBlockup.blockupSerial"
				} ]
			}, {
				layout : "form",
				columnWidth : 0.33,
				defaultType : "textfield",
				items : [ {
					maxLength : 20,
					readOnly : true,
					fieldLabel : "填报部门",
					name : "equipBlockup.department.depName"
				}, {
					readOnly : true,
					fieldLabel : "恢复日期",
					name : "equipBlockup.reactivateDate"
				} ]
			} ]
		} ]
	}, {
		xtype : "fieldset",
		title : "基本信息",
		anchor : "98%",
		collapsible : true,
		items : [ {
			xtype : "panel",
			layout : "column",
			items : [ {
				layout : "form",
				columnWidth : 0.34,
				defaultType : "textfield",
				items : [ {
					readOnly : true,
					fieldLabel : "启用单号",
					name : "equipBlockup.equipFlow.equipActivate.activateSerial"
				}, {
					readOnly : true,
					fieldLabel : "备案编号",
					name : "equipBlockup.equipFlow.equipDiary.recordId"
				},{
					id : "startdisDate",
					hidden : true,
					name : "equipBlockup.equipFlow.equipDismantle.startdisDate",
//					renderer : function (value,record,data){
//						if(data.equipFlow.equipDismantle != undefined){
//							return data.equipFlow.equipDismantle.startdisDate;
//						}
//					}
				},{
					id : "startinDate",
					hidden : true,
					name : "equipBlockup.equipFlow.equipInstall.startinDate",
//					renderer : function (value,record,data){
//						if(data.equipFlow.equipInstall != undefined){
//							return data.equipFlow.equipInstall.startinDate;
//						}
//					}
				},{
					hidden : true,
					name : "equipBlockup.blockupSort",
				} ]
			}, {
				layout : "form",
				columnWidth : 0.33,
				defaultType : "textfield",
				items : [ {
					readOnly : true,
					fieldLabel : "启用日期",
					name : "equipBlockup.equipFlow.equipActivate.activateDate"
				}, {
					readOnly : true,
					fieldLabel : "合同编号",
					name : "equipBlockup.equipFlow.contractLease.contractNo"
				} ]
			}, {
				layout : "form",
				columnWidth : 0.33,
				defaultType : "textfield",
				items : [ {
					readOnly : true,
					fieldLabel : "停用设备",
					name : "equipBlockup.equipFlow.equipDiary.equipGenericName"
				}, {
					readOnly : true,
					fieldLabel : "规格型号",
					name : "equipBlockup.equipFlow.equipDiary.equipSpecificName"
				} ]
			} ]
		}, {
			xtype : "panel",
			layout : "column",
			items : [ {
				layout : "form",
				columnWidth : 0.34,
				defaultType : "textfield",
				items : [ {
					readOnly : true,
					fieldLabel : "项目名称",
					name : "equipBlockup.equipFlow.equipDiary.projectName"
				},{
					readOnly : true,
					fieldLabel : "设备自编号",
					name : "equipBlockup.equipFlow.equipDiary.equipSerial"
				} ]
			}, {
				layout : "form",
				columnWidth : 0.66,
				defaultType : "textfield",
				items : [ {
					xtype : "textfield",
					anchor : "95%",
					readOnly : true,
					fieldLabel : "项目地址",
					name : "equipBlockup.equipFlow.equipDiary.address"
				}, {
					xtype : "textfield",
					anchor : "95%",
					readOnly : true,
					fieldLabel : "使用单位",
					name : "equipBlockup.equipFlow.contractLease.paEntName"
				} ]
			} ]
		}, {
			xtype : "textarea",
			anchor : "95%",
			maxLength : 128,
			fieldLabel : "备注",
			name : "equipBlockup.remark"
		}, fileAttachContainer ]
	} ];
	EquipBlockupForm.superclass.constructor.call(this, {
		title : "停用信息明细",
		maximized : true,
		form_config : {
			object : "equipBlockup",
			saveable : this.saveable,
			url : __ctxPath + "/equip/saveEquipBlockup.do",
			items : items,
			fieldMapping : EquipBlockupFieldMapping,
			hiddenField : EquipBlockupHiddenField
		}
	});
};
Ext.extend(EquipBlockupForm, Knight.ux.FormPanelWindow, {
	saveFormData : function() {
		if(isCorpAppUser()){
			this.setFieldValue("corpId",curUserInfo.corpInfo.corpId);
		}
		var practiNo = this.getFieldValue("blockupDate");
		var time = formatDate(practiNo,"yyyy-MM-dd HH:mm:ss");
		var startdisDate = this.getFieldValue("equipFlow.equipDismantle.startdisDate");
		var startinDate = this.getFieldValue("equipFlow.equipInstall.startinDate");
		var activateDate = this.getFieldValue("equipFlow.equipActivate.activateDate");
		if(startdisDate && time > startdisDate){
			$toast("停用日期不能晚于拆卸时间！");
			return;
		}else if(startinDate && time < startinDate){
			$toast("停用日期不能早于安装时间！");
			return;
		}else if(activateDate && time < activateDate){
			$toast("停用日期不能早于启用时间！");
			return;
		}
		$formsubmit(this.getForm(), function(c, e) {
			$toast("信息操作成功！");
			if (this.callback) {
				this.callback.call(this);
			}
			this.close();
		}.createDelegate(this));
	},
	loadFormData : function() {
		if (!Ext.isEmpty(this.blockupId)) {
			this.getForm().load({
				deferredRender : false,
				url : __ctxPath + "/equip/loadEquipBlockup.do?blockupId=" + this.blockupId,
				waitMsg : "正在载入数据...",
				success : function(g, h) {
					var data = Ext.util.JSON.decode(h.response.responseText).data[0];
					this.setFieldRawValue("blockupType", data.blockupTypeName);
					if(data.equipFlow.equipInstall != null){
						this.setFieldRawValue("equipFlow.equipInstall.startinDate", data.equipFlow.equipInstall.startinDate);
					
					}
					if(data.equipFlow.equipDismantle != null){
						this.setFieldRawValue("equipFlow.equipDismantle.startdisDate", data.equipFlow.equipDismantle.startdisDate);
					}
		
				}.createDelegate(this),
				failure : function(c, d) {
					Ext.Msg.alert("出错", "载入数据失败!");
				}
			});
		} else {
			if(this.Disassemble){
				var fieldNames = [ "department.depId", "department.depName", "userId", "userName", "equipFlow.flowId", "equipFlow.equipId", "isScraped","warehouseId"];
				var values = [ curUserInfo.depId, curUserInfo.depName, curUserInfo.userId, curUserInfo.fullname, this.equipFlow.flowId, this.equipFlow.equipId, this.isScraped,this.warehouseId ];
				this.setMultiFieldValue(fieldNames, values);
				fieldNames = [ "recordId", "equipGenericName", "equipSpecificName", "exwSerial", "projectName", "address","equipSerial" ];
				this.setMultiFieldValue(this.paddingFieldNames("equipFlow.equipDiary", fieldNames), this.paddingValues(this.equipFlow.equipDiary, fieldNames));
				fieldNames = [ "activateSerial", "activateDate" ];
				this.setMultiFieldValue(this.paddingFieldNames("equipFlow.equipActivate", fieldNames), this.paddingValues(this.equipFlow.equipActivate, fieldNames));
				fieldNames = [ "paEntName", "contractNo" ];
				this.setMultiFieldValue(this.paddingFieldNames("equipFlow.contractLease", fieldNames), this.paddingValues(this.equipFlow.contractLease, fieldNames));
				if(this.equipFlow.equipInstall != undefined){
					fieldNames = [ "startinDate"];
					this.setMultiFieldValue(this.paddingFieldNames("equipFlow.equipInstall", fieldNames), this.paddingValues(this.equipFlow.equipInstall, fieldNames));
				}
				if(this.equipFlow.equipDismantle != undefined){
					fieldNames = [ "startdisDate"];
					this.setMultiFieldValue(this.paddingFieldNames("equipFlow.equipDismantle", fieldNames), this.paddingValues(this.equipFlow.equipDismantle, fieldNames));
				}
			}else{
				var fieldNames = [ "department.depId", "department.depName", "userId", "userName", "equipFlow.flowId", "equipFlow.equipId", "equipFlow.contractLease.paEntName" ];
				var values = [ curUserInfo.depId, curUserInfo.depName, curUserInfo.userId, curUserInfo.fullname, this.flowId, this.equipId, this.contractLease.paEntName];
				this.setMultiFieldValue(fieldNames, values);
				fieldNames = [ "recordId", "equipGenericName", "equipSpecificName", "exwSerial", "projectName", "address","equipSerial" ];
				this.setMultiFieldValue(this.paddingFieldNames("equipFlow.equipDiary", fieldNames), this.paddingValues(this.equipDiary, fieldNames));
				fieldNames = [ "activateSerial", "activateDate" ];
				this.setMultiFieldValue(this.paddingFieldNames("equipFlow.equipActivate", fieldNames), this.paddingValues(this.equipActivate, fieldNames));
				fieldNames = [ "paEntName", "contractNo" ];
				this.setMultiFieldValue(this.paddingFieldNames("equipFlow.contractLease", fieldNames), this.paddingValues(this.contractLease, fieldNames));
				if(this.applove){
					this.setFieldValue("blockupSort", "0");
				}else{
					this.setFieldValue("blockupSort", "1");
				}
				if(this.equipInstall != undefined){
					fieldNames = [ "startinDate"];
					this.setMultiFieldValue(this.paddingFieldNames("equipFlow.equipInstall", fieldNames), this.paddingValues(this.equipInstall, fieldNames));
				}
				if(this.equipDismantle != undefined){
					fieldNames = [ "startdisDate"];
					this.setMultiFieldValue(this.paddingFieldNames("equipFlow.equipDismantle", fieldNames), this.paddingValues(this.equipDismantle, fieldNames));
				}
			}
		}
	}
});
var EquipActivateForm = function(a, b) {
	Ext.apply(this, a || {});
	Ext.apply(this, b || {});
	this.saveable = this.saveable; // 保存/重置功能按钮
	this.initFormPanel = this.initFormPanel;
	var fileAttachContainer = this.initFileAttachContainer({
		relateId : this.activateId,
		relateModule : RelationModule.equipActivate.relateModule,
		saveable : this.saveable
	});
	var tbarItems = [];
//	tbarItems.push({
//		iconCls : "btn-search",
//		text : "现场装车查询",
//		handler : this.searchForm.createDelegate(this)
//	});
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
					readOnly : true,
					fieldLabel : "填报人",
					name : "equipActivate.userName"
				}, {
					readOnly : true,
					fieldLabel : "启用单号",
					name : "equipActivate.activateSerial"
				} ]
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
					name : "equipActivate.providedDate",
					value : new Date()
				}, {
					xtype : "datefield",
					format : "Y-m-d",
					width : 130,
					editable : false,
					allowBlank : false,
					fieldLabel : "启用日期",
					name : "equipActivate.activateDate",
					/*value : new Date()*/
				} ]
			}, {
				layout : "form",
				columnWidth : 0.33,
				defaultType : "textfield",
				items : [ {
					maxLength : 20,
					readOnly : true,
					fieldLabel : "填报部门",
					name : "equipActivate.department.depName"
				},{
					xtype : "datefield",
					format : "Y-m-d",
					width : 130,
					editable : false,
					readOnly : true,
					fieldLabel : "验收日期",
					name : "equipActivate.verifyDate"
				}]
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
				defaults : {
					readOnly : true
				},
				items : [ {
					readOnly : false,
					fieldLabel : "合同编号",
					name : "equipActivate.contractNo"
				}, {
					fieldLabel : "安装告知",
					name : "equipActivate.equipFlow.equipInstall.installSerial"
				}, {
					fieldLabel : "设备自编号",
					name : "equipActivate.equipFlow.equipDiary.equipSerial"
				},{
					fieldLabel : "规格型号",
					name : "equipActivate.equipFlow.equipDiary.equipSpecificName"
				}, {
					fieldLabel : "产权单位",
					name : "equipActivate.equipFlow.equipDiary.propertyName"
				}, {
					fieldLabel : "项目名称",
					name : "equipActivate.equipFlow.equipDiary.projectName"
				}, {
					hidden:true,
					fieldLabel : "承租单位",
					name : "equipActivate.equipFlow.contractLease.paEntName"
				} ]
			}, {
				layout : "form",
				columnWidth : 0.33,
				defaultType : "textfield",
				defaults : {
					readOnly : true
				},
				items : [{
					fieldLabel : "安装高度",
					name : "equipActivate.equipFlow.equipInstall.installHeight"
				}, {
					fieldLabel : "设备类别",
					name : "equipActivate.equipFlow.equipDiary.equipCategoryName"
				}, {
					fieldLabel : "备案编号",
					name : "equipActivate.equipFlow.equipDiary.recordId"
				}, {
					fieldLabel : "项目编号",
					name : "equipActivate.equipFlow.equipDiary.projectSerial"
				},{
					readOnly: false,
					fieldLabel : "台日租金",
					name : "equipActivate.rentStandard"
				},{
					readOnly: false,
					fieldLabel : "租金单位",
					name : "equipActivate.measurement"
				}  ]
			}, {
				layout : "form",
				columnWidth : 0.33,
				defaultType : "textfield",
				defaults : {
					readOnly : true
				},
				items : [ {
					xtype : "datetimefield",
					format : "Y-m-d H:i:s",
					fieldLabel : "安装日期",
					readOnly : false,
					name : "equipActivate.equipFlow.equipInstall.startinDate"
				}, {
					fieldLabel : "生产厂家",
					name : "equipActivate.equipFlow.equipDiary.equipVender"
				}, {
					fieldLabel : "设备名称",
					name : "equipActivate.equipFlow.equipDiary.equipGenericName"
				}, {
					fieldLabel : "出厂编号",
					name : "equipActivate.equipFlow.equipDiary.exwSerial"
				}, {
					fieldLabel : "发货仓库",
					name : "equipActivate.deliveryEntName"
				},{
					fieldLabel : "楼号",
					readOnly : false,
					name : "equipActivate.equipFlow.equipDiary.buildingNum"
				},{
					fieldLabel : "进场序号",
					readOnly : false,
					name : "equipActivate.equipFlow.equipInstall.approachNumber"
				},{
					fieldLabel : "安装ID",
					hidden : true,
					name : "equipActivate.equipFlow.equipInstall.installId"
				}]
			} ]
		}, {
			xtype : "textfield",
			anchor : "95%",
			readOnly : true,
			fieldLabel : "项目地址",
			name : "equipActivate.equipFlow.equipDiary.address"
		}, {
			xtype : "textarea",
			anchor : "95%",
			maxLength : 128,
			maxLengthText : MoreThanMaxLength,
			fieldLabel : "备注",
			name : "equipActivate.remark"
		},fileAttachContainer ]
	} ];
	EquipActivateForm.superclass.constructor.call(this, {
		title : "起租信息明细",
		maximized : true,
		animateTarget : this.animateTarget,
		form_config : {
			labelWidth : 98,
			object : "equipActivate",
			saveable : this.saveable,
			tbarItems : tbarItems,			
			url : __ctxPath + "/equip/saveEquipActivate.do",
			items : items,
			fieldMapping : EquipActivateFieldMapping,
			hiddenField : EquipActivateHiddenField
		 }	
    }); 	
};
Ext.extend(EquipActivateForm, Knight.ux.FormPanelWindow, {
	saveFormData : function() {
		$formsubmit(this.getForm(), function(c, e) {
			$toast("信息操作成功！");
			if (this.callback) {
				this.callback.call(this);
			}
			this.close();
		}.createDelegate(this));
	},	
    searchForm : function(){
    	var result = $ajaxSyncCall(__ctxPath + "/dispatch/listLogisticsTransport.do", {
    		"Q_applyforState_S_EQ" : "3",
    		"Q_projectName_S_LK" : this.equipFlow==null?this.contractLease.projectName:this.equipFlow.equipDiary.projectName,
    	});
		new EquipActivateSearchForm (result).show();
	},
	addInstallEquipActivate : function() {
		new EquipFlowInstallSelector({
			single : true,
			params : { // 过滤已启用
				"Q_[activateId]_L_NULL" : "0"
			},
			callback : function(d) {
				var data = d[0].data;
				$request({
					url : __ctxPath + "/equip/loadEquipFlow.do",
					params : {
						loadProject : true,
						flowId : data.flowId
					},
					success : function(g, h) {
						var resp = Ext.util.JSON.decode(g.responseText);
						new EquipActivateForm(resp.data[0], {
							saveable : true,
							callback : function() {
								this.dataGridPanel.getStore().reload();
							}.createDelegate(this)
						}).show();
					}.createDelegate(this)
				});
			}.createDelegate(this)
		}).show();
	},	
	loadFormData : function() {
		if (!Ext.isEmpty(this.activateId)) {
			this.getForm().load({
				deferredRender : false,
				url : __ctxPath + "/equip/loadEquipActivate.do?activateId=" + this.activateId,
				waitMsg : "正在载入数据...",
				success : function(g, h) {
					var data = Ext.util.JSON.decode(h.response.responseText).data[0];
				}.createDelegate(this),
				failure : function(c, d) { 
					Ext.Msg.alert("出错", "载入数据失败!");
				}
			}); 
		}else{
			var deliveryEntNameData = $ajaxSyncCall(__ctxPath + "/equip/querydispatchEquipActivate.do?",{
				"flowId":this.flowId,
			});
			var rentInfoData = $ajaxSyncCall(__ctxPath + "/dispatch/listEquipBriefContractLease.do",{
				"contractId":this.contractId,
				"equipSpecific" :this.equipment.equipSpecific,
			});
			var data1 = deliveryEntNameData.data[0];
			var fieldNames = [ "department.depId", "department.depName", "userId", "userName", "emEnt", "emEntName", "equipFlow.flowId", "contractNo","measurement","rentStandard","deliveryEntName","verifyDate" ];
			var values = [ curUserInfo.depId, curUserInfo.depName, curUserInfo.userId, curUserInfo.fullname, this.project.unCustomId, this.project.unCustomName, this.flowId, this.contractLease.contractNo,rentInfoData.data.length>0?rentInfoData.data[0].measurement:"",rentInfoData.data.length>0?rentInfoData.data[0].rentStandard:"0",
					data1.length>0?data1[0].DELIVERY_ENT_NAME:"",this.verifyDate];
			this.setMultiFieldValue(fieldNames, values);
			fieldNames = [ "recordSerial", "equipSpecificName", "propertyName", "equipCategoryName", "recordId", "projectSerial", "equipGenericName", "exwSerial", "projectName", "address","equipVender","equipSerial","buildingNum"];

			this.setMultiFieldValue(this.paddingFieldNames("equipFlow.equipDiary", fieldNames), this.paddingValues(this.equipDiary, fieldNames));
			fieldNames = [ "installSerial", "installTheme", "installHeight", "startinDate","approachNumber" ];					
			if(this.equipInstall !=null){
				this.setMultiFieldValue(this.paddingFieldNames("equipFlow.equipInstall", fieldNames), this.paddingValues(this.equipInstall, fieldNames));	
			}
			fieldNames = [ "paEntName","approachNumber"];
			this.setMultiFieldValue(this.paddingFieldNames("equipFlow.contractLease", fieldNames), this.paddingValues(this.contractLease, fieldNames));
		}
	}
});

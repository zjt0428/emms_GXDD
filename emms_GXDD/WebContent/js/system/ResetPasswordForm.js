var ResetPasswordForm = function(b) {
	var a = new Ext.FormPanel({
		url : __ctxPath + "/system/resetPasswordAppUser.do",
		layout : "form",
		id : "setPasswordForm",
		frame : true,
		defaults : {
			widht : 400,
			anchor : "100%,100%"
		},
		defaultType : "textfield",
		items : [ {
			name : "appUserUserId",
			id : "appUserUserId",
			xtype : "hidden",
			value : b.userId
		}, {
			fieldLabel : "旧密码",
			name : "oldPassword",
			id : "oldPassword",
			inputType : "password"
		}, {
			fieldLabel : "新密码",
			name : "newPassword",
			id : "newPassword",
			inputType : "password"
		}, {
			fieldLabel : "再输入",
			name : "againPassword",
			id : "againPassword",
			inputType : "password"
		} ]
	});
	var c = new Ext.Window({
		title : "修改密码",
		iconCls : "menu-set-password",
		width : 300,
		height : 175,
		modal : true,
		layout : "anchor",
		bodyStyle : "padding:5px;",
		buttonAlign : "center",
		items : [ a ],
		buttons : [ {
			text : "保存",
			iconCls : "btn-save",
			handler : function() {
				var d = Ext.getCmp("setPasswordForm");
				if (d.getForm().isValid()) {
					d.getForm().submit({
						method : "post",
						waitMsg : "正在提交数据...",
						success : function(e, f) {
							$toast("密码修改成功！");
							c.close();
						},
						failure : function(e, f) {
							$toast("错误提示", f.result.msg);
							Ext.getCmp("setPasswordForm").getForm().reset();
						}
					});
				}
			}
		}, {
			text : "取消",
			iconCls : "btn-cancel",
			handler : function() {
				c.close();
			}
		} ]
	});
	c.show();
};
Ext.DataView.LabelEditor = Ext.extend(Ext.Editor, {
	alignment : "tl-tl",
	hideEl : false,
	cls : "x-small-editor",
	shim : false,
	completeOnEnter : true,
	cancelOnEsc : true,
	labelSelector : "div.thumb-wrap",
	constructor : function(a, b) {
		Ext.DataView.LabelEditor.superclass.constructor.call(this, b || new Ext.form.TextArea({
			allowBlank : false,
			growMin : 90,
			growMax : 240,
			grow : true,
			selectOnFocus : true
		}), a);
	},
	init : function(a) {
		this.view = a;
		a.on("render", this.initEditor, this);
		this.on("complete", this.onSave, this);
	},
	initEditor : function() {
		this.view.on({
			scope : this,
			containerclick : this.doBlur,
			click : this.doBlur
		});
		var a = this.view.getEl();
		a.on("dblclick", this.onMouseDown, this, {
			delegate : this.labelSelector
		});
	},
	doBlur : function() {
		if (this.editing) {
			this.field.blur();
		}
	},
	onMouseDown : function(g, f) {
		if (!g.ctrlKey && !g.shiftKey) {
			var d = this.view.findItemFromChild(f);
			g.stopEvent();
			var h = this.view.indexOf(d);
			var b = this.view.store.getAt(h);
			this.startEdit(f, b.data[this.dataIndex]);
			var a = d.scrollHeight;
			var c = d.scrollWidth;
			this.setSize(c, a);
			this.activeRecord = b;
		} else {
			g.preventDefault();
		}
	},
	onSave : function(a, b) {
		this.activeRecord.set(this.dataIndex, b);
		var c = Ext.getCmp("PersonalTipsView");
		if (c != null) {
			c.saveRecord(this.view.store);
		}
	}
});
Ext.ns("PersonalTipsView");
PersonalTipsView = Ext.extend(Ext.Panel, {
	maxLevel : 1,
	topbar : null,
	dataView : null,
	store : null,
	constructor : function(a) {
		Ext.applyIf(this, a);
		this.initTopbar();
		PersonalTipsView.superclass.constructor.call(this, {
			id : "PersonalTipsView",
			title : "个人便签",
			iconCls : "menu-idx-tipsTile",
			layout : "fit",
			tbar : this.topbar,
			autoScroll : false,
			items : []
		});
		this.initUI();
	},
	initTopbar : function() {
		this.topbar = new Ext.Toolbar({
			items : [ "->", {
				xtype : "button",
				text : "清除",
				iconCls : "btn-del",
				scope : this,
				handler : function() {
					PersonalTipsView.deleteTips("all");
				}
			}, {
				xtype : "button",
				text : "保存",
				iconCls : "btn-save",
				scope : this,
				handler : function() {
					this.saveRecord(this.store);
				}
			} ]
		});
	},
	initUI : function() {
		this.store = new Ext.data.JsonStore({
			url : __ctxPath + "/info/listAppTips.do",
			root : "result",
			totalProperty : "totalCounts",
			remoteSort : true,
			fields : [ {
				name : "tipsId",
				type : "int"
			}, "userId", "tipsName", "content", "disheight", "diswidth", "disleft", "distop", "dislevel", "createTime" ]
		});
		this.store.setDefaultSort("tipsId", "asc");
		this.store.load({
			params : {
				start : 0,
				limit : 1000
			}
		});
		this.store.on("load", function(b) {
			this.store = b;
			if (this.store.getCount() < 1) {
				var a = {
					tipsId : -1,
					tipsName : "initDate",
					content : "",
					diswidth : 0,
					disheight : 0,
					disleft : 0,
					distop : 0,
					dislevel : 0
				};
				var c = new this.store.recordType(a);
				this.store.add(c);
			}
	this.dataView = new Ext.DataView({
				id : "dataView",
				autoScroll : false,
				store : this.store,
				itemSelector : "div.thumb-wrap",
				multiSelect : false,
				singleSelect : true,
				overClass : "setDiv",
				plugins : [ new Ext.DataView.LabelEditor({
					dataIndex : "content"
				}) ],
				tpl : new Ext.XTemplate(
						'<div id="basicDiv" style="width:100%;overflow:hidden;height:100%;">',
						'<div id="inputDiv" style="position: absolute;width:100%;height:100%;"></div>',
						'<tpl for=".">',
						'<div id={tipsName} class="thumb-wrap tipDiv" style="width:{diswidth}px;height:{disheight}px;left:{disleft}px;top:{distop}px;z-index:{dislevel};"><span id={tipsName}a class="x-linkdel"><button class="menu-idx-tipsClose" value="" onclick="PersonalTipsView.deleteTips({tipsId});" title="删除"></button></span><span class="x-editable">{content}</span><span class="x-timelabel">{createTime}</span></div>',
						"</tpl>", "</div>"),
				scope : this,
				listeners : {
					scope : this,
					"mouseenter" : {
						fn : this.mouseenter,
						scope : this
					},
					"mouseleave" : {
						fn : this.mouseleave,
						scope : this
					},
					"click" : {
						fn : this.clickView,
						scope : this
					},
					"afterrender" : {
						fn : this.afterrender,
						scope : this
					}
				}
			});
			this.removeAll(true);
			this.add(this.dataView);
			this.doLayout();
		}, this);
	},
	saveRecord : function(b) {
		var d = [];
		for ( var c = 0; c < b.getCount(); c++) {
			var a = b.getAt(c);
			if (a.data.tipsId != -2) {
				if (a.data.tipsId == "" || a.data.tipsId == null) {
					a.set("tipsId", -1);
				}
				if (a.dirty) {
					d.push(a.data);
				}
			}
		}
		if (d.length == 0) {
			return;
		}
		Ext.Ajax.request({
			method : "post",
			url : __ctxPath + "/info/saveAppTips.do",
			success : function(e) {
				$toast("保存成功");
				b.reload({
					params : {
						start : 0,
						limit : 1000
					}
				});
			},
			failure : function(e) {
				b.reload({
					params : {
						start : 0,
						limit : 1000
					}
				});
				Ext.MessageBox.show({
					title : "操作信息",
					msg : "信息保存出错，请联系管理员！",
					buttons : Ext.MessageBox.OK,
					icon : "ext-mb-error"
				});
			},
			params : {
				data : Ext.encode(d)
			}
		});
	},
	afterrender : function(b) {
		function e(j, h) {
			var i = new Ext.Resizable(j, {
				wrap : true,
				pinned : false,
				dynamic : true,
				minWidth : 200,
				minHeight : 100,
				draggable : true
			});
			i.el.setStyle("position", "absolute");
			i.on("resize", function(p, o, l, q) {
				p.el.setStyle("position", "absolute");
				var r = p.el.getBox();
				var k = p.resizeChild.id;
				var n = h.indexOf(k);
				var m = h.store.getAt(n);
				m.set("disleft", r.x - a.getLeft());
				m.set("distop", r.y - a.getTop());
				m.set("diswidth", o - 3);
				m.set("disheight", l - 3);
			}, this);
		}
		if (this.store.getCount() > 0) {
			var a = Ext.get("basicDiv");
			var f = Ext.get("inputDiv");
			for ( var d = 0; d < this.store.getCount(); d++) {
				var g = this.store.getAt(d).get("tipsName");
				e(g, b);
			}
			function c(l, k) {
				if (!l.ctrlKey && !l.shiftKey) {
					var j = b.findItemFromChild(k);
					if (j == null) {
						var h = l.getPageX();
						var m = l.getPageY();
						f.setStyle("top", l.getPageY() - a.getTop() + "px");
						f.setStyle("left", l.getPageX() - a.getLeft() + "px");
						var i = new Ext.DataView.LabelEditor();
						i.setSize(200, 100);
						i.on("complete", function(o, q) {
							if (j == null) {
								var s = o.el.getBox();
								var n = {
									tipsName : "initName",
									content : q,
									diswidth : s.width,
									disheight : s.height,
									disleft : h - a.getLeft(),
									distop : m - a.getTop(),
									dislevel : 1
								};
								var r = new this.store.recordType(n);
								this.store.add(r);
								this.saveRecord(this.store);
							}
						}, this);
						i.startEdit(k, "");
						f.setStyle("top", "0px");
						f.setStyle("left", "0px");
					}
				}
			}
			f.on("dblclick", c, this);
		}
	},
	clickView : function(b, c, d, f) {
		var g = d.id;
		var a = Ext.get(g + "-rzwrap");
		this.maxLevel = this.maxLevel + 1;
		a.setStyle("z-index", this.maxLevel);
	},
	mouseenter : function(a, b, d, f) {
		var g = d.id;
		var c = Ext.get(g + "a");
		c.setStyle("visibility", "visible");
	},
	mouseleave : function(j, k, d, l) {
		var a = Ext.get("basicDiv");
		var n = d.id;
		var b = Ext.get(n + "a");
		b.setStyle("visibility", "hidden");
		var i = Ext.get(n + "-rzwrap").getBox();
		var k = j.indexOf(n);
		var h = j.store.getAt(k);
		var c = i.x - a.getLeft();
		var m = i.y - a.getTop();
		var f = h.data.disleft;
		var g = h.data.distop;
		if ((c != f) && (m != g)) {
			h.set("disleft", i.x - a.getLeft());
			h.set("distop", i.y - a.getTop());
		}
	}
});
PersonalTipsView.deleteTips = function(b) {
	var a = "您确认要删除所选记录吗？";
	if ("all" == b) {
		a = "您确认要清除所有便签吗?";
	}
	Ext.Msg.confirm("信息确认", a, function(c) {
		if (c == "yes") {
			Ext.Ajax.request({
				url : __ctxPath + "/info/multiDelAppTips.do",
				params : {
					ids : b
				},
				method : "POST",
				success : function(d, e) {
					$toast("成功删除便签！");
					Ext.getCmp("PersonalTipsView").store.reload({
						params : {
							start : 0,
							limit : 1000
						}
					});
				},
				failure : function(d, e) {
					$toast("操作出错，请联系管理员！");
				}
			});
		}
	});
};
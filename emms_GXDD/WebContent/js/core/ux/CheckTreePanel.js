Ext.ns("Ext.ux.tree");
Ext.ux.tree.CheckTreePanel = Ext.extend(Ext.tree.TreePanel, {
	bubbleCheck : "checked",
	cascadeCheck : "unchecked",
	checkModel : "cascade",
	deepestOnly : false,
	expandOnCheck : true,
	filter : true,
	separator : ",",
	cls : "ux-checktree",
	baseAttrs : {},
	initComponent : function() {
		this.eventModel = new Ext.ux.tree.CheckTreeEventModel(this);
		Ext.ux.tree.CheckTreePanel.superclass.initComponent.apply(this, arguments);
		var a = Ext.apply({
			uiProvider : Ext.ux.tree.CheckTreeNodeUI
		}, this.baseAttrs);
		Ext.applyIf(this.loader, {
			baseAttrs : a,
			preloadChildren : true
		});
		if (true === this.loader.preloadChildren) {
			this.loader.on("load", function(c, d) {
				d.cascade(function(e) {
					c.doPreload(e);
					e.loaded = true;
				});
			});
		}
		if (true === this.filter) {
			var b = Ext.ux.tree.TreeFilterX ? Ext.ux.tree.TreeFilterX : Ext.tree.TreeFilter;
			this.filter = new b(this, {
				autoClear : true
			});
		}
	},
	getValue : function() {
		var b = [];
		this.root.cascade(function(a) {
			if (true === a.attributes.checked) {
				if (false === this.deepestOnly || !this.isChildChecked(a)) {
					b.push(a.id);
				}
			}
		}, this);
		return b;
	},
	isChildChecked : function(b) {
		var a = false;
		Ext.each(b.childNodes, function(c) {
			if (c.attributes.checked) {
				a = true;
			}
		});
		return a;
	},
	clearValue : function() {
		this.root.cascade(function(b) {
			var a = b.getUI();
			if (a && a.setChecked) {
				a.setChecked(false);
			}
		});
		this.value = [];
		return this;
	},
	convertValue : function(d) {
		var b = [];
		if (1 < arguments.length) {
			for ( var c = 0; c < arguments.length; c++) {
				b.push(this.convertValue(arguments[c]));
			}
		} else {
			if (Ext.isArray(d)) {
				b = d;
			} else {
				if ("number" === typeof d) {
					b.push(d);
				} else {
					if ("string" === typeof d) {
						b = d.split(this.separator);
					}
				}
			}
		}
		return b;
	},
	setValue : function(a) {
		this.clearValue();
		this.value = this.convertValue.apply(this, arguments);
		Ext.each(this.value, function(d) {
			var c = this.getNodeById(d);
			if (c) {
				var b = c.getUI();
				if (b && b.setChecked) {
					b.setChecked(true);
					if (true === this.expandOnCheck) {
						c.bubbleExpand();
					}
				}
			}
		}, this);
		return this.value;
	},
	serialize : function(b) {
		b = b || "text";
		var c = [];
		this.root.cascade(function(a) {
			if (true === a.attributes.checked) {
				if (false === this.deepestOnly || !this.isChildChecked(a)) {
					c.push(a[b]);
				}
			}
		}, this);
		return c.join(this.separator + " ");
	},
	getText : function(a) {
		return this.serialize(a);
	},
	onRender : function() {
		Ext.ux.tree.CheckTreePanel.superclass.onRender.apply(this, arguments);
		if (true === this.isFormField) {
			this.hiddenField = this.body.createChild({
				tag : "input",
				type : "hidden",
				name : this.name || this.id
			}, undefined, true);
		}
	},
	updateHidden : function() {
		if (this.hiddenField) {
			this.hiddenField.value = this.getValue().join(this.separator);
		}
	},
	clearInvalid : Ext.emptyFn,
	markInvalid : Ext.emptyFn,
	validate : function() {
		return true;
	},
	isValid : function() {
		return true;
	},
	getName : function() {
		return this.name || this.id || "";
	}
});
Ext.reg("checktreepanel", Ext.ux.tree.CheckTreePanel);
Ext.override(Ext.tree.TreeNode, {
	bubbleExpand : function() {
		var a = this.getOwnerTree().root;
		var b = [];
		var c = this;
		while (c !== a) {
			c = c.parentNode;
			b.push(c);
		}
		b.reverse();
		Ext.each(b, function(d) {
			d.expand(false, false);
		});
	}
});
Ext.ux.tree.CheckTreeNodeUI = Ext.extend(Ext.tree.TreeNodeUI, {
	renderElements : function(e, h, g, j) {
		this.indentMarkup = e.parentNode ? e.parentNode.ui.getChildIndent() : "";
		var i = e.attributes.checked;
		var c = h.href ? h.href : Ext.isGecko ? "" : "#";
		var d = [ '<li class="x-tree-node"><div ext:tree-node-id="', e.id, '" class="x-tree-node-el x-tree-node-leaf x-unselectable ', h.cls, '" unselectable="on">', '<span class="x-tree-node-indent">', this.indentMarkup, "</span>",
				'<img src="', this.emptyIcon, '" class="x-tree-ec-icon x-tree-elbow" />', '<img src="', h.icon || this.emptyIcon, '" class="x-tree-node-icon', (h.icon ? " x-tree-node-inline-icon" : ""), (h.iconCls ? " " + h.iconCls : ""),
				'" unselectable="on" />', '<img src="' + this.emptyIcon + '" class="x-tree-checkbox' + (true === i ? " x-tree-node-checked" : "") + '" />', '<a hidefocus="on" class="x-tree-node-anchor" href="', c, '" tabIndex="1" ',
				h.hrefTarget ? ' target="' + h.hrefTarget + '"' : "", '><span unselectable="on">', e.text, "</span></a></div>", '<ul class="x-tree-node-ct" style="display:none;"></ul>', "</li>" ].join("");
		var b;
		if (j !== true && e.nextSibling && (b = e.nextSibling.ui.getEl())) {
			this.wrap = Ext.DomHelper.insertHtml("beforeBegin", b, d);
		} else {
			this.wrap = Ext.DomHelper.insertHtml("beforeEnd", g, d);
		}
		this.elNode = this.wrap.childNodes[0];
		this.ctNode = this.wrap.childNodes[1];
		var f = this.elNode.childNodes;
		this.indentNode = f[0];
		this.ecNode = f[1];
		this.iconNode = f[2];
		this.checkbox = f[3];
		this.cbEl = Ext.get(this.checkbox);
		this.anchor = f[4];
		this.textNode = f[4].firstChild;
	},
	setIconCls : function(a) {
		Ext.fly(this.iconNode).set({
			cls : "x-tree-node-icon " + a
		});
	},
	isChecked : function() {
		return this.node.attributes.checked === true;
	},
	onCheckChange : function() {
		var d = this.isChecked();
		var a = this.node.getOwnerTree();
		var b = a.bubbleCheck;
		var c = a.cascadeCheck;
		if ("all" === b || (d && "checked" === b) || (!d && "unchecked" === b)) {
			this.updateParent(d);
		}
		if ("all" === c || (d && "checked" === c) || (!d && "unchecked" === c)) {
			this.updateChildren(d);
		}
		a.updateHidden();
		this.fireEvent("checkchange", this.node, d);
	},
	setChecked : function(b) {
		b = true === b ? b : false;
		var a = this.cbEl || false;
		if (a) {
			true === b ? a.addClass("x-tree-node-checked") : a.removeClass("x-tree-node-checked");
		}
		this.node.attributes.checked = b;
		this.onCheckChange();
		return b;
	},
	toggleCheck : function() {
		var a = !this.isChecked();
		this.setChecked(a);
		return a;
	},
	updateParent : function(a) {
		var c = this.node.parentNode;
		var b = c ? c.getUI() : false;
		if (b && b.setChecked) {
			b.setChecked(a);
		}
	},
	updateChildren : function(a) {
		this.node.eachChild(function(c) {
			var b = c.getUI();
			if (b && b.setChecked) {
				b.setChecked(a);
			}
		});
	},
	onCheckboxClick : function() {
		if (!this.disabled) {
			this.toggleCheck();
		}
	},
	onCheckboxOver : function() {
		this.addClass("x-tree-checkbox-over");
	},
	onCheckboxOut : function() {
		this.removeClass("x-tree-checkbox-over");
	},
	onCheckboxDown : function() {
		this.addClass("x-tree-checkbox-down");
	},
	onCheckboxUp : function() {
		this.removeClass("x-tree-checkbox-down");
	}
});
Ext.ux.tree.CheckTreeEventModel = Ext.extend(Ext.tree.TreeEventModel, {
	initEvents : function() {
		var a = this.tree.getTreeEl();
		a.on("click", this.delegateClick, this);
		if (this.tree.trackMouseOver !== false) {
			a.on("mouseover", this.delegateOver, this);
			a.on("mouseout", this.delegateOut, this);
		}
		a.on("mousedown", this.delegateDown, this);
		a.on("mouseup", this.delegateUp, this);
		a.on("dblclick", this.delegateDblClick, this);
		a.on("contextmenu", this.delegateContextMenu, this);
	},
	delegateOver : function(b, a) {
		if (!this.beforeEvent(b)) {
			return;
		}
		if (this.lastEcOver) {
			this.onIconOut(b, this.lastEcOver);
			delete this.lastEcOver;
		}
		if (this.lastCbOver) {
			this.onCheckboxOut(b, this.lastCbOver);
			delete this.lastCbOver;
		}
		if (b.getTarget(".x-tree-ec-icon", 1)) {
			this.lastEcOver = this.getNode(b);
			this.onIconOver(b, this.lastEcOver);
		} else {
			if (b.getTarget(".x-tree-checkbox", 1)) {
				this.lastCbOver = this.getNode(b);
				this.onCheckboxOver(b, this.lastCbOver);
			}
		}
		if (a = this.getNodeTarget(b)) {
			this.onNodeOver(b, this.getNode(b));
		}
	},
	delegateOut : function(b, a) {
		if (!this.beforeEvent(b)) {
			return;
		}
		if (b.getTarget(".x-tree-ec-icon", 1)) {
			var c = this.getNode(b);
			this.onIconOut(b, c);
			if (c == this.lastEcOver) {
				delete this.lastEcOver;
			}
		} else {
			if (b.getTarget(".x-tree-checkbox", 1)) {
				var c = this.getNode(b);
				this.onCheckboxOut(b, c);
				if (c == this.lastCbOver) {
					delete this.lastCbOver;
				}
			}
		}
		if ((a = this.getNodeTarget(b)) && !b.within(a, true)) {
			this.onNodeOut(b, this.getNode(b));
		}
	},
	delegateDown : function(b, a) {
		if (!this.beforeEvent(b)) {
			return;
		}
		if (b.getTarget(".x-tree-checkbox", 1)) {
			this.onCheckboxDown(b, this.getNode(b));
		}
	},
	delegateUp : function(b, a) {
		if (!this.beforeEvent(b)) {
			return;
		}
		if (b.getTarget(".x-tree-checkbox", 1)) {
			this.onCheckboxUp(b, this.getNode(b));
		}
	},
	delegateOut : function(b, a) {
		if (!this.beforeEvent(b)) {
			return;
		}
		if (b.getTarget(".x-tree-ec-icon", 1)) {
			var c = this.getNode(b);
			this.onIconOut(b, c);
			if (c == this.lastEcOver) {
				delete this.lastEcOver;
			}
		} else {
			if (b.getTarget(".x-tree-checkbox", 1)) {
				var c = this.getNode(b);
				this.onCheckboxOut(b, c);
				if (c == this.lastCbOver) {
					delete this.lastCbOver;
				}
			}
		}
		if ((a = this.getNodeTarget(b)) && !b.within(a, true)) {
			this.onNodeOut(b, this.getNode(b));
		}
	},
	delegateClick : function(b, a) {
		if (!this.beforeEvent(b)) {
			return;
		}
		if (b.getTarget(".x-tree-checkbox", 1)) {
			this.onCheckboxClick(b, this.getNode(b));
		} else {
			if (b.getTarget(".x-tree-ec-icon", 1)) {
				this.onIconClick(b, this.getNode(b));
			} else {
				if (this.getNodeTarget(b)) {
					this.onNodeClick(b, this.getNode(b));
				}
			}
		}
	},
	onCheckboxChildren : function(a) {
		if (a.attributes.checked) {
			for ( var i = 0; i < a.childNodes.length; i++) {
				var n = a.childNodes[i];
				n.getUI().setChecked(true);
				if (n.childNodes.length > 0) {
					this.onCheckboxChildren(n);
				}
			}
		}
	},
	onCheckboxClick : function(b, a) {
		a.ui.onCheckboxClick();
		this.onCheckboxChildren(a);
	},
	onCheckboxOver : function(b, a) {
		a.ui.onCheckboxOver();
	},
	onCheckboxOut : function(b, a) {
		a.ui.onCheckboxOut();
	},
	onCheckboxDown : function(b, a) {
		a.ui.onCheckboxDown();
	},
	onCheckboxUp : function(b, a) {
		a.ui.onCheckboxUp();
	}
});
Ext.ns("knight.ux");
knight.ux.TreeXmlLoader = Ext.extend(Ext.tree.TreeLoader, {
	load : function(a, b) {
		if (this.clearOnLoad) {
			while (a.firstChild) {
				a.removeChild(a.firstChild);
			}
		}
		if (this.doPreload(a)) {
			if (typeof b == "function") {
				b();
			}
		} else {
			this.loadXml(a, b);
		}
	},
	doPreload : function(d) {
		if (d.attributes.children) {
			if (d.childNodes.length < 1) {
				var c = d.attributes.children;
				d.beginUpdate();
				for ( var b = 0, a = c.length; b < a; b++) {
					var e = d.appendChild(this.createNode(c[b]));
					if (this.preloadChildren) {
						this.doPreload(e);
					}
				}
				d.endUpdate();
			}
			return true;
		} else {
			return false;
		}
	},
	loadXml : function(b, f) {
		var d = b.attributes.xmlNode;
		if (d && ((d.nodeType == 1) || (d.nodeType == 9))) {
			childNodes = d.childNodes, l = d.childNodes.length;
			for ( var a = 0; a < l; a++) {
				var e = d.childNodes[a];
				if (e.nodeType == 1) {
					b.appendChild(this.createNode({
						id : e.getAttribute("id"),
						iconCls : e.getAttribute("iconCls"),
						text : e.getAttribute("text"),
						xmlNode : e,
						expanded : false,
						leaf : ((e.childNodes.length) == 0)
					}));
				} else {
					if ((e.nodeType == 3) && (e.data.trim().length != 0)) {
						b.appendChild(this.createNode({
							expanded : true,
							text : e.data,
							leaf : true
						}));
					}
				}
			}
		}
		f(this, b);
	},
	createNode : function(attr) {
		if (this.baseAttrs) {
			Ext.applyIf(attr, this.baseAttrs);
		}
		if (this.applyLoader !== false) {
			attr.loader = this;
		}
		if (typeof attr.uiProvider == "string") {
			attr.uiProvider = this.uiProviders[attr.uiProvider] || eval(attr.uiProvider);
		}
		return (attr.leaf ? new Ext.tree.TreeNode(attr) : new Ext.tree.AsyncTreeNode(attr));
	}
});
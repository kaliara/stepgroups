/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.dialog.add("cellProperties",function(e){function l(t,n){var r=function(){var e=this;s(e),n(e,e._.parentDialog),e._.parentDialog.changeFocus(!0)},i=function(){s(this),this._.parentDialog.changeFocus()},s=function(e){e.removeListener("ok",r),e.removeListener("cancel",i)},o=function(e){e.on("ok",r),e.on("cancel",i)};e.execCommand(t),e._.storedDialogs.colordialog?o(e._.storedDialogs.colordialog):CKEDITOR.on("dialogDefinition",function(e){if(e.data.name!=t)return;var n=e.data.definition;e.removeListener(),n.onLoad=CKEDITOR.tools.override(n.onLoad,function(e){return function(){o(this),n.onLoad=e,typeof e=="function"&&e.call(this)}})})}var t=e.lang.table,n=t.cell,r=e.lang.common,i=CKEDITOR.dialog.validate,s=/^(\d+(?:\.\d+)?)(px|%)$/,o=/^(\d+(?:\.\d+)?)px$/,u=CKEDITOR.tools.bind,a={type:"html",html:"&nbsp;"},f=e.lang.dir=="rtl";return{title:n.title,minWidth:CKEDITOR.env.ie&&CKEDITOR.env.quirks?450:410,minHeight:CKEDITOR.env.ie&&(CKEDITOR.env.ie7Compat||CKEDITOR.env.quirks)?230:200,contents:[{id:"info",label:n.title,accessKey:"I",elements:[{type:"hbox",widths:["40%","5%","40%"],children:[{type:"vbox",padding:0,children:[{type:"hbox",widths:["70%","30%"],children:[{type:"text",id:"width",width:"100px",label:r.width,validate:i.number(n.invalidWidth),onLoad:function(){var e=this.getDialog().getContentElement("info","widthType"),t=e.getElement(),n=this.getInputElement(),r=n.getAttribute("aria-labelledby");n.setAttribute("aria-labelledby",[r,t.$.id].join(" "))},setup:function(e){var t=parseInt(e.getAttribute("width"),10),n=parseInt(e.getStyle("width"),10);!isNaN(t)&&this.setValue(t),!isNaN(n)&&this.setValue(n)},commit:function(e){var t=parseInt(this.getValue(),10),n=this.getDialog().getValueOf("info","widthType");isNaN(t)?e.removeStyle("width"):e.setStyle("width",t+n),e.removeAttribute("width")},"default":""},{type:"select",id:"widthType",label:e.lang.table.widthUnit,labelStyle:"visibility:hidden","default":"px",items:[[t.widthPx,"px"],[t.widthPc,"%"]],setup:function(e){var t=s.exec(e.getStyle("width")||e.getAttribute("width"));t&&this.setValue(t[2])}}]},{type:"hbox",widths:["70%","30%"],children:[{type:"text",id:"height",label:r.height,width:"100px","default":"",validate:i.number(n.invalidHeight),onLoad:function(){var e=this.getDialog().getContentElement("info","htmlHeightType"),t=e.getElement(),n=this.getInputElement(),r=n.getAttribute("aria-labelledby");n.setAttribute("aria-labelledby",[r,t.$.id].join(" "))},setup:function(e){var t=parseInt(e.getAttribute("height"),10),n=parseInt(e.getStyle("height"),10);!isNaN(t)&&this.setValue(t),!isNaN(n)&&this.setValue(n)},commit:function(e){var t=parseInt(this.getValue(),10);isNaN(t)?e.removeStyle("height"):e.setStyle("height",CKEDITOR.tools.cssLength(t)),e.removeAttribute("height")}},{id:"htmlHeightType",type:"html",html:"<br />"+t.widthPx}]},a,{type:"select",id:"wordWrap",label:n.wordWrap,"default":"yes",items:[[n.yes,"yes"],[n.no,"no"]],setup:function(e){var t=e.getAttribute("noWrap"),n=e.getStyle("white-space");(n=="nowrap"||t)&&this.setValue("no")},commit:function(e){this.getValue()=="no"?e.setStyle("white-space","nowrap"):e.removeStyle("white-space"),e.removeAttribute("noWrap")}},a,{type:"select",id:"hAlign",label:n.hAlign,"default":"",items:[[r.notSet,""],[r.alignLeft,"left"],[r.alignCenter,"center"],[r.alignRight,"right"]],setup:function(e){var t=e.getAttribute("align"),n=e.getStyle("text-align");this.setValue(n||t||"")},commit:function(e){var t=this.getValue();t?e.setStyle("text-align",t):e.removeStyle("text-align"),e.removeAttribute("align")}},{type:"select",id:"vAlign",label:n.vAlign,"default":"",items:[[r.notSet,""],[r.alignTop,"top"],[r.alignMiddle,"middle"],[r.alignBottom,"bottom"],[n.alignBaseline,"baseline"]],setup:function(e){var t=e.getAttribute("vAlign"),n=e.getStyle("vertical-align");switch(n){case"top":case"middle":case"bottom":case"baseline":break;default:n=""}this.setValue(n||t||"")},commit:function(e){var t=this.getValue();t?e.setStyle("vertical-align",t):e.removeStyle("vertical-align"),e.removeAttribute("vAlign")}}]},a,{type:"vbox",padding:0,children:[{type:"select",id:"cellType",label:n.cellType,"default":"td",items:[[n.data,"td"],[n.header,"th"]],setup:function(e){this.setValue(e.getName())},commit:function(e){e.renameNode(this.getValue())}},a,{type:"text",id:"rowSpan",label:n.rowSpan,"default":"",validate:i.integer(n.invalidRowSpan),setup:function(e){var t=parseInt(e.getAttribute("rowSpan"),10);t&&t!=1&&this.setValue(t)},commit:function(e){var t=parseInt(this.getValue(),10);t&&t!=1?e.setAttribute("rowSpan",this.getValue()):e.removeAttribute("rowSpan")}},{type:"text",id:"colSpan",label:n.colSpan,"default":"",validate:i.integer(n.invalidColSpan),setup:function(e){var t=parseInt(e.getAttribute("colSpan"),10);t&&t!=1&&this.setValue(t)},commit:function(e){var t=parseInt(this.getValue(),10);t&&t!=1?e.setAttribute("colSpan",this.getValue()):e.removeAttribute("colSpan")}},a,{type:"hbox",padding:0,widths:["60%","40%"],children:[{type:"text",id:"bgColor",label:n.bgColor,"default":"",setup:function(e){var t=e.getAttribute("bgColor"),n=e.getStyle("background-color");this.setValue(n||t)},commit:function(e){var t=this.getValue();t?e.setStyle("background-color",this.getValue()):e.removeStyle("background-color"),e.removeAttribute("bgColor")}},{type:"button",id:"bgColorChoose","class":"colorChooser",label:n.chooseColor,onLoad:function(){this.getElement().getParent().setStyle("vertical-align","bottom")},onClick:function(){var e=this;l("colordialog",function(t){e.getDialog().getContentElement("info","bgColor").setValue(t.getContentElement("picker","selectedColor").getValue())})}}]},a,{type:"hbox",padding:0,widths:["60%","40%"],children:[{type:"text",id:"borderColor",label:n.borderColor,"default":"",setup:function(e){var t=e.getAttribute("borderColor"),n=e.getStyle("border-color");this.setValue(n||t)},commit:function(e){var t=this.getValue();t?e.setStyle("border-color",this.getValue()):e.removeStyle("border-color"),e.removeAttribute("borderColor")}},{type:"button",id:"borderColorChoose","class":"colorChooser",label:n.chooseColor,style:(f?"margin-right":"margin-left")+": 10px",onLoad:function(){this.getElement().getParent().setStyle("vertical-align","bottom")},onClick:function(){var e=this;l("colordialog",function(t){e.getDialog().getContentElement("info","borderColor").setValue(t.getContentElement("picker","selectedColor").getValue())})}}]}]}]}]}],onShow:function(){var e=this;e.cells=CKEDITOR.plugins.tabletools.getSelectedCells(e._.editor.getSelection()),e.setupContent(e.cells[0])},onOk:function(){var e=this,t=e._.editor.getSelection(),n=t.createBookmarks(),r=e.cells;for(var i=0;i<r.length;i++)e.commitContent(r[i]);t.selectBookmarks(n);var s=t.getStartElement(),o=new CKEDITOR.dom.elementPath(s);e._.editor._.selectionPreviousPath=o,e._.editor.fire("selectionChange",{selection:t,path:o,element:s})}}});
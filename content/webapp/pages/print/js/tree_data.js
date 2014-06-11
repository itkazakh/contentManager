(function(){
	var init0 = function() {
		
		//create the TreeView instance:
		var tree = new YAHOO.widget.TreeView("treediv0");
		
		//get a reusable reference to the root node:
		var root = tree.getRoot();
		
		//for Ahmed's documents, we'll use TextNodes.
		//First, create a parent node for his documents:
		var ahmedDocs = new YAHOO.widget.TextNode("����ע��������", root, true);
			//Create a child node for his Word document:
			var ahmedMsWord = new YAHOO.widget.TextNode("����ע��������1", ahmedDocs, false);
			//Now, apply the "icon-doc" style to this node's
			//label:
			ahmedMsWord.labelStyle = "icon-doc";
			var ahmedPpt = new YAHOO.widget.TextNode("����ע��������2", ahmedDocs, false);
			ahmedPpt.labelStyle = "icon-ppt";
			var ahmedPdf = new YAHOO.widget.TextNode("����ע��������3", ahmedDocs, false);
			
			var ahmedPdf_node1 = new YAHOO.widget.TextNode("����ע��������3_1", ahmedPdf, false);
			var ahmedPdf_node2 = new YAHOO.widget.TextNode("����ע��������3_2", ahmedPdf, false);
			var ahmedPdf_node3 = new YAHOO.widget.TextNode("����ע��������3_3", ahmedPdf, false);
			
	
		//for Susheela's documents, we'll use HTMLNodes.
		//First, create a parent node for her documents:
		var sushDocs = new YAHOO.widget.TextNode("����������", root, true);
			//Create a child node for her zipped files:
			var sushZip = new YAHOO.widget.HTMLNode("����������1", sushDocs, false, true);
			//Now, apply the "icon-zip" style to this HTML node's
			//content:
			sushZip.contentStyle = "icon-zip";
			var sushDmg = new YAHOO.widget.HTMLNode("����������2", sushDocs, false, true);
			sushDmg.contentStyle = "icon-dmg";
			var sushGen = new YAHOO.widget.HTMLNode("����������3", sushDocs, false, true);
			sushGen.contentStyle = "icon-gen";
			var sushJar = new YAHOO.widget.HTMLNode("����������4", sushDocs, false, true);
			sushJar.contentStyle = "icon-jar";
	
		tree.draw();
	}
	YAHOO.util.Event.on(window, "load", init0);
})();// JavaScript Document
//Page Init
//global variable to allow console inspection of tree:
var tree;
var tree2;
//anonymous function wraps the remainder of the logic:


	//function to initialize the tree:
    //function treeInit() {
      //  buildRandomTextNodeTree();  
       // testTree2(); 
    //}
    
	//Function  creates the tree and 
	//builds between 3 and 7 children of the root node:
    function buildRandomTextNodeTree() {
	
		//instantiate the tree:
        tree = new YAHOO.widget.TreeView("treeDiv1");

        for (var i = 0; i < Math.floor((Math.random()*4) + 3); i++) {
            var tmpNode = new YAHOO.widget.TextNode("label-" + i, tree.getRoot(), false);
            // tmpNode.collapse();
            // tmpNode.expand();
            // buildRandomTextBranch(tmpNode);
            buildLargeBranch(tmpNode);
        }

       // Expand and collapse happen prior to the actual expand/collapse,
       // and can be used to cancel the operation
       tree.subscribe("expand", function(node) {
              YAHOO.log(node.index + " was expanded", "info", "example");
              // return false; // return false to cancel the expand
           });

       tree.subscribe("collapse", function(node) {
              YAHOO.log(node.index + " was collapsed", "info", "example");
           });

       // Trees with TextNodes will fire an event for when the label is clicked:
       tree.subscribe("labelClick", function(node) {
              YAHOO.log(node.index + " label was clicked", "info", "example");
           });

		//The tree is not created in the DOM until this method is called:
        tree.draw();
    }

	//function builds 10 children for the node you pass in:
    function buildLargeBranch(node) {
        if (node.depth < 10) {
            YAHOO.log("buildRandomTextBranch: " + node.index, "info", "example");
            for ( var i = 0; i < 10; i++ ) {
                new YAHOO.widget.TextNode(node.label + "-" + i, node, false);
            }
        }
        new YAHOO.widget.HTMLNode("<a href=\"developer.yahoo.com/yui\">YUI</a>",node, false);
    }
	function testTree2(){
		tree2 =	new YAHOO.widget.TreeView("treeDiv4",[
		                                   	'Label 0',
		                                   	{type:'Text', label:'text label 1', title:'this is the tooltip for text label 1'},
		                                   	{type:'Text', label:'branch 1', title:'there should be children here', expanded:true, children:[
		                                   		'Label 1-0'
		                                   	]},
		                                   	{type:'Text',label:'YAHOO',title:'this should be an href', href:'http://www.yahoo.com', target:'somewhere new'},
		                                   	{type:'HTML',html:'<a href="developer.yahoo.com/yui">YUI</a>'},
		                                   	{type:'MenuNode',label:'branch 3',title:'this is a menu node', expanded:false, children:[
		                                   		'Label 3-0',
		                                   		'Label 3-1'
		                                   	]}
		                                   ]);
		 tree2.render();
		}
	//Add a window onload handler to build the tree when the load
	//event fires.
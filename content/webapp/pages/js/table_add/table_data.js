var myColumnHeaders = [
    {key:"���", sortable:true, resizeable:true},
    {key:"�㲿������", type:"html", sortable:true, resizeable:true},
    {key:"�˱�����", type:"html", sortable:true, resizeable:true},
    {key:"ԭ������", type:"html", sortable:true, resizeable:true},
    {key:"����", type:"currency", sortable:true, resizeable:true},
	{key:"�۸����", type:"currency", sortable:true, resizeable:true},
	{key:"������", type:"html", sortable:true, resizeable:true},
	{key:"�۲н��", type:"html", sortable:true, resizeable:true},
	{key:"����۸�", type:"html", sortable:true, resizeable:true},
	{key:"����", type:"html", sortable:true, resizeable:true},
	{key:"����", type:"html", sortable:true, resizeable:true}
];
var myColumnSet = new YAHOO.widget.ColumnSet(myColumnHeaders);
var myDataSource = new YAHOO.util.DataSource(Data.tableContent);
myDataSource.responseType = YAHOO.util.DataSource.TYPE_JSARRAY;
myDataSource.responseSchema = {
    fields: ["���","�㲿������","�˱�����","ԭ������","����","�۸����","������","�۲н��","����۸�","����","����"]
};

var myDataTable = new YAHOO.widget.DataTable("sort",myColumnSet,myDataSource,{caption:"",sortedBy:{colKey:"���",dir:"asc"}});
var onColumnSort = function(oArgs) {
    var column = oArgs.column;
    var dir = oArgs.dir;
};
myDataTable.subscribe("columnSortEvent",onColumnSort);
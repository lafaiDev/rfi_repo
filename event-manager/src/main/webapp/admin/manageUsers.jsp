<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
	<jsp:include page="/includes/header.jsp"></jsp:include>	
	<script type="text/javascript"></script>
  </head>
  <body>
  	<jsp:include page="/includes/head_menu.jsp"></jsp:include>
    <div class="container center" id="main_container">
    	<table id="grid"></table>
		<div id="navGrid"></div>
   		<div class="error"><s:property value="errorNotification" /></div>
    </div>
    <div id="modalContainer"></div>
	<jsp:include page="/includes/footer.jsp"></jsp:include>
	<script type="text/javascript">
	 var grid = jQuery("#grid").jqGrid({
		url : contextPath+'/user/list',
		datatype : "json",
		colNames : [ 'ID', 'nom', 'Login','Mail','Rôls','Téléphone','Mot de passe'],
		colModel : [ {name : 'id',key : true,index : 'id',width : 40, editable : false,search:false}, 
		             {name : 'name',key : true,width : 100,editable : true,searchoptions:{sopt:['eq','ne','le','lt','gt','ge']}},
		             {name : 'username',width : 100,editable : true},
		             {name : 'mail',width : 120,editable : true},
		             {name : 'userRole',width : 170,editable : true,formatter:userRoleFormatter},
		             {name : 'phone',width : 100,editable : true},
		             {name : 'password',width : 440,editable : true}
		           ],
		rowNum : 50,
		width : 700,
		height : 700,
		rowList : [ 10, 20, 30 ],
		pager : '#navGrid',
		sortname : 'id',
		viewrecords : true,
		sortorder : "desc",
		jsonReader : { repeatitems : false},
		prmNames : { addoper : "add", deloper : "del", editoper : "edit"},
		caption : "liste des clients",
		height : '65%',width : '100%',
		jsonReader : {repeatitems : false, root : "list"}

	});

	 grid.jqGrid('navGrid', '#navGrid', {
		edit : true,
		add : true,
		del : true,
		search : false
	}, 
	{url : contextPath+"/user/edit"}, 
	{url : contextPath+"/user/add"}, 
	{url : contextPath+"/user/del"}, {});
	 
	 grid.jqGrid('filterToolbar',{searchOperators : true});
	</script>
  </body>
</html>

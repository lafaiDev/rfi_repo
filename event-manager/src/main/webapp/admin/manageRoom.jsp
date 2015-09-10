<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page pageEncoding="UTF-8"%>

<%--
<script>
	var selectedId = null;
	var table= $('#list').DataTable({
	    ordering: true,
	    "drawCallback": function( settings ) {
			$("#main_container").fadeIn("fast");
	    }
	});
	
	selectTableRow = function(rowDiv){
		selectedId = $(rowDiv).attr("id");
		$("#list tr").removeClass("hovered");
		$(rowDiv).addClass("hovered");
	};

/* 	showEditPopUp = function(id){		
		$.ajax({
			url : contextPath+'/event/initEdit',
			method  : 'POST',
			data : {eventId:id},
			success : function(response){
				$("#modalContainer").html(response);		
				$("#editEvent").modal();
			},
			error : function(){
			}
		});		
	}; */
	
	showAddPopUp = function(){
	    $("#modalContainer").load( "add.jsp" ,function() {
	    	$("#addEvent").modal();
	    });
	}
	initBooking = function(){
		window.location.href = contextPath+'/booking/initBooking?eventId='+selectedId;
	};
	
	del = function(id){
		$.ajax({
			url : contextPath+'/event/del',
			method  : 'POST',
			data : {eventId:id},
			success : function(){
				window.location = contextPath+'/event/list';				
			},
			error : function(){
			}
		});
	};
	</script>
 --%>
<!DOCTYPE html>
<html>
<head>

	<jsp:include page="/includes/header.jsp"></jsp:include>

    <style>
        html, body {
            height: 100%;
        }
        body {
        }
        .page-content {
            padding-top: 3.125rem;
            min-height: 100%;
            height: 100%;
        }
        .table .input-control.checkbox {
            line-height: 1;
            min-height: 0;
            height: auto;
        }

        @media screen and (max-width: 800px){
            #cell-sidebar {
                flex-basis: 52px;
            }
            #cell-content {
                flex-basis: calc(100% - 52px);
            }
        }
    </style>

    <script>
        function pushMessage(t){
            var mes = 'Info|Implement independently';
            $.Notify({
                caption: mes.split("|")[0],
                content: mes.split("|")[1],
                type: t
            });
        }

        $(function(){
            $('.sidebar').on('click', 'li', function(){
                if (!$(this).hasClass('active')) {
                    $('.sidebar li').removeClass('active');
                    $(this).addClass('active');
                }
            })
        })
    </script>
</head>
<body class="bg-steel">
	<jsp:include page="/includes/admin_header.jsp"></jsp:include>

    <div class="page-content">
        <div class="flex-grid no-responsive-future" style="height: 100%;">
            <div class="row" style="height: 100%">
                <jsp:include page="/includes/left_menu.jsp"></jsp:include>
                <div class="cell auto-size padding20 bg-white" id="cell-content">
                    <h1 class="text-light">Événements<span class="mif-drive-eta place-right"></span></h1>
                    <hr class="thin bg-grayLighter">
                    <button class="button primary" onclick="pushMessage('info')"><span class="mif-plus"></span> Create...</button>
                    <button class="button success" onclick="pushMessage('success')"><span class="mif-play"></span> Start</button>
                    <button class="button warning" onclick="pushMessage('warning')"><span class="mif-loop2"></span> Restart</button>
                    <button class="button alert" onclick="pushMessage('alert')">Stop all machines</button>
                    <hr class="thin bg-grayLighter">
                    <table class="dataTable border bordered" id="grid"></table>
						<div id="navGrid"></div>
   						<div class="error"><s:property value="errorNotification" /></div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/includes/footer.jsp"></jsp:include>
	<script type="text/javascript">	
		plotGrid_Room = function(roomsList){
		var grid = $("#grid").jqGrid({
			url : contextPath+'/room/list',
			datatype : "json",
			colNames : [ 'Id', 'Nom', 'Description','Statut'],
			colModel : [ {name : 'id',key : true,index : 'id',width : 40, editable : false,search:false}, 
			             {name : 'name',key : true,width : 150,editable : true},
			             {name : 'description',width : 380,editable : true,edittype:"textarea",editable : true},
			             {name : 'state',width : 100,editable : true,editable : true}
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
			caption : "liste des Salles",
			height : '65%',width : '100%',
			jsonReader : {repeatitems : false, root : "list"},
			onSelectRow: function(id){}

		});

		grid.jqGrid('navGrid', '#navGrid', {
			edit : true,
			add : true,
			del : true,
			search : false
		},{/*Edit options*/width: 700}, { width: 700 }, 
		{url : contextPath+"/room/edit"}, 
		{url : contextPath+"/room/add"}, 
		{url : contextPath+"/room/del"}, {});
		
		grid.jqGrid('filterToolbar',{searchOperators : true});
	};
	
	plotGrid_Room();
	</script>
</body>
</html>
 
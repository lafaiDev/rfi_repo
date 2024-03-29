<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="s" uri="/struts-tags" %>


   		<div class="control-group">
			<label class="control-label" for="inputCNE">CNE</label>
			<div class="controls">
				<s:textfield id="inputCNE" placeholder="" disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputCIN">CIN</label>
			<div class="controls">
				<s:textfield id="inputCIN" placeholder="" disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputFirstName">Nom</label>
			<div class="controls">
				<s:textfield id="inputFirstName" placeholder="" disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputLastName">Prénom</label>
			<div class="controls">
				<s:textfield id="inputLastName" placeholder="" disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<a class="btn disabled">Valider</a>
				<a class="btn" onclick="showSearchClientGrid();">Rechercher un client</a>
			</div>
		</div> --%>

<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head lang="en">
	
	<jsp:include page="/includes/header.jsp"></jsp:include>

    <script>
        $(function(){
            $.StartScreen();
            var tiles = $(".tile, .tile-small, .tile-sqaure, .tile-wide, .tile-large, .tile-big, .tile-super");

            $.each(tiles, function(){
                var tile = $(this);
                setTimeout(function(){
                    tile.css({
                        opacity: 1,
                        "-webkit-transform": "scale(1)",
                        "transform": "scale(1)",
                        "-webkit-transition": ".3s",
                        "transition": ".3s"
                    });
                }, Math.floor(Math.random()*500));
            });

            $(".tile-group").animate({
                left: 0
            });
        });
     
    </script>
</head>
<body style="overflow-y: hidden;">
    <div data-role="charm" id="charmSearch">
        <h1 class="text-light">Search</h1>
        <hr class="thin"/>
        <br />
        <div class="input-control text full-size">
            <label>
                <span class="dropdown-toggle drop-marker-light">Anywhere</span>
                <ul class="d-menu" data-role="dropdown">
                    <li><a>Anywhere</a></li>
                    <li><a>Options</a></li>
                    <li><a>Files</a></li>
                    <li><a>Internet</a></li>
                </ul>
            </label>
            <input type="text">
            <button class="button"><span class="mif-search"></span></button>
        </div>
    </div>

    <div class="tile-area fg-white tile-area-scheme-lightBlue" style="height: 100%; max-height: 100% !important;">
	
	<jsp:include page="/includes/head_menu.jsp"></jsp:include>
	
        
        <div class="tile-group"  >
            <%-- <span class="tile-group-title">Identification</span> --%>
            <div class="tile-container">
                <a href="#" class="tile-large bg-white super-tile" data-role="tile" data-transform="false">
					<div class="cell auto-size padding20 bg-white" id="cell-content">
                    <h1 class="text-light">Identification<span class="mif-database place-right"></span></h1>
                    <hr class="thin bg-grayLighter">
					<div id="searchCriteriaSection" class="row cells2">
						<div class="input-control text" data-role="input">
	    					<input id="inputCNE" type="text" placeholder="CNE" name="cne">
	    					<button class="button helper-button clear"><span class="mif-cross"></span></button>
						</div>                 
						<div class="input-control text" data-role="input">
	    					<input id="inputCIN" type="text" placeholder="CIN" name="cin">
	    					<button class="button helper-button clear"><span class="mif-cross"></span></button>
						</div>  
						<div class="input-control text" data-role="input">
	    					<input type="text" placeholder="Nom" name="firstName">
	    					<button class="button helper-button clear"><span class="mif-cross"></span></button>
						</div> 
						<div class="input-control text" data-role="input">
	    					<input type="text" placeholder="Prénom" name="lastName">
	    					<button class="button helper-button clear"><span class="mif-cross"></span></button>
						</div>
						<button class="button warning" onclick="searchClient();">
							<span class="mif-search"></span> 
							Rechercher
						</button>          
					</div>					
					
                    <hr class="thin bg-grayLighter">
                    <table id="clientsSearchResultTable" class="dataTable border bordered no-footer hovered">
                    	<thead>
								<tr>
				                  <th>Id</th>
				                  <th>Nom</th>
				                  <th>Prénom</th>
				                  <th>CNE</th>
				                  <th>CIN</th>
                				</tr>  
				        </thead>
						<tbody id="searchTbody"></tbody>
                  	 </table>
                </div>
                </a>                   
            </div>
        </div> 

		<div class="tile-group double">
            <span class="tile-group-title">Options</span>
            <div class="tile-container">
                <div id="goToPaymentStep" href="#" class="tile bg-lightRed fg-white disabled" data-role="tile" style="display: none;" onclick="goToPaymentStep();">
                    <div class="tile-content iconic">
                        <span class="icon mif-money"></span>
                    </div>
                    <span class="tile-label">Paiement</span>
                </div>
       			<div class="tile bg-darkBlue fg-white" data-role="tile" onclick="goHome();">
           			<div class="tile-content iconic">
						<span class="icon mif-home"></span>
					</div>
					<span class="tile-label">Accueil</span>
				</div>
				
				<a href="<%=request.getContextPath()%>/admin/manageEvent.jsp" class="tile bg-teal fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-pencil"></span>
                    </div>
                    <span class="tile-label">Administration</span>
                </a>
                <a href="<%=request.getContextPath()%>/reporting/index.jsp" class="tile bg-darkGreen fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-chart-dots"></span>
                    </div>
                    <span class="tile-label">Reporting</span>
                </a>
            </div>
        </div>      
    </div>
</body>
<script>
var selectedClientId = -7;

$("#searchCriteriaSection input").keyup(function(event){
    if(event.keyCode == 13){
    	searchClient();
    }
});

var table = $('#clientsSearchResultTable').DataTable({
    ordering: true,
    "drawCallback": function(settings) {}
});


function searchClient(){
	var fields = $('#searchCriteriaSection').find('input');
	console.log(fields.serializeArray());
	var criteriaList = $(fields).serializeArray();
	criteriaList.push({ name : '_search' , value : 'true'});
	
	$.ajax({
		url : contextPath+'/client/list',
		method  : 'POST',
		data : criteriaList,
		dataType : "json",
		success : function(searchResult){
			searchResult=searchResult.data;
			table.clear();
			$(searchResult).each(function(index, element) {
				row = searchResult[index];
				table.row.add([row.id,row.firstName,row.lastName,row.cne,row.cin]);
			});
			table.draw();
			
			var trs = $("tr");
			trs.click(function() {
				selectedClientId = $(this).find("td").first().html();
				trs.removeClass("hovered");
				$(this).addClass("hovered");
				$("#goToPaymentStep").animate({width:"show",opacity:'show'},150,"swing");
			});
		},
		error : function(){
			table.clear();
		}
	});
	
};
</script>
</html>
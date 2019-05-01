<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista książek</title>

<script>	
	
	function postToUrl(url) {
	    var form = document.createElement('form');
	    form.action = url;
	    form.method = 'POST';
	    form.options = {};
	    document.body.appendChild(form);
	    form.submit();	    
	}
	
	function doDelete(deletePath) {	
		//$.post(deletePath);
		var xhttp = new XMLHttpRequest();
		xhttp.open("POST", deletePath, true);
		xhttp.send();
		return true;
	}
	
	function getConfirmation(deletePath) {
		var retVal = confirm("Usunąć książkę ?");
		if (retVal == true) {		
			doDelete(deletePath);
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><span class="navbar-brand">Lista
						książek w magazynie</span></li>
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a href="<c:url value = "/books/add"/>"
					class="btn btn-nav btn-success">Dodaj książkę</a></li>
			</ul>
		</div>
		</nav>
	</div>
	<div class="container">
		<c:if test="${not empty msg}">
			<div class="alert alert-${alertType} alert-dismissible fade show"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>${msgHead}</strong> ${msg}
			</div>
		</c:if>

		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th align="right">#</th>
					<th align="left">Tytuł</th>
					<th align="left">Autor</th>
					<th align="center">Data wydania</th>
					<th align="right">Liczba stron</th>
					<th></th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${books}" var="book" varStatus="status">
					<spring:url value="books/${book.id}" var="detailsUrl" />
					<spring:url value="books/${book.id}/delete" var="deleteUrl" />
					<spring:url value="books/${book.id}/update" var="updateUrl" />
					<tr>
						<td>${status.index}</td>
						<td>${book.title}</td>
						<td>${book.author.getSurnameName()}</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${book.releaseDate}" /></td>
						<td>${book.numberOfPages}</td>						
						<td width="70"><button class="btn btn-outline-info btn-sm btn-block" onclick="location.href='${detailsUrl}'"><span class="fa fa-info"></span></button></td>
						<td width="70"><button class="btn btn-outline-primary btn-sm btn-block" onclick="location.href='${updateUrl}'"><span class="fa fa-edit"></span></button></td>
						<td width="70">
							<!-- #1 - delete bez dialogu <td width="10"><form action="${deleteUrl}" method="post"> <button type="submit" class="btn btn-outline-danger btn-sm">Usuń</button></form></td>   -->
							<!-- #2 - dialog wersja 1 <td width="10"><button class="btn btn-outline-danger btn-sm" onclick="deleteConfirm('${deleteUrl}')">Usuń</button></td>  --> 
							<!-- #3 - dialog wersja 2 --> 
							<button class="btn btn-outline-danger btn-sm btn-block" data-toggle="modal" data-target="#deleteConfirmDialog" data-url="${deleteUrl}" data-title="${book.title}"><span class="fa fa-trash"></span></button>
						</td>
						</div>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
  <!-- The confirmation model -->
  <div class="modal fade" id="deleteConfirmDialog" role="dialog" > 
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <div class="modal-header">
          <h4 class="modal-title" id="dialogHeader">Potwierdź</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">	×</button>
        </div>
        
        <div class="modal-body">
          <p id="dialogQuestion"> Usunąć wskazaną książkę?</p>
        </div>
        
        <div class="modal-footer">
          <button id="dialogNo" type="button" class="btn btn-info" data-dismiss="modal">Anuluj</button> 
          <button id="dialogBtYes" type="submit" class="btn btn-danger">Usuń</button>        
        </div>     
      </div>
    </div>
  </div>	
 
 <script>
 	//kurw... 2 dni szukania i okazało się, że musi być na dole strony - inaczej nie działa 	
 	
 	//wersja 1 
 	//--------------------------------------------
 	//function deleteConfirm(deletePath) {	 
 	//	$('#deleteConfirmDialog').data('url', deletePath).modal('show');	
	//}

	//$('#dialogBtYes').click(function() {
	//	var url = $('#deleteConfirmDialog').data('url');
	//	postToUrl(url); 
	//	$('#deleteConfirmDialog').modal('hide');  
	//}); 	
 
 	//wersja 2 
 	//--------------------------------------------	 	
 	$('#deleteConfirmDialog').on('show.bs.modal', function (event) {
 		$(this).find('#dialogHeader').text("Usuwanie książki"); 
 		document.getElementById("dialogQuestion").innerHTML = "Czy na pewno chcesz usunąć książkę : <b>&#34;" + $(event.relatedTarget).data('title') + "&#34;</b> ?";
 		$(this).find('#dialogBtYes').attr('href', $(event.relatedTarget).data('url'));
	});
 	
 	$('#dialogBtYes').click(function(event) {
 		event.preventDefault();
 		postToUrl($(this).attr('href')); 
 		$('#deleteConfirmDialog').modal('hide');  
 	}); 	 	
 	
 	//tak też można dostać się do przycisków
	//document.getElementById("dialogBtNo").onclick = function() {alert("canceled" );};
 	//document.getElementById("dialogBtYes").onclick = function() {alert("The 1111111111111111" );};

	</script>
</body>
</html>
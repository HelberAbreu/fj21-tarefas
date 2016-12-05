<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Projeto fj21-tarefas</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="container">
		<c:import url="../cabecalho.jsp" />
		<div class="jumbotron">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Id</th>
						<th>Descrição</th>
						<th>Finalizado?</th>
						<th>Data de finalização</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tarefa" items="${tarefas}">
						<tr id="linha_tarefa_${tarefa.id}">
							<td>${tarefa.id}</td>
							<td>${tarefa.descricao}</td>
							<td id="tarefa_${tarefa.id}"><c:if test="${tarefa.finalizado eq false}">
									<i class="fa fa-thumbs-down" onclick="finalizaTarefa(${tarefa.id})"></i>
								</c:if> <c:if test="${tarefa.finalizado eq true}">
									<i class="fa fa-thumbs-up"></i>
								</c:if></td>
							<td id="tarefa_data_${tarefa.id}">
							<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" /></td>
 							<td nowrap="nowrap">
 								<a href="javascript:removeTarefa(${tarefa.id})">
 									<i class="fa fa-trash"></i>
								</a>
 								<a href="mostraTarefa?id=${tarefa.id}">
 									<i class="fa fa-edit"></i>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="novaTarefa" class="btn btn-primary pull-right">Adicionar</a>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	function finalizaTarefa(id){
		$.post("finalizaTarefa", {'id':id}, function(data){
			$("#tarefa_"+id).html("<i class='fa fa-thumbs-up'></i>");
			$("#tarefa_data_"+id).html(data);
		});
	}
	function removeTarefa(id){
		$.post("removeTarefa", {'id':id}, function(){
			$("#linha_tarefa_"+id).remove();
		});
	}
</script>
</html>
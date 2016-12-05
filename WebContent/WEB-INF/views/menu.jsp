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
		<c:import url="cabecalho.jsp" />
		<div class="jumbotron">
		<p>Bem vindo, ${usuarioLogado.login}</p>
			<a href="listaTarefas" class="btn btn-default btn-block">Listar Tarefas</a>
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
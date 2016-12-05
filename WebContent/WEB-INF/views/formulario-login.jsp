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
			<form action="efetuaLogin" class="form-horizontal" method="post">
				<div class="form-group">
					<label for="descricao" class="col-sm-2 control-label">Login</label>
					<div class="col-sm-10">
						<input type="text" name="login" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="descricao" class="col-sm-2 control-label">Senha</label>
					<div class="col-sm-10">
						<input type="password" name="senha" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary">Entrar</button>
					</div>
				</div>
			</form>
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
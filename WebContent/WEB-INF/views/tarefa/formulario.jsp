<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Projeto fj21-tarefas</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
	<c:import url="../cabecalho.jsp"/>
	<h3>Nova tarefa</h3>
		<div class="jumbotron">
		<form:errors path="tarefa.descricao"/>
			<form action="adicionaTarefa" class="form-horizontal" method="post">
				<div class="form-group">
					<label for="descricao" class="col-sm-2 control-label">Descrição</label>
					<div class="col-sm-10">
						<textarea id="descricao" name="descricao" class="form-control" rows="" cols=""></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary">Salvar</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script
  src="http://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
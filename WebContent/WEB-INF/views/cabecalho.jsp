<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<br />
<div class="header clearfix">
	<img
		src="http://www.caelum.com.br/imagens/base/caelum-ensino-inovacao.png"
		class="img-responsive col-md-2">
	<h3 class="text-muted col-md-3">Tarefas</h3>
	<c:if test="${!empty usuarioLogado}">
		<div class="text-muted col-md-6 pull-right">
			<h4>${usuarioLogado.login}
				<small><a href="logout" class="btn btn-link"><i
						class="fa fa-sign-out"></i></a></small>
			</h4>
		</div>
	</c:if>
</div>
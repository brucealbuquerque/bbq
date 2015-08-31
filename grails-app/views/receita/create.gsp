<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receita.label', default: 'Receita')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="wrapper criar-receita">
			<header>
				<div class="barra-superior clearfix">
					<sec:ifLoggedIn>
						<form method="POST" action="/bbq/j_spring_security_logout" >
						<!--  <input type="submit" value="sair" class="sair" /> -->
						<a href="/bbq/j_spring_security_logout" class="sair">sair</a>
						</form>
						<p class="right">
							Logado como <a href="/bbq/usuario/show/${usuario}"><sec:username/></a>
							<a href="/bbq/receita/index" class="nova-receita">Voltar</a>
						<p>

					</sec:ifLoggedIn>
					<sec:ifNotLoggedIn>
						<g:link controller='usuario' action='autenticar' class="right">Login</g:link>
						<g:link controller='usuario' action='create' class="right cadastrar">Cadastrar</g:link>
					</sec:ifNotLoggedIn>
				</div>
			</header>


			<asset:image src="bbq.png" alt="Logo BBQ ExTouro" class="img-cadastro" />
			<div id="create-receita" class="content scaffold-create" role="main">
				<h1>Nova Receita</h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<g:hasErrors bean="${receitaInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${receitaInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
						<g:message error="${error}"/>
					</li>
					</g:eachError>
				</ul>
				</g:hasErrors>
				<g:form url="[resource:receitaInstance, action:'save']" enctype="multipart/form-data" >
					<fieldset class="form">
						<g:render template="form"/>
					</fieldset>
					<fieldset class="buttons">
						<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</fieldset>
				</g:form>
			</div>
		</div>
	</body>
</html>

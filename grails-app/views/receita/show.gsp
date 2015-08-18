
<%@ page import="bbq.Receita" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receita.label', default: 'Receita')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-receita" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-receita" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list receita">

				<g:if test="${receitaInstance?.etapas}">
				<li class="fieldcontain">
					<span id="etapas-label" class="property-label"><g:message code="receita.etapas.label" default="Etapas" /></span>

						<g:each in="${receitaInstance.etapas}" var="e">
						<span class="property-value" aria-labelledby="etapas-label"><g:link controller="etapa" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>

				</li>
				</g:if>

				<g:if test="${receitaInstance?.likes}">
				<li class="fieldcontain">
					<span id="likes-label" class="property-label"><g:message code="receita.likes.label" default="likes" /></span>

						<span class="property-value" aria-labelledby="likes-label"><g:fieldValue bean="${receitaInstance}" field="likes"/></span>

				</li>
				</g:if>

				<g:if test="${receitaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="receita.nome.label" default="Nome" /></span>

						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${receitaInstance}" field="nome"/></span>

				</li>
				</g:if>

			</ol>
			<g:form url="[resource:receitaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${receitaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

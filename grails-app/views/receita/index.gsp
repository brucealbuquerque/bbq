
<%@ page import="bbq.Receita" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'receita.label', default: 'Receita')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-receita" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-receita" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="likes" title="${message(code: 'receita.likes.label', default: 'likes')}" />

						<g:sortableColumn property="nome" title="${message(code: 'receita.nome.label', default: 'Nome')}" />

					</tr>
				</thead>
				<tbody>
				<g:each in="${receitaInstanceList}" status="i" var="receitaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${receitaInstance.id}">${fieldValue(bean: receitaInstance, field: "likes")}</g:link></td>

						<td>${fieldValue(bean: receitaInstance, field: "nome")}</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${receitaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

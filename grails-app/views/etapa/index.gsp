
<%@ page import="bbq.Etapa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'etapa.label', default: 'Etapa')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-etapa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-etapa" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descricao" title="${message(code: 'etapa.descricao.label', default: 'Descricao')}" />
					
						<th><g:message code="etapa.receita.label" default="Receita" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${etapaInstanceList}" status="i" var="etapaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${etapaInstance.id}">${fieldValue(bean: etapaInstance, field: "descricao")}</g:link></td>
					
						<td>${fieldValue(bean: etapaInstance, field: "receita")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${etapaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>

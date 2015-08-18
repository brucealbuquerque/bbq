<%@ page import="bbq.Receita" %>



<div class="fieldcontain ${hasErrors(bean: receitaInstance, field: 'etapas', 'error')} ">
	<label for="etapas">
		<g:message code="receita.etapas.label" default="Etapas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${receitaInstance?.etapas?}" var="e">
    <li><g:link controller="etapa" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="etapa" action="create" params="['receita.id': receitaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'etapa.label', default: 'Etapa')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: receitaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="receita.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${receitaInstance?.nome}"/>

</div>


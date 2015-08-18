<%@ page import="bbq.Etapa" %>



<div class="fieldcontain ${hasErrors(bean: etapaInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="etapa.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${etapaInstance?.descricao}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: etapaInstance, field: 'receita', 'error')} required">
	<label for="receita">
		<g:message code="etapa.receita.label" default="Receita" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="receita" name="receita.id" from="${bbq.Receita.list()}" optionKey="id" required="" value="${etapaInstance?.receita?.id}" class="many-to-one"/>

</div>


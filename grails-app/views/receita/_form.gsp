<%@ page import="bbq.Receita" %>



<div class="fieldcontain ${hasErrors(bean: receitaInstance, field: 'etapas', 'error')} ">
	<label for="etapas">
		<g:message code="receita.etapas.label" default="Etapas" />

	</label>



</div>

<div class="fieldcontain ${hasErrors(bean: receitaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="receita.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${receitaInstance?.nome}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: receitaInstance, field: 'etapas', 'error')} required">
	<label for="likes">
		Etapas
		<span class="required-indicator">*</span>
	</label>
	<g:textArea type="text"  name="etapas" value="${receitaInstance.etapas}" />

</div>

<div class="fieldcontain ${hasErrors(bean: receitaInstance, field: 'ingredientes', 'error')} required">
	<label for="ingredientes">
		Ingredientes
		<span class="required-indicator">*</span>
	</label>
	<g:textArea type="text"  name="ingredientes" value="${receitaInstance.ingredientes}" />
</div>


<div>
	<g:field type="file" accept="image/*"  name="image" value="${receitaInstance.image}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: receitaInstance, field: 'youtubeLink', 'error')} required">
	<label for="likes">
		<g:message code="receita.youtubeLink.label" default="Link do youtube" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="text" name="youtubeLink" value="${receitaInstance.youtubeLink}" />

</div>

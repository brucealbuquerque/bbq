import bbq.Receita
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_bbq_receita_form_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/receita/_form.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
expressionOut.print(hasErrors(bean: receitaInstance, field: 'etapas', 'error'))
printHtmlPart(1)
invokeTag('message','g',7,['code':("receita.etapas.label"),'default':("Etapas")],-1)
printHtmlPart(2)
expressionOut.print(hasErrors(bean: receitaInstance, field: 'nome', 'error'))
printHtmlPart(3)
invokeTag('message','g',17,['code':("receita.nome.label"),'default':("Nome")],-1)
printHtmlPart(4)
invokeTag('textField','g',20,['name':("nome"),'required':(""),'value':(receitaInstance?.nome)],-1)
printHtmlPart(5)
expressionOut.print(hasErrors(bean: receitaInstance, field: 'etapas', 'error'))
printHtmlPart(6)
invokeTag('textArea','g',30,['type':("text"),'name':("etapas"),'value':(receitaInstance.etapas)],-1)
printHtmlPart(7)
expressionOut.print(hasErrors(bean: receitaInstance, field: 'ingredientes', 'error'))
printHtmlPart(8)
invokeTag('textArea','g',39,['type':("text"),'name':("ingredientes"),'value':(receitaInstance.ingredientes)],-1)
printHtmlPart(9)
invokeTag('field','g',44,['type':("file"),'accept':("image/*"),'name':("image"),'value':(receitaInstance.image)],-1)
printHtmlPart(10)
expressionOut.print(hasErrors(bean: receitaInstance, field: 'youtubeLink', 'error'))
printHtmlPart(11)
invokeTag('message','g',49,['code':("receita.youtubeLink.label"),'default':("Link do youtube")],-1)
printHtmlPart(4)
invokeTag('field','g',52,['type':("text"),'name':("youtubeLink"),'value':(receitaInstance.youtubeLink)],-1)
printHtmlPart(12)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1440947568000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}

import bbq.Receita
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_bbq_receitashow_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/receita/show.gsp" }
public Object run() {
Writer out = getOut()
Writer expressionOut = getExpressionOut()
registerSitemeshPreprocessMode()
printHtmlPart(0)
printHtmlPart(1)
createTagBody(1, {->
printHtmlPart(2)
invokeTag('captureMeta','sitemesh',6,['gsp_sm_xmlClosingForEmptyTag':(""),'charset':("utf-8")],-1)
printHtmlPart(3)
invokeTag('captureMeta','sitemesh',7,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("HandheldFriendly"),'content':("True")],-1)
printHtmlPart(3)
invokeTag('captureMeta','sitemesh',8,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("MobileOptimized"),'content':("320")],-1)
printHtmlPart(3)
invokeTag('captureMeta','sitemesh',9,['gsp_sm_xmlClosingForEmptyTag':("/"),'name':("viewport"),'content':("width=device-width, initial-scale=1")],-1)
printHtmlPart(4)
createTagBody(2, {->
createClosureForHtmlPart(5, 3)
invokeTag('captureTitle','sitemesh',11,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',11,[:],2)
printHtmlPart(6)
invokeTag('stylesheet','asset',12,['src':("style.css")],-1)
printHtmlPart(7)
})
invokeTag('captureHead','sitemesh',23,[:],1)
printHtmlPart(8)
createTagBody(1, {->
printHtmlPart(9)
createTagBody(2, {->
printHtmlPart(10)
expressionOut.print(usuario)
printHtmlPart(11)
invokeTag('username','sec',32,[:],-1)
printHtmlPart(12)
})
invokeTag('ifLoggedIn','sec',37,[:],2)
printHtmlPart(13)
createTagBody(2, {->
printHtmlPart(14)
createClosureForHtmlPart(15, 3)
invokeTag('link','g',39,['controller':("usuario"),'action':("autenticar")],3)
printHtmlPart(13)
})
invokeTag('ifNotLoggedIn','sec',40,[:],2)
printHtmlPart(16)
invokeTag('image','asset',47,['src':("bbq.png"),'alt':("Logo BBQ ExTouro")],-1)
printHtmlPart(17)
createTagBody(2, {->
printHtmlPart(18)
invokeTag('textField','g',54,['placeholder':("Pesquise aqui uma receita"),'name':("query"),'value':(params.query)],-1)
printHtmlPart(19)
})
invokeTag('form','g',56,['action':("search"),'method':("GET")],2)
printHtmlPart(20)
expressionOut.print(receitaInstance.nome)
printHtmlPart(21)
expressionOut.print(receitaInstance.likes.size())
printHtmlPart(22)
createTagBody(2, {->
printHtmlPart(23)
createTagBody(3, {->
printHtmlPart(24)
createClosureForHtmlPart(25, 4)
invokeTag('actionSubmit','g',67,['action':("like"),'value':("curtir")],4)
printHtmlPart(23)
})
invokeTag('form','g',68,['url':([resource:receitaInstance, action:'like']),'method':("POST")],3)
printHtmlPart(26)
})
invokeTag('ifLoggedIn','sec',69,[:],2)
printHtmlPart(27)
invokeTag('createLink','g',72,['controller':("Receita"),'action':("image"),'width':("320"),'height':("240"),'params':([id: receitaInstance.id])],-1)
printHtmlPart(28)
expressionOut.print(receitaInstance.ingredientes)
printHtmlPart(29)
expressionOut.print(receitaInstance.etapas)
printHtmlPart(30)
expressionOut.print(receitaInstance.youtubeLink)
printHtmlPart(31)
})
invokeTag('captureBody','sitemesh',88,[:],1)
printHtmlPart(32)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1440970365000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}

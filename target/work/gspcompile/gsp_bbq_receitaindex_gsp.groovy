import bbq.Receita
import org.codehaus.groovy.grails.plugins.metadata.GrailsPlugin
import org.codehaus.groovy.grails.web.pages.GroovyPage
import org.codehaus.groovy.grails.web.taglib.*
import org.codehaus.groovy.grails.web.taglib.exceptions.GrailsTagException
import org.springframework.web.util.*
import grails.util.GrailsUtil

class gsp_bbq_receitaindex_gsp extends GroovyPage {
public String getGroovyPageFileName() { "/WEB-INF/grails-app/views/receita/index.gsp" }
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
invokeTag('stylesheet','asset',10,['src':("style.css")],-1)
printHtmlPart(5)
createTagBody(2, {->
createClosureForHtmlPart(6, 3)
invokeTag('captureTitle','sitemesh',22,[:],3)
})
invokeTag('wrapTitleTag','sitemesh',22,[:],2)
printHtmlPart(7)
})
invokeTag('captureHead','sitemesh',24,[:],1)
printHtmlPart(8)
createTagBody(1, {->
printHtmlPart(9)
createTagBody(2, {->
printHtmlPart(10)
expressionOut.print(usuario)
printHtmlPart(11)
invokeTag('username','sec',33,[:],-1)
printHtmlPart(12)
})
invokeTag('ifLoggedIn','sec',38,[:],2)
printHtmlPart(13)
createTagBody(2, {->
printHtmlPart(14)
createClosureForHtmlPart(15, 3)
invokeTag('link','g',40,['controller':("usuario"),'action':("autenticar")],3)
printHtmlPart(13)
})
invokeTag('ifNotLoggedIn','sec',41,[:],2)
printHtmlPart(16)
invokeTag('image','asset',48,['src':("bbq.png"),'alt':("Logo BBQ ExTouro")],-1)
printHtmlPart(17)
createTagBody(2, {->
printHtmlPart(18)
invokeTag('textField','g',56,['placeholder':("Pesquise aqui uma receita"),'name':("query"),'value':(params.query)],-1)
printHtmlPart(19)
})
invokeTag('form','g',58,['action':("search"),'method':("GET")],2)
printHtmlPart(20)
loop:{
int i = 0
for( receita in (receitaInstanceList) ) {
printHtmlPart(21)
expressionOut.print(receita.id)
printHtmlPart(11)
expressionOut.print(receita.nome)
printHtmlPart(22)
expressionOut.print(receita.likes.size())
printHtmlPart(23)
i++
}
}
printHtmlPart(24)
})
invokeTag('captureBody','sitemesh',85,[:],1)
printHtmlPart(25)
}
public static final Map JSP_TAGS = new HashMap()
protected void init() {
	this.jspTags = JSP_TAGS
}
public static final String CONTENT_TYPE = 'text/html;charset=UTF-8'
public static final long LAST_MODIFIED = 1440970358000L
public static final String EXPRESSION_CODEC = 'html'
public static final String STATIC_CODEC = 'none'
public static final String OUT_CODEC = 'html'
public static final String TAGLIB_CODEC = 'none'
}

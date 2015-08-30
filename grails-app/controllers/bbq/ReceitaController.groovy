package bbq



import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional
import comum.Usuario

@Transactional(readOnly = true)
class ReceitaController {

    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def receitas = Receita.list()
        receitas = receitas.sort {it.likes.size()}
        receitas = receitas.reverse()

        respond  receitas, model:[receitaInstanceCount: Receita.count(), usuario: springSecurityService.currentUser?.id]
    }

    def search() {


      def recs = Receita.findAll("from Receita r WHERE r.nome like '%"+params.query+"%' " +
        "or r.ingredientes like '%"+params.query+"%' or r.etapas like '%"+params.query+"%'")
        recs = recs.sort { it.likes.size() }
        recs = recs.reverse()

      respond recs, model:[usuario: springSecurityService.currentUser?.id]
    }

    def show(Receita receitaInstance) {
        respond receitaInstance, model:[usuario: springSecurityService.currentUser?.id]
    }

    def image() {

      Receita receita = Receita.findById(params.id)

        response.contentType = 'image/jpeg' // or the appropriate image content type
        response.outputStream << receita.image
        response.outputStream.flush()

    }

    def create(Receita receitaInstance) {

        receitaInstance = new Receita(params)
        respond receitaInstance
    }

    @Transactional
    def like(Receita receita) {

        def user = springSecurityService.currentUser
        Usuario usuario = Usuario.findByUsername(user)
        println user

        receita.addToLikes(usuario)
        receita.save flush:true

        redirect(action: "show", id : receita.id)

    }

    @Transactional
    @Secured
    def save(Receita receitaInstance) {
        if (receitaInstance == null) {
            notFound()
            return
        }
/*
        if (receitaInstance.hasErrors()) {
            respond receitaInstance.errors, view:'create'
            return
        }
*/
        def user = springSecurityService.currentUser
        Usuario usuario = Usuario.findById(user.id)

        receitaInstance.criador = usuario
        def file = request.getFile('image')
        if (!file.empty) {
          receitaInstance.image = file.getBytes()
        }


        receitaInstance.save flush:true

        redirect(action: "index")
    }
    @Transactional
    def comentar(Receita receitaInstance) {

      def user = springSecurityService.currentUser
      Usuario usuario = Usuario.findById(user.id)

      Comentario comentario = new Comentario()
      comentario.usuario  = usuario

      comentario.texto = params.texto
      comentario.data = new Date()

      receitaInstance.addToComentarios(comentario)

      receitaInstance.save flush:true

      redirect(action: "show", id : receitaInstance.id)

    }


    def edit(Receita receitaInstance) {
        respond receitaInstance
    }

    @Transactional
    def update(Receita receitaInstance) {
        if (receitaInstance == null) {
            notFound()
            return
        }

        if (receitaInstance.hasErrors()) {
            respond receitaInstance.errors, view:'edit'
            return
        }

        receitaInstance.save flush:true

        redirect(action: "index")
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'receita.label', default: 'Receita'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

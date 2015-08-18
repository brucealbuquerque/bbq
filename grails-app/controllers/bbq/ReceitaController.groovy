package bbq



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ReceitaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Receita.list(params), model:[receitaInstanceCount: Receita.count()]
    }

    def show(Receita receitaInstance) {
        respond receitaInstance
    }

    def create() {
        respond new Receita(params)
    }

    @Transactional
    def save(Receita receitaInstance) {
        if (receitaInstance == null) {
            notFound()
            return
        }

        if (receitaInstance.hasErrors()) {
            respond receitaInstance.errors, view:'create'
            return
        }

        receitaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'receita.label', default: 'Receita'), receitaInstance.id])
                redirect receitaInstance
            }
            '*' { respond receitaInstance, [status: CREATED] }
        }
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

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Receita.label', default: 'Receita'), receitaInstance.id])
                redirect receitaInstance
            }
            '*'{ respond receitaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Receita receitaInstance) {

        if (receitaInstance == null) {
            notFound()
            return
        }

        receitaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Receita.label', default: 'Receita'), receitaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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

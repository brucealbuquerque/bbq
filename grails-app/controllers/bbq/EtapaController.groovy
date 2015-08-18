package bbq

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EtapaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Etapa.list(params), model:[etapaInstanceCount: Etapa.count()]
    }

    def show(Etapa etapaInstance) {
        respond etapaInstance
    }

    def create() {
        respond new Etapa(params)
    }

    @Transactional
    def save(Etapa etapaInstance) {
        if (etapaInstance == null) {
            notFound()
            return
        }

        if (etapaInstance.hasErrors()) {
            respond etapaInstance.errors, view:'create'
            return
        }

        etapaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'etapa.label', default: 'Etapa'), etapaInstance.id])
                redirect etapaInstance
            }
            '*' { respond etapaInstance, [status: CREATED] }
        }
    }

    def edit(Etapa etapaInstance) {
        respond etapaInstance
    }

    @Transactional
    def update(Etapa etapaInstance) {
        if (etapaInstance == null) {
            notFound()
            return
        }

        if (etapaInstance.hasErrors()) {
            respond etapaInstance.errors, view:'edit'
            return
        }

        etapaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Etapa.label', default: 'Etapa'), etapaInstance.id])
                redirect etapaInstance
            }
            '*'{ respond etapaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Etapa etapaInstance) {

        if (etapaInstance == null) {
            notFound()
            return
        }

        etapaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Etapa.label', default: 'Etapa'), etapaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'etapa.label', default: 'Etapa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}

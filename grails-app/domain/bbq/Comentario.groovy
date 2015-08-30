package bbq
import comum.Usuario

class Comentario {

    Usuario usuario
    static belongsTo = Receita
    String texto
    Date data

    static constraints = {
    }
}

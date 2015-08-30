package bbq
import comum.Usuario

class Receita {

  String nome
  String youtubeLink
  String etapas
  String ingredientes
  byte[] image
  static hasMany = [likes: Usuario]
  

  public String toString() {
      this.nome
  }
    static constraints = {
      youtubeLink blank:true, nullable:true
      image blank:true, nullable:true
      ingredientes blank:true, nullable:true
    }

    static mapping = {
      likes defaultValue: 0
    }
}

package bbq

class Receita {

  Long id
  Long likes
  String nome
  static hasMany = [etapas : Etapa]

  public String toString() {
      this.nome
  }
    static constraints = {
    }

    static mapping = {
      likes defaultValue: 0
    }
}

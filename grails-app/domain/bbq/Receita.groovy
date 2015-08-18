package bbq

class Receita {

  Long id
  String nome
  static hasMany = [etapas : Etapa]

  public String toString() {
      this.nome
  }
    static constraints = {
    }
}

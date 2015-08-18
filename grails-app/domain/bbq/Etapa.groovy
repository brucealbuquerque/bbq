package bbq

class Etapa {
    Long id
    String descricao
    Receita receita
    static belongsTo = Receita

    public String toString() {
        this.descricao
    }
    static constraints = {
    }
}

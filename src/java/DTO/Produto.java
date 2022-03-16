package DTO;

public class Produto {

    private int codigo;
    private String nome_produto;
    private String desc_produto;
    private int qtd;
    private float valor;

    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNomeProduto() {
        return nome_produto;
    }

    public void setNomeProduto(String nome_produto) {
        this.nome_produto = nome_produto;
    }

    public String getDescProduto() {
        return desc_produto;
    }

    public void setDescProduto(String desc_produto) {
        this.desc_produto = desc_produto;
    }

    public int getQtd() {
        return qtd;
    }

    public void setQtd(int qtd) {
        this.qtd = qtd;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }
   
}

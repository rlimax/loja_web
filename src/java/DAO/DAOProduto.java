package DAO;

import DTO.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.text.DecimalFormat;


public class DAOProduto {
Connection con;
PreparedStatement pstm;
ResultSet rs;
ArrayList<Produto> lista = new ArrayList<>();

/**
create table produto(
cod int not null primary key auto_increment,
nome_produto varchar(100) not null,
descricao_produto varchar(150) not null,
quantidade int not null,
valor float not null
);
*/

    public void cadastrarProduto(Produto ObjectProduto){
        String sql = "insert into produto (nome_produto, descricao_produto, quantidade, valor) values (?,?,?,?)";
        con = new Conexao().conexao();
        try{
            pstm = con.prepareStatement(sql);
            pstm.setString(1, ObjectProduto.getNomeProduto());
            pstm.setString(2, ObjectProduto.getDescProduto());
            pstm.setString(3, Integer.toString(ObjectProduto.getQtd()));
            pstm.setString(4, Float.toString(ObjectProduto.getValor()));

            pstm.execute();
            pstm.close();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    
   public ArrayList<Produto> PesquisarProduto(){
       String sql = "select cod, nome_produto, descricao_produto, quantidade, valor from produto";
        con = new Conexao().conexao();
        
        try{
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery();
            while(rs.next()){
                Produto objDTOproduto = new Produto();
                objDTOproduto.setCodigo(rs.getInt("cod"));
                objDTOproduto.setNomeProduto(rs.getString("nome_produto"));
                objDTOproduto.setDescProduto(rs.getString("descricao_produto"));
                objDTOproduto.setQtd(Integer.parseInt(rs.getString("quantidade")));
                objDTOproduto.setValor(Float.parseFloat(rs.getString("valor")));

                
                lista.add(objDTOproduto);
            }

        }catch(SQLException e){
            System.out.println(e);
        }
        return lista;
   }
    public String consultaCod(String cod){
        String sql = "select nome_produto from produto where cod=?";
        String nome = null;
        con = new Conexao().conexao();
        try{
            pstm = con.prepareStatement(sql);
            pstm.setString(1, cod);
            rs = pstm.executeQuery();
            while(rs.next()){
                nome = rs.getString(1);
            }
        }catch(SQLException e){
            System.out.println(e);
        }

        return nome;
    }
   public String formataValor(String valor){
       DecimalFormat df = new DecimalFormat("0.00");
       String saida = null;
       saida = df.format(Float.parseFloat(valor));
       return saida;
   }
    
}

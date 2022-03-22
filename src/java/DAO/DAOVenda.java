package DAO;

import DTO.Produto;
import DTO.Venda;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DAOVenda {
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    ArrayList<Venda> lista = new ArrayList<>();

/*
cod int auto_increment primary key,
data_pedido date not null,
cod_produto int not null,
quantidade int not null,
valor float not null,
cod_cliente int not null    
*/    
    
    public void cadastrarVenda(Venda ObjectVenda){
        String sql = "insert into venda (data_pedido, cod_produto, quantidade, total, cod_cliente) values (?,?,?,?,?)";
        con = new Conexao().conexao();
        try{
            pstm = con.prepareStatement(sql);
            pstm.setString(1, ObjectVenda.getData());
            pstm.setString(2, Integer.toString(ObjectVenda.getCodProduto()));
            pstm.setString(3, Integer.toString(ObjectVenda.getQuantidade()));
            pstm.setString(4, Float.toString(ObjectVenda.getTotal()));
            pstm.setString(5, Integer.toString(ObjectVenda.getCodCliente()));

            pstm.execute();
            pstm.close();
        }catch(SQLException e){
            System.out.println(e);
        }
    }

   public ArrayList<Venda> PesquisarVenda(){
       String sql = "select cod, data_pedido, cod_produto, quantidade, total, cod_cliente from venda";
        con = new Conexao().conexao();
        
        try{
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery();
            while(rs.next()){
                Venda objDTOvenda = new Venda();
                objDTOvenda.setCod(rs.getInt("cod"));
                objDTOvenda.setData(rs.getString("data_pedido"));
                objDTOvenda.setCodProduto(rs.getInt("cod_produto"));
                objDTOvenda.setQuantidade(rs.getInt("quantidade"));
                objDTOvenda.setTotal(rs.getFloat("total"));
                objDTOvenda.setCodCliente(rs.getInt("cod_cliente"));

                lista.add(objDTOvenda);
            }

        }catch(SQLException e){
            System.out.println(e);
        }
        return lista;
   }
}

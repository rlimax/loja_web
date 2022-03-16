
package DAO;

import DTO.Cliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.ResultSet;


public class DAOCliente {
Connection con;
PreparedStatement pstm;
ResultSet rs;
ArrayList<Cliente> lista = new ArrayList<>();

    public void cadastrarCliente(Cliente ObjectCliente){
        String sql = "insert into cliente (nome, email, senha, telefone, cidade) values (?,?,md5(?),?,?)";
        con = new Conexao().conexao();
        try{
            pstm = con.prepareStatement(sql);
            pstm.setString(1, ObjectCliente.getNome());
            pstm.setString(2, ObjectCliente.getEmail());
            pstm.setString(3, ObjectCliente.getSenha());
            pstm.setString(4, ObjectCliente.getTelefone());
            pstm.setString(5, ObjectCliente.getCidade());
            pstm.execute();
            pstm.close();
        }catch(SQLException e){
            System.out.println(e);
        }
    }
    
    
   public ArrayList<Cliente> PesquisarCliente(){
       String sql = "select cod, nome, email, senha, telefone, cidade from cliente";
        con = new Conexao().conexao();
        
        try{
            pstm = con.prepareStatement(sql);
            rs = pstm.executeQuery();
            while(rs.next()){
                Cliente objDTOcliente = new Cliente();
                objDTOcliente.setCod(rs.getInt("cod"));
                objDTOcliente.setNome(rs.getString("nome"));
                objDTOcliente.setEmail(rs.getString("email"));
                objDTOcliente.setSenha(rs.getString("senha"));
                objDTOcliente.setTelefone(rs.getString("telefone"));
                objDTOcliente.setCidade(rs.getString("cidade"));
                
                lista.add(objDTOcliente);
            }

        }catch(SQLException e){
            System.out.println(e);
        }
        return lista;
   }
    public String formataTel(String tel){
        String texto = null;
        texto = "("+tel.substring(0, 2)+") ";
        texto = texto + tel.substring(2, 6)+"-";
        texto = texto + tel.substring(6, 10);
        return texto;
    }
}

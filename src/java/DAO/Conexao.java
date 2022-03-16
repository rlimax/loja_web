package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {

    public Connection conexao(){
            Connection conexao = null;

            String driver = "com.mysql.cj.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/loja_web";
            String user = "root";
            String password = "root";

            try{
                Class.forName(driver);
                conexao = DriverManager.getConnection(url,user,password);

            }catch(Exception e){
                System.out.println("e");
            }
            return conexao;
    }
    
}

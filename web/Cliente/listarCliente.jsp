<%-- 
    Document   : listarCliente
    Created on : 09/03/2022, 21:28:33
    
--%>

<%@page import="DTO.Cliente"%>
<%@page import="DAO.DAOCliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <title>Listar Clientes</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 mx-auto center gradiente">
                    <a href="../index.jsp"><i class="fa fa-home home"></i></a>
                    <h1>LISTA DE CLIENTES</h1>
                </div>
            </div>
            
            <div class="col-10 mx-auto mt-4 cont_form gradiente show">
                <div>
                    <table class="table table-lg table-dark table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>NOME</th>
                                <th>SENHA</th>
                                <th>TELEFONE</th>
                                <th>CIDADE</th>
                                <th>EMAIL</th>
                                <th>CONTROLE</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try{ 
                                    DAOCliente objDAOcliente = new DAOCliente();
                                    ArrayList<Cliente> lista = objDAOcliente.PesquisarCliente();

                                    for(int num = 0; num<lista.size(); num++){
                                        out.print("<tr>");
                                        out.print("<td>"+lista.get(num).getCod()+"</td>");
                                        out.print("<td>"+lista.get(num).getNome()+"</td>");
                                        out.print("<td>"+lista.get(num).getSenha()+"</td>");
                                        out.print("<td>"+objDAOcliente.formataTel(lista.get(num).getTelefone())+"</td>");
                                        out.print("<td>"+lista.get(num).getCidade()+"</td>");
                                        out.print("<td>"+lista.get(num).getEmail()+"</td>");
                                        out.print("<td><div class=\"yellow\"> EDIT &#8634;</div><div class=\"red\">DEL &#10008;</div></td>");
                                        out.print("<tr>");
                                    }
                                }catch(Exception e){
                                    System.out.print(e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>

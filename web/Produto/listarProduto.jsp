<%-- 
    Document   : listarCliente
    Created on : 09/03/2022, 21:28:33
    
--%>
<%@page import="DTO.Produto"%>
<%@page import="DAO.DAOProduto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <title>Listar Produtos</title>

    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 mx-auto center gradiente">
                    <a href="../index.jsp"><i class="fa fa-home home"></i></a>
                    <h1>LISTA DE PRODUTOS</h1>
                </div>
            </div>
            
            <div class="col-10 mx-auto mt-4 cont_form gradiente">
                <div>
                    <table class="table table-dark table-striped">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>NOME</th>
                                <th>DESCRIÇÃO</th>
                                <th>QUANTIDADE</th>
                                <th>VALOR</th>
                                <th>VALOR EM ESTOQUE</th>
                                <th>CONTROLE</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try{ 
                                    DAOProduto objDAOproduto = new DAOProduto();
                                    ArrayList<Produto> lista = objDAOproduto.PesquisarProduto();

                                    for(int num = 0; num<lista.size(); num++){
                                        out.print("<tr>");
                                        out.print("<td>"+lista.get(num).getCodigo()+"</td>");
                                        out.print("<td>"+lista.get(num).getNomeProduto()+"</td>");
                                        out.print("<td>"+lista.get(num).getDescProduto()+"</td>");
                                        out.print("<td>"+lista.get(num).getQtd()+"</td>");
                                        out.print(String.format("<td>R$ %.2f</td>",lista.get(num).getValor()));
                                        out.print(String.format("<td>R$ %.2f</td>",lista.get(num).getQtd()*lista.get(num).getValor()));
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

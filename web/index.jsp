<%-- 
    Document   : noticias
    Created on : 10/03/2022, 04:22:06
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.NoticiasXml"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/estilos.css">
        <title>LOJA</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 mx-auto center gradiente">
                    <h1>LOJA</h1>
                </div>
            </div>
            <div class="col-6 mx-auto mt-4 cont_form gradiente">
                <div class="col-12 center">
                  <a href="Cliente/cliente.html"><button class="btn md btn-success larg">CLIENTE</button></a>
                  <a href="Produto/produto.html"><button class="btn btn-success larg">PRODUTO</button></a>
                  <a href="Venda/venda.jsp"><button class="btn btn-success larg" >VENDA</button></a>
                </div>
                <br>
                <div class="col-12 center">
                  <a href="Cliente/listarCliente.jsp"><button class="btn btn-success larg">LISTA CLIENTES</button></a>
                  <a href="Produto/listarProduto.jsp"><button class="btn btn-success larg">LISTA PRODUTOS</button></a>
                  <a href=""><button class="btn btn-success larg" >LISTA VENDAS</button></a>
                </div>
            </div>

            <div class="col-12 center mt-5">
                <div class="col-6 mx-auto">
                    <h4>NOTÍCIAS</h4>
                <table class="table table-dark table-sm table-striped">
                    <tbody>
                <%
                    
                    NoticiasXml notic = new NoticiasXml();
                    ArrayList<String> x = notic.noticias();
                    //out.print(x);
                    
                    for(int i = 1; i<x.size(); i++){
                        out.println("<tr><td>"+x.get(i)+".</td></tr>");
                    }
                %>
                    </tbody>
                </table>
                </div>
            </div>
            
        </div>
    </body>
</html>

<%-- 
    Document   : InserirCliente
    Created on : 07/03/2022, 21:16:33
--%>

<%@page import="DTO.Produto"%>
<%@page import="DAO.DAOProduto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <title>Status do Cadastro</title>
    </head>
    <body>
        <div class="container-fluid center">
            <div class="row">
                <div class="col-12 mx-auto center gradiente">
                    <a href="../index.jsp"><i class="fa fa-home home"></i></a>
                    <h1>Status de Cadastro</h1>
                </div>
            </div>
            
            <div class="col-4 mx-auto mt-4 cont_form gradiente show">
                <table class="table table-dark">
                    <%
                        try{
                            Produto produto = new Produto();
                            produto.setNomeProduto(request.getParameter("nome"));
                            produto.setDescProduto(request.getParameter("desc"));
                            produto.setQtd(Integer.parseInt(request.getParameter("qtd")));
                            produto.setValor(Float.parseFloat(request.getParameter("valor")));

                            out.print("<tr><td>Nome:</td><td>"+produto.getNomeProduto()+"</td></tr>");
                            out.print("<tr><td>Descrição:</td><td>"+produto.getDescProduto()+"</td></tr>");
                            out.print("<tr><td>Quantidade:</td><td>"+produto.getQtd()+"</td></tr>");
                            out.print(String.format("<tr><td>Valor unitário:</td><td>R$ %.2f</td></tr>",produto.getValor()));

                            DAOProduto dao_produto = new DAOProduto();
                            dao_produto.cadastrarProduto(produto);
                            out.print("<h4>Produto cadastrado com sucesso.</h4>");
                        }catch(Exception e){
                            System.out.println(e);
                        }

                    %>
                </table>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : InserirCliente
    Created on : 07/03/2022, 21:16:33
--%>

<%@page import="DTO.Venda"%>
<%@page import="DAO.DAOVenda"%>
<%@page import="DAO.DAOCliente"%>
<%@page import="DAO.DAOProduto"%>
<%@page import="DAO.DataHora"%>
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
            
            <div class="col-6 mx-auto mt-4 cont_form gradiente show">
                <table class="table table-dark">
                    <%




                            try{
                            Venda venda = new Venda();
                            venda.setData(request.getParameter("data"));
                            venda.setTotal(Float.parseFloat((request.getParameter("total")).replace(',','.')));
                            venda.setCodCliente(Integer.parseInt(request.getParameter("ccliente")));
                            venda.setCodProduto(Integer.parseInt(request.getParameter("produto")));
                            venda.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
                     
                            DAOCliente objDAOcliente = new DAOCliente();
                            DAOProduto objDAOproduto = new DAOProduto();
                            DataHora dt = new DataHora();
                            
                            out.print("<tr><td>Data:</td><td>"+dt.formataData(venda.getData())+"</td></tr>");
                            out.print("<tr><td>Cliente:</td><td>"+venda.getCodCliente()+" - "+objDAOcliente.consultaCod(Integer.toString(venda.getCodCliente()))+"</td></tr>");
                            out.print("<tr><td>Produto:</td><td>"+venda.getCodProduto()+" - "+objDAOproduto.consultaCod(Integer.toString(venda.getCodProduto()))+"</td></tr>");
                            out.print("<tr><td>Quantidade:</td><td>"+venda.getQuantidade()+"</td></tr>");
                            out.print("<tr><td>Total:</td>");
                            out.print(String.format("<td>R$ %.2f</td></tr>",venda.getTotal()));
                            
                            
                            DAOVenda dao_venda = new DAOVenda();
                            dao_venda.cadastrarVenda(venda);
                            
                        }catch(Exception e){
                            System.out.println(e);
                        }

                    %>
                </table>
            </div>
        </div>
    </body>
</html>

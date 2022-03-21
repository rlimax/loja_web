<%-- 
    Document   : InserirCliente
    Created on : 07/03/2022, 21:16:33
--%>

<%@page import="DTO.Cliente"%>
<%@page import="DAO.DAOCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <title>Status da Exclusão</title>
    </head>
    <body>
        <div class="container-fluid center">
            <div class="row">
                <div class="col-12 mx-auto center gradiente">
                    <a href="../index.jsp"><i class="fa fa-home home"></i></a>
                    <h1>Status da Exclusão</h1>
                </div>
            </div>
            
            <div class="col-6 mx-auto mt-4 cont_form gradiente show">
                <table class="table table-dark">
                    <%
                        try{
                            DAOCliente dao_cliente = new DAOCliente();
                            dao_cliente.apagarCliente(request.getParameter("cod"));
                            out.print("<h4>Registro de cliente excluído com sucesso.</h4>");
                        }catch(Exception e){
                            System.out.println(e);
                        }
                    %>
                </table>
            </div>
        </div>
    </body>
</html>

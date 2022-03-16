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
                            Cliente cliente = new Cliente();
                            cliente.setNome(request.getParameter("nome"));
                            cliente.setEmail(request.getParameter("email"));
                            cliente.setSenha(request.getParameter("senha"));
                            cliente.setTelefone(request.getParameter("telefone"));
                            cliente.setCidade(request.getParameter("cidade"));

                            DAOCliente dao_cliente = new DAOCliente();
                            dao_cliente.cadastrarCliente(cliente);
                            out.print("<tr><td>Nome:</td><td>"+cliente.getNome()+"</td></tr>");
                            out.print("<tr><td>E-mail:</td><td>"+cliente.getEmail()+"</td></tr>");
                            out.print("<tr><td>Senha:</td><td>"+cliente.getSenha()+"</td></tr>");
                            out.print("<tr><td>Telefone:</td><td>"+dao_cliente.formataTel(cliente.getTelefone())+"</td></tr>");
                            out.print("<tr><td>Cidade:</td><td>"+cliente.getCidade()+"</td></tr>");
                            out.print("<h4>Cliente cadastrado com sucesso.</h4>");
                        }catch(Exception e){
                            System.out.println(e);
                        }

                    %>
                </table>
            </div>
        </div>
    </body>
</html>

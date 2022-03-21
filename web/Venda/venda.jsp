<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.DAOCliente"%>
<%@page import="DTO.Cliente"%>
<%@page import="DTO.Produto"%>
<%@page import="DAO.DAOProduto"%>
<%@page import="DAO.DataHora"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venda</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <script type="text/javascript" src="../js/functions.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 mx-auto center gradiente">
                    <a href="../index.jsp"><i class="fa fa-home home"></i></a>
                    <h1>VENDA</h1>
                </div>
            </div>
            <div class="col-6 mx-auto mt-4 cont_form gradiente show">
            <form name="cliente" method="POST" action="InserirCliente.jsp">
                <div class="form-group row">
                    <label for="cod" class="col-2 col-form-label">Código</label> 
                    <div class="col-2">
                        <input id="cod" name="cod" type="text" class="form-control" disabled>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="data" class="col-2 col-form-label">Data*</label> 
                    <div class="col-4">
                        <div class="input-group"> 

                            <input id="data" name="data" type="date" value="<% DataHora data = new DataHora(); out.print(data.getData()); %>" class="form-control" required>
                        </div>
                    </div>
                </div>      
              <div class="form-group row">
                <label for="valor" class="col-2 col-form-label">Valor(R$)</label> 
                <div class="col-4">
                  <div class="input-group">
                    <input id="valor" name="valor" type="text" class="form-control">
                  </div>
                </div>
              </div>
                
              <div class="form-group row">
                <label for="cliente" class="col-2 col-form-label">Cliente</label>
                <div class="col-10">
                  <select id="cliente" name="cliente" class="custom-select">
                    <option value="Não informado">-</option>
                        <%
                            try{ 
                                DAOCliente objDAOcliente = new DAOCliente();
                                ArrayList<Cliente> lista = objDAOcliente.PesquisarCliente();

                                for(int num = 0; num<lista.size(); num++){

                                    out.print("<option value=\""+lista.get(num).getCod()+"\">"+lista.get(num).getNome()+"</option>");
                                }
                            }catch(Exception e){
                                System.out.print(e);
                            }
                        %>
                  </select>
                </div>
              </div>
              <div class="form-group row">
                <label for="produto" class="col-2 col-form-label">Produto</label>
                <div class="col-4">
                    <select id="produto" name="produto" class="custom-select" onchange="calc()">
                    <option value="Não informado">-</option>
                        <%
                            try{ 
                                DAOProduto objDAOproduto = new DAOProduto();
                                ArrayList<Produto> lista = objDAOproduto.PesquisarProduto();                             
                                for(int num = 0; num<lista.size(); num++){
                                    out.print("<option value=\""+lista.get(num).getCodigo()+"\">"+lista.get(num).getNomeProduto()+" - R$ "+objDAOproduto.formataValor(Float.toString(lista.get(num).getValor()))+"</option>");
                                }
                            }catch(Exception e){
                                System.out.print(e);
                            }
                        %>
                  </select>
                </div>
                <label for="quantidade" class="col-2 col-form-label">Quantidade</label>
                <div class="col-4">
                  <div class="input-group">
                    <input id="quantidade" name="quantidade" type="number" class="form-control" value="1" min="1" onchange="calc()">
                  </div>
                </div>
              </div> 
              <div class="form-group row">
                <div class="col-12 center">
                  <button name="submit" type="submit" class="btn md btn-success larg">ENVIAR</button>
                  <button name="submit" type="reset" class="btn btn-warning larg">LIMPAR</button>
                  <button name="submit" type="reset" class="btn btn-danger larg" disabled>EXCLUIR</button>
                </div>
              </div>
            </form> 
            </div>
            
        </div>

    </body>
</html>

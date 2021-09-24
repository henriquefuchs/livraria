<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <link crossorigin="anonymous" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" rel="stylesheet">
    <title>Autores</title>
  </head>
  <body>
    <header>
      <nav class="navbar navbar-dark bg-dark">
        <div class="container-fluid">
          <h1 class="navbar-brand h1">AUTORES</h1>
        </div>
      </nav>
    </header>
    <main>
      <nav>
        <div class="nav nav-tabs" id="nav-tab" role="tablist">
          <button aria-controls="nav-cadastro" aria-selected="true" class="nav-link active"
                  data-bs-target="#nav-cadastro"
                  data-bs-toggle="tab" id="nav-cadastro-tab" role="tab" type="button">Cadastro
          </button>
          <button aria-controls="nav-lista" aria-selected="false" class="nav-link" data-bs-target="#nav-lista"
                  data-bs-toggle="tab"
                  id="nav-lista-tab" role="tab" type="button">Lista
          </button>
        </div>
      </nav>
      <div class="tab-content" id="nav-tabContent">
        <div aria-labelledby="nav-cadastro-tab" class="tab-pane fade show active" id="nav-cadastro" role="tabpanel">
          <fieldset>
            <div class="card">
              <div class="card-body">
                <form action="<c:url value="/autores"/>" method="POST">
                  <div class="mb-3">
                    <label class="form-label" for="nome">Nome</label>
                    <input class="form-control" id="nome" name="nome" type="text">
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="email">Email</label>
                    <input class="form-control" id="email" name="email" type="email">
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="dataNascimento">Data de Nascimento</label>
                    <input class="form-control" id="dataNascimento" name="dataNascimento" type="date">
                  </div>
                  <div class="mb-3">
                    <label class="form-label" for="miniCurriculo">Miní curriculo</label>
                    <textarea class="form-control" id="miniCurriculo" name="miniCurriculo" rows="10"></textarea>
                  </div>
                  <input class="btn btn-primary" type="submit" value="Cadastrar">
                </form>
              </div>
            </div>
          </fieldset>
        </div>
        <div aria-labelledby="nav-lista-tab" class="tab-pane fade" id="nav-lista" role="tabpanel">
          <div class="card">
            <div class="card-body">
              <table class="table table-bordered table-striped table-hover">
                <thead class="table-light">
                <tr>
                  <th scope="col">NOME</th>
                  <th scope="col">EMAIL</th>
                  <th scope="col">DATA NASCIMENTO</th>
                </tr>
                </thead>
                <tbody>
				  <c:forEach items="${autores}" var="autor">
				    <tr>
				      <td>${autor.nome}</td>
				      <td>${autor.email}</td>
				      <td>${autor.dataNascimento}</td>
				    </tr>
				  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </main>
    <script crossorigin="anonymous"
            integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
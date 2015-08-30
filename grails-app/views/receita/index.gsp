
<%@ page import="bbq.Receita" %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
   <meta name="HandheldFriendly" content="True" />
   <meta name="MobileOptimized" content="320" />
   <meta name="viewport" content="width=device-width, initial-scale=1" />
	 <asset:stylesheet src="style.css"/>
	 <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,500' rel='stylesheet' type='text/css' />

   <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

   <title>BBQ EXtouro</title>

  </head>
  <body>
    <div class="wrapper">
      <header>
        <div>
          <nav class="navbar navbar-default">
            <div class="container-fluid">
              <div class="navbar-header">
                <sec:ifLoggedIn>
                Logged in as <a  href="/bbq/usuario/show/${usuario}"><sec:username/></a>

                <form class="form-signin"  method="POST" action="/bbq/j_spring_security_logout" >
                  <input type="submit" value="sair" /> ||
                  <g:link controller='receita' action='create'>Criar uma receita</g:link>
                </form>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                  <g:link controller='usuario' action='autenticar'>Login</g:link>
                  ||
                  <g:link controller='usuario' action='create'>Criar usuário</g:link>
                </sec:ifNotLoggedIn>

              </div>
          </nav>

        </div>
        <a href="index.html">
          <asset:image src="bbq.png" alt="Logo BBQ ExTouro" />
        </a>

        <h1>BBQ anywhere at any time!</h1>
      </header>
      <main>
        <div class="search clearfix">
          <g:form action="search" method="GET">
            <g:textField  placeholder="Pesquise aqui uma receita" name="query" value="${params.query}" />
            <button class="icon-fire" type="submit" ></button>
          </g:form>
        </div>
        <table>
          <thead>
            <tr>
              <th>Receita </th>
              <th class="rate icon-heart"></th>
            </tr>
          </thead>
          <tbody>
						<g:each in="${receitaInstanceList}" var="receita" status="i">
            <tr>
              <td>
                <a href="show/${receita.id}">${receita.nome}</a>
              </td>
              <td class="rate">
                ${receita.likes.size()}
              </td>
            </tr>
					</g:each>



          </tbody>
        </table>
      </main>
    </div>
  </body>
</html>

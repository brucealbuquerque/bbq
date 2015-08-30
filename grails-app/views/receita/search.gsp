
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
						<g:each in="${receitaInstanceList}" var="receita" status="i">
            <div class="lista clearfix">
              <div class="lista-imagem">
                <a href="show/${receita.id}">
                  <img src="<g:createLink controller="Receita" action="image" width="320" height="240"
                params="[id: receita.id]"/>" />
                </a>
              </div>
              <div class="lista-texto">
                <a href="show/${receita.id}">
                  <h2>${receita.nome}</h2>
                </a>
                <p class="icon-heart"> ${receita.likes.size()}</p>
              </div>
            </div>
					</g:each>

          </tbody>
        </table>
        <div>
          <a href="/bbq/receita">Todas as Receitas</a>
        </div>
      </main>
    </div>
  </body>
</html>

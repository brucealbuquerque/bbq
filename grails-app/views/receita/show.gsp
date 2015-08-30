
<%@ page import="bbq.Receita" %>
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="utf-8">
   <meta name="HandheldFriendly" content="True" />
   <meta name="MobileOptimized" content="320" />
   <meta name="viewport" content="width=device-width, initial-scale=1" />

   <title>BBQ EXtouro</title>
	 <asset:stylesheet src="style.css"/>
	 <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,500' rel='stylesheet' type='text/css' />

   <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
        <a href="/bbq/receita/index.html">
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
        <div class="show clearfix">
          <div>
            <h2>${receitaInstance.nome}</h2>
            <div class="coracao">
              <span class="icon-heart"> ${receitaInstance.likes.size()}</span>
              <sec:ifLoggedIn>
  							<g:form url="[resource:receitaInstance, action:'like']" method="POST">
  									<g:actionSubmit  action="like" value="curtir" >
  										<span class="icon-like" />
  								</g:actionSubmit>
  							</g:form>
              </sec:ifLoggedIn>
            </div>
						<img src="<g:createLink controller="Receita" action="image" width="320" height="240"
          params="[id: receitaInstance.id]"/>"/>
          </div>

          <div class="ingredientes">
            <h3>Ingredientes</h3>
            ${receitaInstance.ingredientes}
          </div>
          <div class="preparo">
            <h3>Modo de Preparo</h3>
            ${receitaInstance.etapas}
          </div>
            <iframe width="95%" height="315" src="https://www.youtube.com/embed/${receitaInstance.youtubeLink}" frameborder="0" allowfullscreen></iframe>
          </div>

          <div class="comments">
            <g:each in="${receitaInstance.comentarios}" var="${comentario}">
            <div class="comment" >
              <div class="author">
                ${comentario.usuario.username}
              </div>
              <div class="comment_date">
                ${comentario.data}
              </div>
              <div class="comment_text">
                ${comentario.texto}
              </div>
            </div>
          </g:each>
          </div>

          <div class="comment_insert">
            <g:form url="[resource:receitaInstance, action:'comentar']" >
              <div class="comment_text">
                <g:textArea type="text" name="texto" value="${params.texto}" />
              </div>
              <button type="submit" value="postar" > Postar </button>
            </g:form>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>

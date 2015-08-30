<%@ page import="comum.Usuario" %>
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
    <div class="container">

      <g:if test="${message != null}">
        <div class="alert alert-info" role="alert">
          ${message}
        </div>
      </g:if>


      <form class="form-signin"  method="POST" action="/bbq/j_spring_security_check" >
        <h2 class="form-signin-heading">Autenticação</h2>
        <label for="j_username" class="sr-only">login</label>
        <input type="text" name="j_username" id="j_username" class="form-control" placeholder="login" required autofocus>
        <label for="j_password" class="sr-only">senha</label>
        <input type="password" name="j_password" id="j_password" class="form-control" placeholder="senha" required>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Logar</button>
      </form>

    </div> <!-- /container -->
  </body>
</html>

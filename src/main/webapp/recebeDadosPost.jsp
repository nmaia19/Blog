<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.entidades.Posts" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Blog</title>

    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="./assets/css/styles.css" />
    <script defer src="./assets/scripts/index.js"></script>

  </head>
  <body>
    <!-- HEADER -->
    <header class="header" id="header">
      <nav class="navbar container">
        <a href="./index.jsp">
          <h2 class="logo">Blog</h2>
        </a>
        <div class="menu" id="menu">
          <ul class="list">
            <li class="list__item">
              <a href="./index.jsp" class="list__link screen-lg-hidden current">Home</a>
            </li>
            <li class="list__item">
              <a href="#" class="list__link screen-lg-hidden">Login</a>
            </li>
            <li class="list__item">
              <a href="#" class="list__link screen-lg-hidden">Sign Up</a>
            </li>
          </ul>
        </div>
        <div class="list list-right">
          <button
            class="btn place-items-center screen-lg-hidden menu-toggle-icon"
            id="menu-toggle-icon"
          >
            <i class="ri-menu-3-line open-menu-icon"></i>
            <i class="ri-close-line close-menu-icon"></i>
          </button>

          <a href="#" class="list-link screen-sm-hidden">Login</a>
          <a
            href="#"
            class="list-link screen-sm-hidden btn sign-up-btn fancy-border"
          >
            <span>Sign Up</span>
          </a>
        </div>
      </nav>
    </header>

    <!-- CADASTRO DE NOVOS POSTS -->


    <section class="posts section">

        <div class="container">

            <h2 class="title section-title" data-name="Postagens">Novo Post</h2>

             <%
                      //recebe os valores da tela HTML
                      String titulo = request.getParameter("titulo");
                      String texto = request.getParameter("texto");
                      String imagem = request.getParameter("imgsrc");

                      //instancia o post
                      Posts novoPost = new Posts();
                      novoPost.setTitle(titulo);
                      novoPost.setArticle(texto);
                      novoPost.setImageSrc(imagem);

                      if(novoPost.salvar()){
                          out.write("Post salvo com sucesso");
                      }
                      else
                      {
                          out.write("Problemas ao salvar post");
                      }

                    %>

        </div>

    </section>

    <!-- Footer -->
    <footer class="footer">Nayane Maia - Proway</footer>


  </body>
</html>

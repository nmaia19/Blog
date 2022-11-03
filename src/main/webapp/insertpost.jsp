<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.entidades.Posts" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Novo Post</title>

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

            <article>
              <hr />
              <form action="recebeDadosPost.jsp" method="POST">
                <div>
                  <div class="section-input">
                    <label class="input-label" for="titulo">Título</label>
                    <input name="titulo" id="titulo" class="input" type="text" placeholder="Título" required>
                  </div>
            
                  <div class="section-input">
                    <label class="input-label" for="texto">Texto</label>
                    <input name="texto" id="texto" class="input" type="text" placeholder="Escreva seu texto" required>
                  </div>
            
                  <div class="section-input">
                    <label class="input-label" for="imagem">Insira o caminho da imagem</label>
                    <input name="imgsrc" id="imagem" class="input" type="text" placeholder="ex.: ./assets/images/posts_1.jpg">
                  </div>


                  <hr />
                   <button class="btn" onclick="enviaForm()">Salvar post</button>
                </div>
              </form>
            </article>


            <div class="see-more-container">
                <a href="index.jsp" class="btn see-more-btn place-items-center">Voltar <i class="ri-arrow-right-s-line"></i></i></a>
            </div>

        </div>

    </section>

    <!-- Footer -->
    <footer class="footer">Nayane Maia - Proway</footer>

     <script>
      function enviaForm() {
        var titulo = document.getElementsByName("titulo");
        if (titulo[0].value === "") {
          titulo[0].focus();
          alert("Seu texto precisa de um título");
          exit();
        }

        var texto = document.getElementsByName("texto");
        if (texto[0].value === "") {
          texto[0].focus();
          alert("Escreva seu texto");
          exit();
        }

        var imagem = document.getElementsByName("imgsrc");
        if (modelo[0].value === "") {
          modelo[0].focus();
          alert("Uma imagem padrão será exibida, caso não indique uma");
          exit();
        }
        document.forms[0].submit();
      }
    </script>
  </body>
</html>

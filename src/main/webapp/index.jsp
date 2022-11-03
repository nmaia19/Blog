<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.entidades.Posts" %>
<%@page import="com.blog.entidades.Usuarios" %>

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

          <%
            Usuarios usuarioLogado = (Usuarios) session.getAttribute("usuario");
            if(usuarioLogado != null) {%>
                <a href="logout.jsp" class="list-link screen-sm-hidden btn sign-up-btn fancy-border">
                <span>Log Out</span>
                </a>
           <% } else {%>
                <a href="login.jsp" class="list-link screen-sm-hidden">Login</a>
                          <a
                            href="insertUser.jsp"
                            class="list-link screen-sm-hidden btn sign-up-btn fancy-border"
                          >
                            <span>Sign Up</span>
                          </a>
           <%}%>
        </div>
      </nav>
    </header>

    <!-- POSTS -->

     <%
              Posts post = new Posts();
              List<Posts> allPosts = post.consultar();
     %>

    <section class="posts section">

        <div class="container">

            <h2 class="title section-title" data-name="Postagens">Postagens</h2>

            <div class="posts-grid-wrapper d-grid">
<!--
                <a href="./pages/posts.jsp" class="article d-grid">
                    <div class="posts-article-image-wrapper">
                        <img src="./assets/images/posts_1.jpg" alt="" class="article-image">
                    </div>

                    <div class="article-data-container">

                        <h3 class="title article-title">Título de artigo</h3>
                        <p class="article-description">Lorem, ipsum do...</p>

                    </div>
                </a>
-->


                <% for(Posts p : allPosts) {%>
                  <!--  <%out.write(""+p.getId());%> -->

                    <a href='./pages/posts.jsp?id=<%=p.getId()%>' class="article d-grid">

                        <div class="posts-article-image-wrapper">
                            <img src=<%out.write(p.getImageSrc());%> alt="" class="article-image">
                        </div>

                        <div class="article-data-container">
                            <h3 class="title article-title"><%out.write(p.getTitle());%></h3>
                            <p class="article-description">Lorem, ipsum do...</p>

                        </div>

                    </a>

                <%}%>

            </div>

            <div class="see-more-container">
                <a href="#" class="btn see-more-btn place-items-center">Veja mais <i class="ri-arrow-right-s-line"></i></i></a>
            </div>
            <div class="see-more-container">
                <a href="insertpost.jsp" class="btn see-more-btn place-items-center">Novo Post <i class="ri-arrow-right-s-line"></i></i></a>
            </div>

        </div>

    </section>

    <!-- Footer -->
    <footer class="footer">Nayane Maia - Proway</footer>
  </body>
</html>

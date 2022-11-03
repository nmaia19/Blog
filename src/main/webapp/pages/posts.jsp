<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.entidades.Posts" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

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

    <link rel="stylesheet" href="../assets/css/styles.css" />
    <script defer src="../assets/scripts/index.js"></script>

  </head>
  <body>
    <!-- HEADER -->
    <header class="header" id="header">
      <nav class="navbar container">
        <a href="../index.jsp">
          <h2 class="logo">Blog</h2>
        </a>
        <div class="menu" id="menu">
          <ul class="list">
            <li class="list__item">
              <a href="../index.jsp" class="list__link screen-lg-hidden">Home</a>
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

          <a href="#" class="list-link screen-sm-hidden">Sign in</a>
          <a
            href="#"
            class="list-link screen-sm-hidden btn sign-up-btn fancy-border"
          >
            <span>Sign in</span>
          </a>
        </div>
      </nav>
    </header>
   
    <!-- POSTS -->
    <%
        String idPost = request.getParameter("id");
        Posts p = Posts.consultarId(Integer.parseInt(idPost));
    %>

    <section class="blog-post section">
        <div class="blog-post-container container">

            <div class="blog-post-data">
                <h3 class="title blog-post-title"><% out.write(p.getTitle()); %></h3>

                <img src=<%out.write("."+p.getImageSrc());%> alt="">
            </div>

            <div class="container">
                <p><% out.write(p.getArticle()); %></p>
            </div>
        </div>
    </section>


    <!-- Footer -->
    <footer class="footer">Nayane Maia - Proway</footer>
  </body>
</html>

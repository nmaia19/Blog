<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.entidades.Posts" %>
<%@page import="com.blog.entidades.Usuarios" %>
<%@page import="com.blog.dao.DaoUsers" %>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>

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



    <section class="posts section">

        <div class="container">

            <h2 class="title section-title" data-name="Logar">Logar</h2>

            <div class="posts-grid-wrapper d-grid">

                <form action="login.jsp" method="POST">
                               <div>
                                 <div class="section-input">
                                   <label class="input-label" for="email">E-mail</label>
                                   <input name="email" id="email" class="input" type="text" placeholder="E-mail" required>
                                </div>

                                 <div class="section-input">
                                   <label class="input-label" for="senha">Senha</label>
                                   <input name="senha" id="senha" class="input" type="password" placeholder="Digite sua senha" required>
                                 </div>

                                  <button class="btn" id="btn-logar" type="submit" value="Login">Login</button>
                               </div>
                </form>

            </div>



        </div>

    </section>

    <!-- Footer -->
    <footer class="footer">Nayane Maia - Proway</footer>

    <%
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            if((email != null) && (senha != null) && !(email.isEmpty()) && !(senha.isEmpty())){
                Usuarios usuario = DaoUsers.consultarPorEmail(email);
                if(DaoUsers.podeLogar(email, senha)){
                    session.setAttribute("usuario", usuario);
                    if(usuario.getTipo().equals("visitante")) {
                        response.sendRedirect("index.jsp");
                    } else {
                        response.sendRedirect("index-admin.jsp");
                    }
                } else {
                    out.write("<script>");
                    out.write("alert('Dados de login incorretos!')");
                    out.write("</script>");
                }
            }
        %>

  </body>
</html>

create database blog
default character set utf8mb4
default collate utf8mb4_general_ci;

use blog;

create table comentarios(
    id int primary key auto_increment,
    id_user int,
    id_post int,
    comentario varchar(255),
    FOREIGN KEY (id_user) REFERENCES usuario(id_user) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_post) REFERENCES postagens(id_post) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE postagens (
	id_posts INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR (255),
	texto VARCHAR (2000),
    srcImagem VARCHAR (255)
);

insert into postagens(titulo,texto,srcImagem)
values("Título 1",
"Lorem ipsum dolor, sit amet consectetur 
adipisicing elit. Voluptates deleniti voluptatibus, mollitia ipsa, qui nam quas porro voluptatem, 
nemo adipisci soluta! Aut, corrupti vel. Odio maxime similique rem eum sapiente.",
"./assets/images/posts_1.jpg");

select id_posts from postagens;

drop table postagens;

CREATE TABLE usuarios (
	id_user INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR (255),
	email VARCHAR (255) NOT NULL UNIQUE,
	senha VARCHAR (50),
    tipo VARCHAR(30)
);

select * from usuarios;


insert into postagens(titulo,texto,srcImagem)
values("Título 3",
"Lorem ipsum dolor, sit amet consectetur 
adipisicing elit. Voluptates deleniti voluptatibus, mollitia ipsa, qui nam quas porro voluptatem, 
nemo adipisci soluta! Aut, corrupti vel. Odio maxime similique rem eum sapiente.",
"./assets/images/posts_3.jpg");
insert into postagens(titulo,texto,srcImagem)
values("Título 4",
"Lorem ipsum dolor, sit amet consectetur 
adipisicing elit. Voluptates deleniti voluptatibus, mollitia ipsa, qui nam quas porro voluptatem, 
nemo adipisci soluta! Aut, corrupti vel. Odio maxime similique rem eum sapiente.",
"./assets/images/posts_4.jpg");
insert into postagens(titulo,texto,srcImagem)
values("Título 5",
"Lorem ipsum dolor, sit amet consectetur 
adipisicing elit. Voluptates deleniti voluptatibus, mollitia ipsa, qui nam quas porro voluptatem, 
nemo adipisci soluta! Aut, corrupti vel. Odio maxime similique rem eum sapiente.",
"./assets/images/posts_5.jpg");
insert into postagens(titulo,texto,srcImagem)
values("Título 6",
"Lorem ipsum dolor, sit amet consectetur 
adipisicing elit. Voluptates deleniti voluptatibus, mollitia ipsa, qui nam quas porro voluptatem, 
nemo adipisci soluta! Aut, corrupti vel. Odio maxime similique rem eum sapiente.",
"./assets/images/posts_6.jpg");
insert into postagens(titulo,texto,srcImagem)
values("Título 7",
"Lorem ipsum dolor, sit amet consectetur 
adipisicing elit. Voluptates deleniti voluptatibus, mollitia ipsa, qui nam quas porro voluptatem, 
nemo adipisci soluta! Aut, corrupti vel. Odio maxime similique rem eum sapiente.",
"./assets/images/posts_1.jpg");
insert into postagens(titulo,texto,srcImagem)
values("Título 8",
"Lorem ipsum dolor, sit amet consectetur 
adipisicing elit. Voluptates deleniti voluptatibus, mollitia ipsa, qui nam quas porro voluptatem, 
nemo adipisci soluta! Aut, corrupti vel. Odio maxime similique rem eum sapiente.",
"./assets/images/posts_2.jpg");
insert into postagens(titulo,texto,srcImagem)
values("Título 9",
"Lorem ipsum dolor, sit amet consectetur 
adipisicing elit. Voluptates deleniti voluptatibus, mollitia ipsa, qui nam quas porro voluptatem, 
nemo adipisci soluta! Aut, corrupti vel. Odio maxime similique rem eum sapiente.",
"./assets/images/posts_3.jpg");
insert into postagens(titulo,texto,srcImagem)
values("Título 10",
"Lorem ipsum dolor, sit amet consectetur 
adipisicing elit. Voluptates deleniti voluptatibus, mollitia ipsa, qui nam quas porro voluptatem, 
nemo adipisci soluta! Aut, corrupti vel. Odio maxime similique rem eum sapiente.",
"./assets/images/posts_4.jpg");

package com.blog.entidades;

import com.blog.utils.Conexao;
// import javafx.geometry.Pos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Posts {

    private int id;
    private String title;
    private String article;
    private String imageSrc;

    public boolean salvar(){

        String sql = "insert into postagens(titulo,texto,srcImagem)";
        sql += "values(?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.title);
            stm.setString(2, this.article);
            stm.setString(3, this.imageSrc);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterar(){
        Connection con = Conexao.conectar();
        String sql = "update postagens set ";
        sql +="titulo = ?,";
        sql +="texto = ?,";
        sql +="srcImagem = ?,";
        sql +=" where id_posts = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.title);
            stm.setString(2, this.article);
            stm.setString(3, this.imageSrc);
            stm.setInt(4, this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean excluir(){
        Connection con = Conexao.conectar();
        String sql = "delete from postagens ";
        sql +=" where id_posts = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public static Posts consultarId(int id){
        Connection con = Conexao.conectar();
        String sql = "select id_posts, titulo, texto, srcImagem"
                + " from postagens where id_posts = ?";
        Posts post = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                post = new Posts();
                post.setId(id);
                post.setTitle(rs.getString("titulo"));
                post.setArticle(rs.getString("texto"));
                post.setImageSrc(rs.getString("srcImagem"));
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return post;
    }

    public Posts consultar(String titulo){
        Connection con = Conexao.conectar();
        String sql = "select id, titulo, texto, srcImagem"
                + " from postagens where titulo = ?";
        Posts post = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, titulo);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                post = new Posts();
                post.setId(rs.getInt("id_posts"));
                post.setTitle(rs.getString("titulo"));
                post.setArticle(rs.getString("texto"));
                post.setImageSrc(rs.getString("srcImagem"));
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return post;
    }

    @Override
    public String toString() {
        return "Posts{"
                + "id_posts=" + id + ", titulo=" + title + ", texto=" + article + '}';
    }

    public List<Posts> consultar(){
        List<Posts> lista = new ArrayList<Posts>();

        Connection con = Conexao.conectar();
        String sql = "select id_posts, titulo, texto, srcImagem"
                + " from postagens";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while(rs.next()){
                Posts post = new Posts();
                post.setId(rs.getInt("id_posts"));
                post.setTitle(rs.getString("titulo"));
                post.setArticle(rs.getString("texto"));
                post.setImageSrc(rs.getString("srcImagem"));

                lista.add(post);
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }

    public String getImageSrc() {
        return imageSrc;
    }

    public void setImageSrc(String imageSrc) {
        this.imageSrc = imageSrc;
    }
}

package com.blog.dao;

import com.blog.utils.Conexao;
import com.blog.entidades.Usuarios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoUsers {

    public static boolean podeLogar(String email, String senha){
        Connection con = Conexao.conectar();

        String sql = "select * from usuarios where email = ? and senha = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, senha);
            ResultSet rs = stm.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return true;
        }
    }

    public static boolean usuarioExistente(String email){
        Connection con = Conexao.conectar();

        String sql = "select * from usuarios where email = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return true;
        }
    }

    public static String salvar(Usuarios usuario) {
        Connection con = Conexao.conectar();

        if(con != null) {
            String sql = "insert into usuarios(nome, email, senha, tipo) values(?,?,?,?)";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, usuario.getNome());
                stm.setString(2, usuario.getEmail());
                stm.setString(3, usuario.getSenha());
                stm.setString(4, usuario.getTipo());
                stm.execute();
            } catch (SQLException e) {
                return  "Erro: " + e.getMessage();
            }
            return "Usuário inserido com sucesso!";
        }
        return "Erro de conexão!";
    }

    public  static List<Usuarios> consultarUsers() {
        List<Usuarios> allUsers = new ArrayList<Usuarios>();
        Connection con = Conexao.conectar();

        if(con != null) {
            try {
                PreparedStatement stm = con.prepareStatement("select * from usuarios");
                ResultSet rs = stm.executeQuery();

                while (rs.next()) {
                    Usuarios usuario = new Usuarios();
                    usuario.setId(rs.getInt("id_user"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setSenha(rs.getString("senha"));
                    usuario.setTipo(rs.getString("tipo"));
                    allUsers.add(usuario);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return allUsers;
    }

    public static Usuarios consultarPorId(int idUsuario) {
        Connection con = Conexao.conectar();
        Usuarios usuario = new Usuarios();

        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from usuarios where id_user = ?");
                stm.setInt(1, idUsuario);
                ResultSet rs = stm.executeQuery();

                if(rs.next()){
                    usuario.setId(rs.getInt("id_user"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setSenha(rs.getString("senha"));
                    usuario.setTipo(rs.getString("tipo"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return usuario;
    }

    public static Usuarios consultarPorEmail(String email) {
        Connection con = Conexao.conectar();
        Usuarios usuario = new Usuarios();

        if(con != null){
            try {
                PreparedStatement stm = con.prepareStatement("select * from usuarios where email = ?");
                stm.setString(1, email);
                ResultSet rs = stm.executeQuery();

                if(rs.next()){
                    usuario.setId(rs.getInt("id_user"));
                    usuario.setEmail(rs.getString("email"));
                    usuario.setSenha(rs.getString("senha"));
                    usuario.setTipo(rs.getString("tipo"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return usuario;
    }
}

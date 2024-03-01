/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Model.Color;

/**
 *
 * @author Le Tan Kim
 */
public class ColorDao {

    private Connection conn;

    public ColorDao() {
        try {
            conn = DBConnection.connect();
        } catch (Exception e) {
//            handle error here
            conn = null;
        }
    }

    public List<Color> getAllColorByProduct(int productID) {
        List<Color> colors = new ArrayList<>();
        String sql = "select * from color where productID=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, productID);
            ResultSet result = st.executeQuery();
            while (result.next()) {
                int Id = result.getInt("ID");
                String imgColor = result.getString("imgColor");
                String name = result.getString("name");
                Color c = new Color(Id, productID, imgColor, name);
                colors.add(c);
            }
        } catch (SQLException e) {

        }
        return colors;
    }
    
    public Color getColorByID(int ID) {
        String sql = "select * from color where ID=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, ID);
            ResultSet result = st.executeQuery();
            if (result.next()) {
                int Id = result.getInt("ID");
                String imgColor = result.getString("imgColor");
                String name = result.getString("name");
                int productID = result.getInt("ProductID");
                Color c = new Color(Id, productID, imgColor, name);
                return c;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public int insert(Color c) {
        int result = 0;
        String sql = "insert into Color (imgColor, ProductID, name) values (?, ?, ?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, c.getImgColor());
            st.setInt(2, c.getProductID());
            st.setString(3, c.getName());
            result = st.executeUpdate();
        } catch (SQLException e) {

        }
        return result;
    }

    public int delete(int idProduct) {
        int result = 0;
        String sql = "delete from Color where ProductID=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, idProduct);
            result = st.executeUpdate();
        } catch (SQLException e) {

        }
        return result;
    }

}

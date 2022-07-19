/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Database.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author HP
 */
public class WeapValue {
    public String WeapName;
    public String CodeName;
    public int initValue;
    public int IncValue;
    
    public WeapValue() {
        
    }

    public WeapValue(String WeapName, String CodeName, int initValue, int IncValue) {
        this.WeapName = WeapName;
        this.CodeName = CodeName;
        this.initValue = initValue;
        this.IncValue = IncValue;
    }

    public String getWeapName() {
        return WeapName;
    }

    public void setWeapName(String WeapName) {
        this.WeapName = WeapName;
    }

    public String getCodeName() {
        return CodeName;
    }

    public void setCodeName(String CodeName) {
        this.CodeName = CodeName;
    }

    public int getInitValue() {
        return initValue;
    }

    public void setInitValue(int initValue) {
        this.initValue = initValue;
    }

    public int getIncValue() {
        return IncValue;
    }

    public void setIncValue(int IncValue) {
        this.IncValue = IncValue;
    }
    
    public ArrayList<WeapValue> getListWeapValue() {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            String query = "select * from dbo.WeaponValue";
            conn = new Database().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<WeapValue> list = new ArrayList<>();
            while (rs.next()) {
            WeapValue wv= new WeapValue(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getInt(4));
            list.add(wv);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("SQL Connection Error");
        } catch (ClassNotFoundException e){
            System.out.println("Class Not Found");
        }
        return null;
    }
}

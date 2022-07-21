package Model;

import Database.Database;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Product {
    public String ProductID;
    public String charlist;
    public String weaponlist;
    public int primogems;
    public String seller;
    public String account_info;
    public int price;


    public Product() {
    }


    public Product(String ProductID, String charlist, String weaponlist, int primogems, String seller, String account_info, int price) {
        this.ProductID = ProductID;
        this.charlist = charlist;
        this.weaponlist = weaponlist;
        this.primogems = primogems;
        this.seller = seller;
        this.account_info = account_info;
        this.price = price;
    }

    public String getProductID() {
        return this.ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }

    public String getCharlist() {
        return this.charlist;
    }

    public void setCharlist(String charlist) {
        this.charlist = charlist;
    }

    public String getWeaponlist() {
        return this.weaponlist;
    }

    public void setWeaponlist(String weaponlist) {
        this.weaponlist = weaponlist;
    }

    public int getPrimogems() {
        return this.primogems;
    }

    public void setPrimogems(int primogems) {
        this.primogems = primogems;
    }

    public String getSeller() {
        return this.seller;
    }

    public void setSeller(String seller) {
        this.seller = seller;
    }

    public String getAccount_info() {
        return this.account_info;
    }

    public void setAccount_info(String account_info) {
        this.account_info = account_info;
    }

    public int getPrice() {
        return this.price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public ArrayList<Product> getListProduct() {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            String query = "select * from dbo.Product order by LEN(ProductID),ProductID";
            conn = new Database().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Product> list = new ArrayList<>();
            while (rs.next()) {
            Product pro= new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7));
            list.add(pro);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("SQL Connection Error");
        } catch (ClassNotFoundException e){
            System.out.println("Class Not Found");
        }
        return null;
    }
    
    public int addProduct(Product p) {
        Connection conn=null;
        try {
            String query= "Insert into dbo.Product values ('"+p.ProductID+"','"+
                    p.charlist+"','"+p.weaponlist+"',"+Integer.toString(p.primogems)+",'"
                    +p.seller+"','"+p.account_info+"',"+Integer.toString(p.price)+")";
            conn = new Database().getConnection();
            Statement stmt = conn.createStatement();
            return stmt.executeUpdate(query);
        } catch (SQLException e) {
            return e.getErrorCode();
        } catch (ClassNotFoundException e) {
            return -1;
        }
    }
    public int getTotalProduct() {
         Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            String query = " select count(*) from Product";
            conn = new Database().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();      
            while (rs.next()) {
                return rs.getInt(1);
            }
        
        } catch (SQLException e) {
            System.out.println("SQL Connection Error");
        } catch (ClassNotFoundException e){
            System.out.println("Class Not Found");
        }
        return 0;
    }
     public ArrayList<Product> paging(int index) {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            String query = "select * from dbo.Product order by price OFFSET "+Integer.toString((index-1)*4)+" rows fetch next 4 rows only;";
            conn = new Database().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
           // ps.setInt(1, (index-1)*4);
            ArrayList<Product> list = new ArrayList<>();
            while (rs.next()) {
            Product pro= new Product(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getString(5),rs.getString(6),rs.getInt(7));
            list.add(pro);
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
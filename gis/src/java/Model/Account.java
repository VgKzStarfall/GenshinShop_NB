/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Objects;

public class Account {
    public String Username;
    public String Password;
    public Boolean isAdmin;

    public Account() {

    }

    public Account(String Username, String Password, Boolean isAdmin) {
        this.Username = Username;
        this.Password = Password;
        this.isAdmin = isAdmin;
    }

    public String getUsername() {
        return this.Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return this.Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public Boolean isIsAdmin() {
        return this.isAdmin;
    }

    public Boolean getIsAdmin() {
        return this.isAdmin;
    }

    public void setIsAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public Account Username(String Username) {
        setUsername(Username);
        return this;
    }

    public Account Password(String Password) {
        setPassword(Password);
        return this;
    }

    public Account isAdmin(Boolean isAdmin) {
        setIsAdmin(isAdmin);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Account)) {
            return false;
        }
        Account account = (Account) o;
        return Objects.equals(Username, account.Username) && Objects.equals(Password, account.Password)
                && Objects.equals(isAdmin, account.isAdmin);
    }

    @Override
    public String toString() {
        return "{" +
                " Username='" + getUsername() + "'" +
                ", Password='" + getPassword() + "'" +
                ", isAdmin='" + isIsAdmin() + "'" +
                "}";
    }

    /*
     * 
     * public ArrayList<Account> getListAccount() {
     * Connection conn=null;
     * PreparedStatement ps=null;
     * ResultSet rs=null;
     * try {
     * String query = "select * from dbo.Account";
     * conn = new Database().getConnection();
     * ps = conn.prepareStatement(query);
     * rs = ps.executeQuery();
     * ArrayList<Account> list = new ArrayList<>();
     * while (rs.next()) {
     * Account c= new
     * Account(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.
     * getString(5),rs.getString(6));
     * list.add(c);
     * }
     * return list;
     * } catch (SQLException e) {
     * System.out.println("SQL Connection Error");
     * } catch (ClassNotFoundException e){
     * System.out.println("Class Not Found");
     * }
     * return null;
     * }
     */
}

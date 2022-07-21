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
 * @author ACER
 */
public class Wallet {

    String walletID;
    String username;
    int balance;

    public Wallet() {
    }

    public Wallet(String walletID, String username, int balance) {
        this.walletID = walletID;
        this.username = username;
        this.balance = balance;
    }

    public String getWalletID() {
        return walletID;
    }

    public void setWalletID(String walletID) {
        this.walletID = walletID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    @Override
    public String toString() {
        return "Wallet{" + "walletID=" + walletID + ", username=" + username + ", balance=" + balance + '}';
    }

    public ArrayList<Wallet> getListWallet() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "select * from dbo.Wallet";
            conn = new Database().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Wallet> list = new ArrayList<>();
            while (rs.next()) {
                Wallet wallet = new Wallet(rs.getString(1), rs.getString(2), rs.getInt(3));
                list.add(wallet);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("SQL Connection Error");
        } catch (ClassNotFoundException e) {
            
        }
        return null;
    }

    public void updateBalance(String id, int value) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "UPDATE [dbo].Wallet\n"
                    + "SET\n"
                    + "	[balance] = [balance] + ?\n"
                    + "WHERE \n"
                    + "	[WalletID] = ?";
            conn = new Database().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, value);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void decreaseBalance(String id, int value) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "UPDATE [dbo].Wallet\n"
                    + "SET\n"
                    + "	[balance] = [balance] - ?\n"
                    + "WHERE \n"
                    + "	[WalletID] = ?";
            conn = new Database().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, value);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}

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
import java.util.Date;

/**
 *
 * @author ACER
 */
public class Payment {
    String paymentID;
    String walletID;
    String method;
    int value;
    Date date;

    public Payment() {
    }

    public Payment(String paymentID, String walletID, String method, int value, Date date) {
        this.paymentID = paymentID;
        this.walletID = walletID;
        this.method = method;
        this.value = value;
        this.date = date;
    }

    public String getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(String paymentID) {
        this.paymentID = paymentID;
    }

    public String getWalletID() {
        return walletID;
    }

    public void setWalletID(String walletID) {
        this.walletID = walletID;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Payment{" + "paymentID=" + paymentID + ", walletID=" + walletID + ", method=" + method + ", value=" + value + ", date=" + date + '}';
    }
    
    public void paymentCheck(String pID, String walID, String method, int value, String date) {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            String query = "INSERT [dbo].[Payment] ([PaymentID], [WalletID], [Method], [Value], [Date]) VALUES (?, ?, ?, ?, ?)";
            conn = new Database().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pID);
            ps.setString(2, walID);
            ps.setString(3, method);
            ps.setInt(4, value);
            ps.setString(5, date);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public ArrayList<Payment> getListPayment() {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            String query = "select * from dbo.Payment order by Date ASC";
            conn = new Database().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Payment> list = new ArrayList<>();
            while (rs.next()) {
            Payment pay = new Payment(rs.getString(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getDate(5));
            list.add(pay);
            }
            return list;
        } catch (SQLException e) {
            System.out.println("SQL Connection Error");
        } catch (ClassNotFoundException e) {
            
        }
        return null;
    }
}

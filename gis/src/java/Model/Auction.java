package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Objects;
import Database.Database;

public class Auction {
    public String AuctionID;
    public String ProductID;
    public int initPrice;
    public int CurrentPrice;
    public String Winner;
    public String startdate;
    public String enddate;
    String[] days={"01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"};
    String[] months={"01","02","03","04","05","06","07","08","09","10","11","12"};
    
    public Auction() {
        
    }

    public Auction(String AuctionID, String ProductID, int initPrice, int CurrentPrice, String Winner, String startdate) {
        this.AuctionID = AuctionID;
        this.ProductID = ProductID;
        this.initPrice = initPrice;
        this.CurrentPrice = CurrentPrice;
        this.Winner = Winner;
        this.startdate = startdate.substring(0,10);
        this.enddate=this.setEnddate();
    }

    public String getAuctionID() {
        return AuctionID;
    }

    public void setAuctionID(String AuctionID) {
        this.AuctionID = AuctionID;
    }

    public String getProductID() {
        return ProductID;
    }

    public void setProductID(String ProductID) {
        this.ProductID = ProductID;
    }

    public int getInitPrice() {
        return initPrice;
    }

    public void setInitPrice(int initPrice) {
        this.initPrice = initPrice;
    }

    public int getCurrentPrice() {
        return CurrentPrice;
    }

    public void setCurrentPrice(int CurrentPrice) {
        this.CurrentPrice = CurrentPrice;
    }

    public String getWinner() {
        return Winner;
    }

    public void setWinner(String Winner) {
        this.Winner = Winner;
    }

    public String getStartdate() {
        return startdate;
    }

    public void setStartdate(String startdate) {
        this.startdate = startdate;
    }

    public String getEnddate() {
        return enddate;
    }

    public String setEnddate() {
        String day=this.startdate.substring(8,10);
        String endday="";
        for (int i=0;i<days.length;i++) {
            if (day.equals(days[i])) endday=days[i+3];
        }
        return this.startdate.substring(0,8)+endday;
    }
    
    
    public ArrayList<Auction> getListAuction() {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            String query = "select * from dbo.Auction";
            conn = new Database().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Auction> list = new ArrayList<>();
            while (rs.next()) {
            Auction auc= new Auction(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getString(5),rs.getString(6));
            list.add(auc);
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

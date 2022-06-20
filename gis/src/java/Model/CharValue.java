package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Objects;
import Database.Database;

public class CharValue {
    public String FullName;
    public String CodeName;
    public int C0,C1,C2,C3,C4,C5,C6;

    public CharValue() {
        
    }
    
    public CharValue(String FullName, String CodeName, int C0, int C1, int C2, int C3, int C4, int C5, int C6) {
        this.FullName = FullName;
        this.CodeName = CodeName;
        this.C0 = C0;
        this.C1 = C1;
        this.C2 = C2;
        this.C3 = C3;
        this.C4 = C4;
        this.C5 = C5;
        this.C6 = C6;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getCodeName() {
        return CodeName;
    }

    public void setCodeName(String CodeName) {
        this.CodeName = CodeName;
    }

    public int getC0() {
        return C0;
    }

    public void setC0(int C0) {
        this.C0 = C0;
    }

    public int getC1() {
        return C1;
    }

    public void setC1(int C1) {
        this.C1 = C1;
    }

    public int getC2() {
        return C2;
    }

    public void setC2(int C2) {
        this.C2 = C2;
    }

    public int getC3() {
        return C3;
    }

    public void setC3(int C3) {
        this.C3 = C3;
    }

    public int getC4() {
        return C4;
    }

    public void setC4(int C4) {
        this.C4 = C4;
    }

    public int getC5() {
        return C5;
    }

    public void setC5(int C5) {
        this.C5 = C5;
    }

    public int getC6() {
        return C6;
    }

    public void setC6(int C6) {
        this.C6 = C6;
    }
    
    public ArrayList<CharValue> getListCharValue() {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        try {
            String query = "select * from dbo.CharValue";
            conn = new Database().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<CharValue> list = new ArrayList<>();
            while (rs.next()) {
            CharValue cv= new CharValue(rs.getString(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getInt(8),rs.getInt(9));
            list.add(cv);
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

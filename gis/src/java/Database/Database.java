package Database;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.DriverManager;

public class Database {

    public Connection getConnection() throws SQLException, ClassNotFoundException {
        String url="jdbc:sqlserver://localhost:1433;databaseName=SWP;encrypt=true;trustServerCertificate=true";
        //String url="jdbc:sqlserver://"+serverName+"":"+portNumber+";databaseName="+dbName;
        
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url,username,password);
    }
    
    private final String serverName="localhost";
    private final String portNumber="1433";
    private final String dbName="SWP";
    private final String instance="";
    private final String username="sa";
    private final String password="vankagiucop";
}

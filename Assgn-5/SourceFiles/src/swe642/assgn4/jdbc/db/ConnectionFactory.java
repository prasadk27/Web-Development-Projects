// Name: Prasad Khedekar  G# - G00973357

package swe642.assgn4.jdbc.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	//static reference to itself
    //private static ConnectionFactory instance = new ConnectionFactory();
    public static final String URL = "jdbc:oracle:thin:@apollo.vse.gmu.edu:1521:ite10g";
    public static final String USER = "pkhedeka";
    public static final String PASSWORD = "eedroa";
    public static final String DRIVER_CLASS = "oracle.jdbc.driver.OracleDriver"; 
     
    public ConnectionFactory() {
        try {
            Class.forName(DRIVER_CLASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
     
    public Connection createConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            System.out.println("ERROR: Unable to Connect to Database.");
        }
        return connection;
    }   
     
    /*
    public static Connection getConnection() throws ClassNotFoundException,
    SQLException {
        return instance.createConnection();
    }
    */
}

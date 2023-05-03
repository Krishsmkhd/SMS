package dbConnection;

import java.sql.*;

public class DBManager {

    private Connection con=null;
    private PreparedStatement ps=null;
    private Statement stm=null;
    private ResultSet rs=null;

    // Constructor method that implements loading JDBC driver class and establishing connection with the database.
    public DBManager() {
        // 1.Loading JDBC driver class
        String className = "com.mysql.jdbc.Driver"; // The complete package path for the driver class.
        try {
            Class.forName(className);
            // 2.Establishing a connection with the database
            String conUrl = "jdbc:mysql://localhost:3306/students" + "?useUnicode=true&characterEncoding=utf-8";
            String dbUser = "root";
            String dbPassword = "";
            con = DriverManager.getConnection(conUrl, dbUser, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
	/*	try {
			Context ctx=new InitialContext();
			DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/students");
			con=ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

*/
    }

    public ResultSet executeQuery(String sql) throws SQLException{
        stm=con.createStatement();
        rs=stm.executeQuery(sql);
        return rs;
    }

    //Implement the functionality to execute SQL statements for querying data.
	/*
	public ResultSet executeQuery(String sql,String params[]) throws SQLException{
		ps = con.prepareStatement(sql);

		for(int i=1;i<params.length+1;i++){
			ps.setString(i, params[i-1]);
		}

		  //Execute the statement. If it is a query statement, then call the executeQuery method, which returns a ResultSet object.
		  //If it is a non-query statement (e.g., insert, update, delete, etc.), then call the executeUpdate method, which returns an integer.

		rs = ps.executeQuery();
		return rs;
	}
*/

	/*
	//Implementing the execution functionality for non-query SQL statements
	public int executeUpdate(String sql, String params[]) throws SQLException {
		ps = con.prepareStatement(sql);

		for (int i = 1; i < params.length + 1; i++) {
			ps.setString(i, params[i - 1]);
		}

		int count = ps.executeUpdate();
		return count;
	}
*/

    public int executeUpdate(String sql) throws SQLException{
        stm=con.createStatement();
        int count = stm.executeUpdate(sql);
        return count;
    }


    public void close() throws SQLException{
        if (rs != null)
            rs.close();
		/*
		if (ps != null)
			ps.close();
		*/
        if (stm != null)
            stm.close();
        if (con != null)
            con.close();
    }

}

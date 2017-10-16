<%@ page import="java.sql.*"%>
<%
class Mysql
{
	Connection conn;
	Statement stmt;
	void connect(String host,int port,String database,String username,String password) throws ClassNotFoundException, SQLException
	{

		Class.forName("com.mysql.jdbc.Driver");
		String url=new StringBuilder().append("jdbc:mysql://").append(host).append(":").append(String.valueOf(port)).append("/").append(database).append("?useSSL=false").toString();
		conn=DriverManager.getConnection(url,username,password);
		stmt=conn.createStatement();

	}
	void disconnect() throws SQLException
	{
		stmt.close();
		conn.close();
	}
	ResultSet query(String sql,boolean have_return) throws SQLException
	{
		if(have_return)
		{
			ResultSet rs=null;
			rs=stmt.executeQuery(sql);
			return rs;
		}
		else
		{
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.executeUpdate();
		}
		return null;
	}
	public Mysql(){}
}
%>
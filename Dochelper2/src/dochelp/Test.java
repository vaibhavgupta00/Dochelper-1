package dochelp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Test {

	public static void main(String[] args) {
		try {
			Connection con = mysql.connect().getConnection();
			PreparedStatement p = con.prepareStatement("select name from patient where DID=36");
			p.executeQuery();
			ResultSet rs = p.getResultSet();
			if(rs.next()) {
				System.out.println(rs.getString(1));
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}

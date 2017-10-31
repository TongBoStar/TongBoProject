package com.terrence.cn.test.MyDB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OperateDB {
	public static void main(String[] args) {
		Connection conn = MyConnectionUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String sql = "select name from core_menu where id=33";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			String s = rs.getString("name");
			System.out.println(s);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

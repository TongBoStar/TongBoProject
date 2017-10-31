package com.terrence.cn.test.gencode;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.apache.log4j.Logger;

public class ConnectionUtil {
	private static final Logger log = Logger.getLogger(ConnectionUtil.class);
	private static String url;
	private static String driver;
	private static String userName;
	private static String password;
	
	/**
	 * 把属性文件jdbc.properties中的数据读入到 本类的全局变量中 init: initialize: 初始化
	 */
	public static void init() {
		try {
			// 1.装载
			InputStream inputStream = ConnectionUtil.class.getResourceAsStream("/application.properties");
			Properties props = new Properties();
			// 把输入流中的键值对数据装载到对象props中
			props.load(inputStream);
			// 2.获取
			url = props.getProperty("ds.read.jdbc.url");
			driver = props.getProperty("ds.read.jdbc.driver");
			userName = props.getProperty("ds.read.jdbc.username");
			password = props.getProperty("ds.read.jdbc.password");
		} catch (Exception e) {
			log.debug("数据化初始化错误:",e);
		}
	}

	/**
	 * 利用init方法获取的参数,构造数据库连接并返回
	 * 
	 * @return
	 */
	public static Connection getConnection() {
		init();
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, userName, password);
		} catch (ClassNotFoundException e) {
			log.error("加载数据库驱动失败",e);
		} catch (SQLException e) {
			log.error("数据库连接失败",e);
		}
		log.debug("数据库连接成功");
		return conn;
	}

	/**
	 * 关闭连接
	 * 
	 * @param conn
	 */
	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 关闭语句对象
	 * 
	 * @param stmt
	 */
	public static void close(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 关闭结果集
	 */
	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		ConnectionUtil.getConnection();
	}
}
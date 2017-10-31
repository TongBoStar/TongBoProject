package com.terrence.crm.dol.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ConvertSwf {
	public void convert(String path){
		Thread thread = new Thread(new ExeconvertPath(path));
		thread.start();
	}
	public void saveProjectFilesTemp(String path){
		PreparedStatement ps = null;
		try {
			Connection conn = ConnectionUtil.getConnection();
			//将自动提交设置为false
			conn.setAutoCommit(false);
			//设置事务隔离级别
			conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
			ps = conn.prepareStatement("insert into t_project_files_temp values(?)");
			//设置参数值
			ps.setString(1, path);
			ps.execute();//执行sql
			conn.commit();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
class ExeconvertPath implements Runnable{
	public String filepath;
	
	public ExeconvertPath(String filepath) {
		this.filepath = filepath;
	}

	@Override
	public void run() {
		try {
			Thread.sleep(5000);
			DocConverter docConverter = new DocConverter(filepath);
			docConverter.conver();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
class Execonvert implements Runnable{
	@Override
	public void run() {
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Thread.sleep(5000);
			Connection conn = ConnectionUtil.getConnection();
			//将自动提交设置为false
			conn.setAutoCommit(false);
			//设置事务隔离级别
			conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
			ps = conn.prepareStatement("select id,filePath from t_project_files_temp");
			//设置参数值
			rs = ps.executeQuery();//执行sql
			Long id = 0L;
			String filePath = "";
			while(rs.next()){
				id = rs.getLong("id");
				filePath = rs.getString("filePath");
				DocConverter docConverter = new DocConverter(filePath);
				docConverter.conver();
				ps = conn.prepareStatement("delete from t_project_files_temp where id = ?");
	            ps.setLong(1, id);
	            ps.execute();
			}
			conn.commit();
			ps.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
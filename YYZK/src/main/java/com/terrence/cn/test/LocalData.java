package com.terrence.cn.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.terrence.cn.test.gencode.LocalConnectionUtil;

public class LocalData {
	public static void main(String[] args) {
		gensql("2017-07-24","2017-07-25","2017-07-26");
		gensql("2017-07-25","2017-07-26","2017-07-27");
		gensql("2017-07-26","2017-07-27","2017-07-28");
		gensql("2017-07-27","2017-07-28","2017-07-29");
		gensql("2017-07-28","2017-07-29","2017-07-30");
		gensql("2017-07-29","2017-07-30","2017-07-31");
		gensql("2017-07-30","2017-07-31","2017-08-01");
		gensql("2017-07-31","2017-08-01","2017-08-02");
		gensql("2017-08-01","2017-08-02","2017-08-03");
		gensql("2017-08-02","2017-08-03","2017-08-04");
		gensql("2017-08-03","2017-08-04","2017-08-05");
		gensql("2017-08-04","2017-08-05","2017-08-06");
		gensql("2017-08-05","2017-08-06","2017-08-07");
		gensql("2017-08-06","2017-08-07","2017-08-08");
		gensql("2017-08-07","2017-08-08","2017-08-09");
		gensql("2017-08-08","2017-08-09","2017-08-10");
		gensql("2017-08-09","2017-08-10","2017-08-11");
		gensql("2017-08-10","2017-08-11","2017-08-12");
		gensql("2017-08-11","2017-08-12","2017-08-13");
		gensql("2017-08-12","2017-08-13","2017-08-14");
		gensql("2017-08-13","2017-08-14","2017-08-15");
		gensql("2017-08-14","2017-08-15","2017-08-16");
		gensql("2017-08-15","2017-08-16","2017-08-17");
		gensql("2017-08-16","2017-08-17","2017-08-18");
		gensql("2017-08-17","2017-08-18","2017-08-19");
		gensql("2017-08-18","2017-08-19","2017-08-20");
		gensql("2017-08-19","2017-08-20","2017-08-21");
		gensql("2017-08-20","2017-08-21","2017-08-22");
		gensql("2017-08-21","2017-08-22","2017-08-23");
		gensql("2017-08-22","2017-08-23","2017-08-24");
		gensql("2017-08-23","2017-08-24","2017-08-25");
	}
	public static void gensql(String date1,String date2,String date3){
		Connection conn = LocalConnectionUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String ss = "update T_Gas_GasGunDaily set SuccessionGas=";
		try {
			String s1 = "";
			String s2 = "";
			//接班读数
			String sql = "select top 1 CardType,Amount,GasContent,GGPrice,GasTotal,* from T_Gas_FillingRec "+
						"where POSOccurTime>='"+date1+" 08:00:00' and POSOccurTime<='"+date2+" 08:00:00' order by POSOccurTime desc ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			s1 = rs.getString("GasTotal");
			ss += s1+",";
			//交班读数
			sql = "select top 1 CardType,Amount,GasContent,GGPrice,GasTotal,* from T_Gas_FillingRec "+
					"where POSOccurTime>='"+date2+" 08:00:00' and POSOccurTime<='"+date3+" 08:00:00' order by POSOccurTime desc ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			s1 = rs.getString("GasTotal");
			ss += "ShiftGas="+s1+" ,";
			//交易次数
			sql = "select count(*) transactiontimes from T_Gas_FillingRec where POSOccurTime>='"+date2+" 08:00:00' and POSOccurTime<='"+date3+" 08:00:00' ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int s = rs.getInt("transactiontimes");
			ss += " transactiontimes="+s+" ,";
			//交易总气量和总额
			sql = "select SUM(GasContent) s1,SUM(Amount) s2 from T_Gas_FillingRec where POSOccurTime>='"+date2+" 08:00:00' and POSOccurTime<='"+date3+" 08:00:00'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			s1 = rs.getString("s1");
			s2 = rs.getString("s2");
			ss += " totalgas="+s1+" ,GasContent="+s1+",Amount="+s2+",";
			//员工卡气量和金额
			sql = "select SUM(GasContent) s1,SUM(Amount) s2 from T_Gas_FillingRec where POSOccurTime>='"+date2+" 08:00:00' and POSOccurTime<='"+date3+" 08:00:00' and CardType= '01' ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			s1 = rs.getString("s1");
			s2 = rs.getString("s2");
			ss += " usercardgascontent="+s1+" ,usercardamount="+s2+",";
			//用户卡气量和金额
			sql = "select SUM(GasContent) s1,SUM(Amount) s2 from T_Gas_FillingRec where POSOccurTime>='"+date2+" 08:00:00' and POSOccurTime<='"+date3+" 08:00:00' and CardType= '04' ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			s1 = rs.getString("s1");
			s2 = rs.getString("s2");
			ss += " staffcardgascontent="+s1+" ,staffcardamount="+s2+" ";
			
			ss += "where DailyDate='"+date2+" 00:00:00.000' and GasGun=2";
			System.out.println(ss);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

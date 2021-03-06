package com.terrence.cn.test.gencode;
import java.io.File;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;

import com.sun.star.uno.RuntimeException;
import com.terrence.crm.dol.base.BaseService;
/**
 * 
 * @author tongbo
 *
 */
public class GenCode {
	private static final Logger log = Logger.getLogger(GenCode.class);
	private String otherPath;
	private String tablepk;
	public static void main(String[] args) throws Exception {
		log.debug("代码生成开始!");
		GenCode gnCode = new GenCode();
		gnCode.genCodeMain("t_trial_testline");
		log.debug("代码已经生成,请刷新工程!");
	}
	/**
	 * 生成代码主类
	 * @param tableName
	 * @throws Exception
	 */
	public void genCodeMain(String tableName) throws Exception{
		if(null==otherPath){
			otherPath = Config.ROOTPATH+"\\"+Config.PACKAGEPATH;
		}else{
			otherPath = otherPath+"\\"+Config.PACKAGEPATH;
		}
		List<String> list = new ArrayList<String>();
		ResultSet rs = readDB(tableName);
		String beanName = captureTableName(tableName);
		genBean(rs,tableName,beanName,list);
		rs = readDB(tableName);
		genBeanQuery(rs,beanName);
		genBeanXML(beanName,tableName,list);
		genIService(beanName);
		genService(beanName);
		genIDao(beanName);
		genDao(beanName,tablepk);
		genAction(beanName,tablepk);
	}
	/**
	 * 读取数据库
	 * @param tableName
	 * @return
	 */
	public ResultSet readDB(String tableName){
		String sql = "SELECT tablename = case when a.colorder=1 then d.name else '' end,"+
					"tabledesc = case when a.colorder=1 then cast(ifnull(f.value,'') as nvarchar(100)) else '' end,"+
					"columnno = a.colorder,ccolumn = a.name,"+
					"mark = case when COLUMNPROPERTY( a.id,a.name,'IsIdentity')=1 then '1'else '0' end,"+
					"pk = case when exists(SELECT 1 FROM sysobjects where xtype='PK' and parent_obj=a.id and name in ("+
                    "SELECT name FROM sysindexes WHERE indid in( SELECT indid FROM sysindexkeys WHERE id = a.id AND colid=a.colid))) then '1' else '0' end,"+
                    "ctype = b.name, usebytes = a.length,clength = COLUMNPROPERTY(a.id,a.name,'PRECISION'),"+
					"floatlen = cast(ifnull(COLUMNPROPERTY(a.id,a.name,'Scale'),0) as nvarchar(100)),"+
					"marknull = case when a.ifnullable=1 then '1' else '0' end,"+
					"autoval = cast(ifnull(e.text,'') as nvarchar(100)),cnote = cast(ifnull(g.[value],'') as nvarchar(100)) "+
					"FROM syscolumns a "+
					"left join systypes b on a.xusertype=b.xusertype "+
					"inner join sysobjects d on a.id=d.id  and d.xtype='U' and  d.name<>'dtproperties' "+
					"left join syscomments e on a.cdefault=e.id "+
					"left join sys.extended_properties g on a.id=G.major_id and a.colid=g.minor_id "+ 
					"left join sys.extended_properties f on d.id=f.major_id and f.minor_id=0 "+
					"where d.name='"+tableName+"' order by a.id,a.colorder";
		sql = "SELECT tmap.COLUMN_NAME ccolumn, tmap.DATA_TYPE ctype, tmap.COLUMN_COMMENT cnote,tmmp.pk pk " +
				" FROM INFORMATION_SCHEMA.COLUMNS tmap left join " +
				"(SELECT DISTINCT 1 pk, t.TABLE_NAME, t.CONSTRAINT_TYPE, c.COLUMN_NAME column_name, c.ORDINAL_POSITION FROM "+
				"INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS t,"+
				"INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS c WHERE t.TABLE_NAME = c.TABLE_NAME and c.table_name =  '"+tableName+"'  AND t.TABLE_SCHEMA = 'yyzkweb' AND t.CONSTRAINT_TYPE = 'PRIMARY KEY') tmmp" +
				" on tmap.COLUMN_NAME=tmmp.column_name "+
				"WHERE tmap.table_name = '"+tableName+"' AND tmap.table_schema = 'yyzkweb'";
		
		Connection conn = ConnectionUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			//将自动提交设置为false
			conn.setAutoCommit(false);
			//设置事务隔离级别
			conn.setTransactionIsolation(Connection.TRANSACTION_REPEATABLE_READ);
			ps = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			//设置参数值
			rs = ps.executeQuery();//执行sql
			//ResultSetMetaData rsmd=rs.getMetaData();
			//Integer columnCount = rsmd.getColumnCount();//查询出有多少个列
			conn.commit();
		} catch (Exception e) {
			log.error("操作失败，事务回滚!",e);
			try {
				conn.rollback();
			} catch (SQLException se) {
				log.error("回滚失败!",se);
			}
		} 
		/**finally{
			ConnectionUtil.close(ps);
			ConnectionUtil.close(conn);
		}*/
		return rs;
	}
	/**
	 * 生成bean类
	 * @param rs
	 * @param beanName
	 * @param list
	 * @throws Exception
	 */
	public void genBean(ResultSet rs,String tableName,String beanName,List<String> list) throws Exception{
		String ccloumn;
		String ctype;
		String cnote;
		Boolean pkflag = false;
		StringBuffer sb1 = new StringBuffer();
		StringBuffer sb2 = new StringBuffer();
		StringBuffer sb3 = new StringBuffer();
		StringBuffer sb4 = new StringBuffer();
		StringBuffer sb5 = new StringBuffer();
		PrintWriter pw = new PrintWriter(new File(otherPath+"\\bean\\"+beanName+".java"));
		pw.println("package "+Config.PACKAGEPATH_BEAN+";");
		pw.println("import javax.persistence.Entity;");
		pw.println("import org.apache.commons.lang.builder.EqualsBuilder;");
		pw.println("import org.apache.commons.lang.builder.HashCodeBuilder;");
		pw.println("import org.apache.commons.lang.builder.ToStringBuilder;");
		pw.println("import com.terrence.crm.dol.base.BaseEntity;");
		pw.println("import com.terrence.crm.dol.utils.DateConvertUtils;");
		pw.println("");
		pw.println("@Entity");
		pw.println("public class "+beanName+" extends BaseEntity implements java.io.Serializable {");
		pw.println("	/**");
		pw.println("	 * 序列化ID");
		pw.println("	 */");
		pw.println("	private static final long serialVersionUID = 1L;");
		sb3.append("	public String toString() {"+Config.SPLITTER);
		sb3.append("		return new ToStringBuilder(this)"+Config.SPLITTER);
		sb4.append("	public int hashCode() {"+Config.SPLITTER);
		sb4.append("		return new HashCodeBuilder()"+Config.SPLITTER);
		sb5.append("	public boolean equals(Object obj) {"+Config.SPLITTER);
		sb5.append("		if(obj instanceof "+beanName+" == false) return false;"+Config.SPLITTER);
		sb5.append("		if(this == obj) return true;"+Config.SPLITTER);
		sb5.append("		"+beanName+" other = ("+beanName+")obj;"+Config.SPLITTER);
		sb5.append("		return new EqualsBuilder()"+Config.SPLITTER);
		while (rs.next()) {
			/**
			for (int i = 1; i <= columnCount; i++) {
				head = rsmd.getColumnName(i);//取出表头
				type = rsmd.getColumnName(i);//取出类型
				log.info(head);
			}*/
			ccloumn = rs.getString("ccolumn");
			ctype = rs.getString("ctype");
			cnote = rs.getString("cnote");
			if(null!=cnote&&!cnote.trim().equals("")){
				sb1.append("	/**"+Config.SPLITTER);
				sb1.append("	 * "+cnote+Config.SPLITTER);
				sb1.append("	 */"+Config.SPLITTER);
			}
			if(ctype.toUpperCase().equals(ColumnType.BIGINT)){
				ctype = "Long";
			}else if(ctype.toUpperCase().equals(ColumnType.INT)){
				ctype = "Integer";
			}else if(ctype.toUpperCase().equals(ColumnType.DECIMAL)){
				ctype = "Double";
			}else if(ctype.toUpperCase().equals(ColumnType.DATE)
					||ctype.toUpperCase().equals(ColumnType.DATETIME)
					||ctype.toUpperCase().equals(ColumnType.VARCHAR)
					||ctype.toUpperCase().equals(ColumnType.NVARCHAR)){
				ctype = "String";
			}else{
				ctype = "Integer";
			}
			if(!pkflag&&rs.getString("pk").equals("1")){
				tablepk = ccloumn;
				pkflag = true;
			}
			list.add(ccloumn);
			sb1.append("	private "+ctype+" "+ccloumn+";"+Config.SPLITTER);
			sb2.append("	public "+ctype+" get"+captureColumnName(ccloumn)+"(){"+Config.SPLITTER);
			sb2.append("		return this."+ccloumn+";"+Config.SPLITTER);
			sb2.append("	}"+Config.SPLITTER);
			sb2.append("	public void set"+captureColumnName(ccloumn)+"("+ctype+" "+ccloumn+"){"+Config.SPLITTER);
			sb2.append("		this."+ccloumn+"="+ccloumn+";"+Config.SPLITTER);
			sb2.append("	}"+Config.SPLITTER);
			sb3.append("			.append(\""+captureColumnName(ccloumn)+"\",get"+captureColumnName(ccloumn)+"())"+Config.SPLITTER);
			sb4.append("			.append(get"+captureColumnName(ccloumn)+"())"+Config.SPLITTER);
			sb5.append("			.append(get"+captureColumnName(ccloumn)+"(),other.get"+captureColumnName(ccloumn)+"())"+Config.SPLITTER);
		}
		sb3.append("			.toString();"+Config.SPLITTER);
		sb3.append("		}"+Config.SPLITTER);
		sb4.append("			.toHashCode();"+Config.SPLITTER);
		sb4.append("		}"+Config.SPLITTER);
		sb5.append("			.isEquals();"+Config.SPLITTER);
		sb5.append("		}"+Config.SPLITTER);
		if(!pkflag){
			throw new RuntimeException(tableName+"表没有主键!");
		}
		pw.println(sb1.toString()+Config.SPLITTER+sb2.toString()+sb3.toString()+sb4.toString()+sb5.toString());
		pw.println("}");
		pw.close();
	}
	/**
	 * 生成查询类
	 * @param rs
	 * @param beanName
	 * @throws Exception
	 */
	public void genBeanQuery(ResultSet rs,String beanName) throws Exception{
		String ccloumn;
		String ctype;
		String cnote;
		StringBuffer sb1 = new StringBuffer();
		StringBuffer sb2 = new StringBuffer();
		PrintWriter pw = new PrintWriter(new File(otherPath+"\\query\\"+beanName+"Query.java"));
		pw.println("package "+Config.PACKAGEPATH_QUERY+";");
		pw.println("import com.terrence.crm.dol.base.BaseQuery;");
		pw.println("import com.terrence.crm.dol.utils.DateConvertUtils;");
		pw.println("");
		pw.println("public class "+beanName+"Query extends BaseQuery implements java.io.Serializable {");
		pw.println("	/**");
		pw.println("	 * 序列化ID");
		pw.println("	 */");
		pw.println("	private static final long serialVersionUID = 1L;");
		while (rs.next()) {
			ccloumn = rs.getString("ccolumn");
			ctype = rs.getString("ctype");
			cnote = rs.getString("cnote");
			if(null!=cnote&&!cnote.trim().equals("")){
				sb1.append("	/**"+Config.SPLITTER);
				sb1.append("	 * "+cnote+Config.SPLITTER);
				sb1.append("	 */"+Config.SPLITTER);
			}
			if(ctype.toUpperCase().equals(ColumnType.BIGINT)){
				ctype = "Long";
			}else if(ctype.toUpperCase().equals(ColumnType.INT)){
				ctype = "Integer";
			}else if(ctype.toUpperCase().equals(ColumnType.DECIMAL)){
				ctype = "Double";
			}else if(ctype.toUpperCase().equals(ColumnType.DATE)
					||ctype.toUpperCase().equals(ColumnType.DATETIME)
					||ctype.toUpperCase().equals(ColumnType.VARCHAR)
					||ctype.toUpperCase().equals(ColumnType.NVARCHAR)){
				ctype = "String";
			}else{
				ctype = "Integer";
			}
			sb1.append("	private "+ctype+" "+ccloumn+";"+Config.SPLITTER);
			sb2.append("	public "+ctype+" get"+captureColumnName(ccloumn)+"(){"+Config.SPLITTER);
			sb2.append("		return this."+ccloumn+";"+Config.SPLITTER);
			sb2.append("	}"+Config.SPLITTER);
			sb2.append("	public void set"+captureColumnName(ccloumn)+"("+ctype+" "+ccloumn+"){"+Config.SPLITTER);
			sb2.append("		this."+ccloumn+"="+ccloumn+";"+Config.SPLITTER);
			sb2.append("	}"+Config.SPLITTER);
		}
		pw.println(sb1.toString()+Config.SPLITTER+sb2.toString());
		pw.println("}");
		pw.close();
	}
	/**
	 * 生成ibatis的xml文件
	 * @param beanName
	 * @param tableName
	 * @param list
	 * @throws Exception
	 */
	public void genBeanXML(String beanName,String tableName,List<String> list) throws Exception{
		StringBuffer sb1 = new StringBuffer();//map
		StringBuffer sb2 = new StringBuffer();//columns
		StringBuffer sb3 = new StringBuffer();//insert key
		StringBuffer sb4 = new StringBuffer();//insert values
		StringBuffer sb5 = new StringBuffer();//update
		StringBuffer sb6 = new StringBuffer();//where
		StringBuffer sb7 = new StringBuffer();//and
		StringBuffer sb8 = new StringBuffer();//delete
		StringBuffer sb9 = new StringBuffer();//delete multi
		StringBuffer sb10 = new StringBuffer();//findpage
		StringBuffer sb11 = new StringBuffer();//findlist
		StringBuffer sb12 = new StringBuffer();//count(*)
		StringBuffer sb13 = new StringBuffer();//getById
		StringBuffer sb14 = new StringBuffer();//getByProperty
		PrintWriter pw = new PrintWriter(new File(otherPath+"\\bean\\mapper\\"+beanName+"SqlMap.xml"));
		pw.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.println("<!DOCTYPE sqlMap PUBLIC \"-//ibatis.apache.org//DTD SQL Map 2.0//EN\" ");
		pw.println("	\"http://ibatis.apache.org/dtd/sql-map-2.dtd\">");
		pw.println("<sqlMap namespace=\""+beanName+"\">");
		pw.println("");
		sb1.append("<resultMap id=\"RM."+beanName+"\" class=\""+Config.PACKAGEPATH_BEAN+"."+beanName+"\">"+Config.SPLITTER);
		sb2.append("<!-- 用于select查询公用抽取的列 -->"+Config.SPLITTER)
			.append("<sql id=\""+beanName+".columns\">"+Config.SPLITTER).append("	<![CDATA["+Config.SPLITTER);
		sb3.append("<insert id=\""+beanName+".insert\" >"+Config.SPLITTER).append("	<![CDATA["+Config.SPLITTER)
			.append("	INSERT INTO ").append(tableName+" ("+Config.SPLITTER);
		sb4.append("	) VALUES ("+Config.SPLITTER);
		sb5.append("<update id=\""+beanName+".update\" parameterClass=\""+Config.PACKAGEPATH_BEAN+"."+beanName+"\"> "+Config.SPLITTER);
		sb5.append("	UPDATE "+tableName+" "+Config.SPLITTER);
		sb5.append("	<dynamic prepend=\"SET\">"+Config.SPLITTER);
		sb6.append("<sql id=\""+beanName+".findPage.where\">"+Config.SPLITTER);
		sb6.append("	<dynamic prepend=\"WHERE\">"+Config.SPLITTER);
		sb7.append("<sql id=\""+beanName+".findPage.and\">"+Config.SPLITTER);
		int count = 0;
		for (String tmp:list) {
			sb1.append("	<result property=\""+tmp+"\" column=\""+tmp+"\"/>"+Config.SPLITTER);
			if(count!=list.size()-1){
				sb2.append("		"+tableName+"."+tmp+" ,"+Config.SPLITTER);
			}else{
				sb2.append("		"+tableName+"."+tmp+Config.SPLITTER);
			}
			if(!tmp.trim().equals(tablepk)){
				if(count==list.size()-1){
					sb3.append("		"+tmp+Config.SPLITTER);
					sb4.append("		#"+tmp).append("#"+Config.SPLITTER);
				}else{
					sb3.append("		"+tmp).append(","+Config.SPLITTER);
					sb4.append("		#"+tmp).append("#,"+Config.SPLITTER);
				}
				sb5.append("		<isNotEmpty prepend=\",\" property=\""+tmp+"\">"+Config.SPLITTER);
				sb5.append("			"+tmp+" = #"+tmp+"# "+Config.SPLITTER);
				sb5.append("		</isNotEmpty>"+Config.SPLITTER);
			}
			sb6.append("		<isNotEmpty prepend=\"AND\" property=\""+tmp+"\">"+Config.SPLITTER);
			sb6.append("			"+tableName+"."+tmp+" = #"+tmp+"# "+Config.SPLITTER);
			sb6.append("		</isNotEmpty>"+Config.SPLITTER);
			sb7.append("	<isNotEmpty prepend=\"AND\" property=\""+tmp+"\">"+Config.SPLITTER);
			sb7.append("		"+tableName+"."+tmp+" = #"+tmp+"# "+Config.SPLITTER);
			sb7.append("	</isNotEmpty>"+Config.SPLITTER);
			count++;
		}
		sb1.append("</resultMap>"+Config.SPLITTER);
		sb2.append("	]]>"+Config.SPLITTER).append("</sql>"+Config.SPLITTER);
		sb4.append("	)"+Config.SPLITTER).append("	]]>"+Config.SPLITTER);
		sb4.append("	<selectKey resultClass=\"java.lang.Integer\" type=\"post\" keyProperty=\""+tablepk+"\" >"+Config.SPLITTER);
		sb4.append("		SELECT  @@identity  AS  ID"+Config.SPLITTER);
		sb4.append("	</selectKey>"+Config.SPLITTER).append("</insert>"+Config.SPLITTER);
		sb5.append("	</dynamic>"+Config.SPLITTER);
		sb5.append(" 	WHERE ").append( tablepk +"=#"+tablepk+"# "+Config.SPLITTER);
		sb5.append("</update>"+Config.SPLITTER);
		sb6.append("	</dynamic>"+Config.SPLITTER);
		sb6.append("</sql>"+Config.SPLITTER);
		sb7.append("</sql>"+Config.SPLITTER);
		sb9.append("<delete id=\""+beanName+".delete\">"+Config.SPLITTER).append("	<![CDATA["+Config.SPLITTER)
			.append("		DELETE FROM "+tableName+" WHERE "+tablepk+"=#"+tablepk+"#"+Config.SPLITTER)
			.append("	]]>"+Config.SPLITTER).append("</delete>"+Config.SPLITTER);
		sb9.append("<delete id=\""+beanName+".deleteMultiple\">"+Config.SPLITTER).append("	<![CDATA["+Config.SPLITTER)
			.append("		DELETE FROM "+tableName+" WHERE "+tablepk+" in ($"+tablepk+"$)"+Config.SPLITTER)
			.append("	]]>"+Config.SPLITTER).append("</delete>"+Config.SPLITTER);
		sb10.append("<select id=\""+beanName+".findPage\" resultMap=\"RM."+beanName+"\">"+Config.SPLITTER)
			.append("	select <include refid=\""+beanName+".columns\"/> "+Config.SPLITTER)
			.append("		from "+tableName+" "+Config.SPLITTER)
			/*.append(" 		where 1=1"+Config.SPLITTER)
			.append("	<isNotEmpty property=\"notTop\">  "+Config.SPLITTER)
			.append("		and ").append(tablepk).append(" not in("+Config.SPLITTER)
			.append("			select $notTop$ ").append(tablepk)
			.append(" from "+tableName+" <include refid=\""+beanName+".findPage.where\"/>"+Config.SPLITTER)
			.append("			<isNotEmpty property=\"sortColumns\"> "+Config.SPLITTER)
			.append("				ORDER BY $sortColumns$"+Config.SPLITTER)
			.append("			</isNotEmpty> "+Config.SPLITTER).append("		)"+Config.SPLITTER)
			.append("	</isNotEmpty> "+Config.SPLITTER)*/
			.append("	<include refid=\""+beanName+".findPage.where\"/>"+Config.SPLITTER)
			.append("	<isNotEmpty property=\"sortColumns\">"+Config.SPLITTER)
			.append("		ORDER BY $sortColumns$"+Config.SPLITTER)
			.append("	</isNotEmpty>"+Config.SPLITTER)
			.append("</select>"+Config.SPLITTER);
		sb11.append("<select id=\""+beanName+".findList\" resultMap=\"RM."+beanName+"\">"+Config.SPLITTER)
			.append("	SELECT <include refid=\""+beanName+".columns\"/> FROM ").append(tableName).append(Config.SPLITTER)
			.append("	<include refid=\""+beanName+".findPage.where\"/>"+Config.SPLITTER)
			.append("	<isNotEmpty property=\"sortColumns\">"+Config.SPLITTER).append("		ORDER BY $sortColumns$"+Config.SPLITTER)
			.append("	</isNotEmpty>"+Config.SPLITTER).append("</select>"+Config.SPLITTER);
		sb12.append("<select id=\""+beanName+".findPage.count\" resultClass=\"long\">"+Config.SPLITTER);
		sb12.append("	select count(*) from "+tableName).append(" <include refid=\""+beanName+".findPage.where\"/>"+Config.SPLITTER)
			.append("</select>"+Config.SPLITTER);
		sb13.append("<select id=\""+beanName+".getById\" resultMap=\"RM."+beanName+"\">"+Config.SPLITTER)
			.append("	select <include refid=\""+beanName+".columns\"/> from "+tableName+" where "+tablepk+"=#"+tablepk+"#"+Config.SPLITTER)
			.append("</select>"+Config.SPLITTER);
		sb14.append("<select id=\""+beanName+".getByProperty\" resultMap=\"RM."+beanName+"\">"+Config.SPLITTER)
			.append("	select <include refid=\""+beanName+".columns\"/> from "+tableName+" where $propertyName$=#propertyValue#"+Config.SPLITTER)
			.append("</select>");
		pw.println(sb1.toString()+Config.SPLITTER+sb2.toString()+Config.SPLITTER+sb3.toString()+
				sb4.toString()+Config.SPLITTER+sb5.toString()+Config.SPLITTER+
				sb6.toString()+Config.SPLITTER+sb7.toString()+Config.SPLITTER+
				sb13.toString()+Config.SPLITTER+sb14.toString()+Config.SPLITTER+
				sb8.toString()+Config.SPLITTER+sb9.toString()+Config.SPLITTER+
				sb12.toString()+Config.SPLITTER+sb10.toString()+Config.SPLITTER+sb11.toString());
		pw.print("</sqlMap>");
		pw.close();
	}
	/**
	 * 生成业务层的接口类
	 * @param beanName
	 * @throws Exception
	 */
	public void genIService(String beanName) throws Exception{
		PrintWriter pw = new PrintWriter(new File(otherPath+"\\service\\I"+beanName+"Service.java"));
		pw.println("package "+Config.PACKAGEPATH_SERVICE+";");
		pw.println("import java.util.List;");
		pw.println("import com.terrence.crm.dol.base.core.Page;");
		pw.println("import com.terrence.crm.dol.base.exception.ServiceException;");
		pw.println("import com.terrence.crm.dol.bean."+beanName+";");
		pw.println("import com.terrence.crm.dol.query."+beanName+"Query;");
		pw.println("");
		pw.println("public interface I"+beanName+"Service {");
		pw.println("	public "+beanName+" getById(Long id) throws ServiceException;");
		pw.println("	public void saveOrUpdate("+beanName+" entity) throws ServiceException;");
		pw.println("	public Long save("+beanName+" entity) throws ServiceException;");
		pw.println("	public Integer update("+beanName+" entity) throws ServiceException;");
		pw.println("	public Integer deleteById(Long id) throws ServiceException;");
		pw.println("	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;");
		pw.println("	public Page<"+beanName+"> findPage(Page<"+beanName+"> page, "+beanName+"Query query) throws ServiceException;");
		pw.println("	public Page<"+beanName+"> findPage(Page<"+beanName+"> page,String statement, "+beanName+"Query query) throws ServiceException;");
		pw.println("	public List<"+beanName+"> findList("+beanName+"Query query) throws ServiceException;");
		pw.println("	public List<"+beanName+"> findList("+beanName+"Query query,Integer pageSize) throws ServiceException;");
		pw.println("	public List<"+beanName+"> findList("+beanName+"Query query,String statement,Integer pageSize) throws ServiceException;");
		pw.println("	public List<"+beanName+"> findAllList() throws ServiceException;");
		pw.println("}");
		pw.close();
	}
	/**
	 * 生成业务层对应接口的实现类
	 * @param beanName
	 * @throws Exception
	 */
	public void genService(String beanName) throws Exception{
		String lbeanName = littleColumnName(beanName);
		PrintWriter pw = new PrintWriter(new File(otherPath+"\\service\\impl\\"+beanName+"Service.java"));
		pw.println("package "+Config.PACKAGEPATH_SERVICE_IMPL+";");
		pw.println("import java.util.List;");
		pw.println("import org.springframework.beans.factory.annotation.Autowired;");
		pw.println("import org.springframework.beans.factory.annotation.Qualifier;");
		pw.println("import org.springframework.stereotype.Service;");
		pw.println("import org.apache.commons.lang.StringUtils;");
		pw.println("import org.springframework.transaction.annotation.Transactional;");
		pw.println("import com.terrence.crm.dol.base.core.Page;");
		pw.println("import com.terrence.crm.dol.base.BaseService;");
		pw.println("import com.terrence.crm.dol.base.exception.ServiceException;");
		pw.println("import com.terrence.crm.dol.bean."+beanName+";");
		pw.println("import com.terrence.crm.dol.dao.I"+beanName+"Dao;");
		pw.println("import com.terrence.crm.dol.query."+beanName+"Query;");
		pw.println("import com.terrence.crm.dol.service.I"+beanName+"Service;");
		pw.println("@Service");
		pw.println("@Transactional");
		pw.println("public class "+beanName+"Service extends BaseService implements I"+beanName+"Service {");
		pw.println("	@Autowired");
		pw.println("	@Qualifier(\""+lbeanName+"Dao\")");
		pw.println("	private I"+beanName+"Dao "+lbeanName+"Dao;");
		pw.println("	@Override");
		pw.println("	public "+beanName+" getById(Long id) throws ServiceException {");
		pw.println("		return "+lbeanName+"Dao.getById(id);");
		pw.println("	}");
		pw.println("	@Override");
		pw.println("	public void saveOrUpdate("+beanName+" entity) throws ServiceException {");
		pw.println("		"+lbeanName+"Dao.saveOrUpdate(entity);");
		pw.println("	}");
		pw.println("	@Override");
		pw.println("	public Long save("+beanName+" entity) throws ServiceException {");
		pw.println("		return "+lbeanName+"Dao.save(entity);");
		pw.println("	}");
		pw.println("	@Override");
		pw.println("	public Integer update("+beanName+" entity) throws ServiceException {");
		pw.println("		return "+lbeanName+"Dao.update(entity);");
		pw.println("	}");
		pw.println("	@Override");
		pw.println("	public Integer deleteById(Long id) throws ServiceException {");
		pw.println("		return "+lbeanName+"Dao.deleteById(id);");
		pw.println("	}");
		pw.println("	@Override");
		pw.println("	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {");
		pw.println("		String delIds = StringUtils.join(idList, \",\");");
		pw.println("		Integer returnValue = "+lbeanName+"Dao.deleteByMultipleId(delIds);");
		pw.println("		return returnValue;");
		pw.println("	}");
		pw.println("	@Transactional(readOnly=true)");
		pw.println("	public Page<"+beanName+"> findPage(Page<"+beanName+"> page, "+beanName+"Query query) throws ServiceException{");
		pw.println("		return "+lbeanName+"Dao.findPage(page, query);");
		pw.println("	}");
		pw.println("	@Transactional(readOnly=true)");
		pw.println("	public Page<"+beanName+"> findPage(Page<"+beanName+"> page,String statement, "+beanName+"Query query) throws ServiceException{");
		pw.println("		return "+lbeanName+"Dao.findPage(page,statement, query);");
		pw.println("	}");
		pw.println("	@Transactional(readOnly=true)");
		pw.println("	public List<"+beanName+"> findList("+beanName+"Query query) throws ServiceException{");
		pw.println("		return "+lbeanName+"Dao.findList(query);");
		pw.println("	}");
		pw.println("	@Transactional(readOnly=true)");
		pw.println("	public List<"+beanName+"> findList("+beanName+"Query query,Integer pageSize) throws ServiceException{");
		pw.println("		return "+lbeanName+"Dao.findList(query,pageSize);");
		pw.println("	}");
		pw.println("	@Transactional(readOnly=true)");
		pw.println("	public List<"+beanName+"> findList("+beanName+"Query query,String statement,Integer pageSize) throws ServiceException{");
		pw.println("		return "+lbeanName+"Dao.findList(query,statement,pageSize);");
		pw.println("	}");
		pw.println("	@Transactional(readOnly=true)");
		pw.println("	public List<"+beanName+"> findAllList() throws ServiceException{");
		pw.println("		return "+lbeanName+"Dao.findAllList();");
		pw.println("	}");
		pw.println("}");
		pw.close();
	}
	/**
	 * 生成数据访问层的接口类
	 * @param beanName
	 * @throws Exception
	 */
	public void genIDao(String beanName) throws Exception{
		PrintWriter pw = new PrintWriter(new File(otherPath+"\\dao\\I"+beanName+"Dao.java"));
		pw.println("package "+Config.PACKAGEPATH_DAO+";");
		pw.println("import java.util.List;");
		pw.println("import com.terrence.crm.dol.base.IBaseDao;");
		pw.println("import com.terrence.crm.dol.bean."+beanName+";");
		pw.println("");
		pw.println("public interface I"+beanName+"Dao extends IBaseDao<"+beanName+", java.lang.Long>{");
		pw.println("	public "+beanName+" getByProperty(String propertyName,Object propertyValue);");
		pw.println("}");
		pw.close();
	}
	/**
	 * 生成数据访问层接口类的实现类
	 * @param beanName
	 * @param pk
	 * @throws Exception
	 */
	public void genDao(String beanName,String pk) throws Exception{
		PrintWriter pw = new PrintWriter(new File(otherPath+"\\dao\\impl\\"+beanName+"Dao.java"));
		pw.println("package "+Config.PACKAGEPATH_DAO_IMPL+";");
		pw.println("import java.util.Map;");
		pw.println("import java.util.HashMap;");
		pw.println("import org.springframework.stereotype.Repository;");
		pw.println("import com.terrence.crm.dol.base.BaseIbatisDao;");
		pw.println("import com.terrence.crm.dol.bean."+beanName+";");
		pw.println("import com.terrence.crm.dol.dao.I"+beanName+"Dao;");
		pw.println("@Repository");
		pw.println("public class "+beanName+"Dao extends BaseIbatisDao<"+beanName+",java.lang.Long> implements I"+beanName+"Dao{");
		pw.println("	public String getIbatisSqlMapNamespace() {");
		pw.println("		return \""+beanName+"\"; ");
		pw.println("	}");
		pw.println("	public void saveOrUpdate("+beanName+" entity) {");
		pw.println("		if(entity.get"+captureColumnName(pk)+"() == null) ");
		pw.println("		save(entity);");
		pw.println("		else ");
		pw.println("		update(entity);");
		pw.println("	}");
		pw.println("	public "+beanName+" getByProperty(String propertyName,Object propertyValue){");
		pw.println("		Map map=new HashMap();");
		pw.println("		map.put(\"propertyName\", propertyName);");
		pw.println("		map.put(\"propertyValue\", (String)propertyValue);");
		pw.println("		return ("+beanName+")this.getSqlMapClientTemplate().queryForObject(\""+beanName+".getByProperty\", map);");
		pw.println("	}");
		pw.println("}");
		pw.close();
	}
	/**
	 * 生成控制层Action类
	 * @param beanName
	 * @param pk
	 * @throws Exception
	 */
	public void genAction(String beanName,String pk) throws Exception{
		String lbeanName = littleColumnName(beanName);
		PrintWriter pw = new PrintWriter(new File(Config.ROOTPATH+"\\"+Config.PACKAGEPATH+"\\action\\"+beanName+"Action.java"));
		pw.println("package "+Config.PACKAGEPATH_ACTION+";");
		pw.println("import org.apache.struts2.convention.annotation.Namespace;");
		pw.println("import org.apache.struts2.convention.annotation.Result;");
		pw.println("import org.apache.struts2.convention.annotation.Results;");
		pw.println("import org.springframework.beans.BeansException;");
		pw.println("import org.springframework.beans.factory.annotation.Autowired;");
		pw.println("import org.springframework.beans.factory.annotation.Qualifier;");
		pw.println("import org.springframework.context.ApplicationContext;");
		pw.println("import org.springframework.context.ApplicationContextAware;");
		pw.println("import org.springframework.context.annotation.Scope;");
		pw.println("import java.util.List;");
		pw.println("import com.terrence.crm.dol.base.CrudActionSupport;");
		pw.println("import com.terrence.crm.dol.base.core.Page;");
		pw.println("import com.terrence.crm.dol.base.exception.ServiceException;");
		pw.println("import com.terrence.crm.dol.service.I"+beanName+"Service;");
		pw.println("import com.terrence.crm.dol.bean."+beanName+";");
		pw.println("import com.terrence.crm.dol.query."+beanName+"Query;");
		pw.println("/**");
		pw.println(" * tongbo");
		pw.println(" * @version 1.0");
		pw.println(" */");
		pw.println("@Scope(\"prototype\")");
		pw.println("@Namespace(\"/"+lbeanName+"\")");
		pw.println("@Results( { @Result(name = CrudActionSupport.RELOAD, location = \""+lbeanName+".\"+ CrudActionSupport.ACTIONSUFFIX");
		pw.println("		+ \"?page.pageRequest=${page.pageRequest}\", type = \"redirect\") })");
		pw.println("public class "+beanName+"Action extends CrudActionSupport<"+beanName+"> implements ApplicationContextAware {");
		pw.println("");
		pw.println("	@Autowired");
		pw.println("	@Qualifier(\""+lbeanName+"Service\")");
		pw.println("	private I"+beanName+"Service "+lbeanName+"Service;");
		pw.println("");
		pw.println("	private "+beanName+" entity;");
		pw.println("");
		pw.println("	private "+beanName+"Query "+lbeanName+"Query;");
		pw.println("");
		pw.println("	private java.lang.Long "+lbeanName+"Id;");
		pw.println("");
		pw.println("	/** 分页器 */");
		pw.println("	private Page<"+beanName+"> page = new Page<"+beanName+">();");
		pw.println("");
		pw.println("	/** Json操作信息 */");
		pw.println("	private String[] resultInfo = new String[3];");
		pw.println("");
		pw.println("	/** 所选择的编号列表 */");
		pw.println("	private List<java.lang.Long> checkedIdList;");
		pw.println("");
		pw.println("	private ApplicationContext ctx;");
		pw.println("	private List<"+beanName+"> "+lbeanName+"List;");
		pw.println("");
		pw.println("	/*");
		pw.println("	 * (non-Javadoc)");
		pw.println("	 * @see com.disney.dol.base.CrudActionSupport#prepareModel()");
		pw.println("	 */");
		pw.println("	@Override");
		pw.println("	protected void prepareModel() throws Exception {");
		pw.println("		if ("+lbeanName+"Id != null) {");
		pw.println("			entity = "+lbeanName+"Service.getById("+lbeanName+"Id);");
		pw.println("		} else {");
		pw.println("			entity = new "+beanName+"();");
		pw.println("		}");
		pw.println("	}");
		pw.println("");
		pw.println("	/*");
		pw.println("	 * (non-Javadoc)");
		pw.println("	 * @see com.disney.dol.base.CrudActionSupport#delete()");
		pw.println("	 */");
		pw.println("	@Override");
		pw.println("	public String delete() throws Exception {");
		pw.println("		try {");
		pw.println("			if(null!=checkedIdList && checkedIdList.size()>0){");
		pw.println("				"+lbeanName+"Service.deleteByMultipleId(checkedIdList);");
		pw.println("			}else{");
		pw.println("				"+lbeanName+"Service.deleteById("+lbeanName+"Id);");
		pw.println("			}");
		pw.println("			resultInfo[0] = \"0\";");
		pw.println("			resultInfo[1] = \"删除成功\";");
		pw.println("			addActionMessage(\"删除成功\");");
		pw.println("		} catch (Exception e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = \"删除失败\";");
		pw.println("			addActionMessage(\"删除失败\");");
		pw.println("		}");
		pw.println("		return RELOAD;");
		pw.println("	}");
		pw.println("");
		pw.println("	/*");
		pw.println("	 * (non-Javadoc)");
		pw.println("	 * @see com.disney.dol.base.CrudActionSupport#deleteToJson()");
		pw.println("	 */");
		pw.println("	public String deleteToJson() throws Exception {");
		pw.println("		try {");
		pw.println("			delete();");
		pw.println("		} catch (Exception e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = \"删除失败\";");
		pw.println("		}");
		pw.println("		return JSON;");
		pw.println("	}");
		pw.println("");
		pw.println("	/*");
		pw.println("	 * (non-Javadoc)");
		pw.println("	 * @see com.disney.dol.base.CrudActionSupport#input()");
		pw.println("	 */");
		pw.println("	@Override");
		pw.println("	public String input() throws Exception {");
		pw.println("		return INPUT;");
		pw.println("	}");
		pw.println("");
		pw.println("	public String listToQuery() throws Exception {");
		pw.println("		if ("+lbeanName+"Query == null) {");
		pw.println("			"+lbeanName+"Query = new "+beanName+"Query();");
		pw.println("		}");
		pw.println("		try {");
		pw.println("			"+lbeanName+"List = "+lbeanName+"Service.findList("+lbeanName+"Query);");
		pw.println("			resultInfo[0] = \"0\";");
		pw.println("			resultInfo[1] = \"查询列表成功\";");
		pw.println("		} catch (ServiceException e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = e.getMessage();");
		pw.println("		} catch (Exception e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = \"查询列表失败\";");
		pw.println("		}");
		pw.println("		return JSON;");
		pw.println("	}");
		pw.println("");
		pw.println("	/*");
		pw.println("	 * (non-Javadoc)");
		pw.println("	 * @see com.disney.dol.base.CrudActionSupport#list()");
		pw.println("	 */");
		pw.println("	@Override");
		pw.println("	public String list() throws Exception {");
		pw.println("		if (!page.isOrderBySetted()) {");
		pw.println("			page.setOrderBy(\""+pk+"\");");
		pw.println("			page.setOrder(Page.DESC);");
		pw.println("		}");
		pw.println("		if ("+lbeanName+"Query == null) {");
		pw.println("			"+lbeanName+"Query = new "+beanName+"Query();");
		pw.println("		}");
		pw.println("		try {");
		pw.println("			page = "+lbeanName+"Service.findPage(page, "+lbeanName+"Query);");
		pw.println("			resultInfo[0] = \"0\";");
		pw.println("			resultInfo[1] = \"查询列表成功\";");
		pw.println("		} catch (ServiceException e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = e.getMessage();");
		pw.println("		} catch (Exception e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = \"查询列表失败\";");
		pw.println("		}");
		pw.println("		return SUCCESS;");
		pw.println("	}");
		pw.println("");
		pw.println("    /**");
		pw.println("     * 查询列表");
		pw.println("     * @return");
		pw.println("     * @throws Exception");
		pw.println("     */");
		pw.println("	public String listQuery() throws Exception {");
		pw.println("		if (!page.isOrderBySetted()) {");
		pw.println("			page.setOrderBy(\""+pk+"\");");
		pw.println("			page.setOrder(Page.DESC);");
		pw.println("		}");
		pw.println("		if ("+lbeanName+"Query == null) {");
		pw.println("			"+lbeanName+"Query = new "+beanName+"Query();");
		pw.println("		}");
		pw.println("		try {");
		pw.println("			"+lbeanName+"List = "+lbeanName+"Service.findList("+lbeanName+"Query);");
		pw.println("			resultInfo[0] = \"0\";");
		pw.println("			resultInfo[1] = \"查询列表成功\";");
		pw.println("		} catch (ServiceException e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = e.getMessage();");
		pw.println("		} catch (Exception e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = \"查询列表失败\";");
		pw.println("		}");
		pw.println("		return SUCCESS;");
		pw.println("	}");
		pw.println("");
		pw.println("	public String listToJson() throws Exception {");
		pw.println("		try {");
		pw.println("			list();");
		pw.println("		} catch (Exception e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = \"查询列表失败\";");
		pw.println("		}");
		pw.println("		return JSON;");
		pw.println("	}");
		pw.println("");
		pw.println("	public String listToJsonQuery() throws Exception {");
		pw.println("		try {");
		pw.println("			listQuery();");
		pw.println("		} catch (Exception e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = \"查询列表失败\";");
		pw.println("		}");
		pw.println("		return JSON;");
		pw.println("	}");
		pw.println("");
		pw.println("	/*");
		pw.println("	 * (non-Javadoc)");
		pw.println("	 * @see com.disney.dol.base.CrudActionSupport#save()");
		pw.println("	 */");
		pw.println("	@Override");
		pw.println("	public String save() throws Exception {");
		pw.println("		try {");
		pw.println("			"+lbeanName+"Service.saveOrUpdate(entity);");
		pw.println("			resultInfo[0] = \"0\";");
		pw.println("			resultInfo[1] = \"操作成功\";");
		pw.println("			addActionMessage(\"操作成功\");");
		pw.println("		} catch (ServiceException e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = e.getMessage();");
		pw.println("		} catch (Exception e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = \"操作失败,\" + e.getMessage();");
		pw.println("			addActionMessage(\"操作失败\");");
		pw.println("			return INPUT;");
		pw.println("		}");
		pw.println("		return RELOAD;");
		pw.println("	}");
		pw.println("");
		pw.println("	/*");
		pw.println("	 * (non-Javadoc)");
		pw.println("	 * @see com.disney.dol.base.CrudActionSupport#saveToJson()");
		pw.println("	 */");
		pw.println("	public String saveToJson() throws Exception {");
		pw.println("		try {");
		pw.println("			save();");
		pw.println("		} catch (Exception e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = \"操作失败\";");
		pw.println("		}");
		pw.println("		return JSON;");
		pw.println("	}");
		pw.println("");
		pw.println("	/*");
		pw.println("	 * (non-Javadoc)");
		pw.println("	 * @see com.disney.dol.base.CrudActionSupport#show()");
		pw.println("	 */");
		pw.println("	@Override");
		pw.println("	public String show() throws Exception {");
		pw.println("		try {");
		pw.println("			entity = "+lbeanName+"Service.getById("+lbeanName+"Id);");
		pw.println("			resultInfo[0] = \"0\";");
		pw.println("			resultInfo[1] = \"查询成功\";");
		pw.println("		} catch (ServiceException e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = e.getMessage();");
		pw.println("		} catch (Exception e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = \"查询失败\";");
		pw.println("		}");
		pw.println("		return SHOW;");
		pw.println("	}");
		pw.println("");
		pw.println("	/*");
		pw.println("	 * (non-Javadoc)");
		pw.println("	 * @see com.disney.dol.base.CrudActionSupport#showToJson()");
		pw.println("	 */");
		pw.println("	public String showToJson() throws Exception {");
		pw.println("		try {");
		pw.println("			show();");
		pw.println("		} catch (Exception e) {");
		pw.println("			logger.error(e.getMessage());");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = \"查询失败\";");
		pw.println("		}");
		pw.println("		return JSON;");
		pw.println("	}");
		pw.println("");
		pw.println("	// -------------------自定义方法");
		pw.println("	public String listAll() throws Exception {");
		pw.println("		try {");
		pw.println("			"+lbeanName+"List = "+lbeanName+"Service.findAllList();");
		pw.println("			resultInfo[0] = \"0\";");
		pw.println("			resultInfo[1] = \"操作成功\";");
		pw.println("		} catch (ServiceException e) {");
		pw.println("			logger.warn(\"param error \", e);");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = e.getMessage();");
		pw.println("		} catch (Exception e) {");
		pw.println("			logger.warn(\"param error \", e);");
		pw.println("			resultInfo[0] = \"-1\";");
		pw.println("			resultInfo[1] = \"操作失败\";");
		pw.println("		}");
		pw.println("		return JSON;");
		pw.println("	}");
		pw.println("");
		pw.println("	// -------------------自定义方法");
		pw.println("	/*");
		pw.println("	 * (non-Javadoc)");
		pw.println("	 * @see com.opensymphony.xwork2.ModelDriven#getModel()");
		pw.println("	 */");
		pw.println("	public "+beanName+" getModel() {");
		pw.println("		return entity;");
		pw.println("	}");
		pw.println("");
		pw.println("	/**");
		pw.println("	 * 获得分页器");
		pw.println("	 * @return the page");
		pw.println("	 */");
		pw.println("	public Page<"+beanName+"> getPage() {");
		pw.println("		return page;");
		pw.println("	}");
		pw.println("");
		pw.println("	public "+beanName+" getEntity() {");
		pw.println("		return entity;");
		pw.println("	}");
		pw.println("	public void setEntity("+beanName+" entity) {");
		pw.println("		this.entity = entity;");
		pw.println("	}");
		pw.println("	public "+beanName+"Query get"+beanName+"Query() {");
		pw.println("		return "+lbeanName+"Query;");
		pw.println("	}");
		pw.println("	public void set"+beanName+"Query("+beanName+"Query "+lbeanName+"Query) {");
		pw.println("		this."+lbeanName+"Query = "+lbeanName+"Query;");
		pw.println("	}");
		pw.println("	public java.lang.Long get"+beanName+"Id() {");
		pw.println("		return "+lbeanName+"Id;");
		pw.println("	}");
		pw.println("	public void set"+beanName+"Id(java.lang.Long "+lbeanName+"Id) {");
		pw.println("		this."+lbeanName+"Id = "+lbeanName+"Id;");
		pw.println("	}");
		pw.println("	public void setResultInfo(String[] resultInfo) {");
		pw.println("		this.resultInfo = resultInfo;");
		pw.println("	}");
		pw.println("	/**");
		pw.println("	 * 设置分页器");
		pw.println("	 * @param page");
		pw.println("	 *        the new page");
		pw.println(" */");
		pw.println("	public void setPage(Page<"+beanName+"> page) {");
		pw.println("		this.page = page;");
		pw.println("	}");
		pw.println("	/**");
		pw.println("	 * 获得Json操作信息");
		pw.println("	 * @return the result info");
		pw.println("	 */");
		pw.println("	public String[] getResultInfo() {");
		pw.println("		return resultInfo;");
		pw.println("	}");
		pw.println("	/**");
		pw.println("	 * 获得所选择的编号列表");
		pw.println("	 * @return 编号列表");
		pw.println("	 */");
		pw.println("	public List<java.lang.Long> getCheckedIdList() {");
		pw.println("		return checkedIdList;");
		pw.println("	}");
		pw.println("	/**");
		pw.println("	 * 设置编号列表");
		pw.println("	 * @param checkedIdList");
		pw.println("	 *        编号列表");
		pw.println("	 */");
		pw.println("	public void setCheckedIdList(List<java.lang.Long> checkedIdList) {");
		pw.println("		this.checkedIdList = checkedIdList;");
		pw.println("	}");
		pw.println("	public void setApplicationContext(ApplicationContext ctx)");
		pw.println("			throws BeansException {");
		pw.println("		this.ctx = ctx;");
		pw.println("	}");
		pw.println("	public List<"+beanName+"> get"+beanName+"List() {");
		pw.println("		return "+lbeanName+"List;");
		pw.println("	}");
		pw.println("}");
		pw.close();
	}
	/**
	 * 处理数据库表名称去掉前缀
	 * @param tableName
	 * @return
	 */
	public static String captureTableName(String tableName) {
		String[] tableNames = tableName.split("_");
		StringBuffer sb = new StringBuffer();
		for(int i=1;i<tableNames.length;i++){
			char[] cs=tableNames[i].toCharArray();
			cs[0]-=32;
			sb.append(cs);
		}
		return sb.toString();
	}
	/**
	 * 首字母大写
	 * @param columnName
	 * @return
	 */
	public static String captureColumnName(String columnName) {
		char[] cs=columnName.toCharArray();
		cs[0]-=32;
		return String.valueOf(cs);
	}
	/**
	 * 首字母小写
	 * @param columnName
	 * @return
	 */
	public static String littleColumnName(String columnName) {
		char[] cs=columnName.toCharArray();
		cs[0]+=32;
		return String.valueOf(cs);
	}
	public String getOtherPath() {
		return otherPath;
	}
	public void setOtherPath(String otherPath) {
		this.otherPath = otherPath;
	}
}
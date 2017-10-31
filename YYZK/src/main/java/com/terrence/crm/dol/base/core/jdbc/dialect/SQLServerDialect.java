package com.terrence.crm.dol.base.core.jdbc.dialect;

import org.apache.log4j.Logger;

public class SQLServerDialect extends Dialect{
	private static final Logger logger = Logger.getLogger(SQLServerDialect.class);  
	
	public boolean supportsLimitOffset(){
		return true;
	}
	
    public boolean supportsLimit() {   
        return true;   
    } 
    
    
    public String getLimitString(String querySelect, int offset, int limit) {  

    	/*if ( offset > 0 ) {  

    	    throw new UnsupportedOperationException( "query result offset is not supported" );  

    	}  */
    	//return querySelect;
    	return new StringBuffer( querySelect.length() + 8 ).append( querySelect ).insert(getAfterSelectInsertPoint( querySelect ), " top " + limit ).toString();  

    	}  
    public String getLimitString(String sql, int offset,String offsetPlaceholder, int limit, String limitPlaceholder) {
		StringBuffer sqlBuffer = new StringBuffer();
        if (offset > 0) {   
        	sqlBuffer.append(sql);
        	sqlBuffer.append(" limit ");
        	sqlBuffer.append(offsetPlaceholder);
        	sqlBuffer.append(" , ");
        	sqlBuffer.append(limitPlaceholder);

        } else {   
        	sqlBuffer.append(sql);
        	sqlBuffer.append(" limit ");
        	sqlBuffer.append(limitPlaceholder);
        }  
        ///select top 10 *  from t_item where fitemid not in(select top 10 fitemid from t_item where 1=1 order by fitemid desc) order by fitemid desc
        System.out.println( sqlBuffer.toString());
        return sqlBuffer.toString();
	} 
    static int getAfterSelectInsertPoint(String sql) {  

    	int selectIndex = sql.toLowerCase().indexOf( "select" );  

    	final int selectDistinctIndex = sql.toLowerCase().indexOf( "select distinct" );  

    	return selectIndex + ( selectDistinctIndex == selectIndex ? 15 : 6 );  

    }  
    /***  

    * Use <tt>insert table(...) values(...) select SCOPE_IDENTITY()</tt>  

    */ 

    public String appendIdentitySelectToInsert(String insertSQL) {  

    	return insertSQL + " select scope_identity()";  

    }  

    public static void main(String args[])
    {
    	SQLServerDialect sd=new SQLServerDialect();
    	System.out.println(sd.getLimitString("select * from user", 0, 10));
    }
}

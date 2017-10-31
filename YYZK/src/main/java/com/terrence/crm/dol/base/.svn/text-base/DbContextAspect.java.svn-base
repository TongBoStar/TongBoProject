/**
 * 
 */
package com.terrence.crm.dol.base;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.core.Ordered;

import com.terrence.crm.common.util.DbContextHolder;

/**
 * 数据访问拦截器，负责根据调用接口选择不同数据源
 *
 */
@Aspect
public class DbContextAspect implements Ordered  {
	
	private String readDS;
	private String writeDS;
	private String k3Ds;
	private String k3DsCz;//常州
	
	@Pointcut("execution(* com.terrence.crm.dol.service.impl.*Service.get*(..)) || " +
			  "execution(* com.terrence.crm.dol.service.impl.*Service.is*(..)) || " +
			  "execution(* com.terrence.crm.dol.service.impl.*Service.find*(..)) || " +
			  "execution(* com.terrence.crm.dol.service.impl.*Service.query*(..)) || "  +
			  "execution(* com.terrence.oa.dol.service.impl.*Service.get*(..)) || " +
			  "execution(* com.terrence.oa.dol.service.impl.*Service.is*(..)) || " +
			  "execution(* com.terrence.oa.dol.service.impl.*Service.find*(..)) || " +
			  "execution(* com.terrence.oa.dol.service.impl.*Service.query*(..)) || "  +
			  "execution(* com.terrence.core.dol.service.impl.*Service.get*(..)) || " +
			  "execution(* com.terrence.core.dol.service.impl.*Service.is*(..)) || " +
			  "execution(* com.terrence.core.dol.service.impl.*Service.find*(..)) || " +
			  "execution(* com.terrence.core.dol.service.impl.*Service.query*(..)) || "  +
			  "execution(* com.terrence.activiti.dol.service.impl.*Service.get*(..)) || " +
			  "execution(* com.terrence.activiti.dol.service.impl.*Service.is*(..)) || " +
			  "execution(* com.terrence.activiti.dol.service.impl.*Service.find*(..)) || " +
			  "execution(* com.terrence.activiti.dol.service.impl.*Service.query*(..))"
			  )
	private void allQueryMethod(){};
	
	@Pointcut("execution(* com.terrence.crm.dol.service.impl.*Service.save*(..)) || " +
			  "execution(* com.terrence.crm.dol.service.impl.*Service.delete*(..)) || " +
			  "execution(* com.terrence.crm.dol.service.impl.*Service.update*(..)) || " +
			  "execution(* com.terrence.oa.dol.service.impl.*Service.save*(..)) || " +
			  "execution(* com.terrence.oa.dol.service.impl.*Service.delete*(..)) || " +
			  "execution(* com.terrence.oa.dol.service.impl.*Service.update*(..)) || " +
			  "execution(* com.terrence.core.dol.service.impl.*Service.save*(..)) || " +
			  "execution(* com.terrence.core.dol.service.impl.*Service.delete*(..)) || " +
			  "execution(* com.terrence.core.dol.service.impl.*Service.update*(..)) || " +
			  "execution(* com.terrence.activiti.dol.service.impl.*Service.save*(..)) || " +
			  "execution(* com.terrence.activiti.dol.service.impl.*Service.delete*(..)) || " +
			  "execution(* com.terrence.activiti.dol.service.impl.*Service.update*(..)) "
			  )
	private void allSaveMethod(){};
	
	@Pointcut("execution(* com.terrence.crm.kingdee.service.impl.*Service.find*(..)) || "+
			  "execution(* com.terrence.crm.kingdee.service.impl.*Service.query*(..)) || "+
			  "execution(* com.terrence.crm.kingdee.service.impl.*Service.get*(..)) "
			  )
	private void k3QueryMethod(){};
	
	
	@Pointcut("execution(* com.terrence.k3.dol.service.impl.*Service.find*(..)) || " +
			  "execution(* com.terrence.k3.dol.service.impl.*Service.query*(..)) || " +
			  "execution(* com.terrence.k3.dol.service.impl.*Service.get*(..)) "
			  )
	private void k3CzQueryMethod(){};
	
	
	@Before("k3QueryMethod()")
	public void queryK3DbContext(){
		DbContextHolder.setDbType(k3Ds);
	}
	
	@Before("k3CzQueryMethod()")
	public void queryK3CzDbContext(){
		DbContextHolder.setDbType(k3DsCz);
	}
	
	@Before("allQueryMethod()")
	public void queryDbContext(){
	   DbContextHolder.setDbType(readDS);
	}
	
	@Before("allSaveMethod()")
	public void saveDbContext(){
	   DbContextHolder.setDbType(writeDS);
	}
	

	/**
	 * @return the readDS
	 */
	public String getReadDS() {
		return readDS;
	}

	/**
	 * @param readDS the readDS to set
	 */
	public void setReadDS(String readDS) {
		this.readDS = readDS;
	}

	/**
	 * @return the writeDS
	 */
	public String getWriteDS() {
		return writeDS;
	}

	/**
	 * @param writeDS the writeDS to set
	 */
	public void setWriteDS(String writeDS) {
		this.writeDS = writeDS;
	}

	public int getOrder() {
		return -1;
	}

	public String getK3Ds() {
		return k3Ds;
	}

	public void setK3Ds(String k3Ds) {
		this.k3Ds = k3Ds;
	}

	public String getK3DsCz() {
		return k3DsCz;
	}

	public void setK3DsCz(String k3DsCz) {
		this.k3DsCz = k3DsCz;
	}
}

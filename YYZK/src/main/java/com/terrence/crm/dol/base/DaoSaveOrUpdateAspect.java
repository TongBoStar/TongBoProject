/**
 * 
 */
package com.terrence.crm.dol.base;

import java.util.Date;

import javax.persistence.Id;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.core.Ordered;

import com.terrence.crm.dol.base.utils.ReflectionUtils;



/**
 * 数据访问拦截器，负责根据调用接口时填写modifierId  createdTime or modifiedTime
 *
 */
@Aspect
public class DaoSaveOrUpdateAspect implements Ordered  {
	
	
	@Pointcut("execution(* BaseIbatisDao+.update(..)) || execution(* BaseIbatisDao+.save*(..))")
	private void allSaveOrUpdateMethod(){};
	
	
	@Before("allSaveOrUpdateMethod()")
	public void saveOrUpdateMethod(JoinPoint jp){
		System.out.println("============allSaveOrUpdateMethod==========");
		Object[] objs = jp.getArgs();
		try {
			Object id = ReflectionUtils.getFieldByAnnotation(objs[0], Id.class);
			if(id==null){
				if(ReflectionUtils.getFieldValue(objs[0], "createdTime")==null){
					ReflectionUtils.setFieldValue(objs[0], "createdTime", new Date());
				}
				if(ReflectionUtils.getFieldValue(objs[0], "modifiedTime")==null){
					ReflectionUtils.setFieldValue(objs[0], "modifiedTime", new Date());
				}
			}else{
				if(ReflectionUtils.getFieldValue(objs[0], "modifiedTime")==null){
					ReflectionUtils.setFieldValue(objs[0], "modifiedTime", new Date());
				}
			}
			if(ReflectionUtils.getFieldValue(objs[0], "modifierId")==null){
				ReflectionUtils.setFieldValue(objs[0], "modifierId", UserContextHolder.get().getId());
			}
		} catch (Exception e) {
			//e.printStackTrace();
		} 
	}
	
	public int getOrder() {
		return -1;
	}
	
}

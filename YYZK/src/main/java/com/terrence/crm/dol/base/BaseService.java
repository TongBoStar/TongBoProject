/**
 * 
 */
package com.terrence.crm.dol.base;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.ApplicationEvent;

import com.terrence.core.dol.dao.IOperationLogDao;

/**
 * @author Administrator
 *
 */
public abstract class BaseService implements ApplicationContextAware {
	
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	private ApplicationContext ctx;
	@Autowired
	@Qualifier("operationLogDao")
	public IOperationLogDao operationLogDao;
	/**
	 * 发布Context事件
	 * @param event 事件
	 */
	public void publishEvent(ApplicationEvent event){
		this.ctx.publishEvent(event);
	}

	/* (non-Javadoc)
	 * @see org.springframework.context.ApplicationContextAware#setApplicationContext(org.springframework.context.ApplicationContext)
	 */
	public void setApplicationContext(ApplicationContext ctx)
			throws BeansException {
		this.ctx = ctx;
	}

}

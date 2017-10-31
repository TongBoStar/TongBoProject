package com.terrence.crm.common.exception;

import org.springframework.core.NestedRuntimeException;
/**
 * @author  harry.zu E-mail:harry.zu@disney.com
 * @version Feb 17, 2009 2:21:35 PM
 * @
 */
public class DAOException extends NestedRuntimeException{

	 public DAOException(String msg) {
	        super(msg);
	    }
	    public DAOException(String msg, Throwable ex) {
	        super(msg, ex);
	    }
}
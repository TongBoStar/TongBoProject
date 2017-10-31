package com.terrence.crm.dol.base.exception;

/**
 * Service层公用的Exception.
 * 
 * 继承自RuntimeException, 从由Spring管理事务的函数中抛出时会触发事务回滚.
 * 
 */
public class ServiceException extends RuntimeException {

	private static final long serialVersionUID = 3583566093089790852L;
	/**
	 * 错误编号
	 */
	private String errorCode = "-1";
	/**
	 * 错误值 
	 */
	private Object errorValue;

	public ServiceException() {
		super();
	}

	public ServiceException(String message) {
		super(message);
	}
	public ServiceException(String message,String errorCode) {
		super(message);
		this.errorCode = errorCode;
	}
	public ServiceException(String message,String errorCode,Object errorValue) {
		super(message);
		this.errorCode = errorCode;
		this.errorValue = errorValue;
	}

	public ServiceException(Throwable cause) {
		super(cause);
	}

	public ServiceException(String message, Throwable cause) {
		super(message, cause);
	}

	public String getErrorCode() {
		return errorCode;
	}

	/**
	 * @return the errorValue
	 */
	public Object getErrorValue() {
		return errorValue;
	}
	
}

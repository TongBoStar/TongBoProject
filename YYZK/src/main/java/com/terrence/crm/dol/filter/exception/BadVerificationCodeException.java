package com.terrence.crm.dol.filter.exception;

import org.springframework.security.core.AuthenticationException;

public class BadVerificationCodeException extends AuthenticationException {
	private static final long serialVersionUID = -8882769146740042275L;

	public BadVerificationCodeException(String msg) {
		super(msg);
		// TODO Auto-generated constructor stub
	}
	
	public BadVerificationCodeException(String msg, Object extraInformation) {
		super(msg, extraInformation);
		// TODO Auto-generated constructor stub
	}
	
	public BadVerificationCodeException(String msg, Throwable t) {
		super(msg, t);
		// TODO Auto-generated constructor stub
	}

	

	

}

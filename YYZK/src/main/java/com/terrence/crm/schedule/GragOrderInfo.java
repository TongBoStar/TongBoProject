package com.terrence.crm.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import com.terrence.crm.dol.service.IIncominfoService;

public class GragOrderInfo {
	@Autowired
	@Qualifier("incominfoService")
	private IIncominfoService incominfoService;
	
	public  void execGragOrderInfo(){ 
		incominfoService.findAllList();
		incominfoService.gragOrderInfo();
	}
}
package com.terrence.crm.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import com.terrence.crm.dol.service.IStuselogService;
import com.terrence.crm.dol.service.ITuringtestService;

public class TestTuring {
	@Autowired
	@Qualifier("turingtestService")
	private ITuringtestService turingtestService;
	
	public  void execTestTuring(){ 
		turingtestService.getById(1L);
		turingtestService.testTuring();
	}
}

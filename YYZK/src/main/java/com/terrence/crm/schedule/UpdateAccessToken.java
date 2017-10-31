package com.terrence.crm.schedule;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import com.terrence.crm.dol.service.IWxinfoService;

public class UpdateAccessToken {
	@Autowired
	@Qualifier("wxinfoService")
	private IWxinfoService wxinfoService;
	
	public  void execupdateaccesstoken(){ 
		wxinfoService.updateAccessToken();
	}
}

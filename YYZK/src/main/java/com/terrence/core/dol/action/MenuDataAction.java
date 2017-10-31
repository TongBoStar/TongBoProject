package com.terrence.core.dol.action;
import java.io.IOException;
import java.util.Date;

import org.apache.struts2.convention.annotation.Namespace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;

import com.base.BaseAction;
import com.terrence.core.dol.bean.MenuData;
import com.terrence.core.dol.query.MenuDataQuery;
import com.terrence.core.dol.service.IMenuDataService;
import com.terrence.crm.dol.base.core.Page;

@Scope("prototype")
@Namespace("/menudata")
public class MenuDataAction extends BaseAction{

   @Autowired
   @Qualifier("sysMenuDataService")
   private IMenuDataService sysMenuDataService;

   private MenuData sysMenuData;
   private MenuDataQuery sysMenuDataQuery;
   private Page<MenuData> page = new Page<MenuData>();

}

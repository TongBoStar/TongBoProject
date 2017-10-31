package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Helpvideo;

public interface IHelpvideoDao extends IBaseDao<Helpvideo, java.lang.Long>{
	public Helpvideo getByProperty(String propertyName,Object propertyValue);
}

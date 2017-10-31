package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.Comment;

public interface ICommentDao extends IBaseDao<Comment, java.lang.Long>{
	public Comment getByProperty(String propertyName,Object propertyValue);
}

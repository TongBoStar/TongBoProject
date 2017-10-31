package com.terrence.crm.dol.dao;
import java.util.List;
import com.terrence.crm.dol.base.IBaseDao;
import com.terrence.crm.dol.bean.CommentImg;

public interface ICommentImgDao extends IBaseDao<CommentImg, java.lang.Long>{
	public CommentImg getByProperty(String propertyName,Object propertyValue);
}

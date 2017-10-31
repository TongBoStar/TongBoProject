package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.CommentImg;
import com.terrence.crm.dol.dao.ICommentImgDao;
@Repository
public class CommentImgDao extends BaseIbatisDao<CommentImg,java.lang.Long> implements ICommentImgDao{
	public String getIbatisSqlMapNamespace() {
		return "CommentImg"; 
	}
	public void saveOrUpdate(CommentImg entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public CommentImg getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (CommentImg)this.getSqlMapClientTemplate().queryForObject("CommentImg.getByProperty", map);
	}
}

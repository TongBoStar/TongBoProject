package com.terrence.crm.dol.dao.impl;
import java.util.Map;
import java.util.HashMap;
import org.springframework.stereotype.Repository;
import com.terrence.crm.dol.base.BaseIbatisDao;
import com.terrence.crm.dol.bean.Comment;
import com.terrence.crm.dol.dao.ICommentDao;
@Repository
public class CommentDao extends BaseIbatisDao<Comment,java.lang.Long> implements ICommentDao{
	public String getIbatisSqlMapNamespace() {
		return "Comment"; 
	}
	public void saveOrUpdate(Comment entity) {
		if(entity.getId() == null) 
		save(entity);
		else 
		update(entity);
	}
	public Comment getByProperty(String propertyName,Object propertyValue){
		Map map=new HashMap();
		map.put("propertyName", propertyName);
		map.put("propertyValue", (String)propertyValue);
		return (Comment)this.getSqlMapClientTemplate().queryForObject("Comment.getByProperty", map);
	}
}

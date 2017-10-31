package com.terrence.crm.dol.service.impl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.springframework.transaction.annotation.Transactional;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.BaseService;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Comment;
import com.terrence.crm.dol.dao.ICommentDao;
import com.terrence.crm.dol.query.CommentQuery;
import com.terrence.crm.dol.service.ICommentService;
@Service
@Transactional
public class CommentService extends BaseService implements ICommentService {
	@Autowired
	@Qualifier("commentDao")
	private ICommentDao commentDao;
	@Override
	public Comment getById(Long id) throws ServiceException {
		return commentDao.getById(id);
	}
	@Override
	public void saveOrUpdate(Comment entity) throws ServiceException {
		commentDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(Comment entity) throws ServiceException {
		return commentDao.save(entity);
	}
	@Override
	public Integer update(Comment entity) throws ServiceException {
		return commentDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return commentDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = commentDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<Comment> findPage(Page<Comment> page, CommentQuery query) throws ServiceException{
		return commentDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<Comment> findPage(Page<Comment> page,String statement, CommentQuery query) throws ServiceException{
		return commentDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<Comment> findList(CommentQuery query) throws ServiceException{
		return commentDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<Comment> findList(CommentQuery query,Integer pageSize) throws ServiceException{
		return commentDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Comment> findList(CommentQuery query,String statement,Integer pageSize) throws ServiceException{
		return commentDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<Comment> findAllList() throws ServiceException{
		return commentDao.findAllList();
	}
}

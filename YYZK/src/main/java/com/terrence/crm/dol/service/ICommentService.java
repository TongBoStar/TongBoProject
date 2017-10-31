package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.Comment;
import com.terrence.crm.dol.query.CommentQuery;

public interface ICommentService {
	public Comment getById(Long id) throws ServiceException;
	public void saveOrUpdate(Comment entity) throws ServiceException;
	public Long save(Comment entity) throws ServiceException;
	public Integer update(Comment entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<Comment> findPage(Page<Comment> page, CommentQuery query) throws ServiceException;
	public Page<Comment> findPage(Page<Comment> page,String statement, CommentQuery query) throws ServiceException;
	public List<Comment> findList(CommentQuery query) throws ServiceException;
	public List<Comment> findList(CommentQuery query,Integer pageSize) throws ServiceException;
	public List<Comment> findList(CommentQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<Comment> findAllList() throws ServiceException;
}

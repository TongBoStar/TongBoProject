package com.terrence.crm.dol.service;
import java.util.List;
import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;
import com.terrence.crm.dol.bean.CommentImg;
import com.terrence.crm.dol.query.CommentImgQuery;

public interface ICommentImgService {
	public CommentImg getById(Long id) throws ServiceException;
	public void saveOrUpdate(CommentImg entity) throws ServiceException;
	public Long save(CommentImg entity) throws ServiceException;
	public Integer update(CommentImg entity) throws ServiceException;
	public Integer deleteById(Long id) throws ServiceException;
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException;
	public Page<CommentImg> findPage(Page<CommentImg> page, CommentImgQuery query) throws ServiceException;
	public Page<CommentImg> findPage(Page<CommentImg> page,String statement, CommentImgQuery query) throws ServiceException;
	public List<CommentImg> findList(CommentImgQuery query) throws ServiceException;
	public List<CommentImg> findList(CommentImgQuery query,Integer pageSize) throws ServiceException;
	public List<CommentImg> findList(CommentImgQuery query,String statement,Integer pageSize) throws ServiceException;
	public List<CommentImg> findAllList() throws ServiceException;
}

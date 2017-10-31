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
import com.terrence.crm.dol.bean.CommentImg;
import com.terrence.crm.dol.dao.ICommentImgDao;
import com.terrence.crm.dol.query.CommentImgQuery;
import com.terrence.crm.dol.service.ICommentImgService;
@Service
@Transactional
public class CommentImgService extends BaseService implements ICommentImgService {
	@Autowired
	@Qualifier("commentImgDao")
	private ICommentImgDao commentImgDao;
	@Override
	public CommentImg getById(Long id) throws ServiceException {
		return commentImgDao.getById(id);
	}
	@Override
	public void saveOrUpdate(CommentImg entity) throws ServiceException {
		commentImgDao.saveOrUpdate(entity);
	}
	@Override
	public Long save(CommentImg entity) throws ServiceException {
		return commentImgDao.save(entity);
	}
	@Override
	public Integer update(CommentImg entity) throws ServiceException {
		return commentImgDao.update(entity);
	}
	@Override
	public Integer deleteById(Long id) throws ServiceException {
		return commentImgDao.deleteById(id);
	}
	@Override
	public Integer deleteByMultipleId(List<Long> idList) throws ServiceException {
		String delIds = StringUtils.join(idList, ",");
		Integer returnValue = commentImgDao.deleteByMultipleId(delIds);
		return returnValue;
	}
	@Transactional(readOnly=true)
	public Page<CommentImg> findPage(Page<CommentImg> page, CommentImgQuery query) throws ServiceException{
		return commentImgDao.findPage(page, query);
	}
	@Transactional(readOnly=true)
	public Page<CommentImg> findPage(Page<CommentImg> page,String statement, CommentImgQuery query) throws ServiceException{
		return commentImgDao.findPage(page,statement, query);
	}
	@Transactional(readOnly=true)
	public List<CommentImg> findList(CommentImgQuery query) throws ServiceException{
		return commentImgDao.findList(query);
	}
	@Transactional(readOnly=true)
	public List<CommentImg> findList(CommentImgQuery query,Integer pageSize) throws ServiceException{
		return commentImgDao.findList(query,pageSize);
	}
	@Transactional(readOnly=true)
	public List<CommentImg> findList(CommentImgQuery query,String statement,Integer pageSize) throws ServiceException{
		return commentImgDao.findList(query,statement,pageSize);
	}
	@Transactional(readOnly=true)
	public List<CommentImg> findAllList() throws ServiceException{
		return commentImgDao.findAllList();
	}
}

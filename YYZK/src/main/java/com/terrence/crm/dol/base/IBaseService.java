package com.terrence.crm.dol.base;

import com.terrence.crm.dol.base.core.Page;
import com.terrence.crm.dol.base.exception.ServiceException;

public interface IBaseService<E> {
	public Page<E> findPage(final Page<E> page,String statement, BaseQuery query) throws ServiceException;
}

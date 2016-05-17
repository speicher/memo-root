package org.memo.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.memo.dao.AccesslogDao;
import org.memo.dao.BaseCrudDao;
import org.memo.po.AccesslogDto;

/**
 * 访问记录
 * @author Danica
 * Date 2016.5.13
 */
@Service("accesslogService") 
public class AccesslogServiceImpl extends BaseCrudServiceImpl implements AccesslogService {
	@Resource
	private AccesslogDao accesslogDao;
	
	@Override
	public BaseCrudDao init() {
		return accesslogDao;
	}

	public AccesslogDto findByMemberId(String memberId) {
		return accesslogDao.selectByMemberId(memberId);
	}

}

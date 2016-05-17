package org.memo.service;

import org.memo.po.AccesslogDto;

/**
 * 访问记录
 * @author Danica
 * Date 2016.5.13
 */
public interface AccesslogService extends BaseCrudService{
	//根据用户ID查找最近一条记录
	public abstract AccesslogDto findByMemberId(String memberId);
}

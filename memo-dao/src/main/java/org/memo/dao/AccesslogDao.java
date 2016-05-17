package org.memo.dao;

import org.memo.po.AccesslogDto;

/**
 * 访问记录存储
 * @author Danica
 * Date 2016.5.13
 */
public interface AccesslogDao extends BaseCrudDao {
	//根据用户ID查找最近一条记录
	public abstract AccesslogDto selectByMemberId(String memberId);

}

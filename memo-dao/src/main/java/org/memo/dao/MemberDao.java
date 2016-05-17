package org.memo.dao;

import org.memo.po.MemberDto;
/**
 * 会员信息操作
 * @author Danica
 * Date 2016.4.26
 */
public interface MemberDao extends BaseCrudDao {

	public int updateByUniquekey(MemberDto paramMemberDto);
	
	public int deleteByPrimarayKeyForModel(MemberDto paramMemberDto);

}

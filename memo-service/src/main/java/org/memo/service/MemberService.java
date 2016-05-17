package org.memo.service;

import java.util.Map;

import org.memo.core.exception.ServiceException;
import org.memo.po.MemberDto;
/**
 * 会员信息操作
 * @author Danica
 * Date 2016.4.26
 */
public interface MemberService extends BaseCrudService{
//	public int deleteById(MemberDto paramUserDto) throws ServiceException ;

//	public int add(MemberDto paramUserDto) throws ServiceException ;

//	public int modifyById(MemberDto paramUserDto) throws ServiceException ;
	
	public int modifyByUniqueId(MemberDto paramUserDto) throws ServiceException ;
	
//	public MemberDto findById(MemberDto paramUserDto) throws ServiceException;

//	public List<MemberDto> findByBiz(Map<String, Object> paramMap) throws ServiceException ;
	
//	public int findCount(Map<String, Object> paramMap) throws ServiceException ;
	
	public MemberDto findByUniqueParam(Map<String, Object> paramMap) throws ServiceException ;
}

package org.memo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.memo.core.exception.ServiceException;
import org.memo.dao.BaseCrudDao;
import org.memo.dao.MemberDao;
import org.memo.po.MemberDto;
/**
 * 会员信息操作
 * @author Danica
 * Date 2016.4.26
 */
@Service("memberService") 
public class MemberServiceImpl extends BaseCrudServiceImpl implements MemberService{

	@Resource
	private MemberDao memberDao;

	@Override
	public BaseCrudDao init() {
		return memberDao ;
	}

	public MemberDto findByUniqueParam(Map<String, Object> paramMap) throws ServiceException {
		try {
			MemberDto member = new MemberDto();
			List<MemberDto> list = this.memberDao.selectByParams(null,paramMap);
			if(list.size() > 0){
				member = list.get(0);
			} else{
				member = null;
			}
			return member;
		} catch (Exception e) {
			throw new ServiceException(new StringBuilder()
					.append("Problem invoking method, Cause:")
					.append(e.getMessage()).toString(), e);
		}
	}

	public int modifyByUniqueId(MemberDto paramUserDto) throws ServiceException {
		try {
			return this.memberDao.updateByUniquekey(paramUserDto);
		} catch (Exception e) {
			throw new ServiceException(new StringBuilder()
					.append("Problem invoking method, Cause:")
					.append(e.getMessage()).toString(), e);
		}
	}
}

package org.memo.web.controller.community;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;

import org.memo.core.exception.ManagerException;
import org.memo.core.exception.ServiceException;
import org.memo.po.MemberDto;
import org.memo.service.MemberService;
import org.memo.web.controller.BaseCrudController;
import org.memo.web.utils.CommunityConstant;

/**
 * Danica个人社区
 * @author Danica
 * Date 2016.5.9
 */
@Controller
@RequestMapping({"/community/usr"})
public class UserCrudController extends BaseCrudController<MemberDto>{
	@Resource
	private MemberService memberService;
	
	@Override
	protected CrudInfo init() {
		return new CrudInfo(memberService);
	}
	
	//用户资料界面
	@RequestMapping(value="/home")
	public void memberHomepage(){
		System.out.println("-------- community/usr/home.jsp --------");
	}
	
	//个人资料修改界面
	@RequestMapping(value="/profile_s")
	public void profileModify(HttpServletRequest request){
		HttpSession session = request.getSession();
		if(null != session.getAttribute(CommunityConstant.USR_ID)){
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(CommunityConstant.USR_ID, session.getAttribute(CommunityConstant.USR_ID));
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				MemberDto member = memberService.findByUniqueParam(params);
				
				request.setAttribute("member", member);
				if(null != member.getBirthDate())
					request.setAttribute("birthday", sdf.format(member.getBirthDate()));
			} catch (ServiceException e) {
				e.printStackTrace();
			}
		}
		System.out.println("-------- community/usr/profile_m.jsp --------");
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping({ "/name_chk" })
	public ResponseEntity<Integer> getCount(HttpServletRequest req, MemberDto model) throws ServiceException {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("memberName", model.getMemberName());
		int total = memberService.findCount(params);
		return new ResponseEntity(Integer.valueOf(total), HttpStatus.OK);
	}
	
	//修改个人资料
	@RequestMapping(value="/profile_u")
	public ResponseEntity<String> updateProfile(HttpServletRequest req, MemberDto model) throws ManagerException{
		String flag = CommunityConstant.FLAG_0;
		HttpSession session = req.getSession();
		Assert.notNull(model);
		Assert.notNull(session.getAttribute(CommunityConstant.USR_ID), "用户ID不能为空");
		try {
			if(StringUtils.isBlank(model.getMemberId())){
				
				model.setMemberId(session.getAttribute(CommunityConstant.USR_ID).toString());
			}
			model.setUpdateTime(new Date());
			memberService.modifyByUniqueId(model);
			
			this.updateSession(session, model);
			
			flag = CommunityConstant.FLAG_1;
		} catch (ServiceException e) {
			flag = CommunityConstant.FLAG_0;
			throw new ManagerException(e);
		} 
		return new ResponseEntity<String>(flag, HttpStatus.OK);
	}
	
	public void updateSession(HttpSession session, MemberDto model){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put(CommunityConstant.USR_ID, model.getMemberId());
		try {
			model = memberService.findByUniqueParam(params);
			
			session.setAttribute(CommunityConstant.USR_NM, model.getMemberName());
			session.setAttribute(CommunityConstant.USR_EMAIL, model.getEmail());
			session.setAttribute(CommunityConstant.USR_PWD, model.getMemberPwd());
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		
	}
	
}

package org.memo.web.controller.community;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.memo.po.MemberDto;
import org.memo.service.MemberService;
import org.memo.web.controller.BaseCrudController;

/**
 * Danica个人社区
 * @author Danica
 * Date 2016.5.9
 */
@Controller
@RequestMapping({"/community/signin"})
public class SigninController extends BaseCrudController<MemberDto>{
	@Resource
	private MemberService memberService;
	
	@Override
	protected CrudInfo init() {
		return new CrudInfo(memberService);
	}
	
	//每日签到
	@RequestMapping(value="")
	public void signIn(){
		System.out.println("community/signin.jsp");
	}
}

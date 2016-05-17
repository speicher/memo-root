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
@RequestMapping({"/community/works"})
public class MyworkController extends BaseCrudController<MemberDto>{
	@Resource
	private MemberService memberService;
	
	@Override
	protected CrudInfo init() {
		return new CrudInfo(memberService);
	}
	
	//作品界面
	@RequestMapping(value="/index")
	public void welcomeMyWork(){
		System.out.println("-------- community/works/index.jsp --------");
	}
	
	//发帖界面
	@RequestMapping(value="/editor")
	public void pageEditor(){
		System.out.println("-------- community/works/editor.jsp --------");
	}
	
	//单个作品界面
	@RequestMapping(value="/content_s")
	public void contentSearch(){
		System.out.println("-------- community/works/content_s.jsp --------");
	}
}

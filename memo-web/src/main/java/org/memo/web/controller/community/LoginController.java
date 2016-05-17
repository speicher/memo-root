package org.memo.web.controller.community;

import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.FatalBeanException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.memo.core.exception.ManagerException;
import org.memo.core.exception.ServiceException;
import org.memo.po.AccesslogDto;
import org.memo.po.MemberDto;
import org.memo.po.SessionUser;
import org.memo.service.AccesslogService;
import org.memo.service.MemberService;
import org.memo.web.controller.BaseCrudController;
import org.memo.web.utils.CommonUtils;
import org.memo.web.utils.CommunityConstant;

/**
 * Danica个人社区
 * @author Danica
 * Date 2016.5.9
 */
@Controller
@RequestMapping({"/community"})
public class LoginController extends BaseCrudController<MemberDto>{
	@Resource
	private MemberService memberService;
	
	@Resource
	private AccesslogService accesslogService;
	
	
	@Override
	protected CrudInfo init() {
		return new CrudInfo(memberService);
	}
	
	//首页
	@RequestMapping(value="", method=RequestMethod.GET)
	public String welcomeCommunity(){
		System.out.println("-------- community/main.jsp --------");
		return "community/main";
	}
	
	//登录界面
	@RequestMapping(value="/login")
	public void login(){
		System.out.println("-------- community/login.jsp --------");
	}

	//注册界面
	@RequestMapping(value="/register")
	public void register(HttpServletRequest request){
		System.out.println("-------- community/register.jsp --------");
	}
	
	//注册
	@RequestMapping(value="/member_reg")
	@ResponseBody
	public Map<String, Object> registerNewInfo(HttpServletRequest req, MemberDto model, HttpSession session) throws ManagerException{
		Map<String, Object> result = new HashMap<String, Object>();
		String flag = CommunityConstant.FLAG_0;
		Date time = new Date();
		try {
			model.setMemberName(model.getMemberId());
			model.setRegisterDate(time);
			model.setCreateTime(time);
			model.setCreateUser(model.getMemberId());
			model.setUpdateTime(time);
			model.setUpdateUser(model.getMemberId());
			model.setRemark(CommunityConstant.REG_REMARK);
			memberService.add(model);
			
			//注册成功，存session，跳转至首页
			setUserInfoIntoSession(model, session);
			//插入访问记录
			this.controlAccesslog(model);
			
			flag = CommunityConstant.FLAG_1;
		} catch (ServiceException e) {
			throw new ManagerException(e);
		}
		result.put("flag", flag);
		result.put("model", model);
		return result;
	}
	
	//登录
	@RequestMapping(value="/member_login")
	@ResponseBody
	public ResponseEntity<String> login(HttpServletRequest req, Model model, HttpSession session) throws ManagerException, BeansException {
		String flag = CommunityConstant.FLAG_0;
		
		Map<String, Object> params = CommonUtils.builderParams(req, model);
		Assert.notEmpty(params);
		Assert.notNull(params.get(CommunityConstant.USR_EMAIL), "用户名不能为空");
		Assert.notNull(params.get(CommunityConstant.USR_PWD), "密码不能为空");
		
		if(params.get(CommunityConstant.USR_EMAIL).toString().indexOf("@") == -1){
			params.put(CommunityConstant.USR_ID, params.get(CommunityConstant.USR_EMAIL).toString());
			params.remove(CommunityConstant.USR_EMAIL);
		}
		try {
			MemberDto member = memberService.findByUniqueParam(params);
			if(null == member){
				//登录的用户不存在
				flag = CommunityConstant.FLAG_0;
			} else{
				//登录成功，存session，跳转至首页
				setUserInfoIntoSession(member, session);
				//插入或更新访问记录
				this.controlAccesslog(member);
				
				flag = CommunityConstant.FLAG_1;
				
				System.out.println("------------------------------ LOG IN ---------------------------------");
			}
			
		} catch (ServiceException e) {
			throw new ManagerException(e);
		} catch (Throwable ex) {
			throw new FatalBeanException("Could not invoke SessionUser", ex);
		} 
		return new ResponseEntity<String>(flag, HttpStatus.OK);
	}

	public void setUserInfoIntoSession(MemberDto member, HttpSession session){
		SessionUser usr = new SessionUser();
		BeanUtils.copyProperties(member, usr);
		Assert.notNull(usr, "SessionUser must not be null");
		PropertyDescriptor[] sourcePds = BeanUtils.getPropertyDescriptors(usr.getClass());
		for (PropertyDescriptor sourcePd : sourcePds) {
			Method readMethod = sourcePd.getReadMethod();
			if(null != readMethod){
				try {
					Object value = readMethod.invoke(usr);
					if(null != value){
						session.setAttribute(sourcePd.getName(), value);
					}
				} catch (Throwable ex) {
					throw new FatalBeanException("Could not invoke SessionUser", ex);
				} 
			}
		}
		session.setAttribute("loginok", "true");
	}
	
	//插入访问记录
	private void controlAccesslog(MemberDto member){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		
		AccesslogDto accesslog = accesslogService.findByMemberId(member.getMemberId());
		
		try {
			if(null == accesslog){
				accesslog = new AccesslogDto();
				accesslog.setMemberId(member.getMemberId());
				accesslog.setAccessTime(now);
				accesslog.setLogoutTime(null);
				accesslog.setCreateTime(now);
				accesslog.setUpdateTime(now);
				accesslogService.add(accesslog);
				
			} else{
				if(sdf.format(now).equals(sdf.format(accesslog.getUpdateTime()))){
					accesslog.setAccessTime(now);
					accesslog.setUpdateTime(now);
					accesslog.setLogoutTime(null);
					accesslog.setCreateTime(null);
					accesslog.setMemberId(null);
					accesslogService.modifyById(accesslog);
				}
			}
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}
	
	//退出
	@RequestMapping(value="/logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String logoutUrl = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/community"; 
		HttpSession session = request.getSession();
		if(null != session.getAttribute("loginok"))
			session.removeAttribute("loginok");
		SessionUser usr = new SessionUser();
		PropertyDescriptor[] sourcePds = BeanUtils.getPropertyDescriptors(usr.getClass());
		for (PropertyDescriptor sourcePd : sourcePds) {
			try {
				if(null != session.getAttribute(sourcePd.getName())){
					session.removeAttribute(sourcePd.getName());
				}
			} catch (Throwable ex) {
				throw new FatalBeanException("Could not invoke SessionUser", ex);
			}
		}
		System.out.println("------------------------------ LOG OUT ---------------------------------");
		response.getOutputStream().println("<html>");  
		response.getOutputStream().println("<script>");  
		response.getOutputStream().println("window.open ('" +logoutUrl+ "','_top')");
		response.getOutputStream().println("</script>");  
		response.getOutputStream().println("</html>");
	}
}

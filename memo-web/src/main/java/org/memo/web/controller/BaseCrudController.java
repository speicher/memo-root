package org.memo.web.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.memo.core.common.CustomDateEditorBase;
import org.memo.core.exception.ServiceException;
import org.memo.service.BaseCrudService;
import org.memo.utils.SimplePage;

public abstract class BaseCrudController<ModelType> {
	private BaseCrudService service;
	private BaseCrudController<ModelType>.CrudInfo crudInfo;
	
	@PostConstruct
	protected void initConfig() {
		this.crudInfo = init();
		this.service = this.crudInfo.getService();
	}
	
	protected abstract BaseCrudController<ModelType>.CrudInfo init();
	
	//在SpringMVC中，bean中定义了Date，double等类型，如果没有做任何处理的话，日期以及double都无法绑定。
		//使用spring mvc提供的@InitBinder标签可解决上述问题
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditorBase(dateFormat, false));
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping({ "/list.json" })
	@ResponseBody
	public Map<String, Object> queryList(HttpServletRequest req, Model model) throws ServiceException {
		int pageNo = StringUtils.isEmpty(req.getParameter("page")) ? 1
				: Integer.parseInt(req.getParameter("page"));
		int pageSize = StringUtils.isEmpty(req.getParameter("rows")) ? 10
				: Integer.parseInt(req.getParameter("rows"));
		String sortColumn = StringUtils.isEmpty(req.getParameter("sort")) ? ""
				: String.valueOf(req.getParameter("sort"));

		String sortOrder = StringUtils.isEmpty(req.getParameter("order")) ? ""
				: String.valueOf(req.getParameter("order"));

		Map params = builderParams(req, model);
		int total = service.findCount(params);
		SimplePage page = new SimplePage(pageNo, pageSize, total);
		List list = service.findByPage(page, sortColumn, sortOrder, params);
		Map obj = new HashMap();
		obj.put("total", Integer.valueOf(total));
		obj.put("rows", list);
		return obj;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Map<String, Object> builderParams(HttpServletRequest req, Model model) {
		Map retParams = new HashMap(req.getParameterMap().size());
		Map<String, Object> params = req.getParameterMap();
		SimpleDateFormat sdf;
		if ((null != params) && (params.size() > 0)) {
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			for (Map.Entry p : params.entrySet()) {
				if ((null != p.getValue())
						&& (!StringUtils.isEmpty(((String[]) p.getValue()).toString()))) {
					String[] values = (String[]) p.getValue();
					String match = "^((((1[6-9]|[2-9]\\d)\\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\\d|3[01]))|(((1[6-9]|[2-9]\\d)\\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\\d|30))|(((1[6-9]|[2-9]\\d)\\d{2})-0?2-(0?[1-9]|1\\d|2[0-8]))|(((1[6-9]|[2-9]\\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-)) (20|21|22|23|[0-1]?\\d):[0-5]?\\d:[0-5]?\\d$";
					if (values[0].matches(match))
						try {
							retParams.put(p.getKey(), sdf.parse(values[0]));
						} catch (ParseException e) {
							retParams.put(p.getKey(), values);
							e.printStackTrace();
						}
					else if ((((String) p.getKey()).equals("queryCondition"))
							&& (model.asMap().containsKey("queryCondition")))
						retParams.put(p.getKey(),
								model.asMap().get("queryCondition"));
					else
						retParams.put(p.getKey(), values[0]);
				}
			}
		}
		return retParams;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping({ "/get_count.json" })
	public ResponseEntity<Integer> getCount(HttpServletRequest req, Model model) throws ServiceException {
		Map params = builderParams(req, model);
		int total = service.findCount(params);
		return new ResponseEntity(Integer.valueOf(total), HttpStatus.OK);
	}
	
//	@RequestMapping({ "/list" })
//	@InitpowerInterceptors
//	public String list() {
//		return this.crudInfo.ftlFolder + "list";
//	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping({ "/get" })
	public ResponseEntity<ModelType> get(ModelType modelType) throws ServiceException {
		Object type = service.findById(modelType);
		return new ResponseEntity(type, HttpStatus.OK);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping({ "/biz" })
	@ResponseBody
	public List<ModelType> getBiz(ModelType modelType, HttpServletRequest req, Model model) throws ServiceException {
		Map params = builderParams(req, model);
		return service.findByBiz(modelType, params);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping({ "/post" })
	public ResponseEntity<ModelType> add(ModelType type) throws ServiceException {
		service.add(type);
		return new ResponseEntity(type, HttpStatus.OK);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping({ "/put" })
	public ResponseEntity<ModelType> moditfy(ModelType type) throws ServiceException {
		service.modifyById(type);
		return new ResponseEntity(type, HttpStatus.OK);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping({ "/delete" })
	public ResponseEntity<Map<String, Boolean>> remove(ModelType type) throws ServiceException {
		service.deleteById(type);
		Map flag = new HashMap();
		flag.put("success", Boolean.valueOf(true));
		return new ResponseEntity(flag, HttpStatus.OK);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked", "unused" })
	private List<ModelType> convertListWithTypeReference(ObjectMapper mapper,
			List<Map> list) throws JsonParseException, JsonMappingException,
			JsonGenerationException, IOException {
		Class entityClass = (Class) ((java.lang.reflect.ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];

		List tl = new ArrayList(list.size());
		for (int i = 0; i < list.size(); i++) {
			Object type = mapper.readValue(mapper.writeValueAsString(list.get(i)), entityClass);
			tl.add(type);
		}
		return tl;
	}

	public class CrudInfo {
//		private String ftlFolder;
		private BaseCrudService service;

		public CrudInfo(BaseCrudService service) {
			this.service = service;
		}
		
//		public CrudInfo(String ftlFolder, BaseCrudService manager) {
//			this.ftlFolder = ftlFolder;
//			this.manager = manager;
//		}
//
//		public String getFtlFolder() {
//			return this.ftlFolder;
//		}
//
//		public void setFtlFolder(String ftlFolder) {
//			this.ftlFolder = ftlFolder;
//		}

		public BaseCrudService getService() {
			return this.service;
		}

		public void setService(BaseCrudService service) {
			this.service = service;
		}
	}
}

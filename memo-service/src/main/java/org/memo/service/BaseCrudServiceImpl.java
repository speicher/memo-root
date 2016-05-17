package org.memo.service;

import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.memo.core.exception.ServiceException;
import org.memo.dao.BaseCrudDao;
import org.memo.utils.SimplePage;

public abstract class BaseCrudServiceImpl implements BaseCrudService {

	private BaseCrudDao mapper;

	@PostConstruct
	private void initConfig() {
		this.mapper = init();
	}

	public abstract BaseCrudDao init();

	public <ModelType> int deleteById(ModelType modelType) throws ServiceException {
		try {
			return this.mapper.deleteByPrimarayKeyForModel(modelType);
		} catch (Exception e) {
			throw new ServiceException(new StringBuilder()
					.append("Problem invoking method, Cause:")
					.append(e.getMessage()).toString(), e);
		}
	}

	public <ModelType> int add(ModelType modelType) throws ServiceException {
		try {
			return this.mapper.insertSelective(modelType);
		} catch (Exception e) {
			throw new ServiceException(new StringBuilder()
					.append("Problem invoking method, Cause:")
					.append(e.getMessage()).toString(), e);
		}
	}

	public <ModelType> ModelType findById(ModelType modelType) throws ServiceException {
		try {
			return this.mapper.selectByPrimaryKey(modelType);
		} catch (Exception e) {
			throw new ServiceException(new StringBuilder()
					.append("Problem invoking method, Cause:")
					.append(e.getMessage()).toString(), e);
		}
	}

	public <ModelType> List<ModelType> findByBiz(ModelType modelType, Map<String, Object> params) throws ServiceException {
		try {
			return this.mapper.selectByParams(modelType, params);
		} catch (Exception e) {
			throw new ServiceException(new StringBuilder()
					.append("Problem invoking method, Cause:")
					.append(e.getMessage()).toString(), e);
		}
	}

	public <ModelType> int modifyById(ModelType modelType) throws ServiceException {
		try {
			return this.mapper.updateByPrimaryKeySelective(modelType);
		} catch (Exception e) {
			throw new ServiceException(new StringBuilder()
					.append("Problem invoking method, Cause:")
					.append(e.getMessage()).toString(), e);
		}
	}

	public int findCount(Map<String, Object> params) throws ServiceException {
		try {
			return this.mapper.selectCount(params);
		} catch (Exception e) {
			throw new ServiceException("", e);
		}
	}

	public <ModelType> List<ModelType> findByPage(SimplePage page,
			String orderByField, String orderBy, Map<String, Object> params) throws ServiceException {
		return this.mapper.selectByPage(page, orderByField, orderBy, params);
	}

}

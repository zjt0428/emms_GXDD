package com.knight.app.service;

import com.knight.app.model.Attendamce;
import com.knight.app.model.TFlowNode;
import com.knight.core.service.ExportService;
import com.knight.system.service.BusinessLongPKService;
/**
 * @ClassName: AttendamceService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 
 * @date
 */
public interface TFlowNodeService extends BusinessLongPKService<TFlowNode>, ExportService {
	public void saveOrUpdate(TFlowNode tflowNode);

}

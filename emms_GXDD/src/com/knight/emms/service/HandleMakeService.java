/**
 *====================================================
 * 文件名称: HandleMakeService.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2017年11月03日		陈光毅(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.service;

import com.knight.core.service.ExportService;
import com.knight.emms.core.service.BusinessFlowService;
import com.knight.emms.model.HandleMake;

/**
 * @ClassName: HandleMakeService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 陈光毅
 * @date 2017年11月03日
 */
public interface HandleMakeService extends BusinessFlowService<HandleMake>, ExportService {

	public void delMake(Long productId);
	
	public void delConsume(Long consumeId);
}
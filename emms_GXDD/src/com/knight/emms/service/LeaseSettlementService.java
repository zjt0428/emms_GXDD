/**
 *====================================================
 * 文件名称: LeaseSettlementService.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2017年8月30日		陈光毅(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.service;

import com.knight.core.service.ExportService;
import com.knight.emms.core.service.BusinessFlowService;
import com.knight.emms.model.LeaseSettlement;

/**
 * @ClassName: LeaseSettlementService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author 陈光毅
 * @date 2017年8月30日
 */
public interface LeaseSettlementService extends BusinessFlowService<LeaseSettlement>, ExportService {

	public void delList(Long listId);
}

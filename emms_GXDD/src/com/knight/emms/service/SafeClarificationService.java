/**
 *====================================================
 * 文件名称: ReceivementService.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2013-7-7			chenxy(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.service;

import com.knight.core.service.ExportService;
import com.knight.emms.model.SafeClarification;
import com.knight.system.service.BusinessLongPKService;

/**
 * @ClassName: SafeClarificationService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author chenxy
 * @date 2013-7-7 下午11:14:51
 */
public interface SafeClarificationService extends BusinessLongPKService<SafeClarification> , ExportService{

	public SafeClarification getTranslateFull(Long clarificaId);
	
	public void saveOrMergeFor(SafeClarification t);
}

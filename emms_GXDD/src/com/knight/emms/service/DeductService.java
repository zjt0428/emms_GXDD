/**
 *====================================================
 * 文件名称: DeductService.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2013-7-17			chenxy(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.service;

import com.knight.emms.core.service.BusinessFlowService;
import com.knight.emms.model.Deduct;

/**
 * @ClassName: DeductService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author chenxy
 * @date 2013-7-17 下午4:23:10
 */
public interface DeductService extends BusinessFlowService<Deduct> {

	public Deduct getTranslateFull(Long deductId);

	public void deletedPracti(Long deductPractiId);

}

/**
 *====================================================
 * 文件名称: AnnounceService.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2013-7-25			chenxy(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.service;

import com.knight.emms.model.Announce;
import com.knight.system.service.BusinessLongPKService;

/**
 * @ClassName: AnnounceService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author chenxy
 * @date 2013-7-25 下午4:43:52
 */
public interface AnnounceService extends BusinessLongPKService<Announce> {

	public Announce getTranslateFull(Long announceId);

	public void saveOrMergeEdit(Announce announce);
	
	public void saveOrMergeEditApp(Announce announce);

	public void deletedCategory(Long announceCategoryId);

	public void publish(Long announceId);

}

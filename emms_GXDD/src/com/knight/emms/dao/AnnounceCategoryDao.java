/**
 *====================================================
 * 文件名称: AnnounceCategoryDao.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2013-7-25			chenxy(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.dao;

import java.util.Set;

import com.knight.core.dao.BaseLongPKDao;
import com.knight.emms.model.AnnounceCategory;

/**
 * @ClassName: AnnounceCategoryDao
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author chenxy
 * @date 2013-7-25 下午4:42:22
 */
public interface AnnounceCategoryDao extends BaseLongPKDao<AnnounceCategory> {

	public void saveOrUpdate(Set<AnnounceCategory> announceCategorySet);

}
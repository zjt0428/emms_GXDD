/**
 *====================================================
 * 文件名称: InstallManageServiceImpl.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2014-10-26			chenxy(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.service.impl;

import com.knight.emms.dao.InstallManageDao;
import com.knight.emms.model.InstallManage;
import com.knight.emms.service.InstallManageService;
import com.knight.system.service.impl.BusinessLongPKServiceImpl;

/**
 * @ClassName: InstallManageServiceImpl
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author chenxy
 * @date 2014-10-26 下午4:22:19
 */
public class InstallManageServiceImpl extends BusinessLongPKServiceImpl<InstallManage> implements InstallManageService {

	public InstallManageServiceImpl(InstallManageDao dao) {
		super(dao);
	}

}

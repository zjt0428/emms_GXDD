/**
 *====================================================
 * 文件名称: MoneyBackDao.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2013-7-16			chenxy(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.dao;

import java.math.BigDecimal;

import com.knight.emms.core.dao.BaseBusinessModelDao;
import com.knight.emms.model.MoneyBack;

/**
 * @ClassName: MoneyBackDao
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author chenxy
 * @date 2013-7-16 下午5:36:22
 */
public interface MoneyBackDao extends BaseBusinessModelDao<MoneyBack> {

	public BigDecimal queryArrearsAmount(MoneyBack moneyBack);

}

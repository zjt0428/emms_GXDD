/**
 *====================================================
 * 文件名称: MoneyLendDaoImpl.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2013-7-16			chenxy(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.dao.impl;

import java.math.BigDecimal;

import com.knight.emms.constant.Constant;
import com.knight.emms.constant.EmmsConstant;
import com.knight.emms.constant.Status;
import com.knight.emms.core.dao.BaseBusinessModelDaoImpl;
import com.knight.emms.dao.MoneyLendDao;
import com.knight.emms.model.MoneyLend;

/**
 * @ClassName: MoneyLendDaoImpl
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author chenxy
 * @date 2013-7-16 下午5:37:42
 */
public class MoneyLendDaoImpl extends BaseBusinessModelDaoImpl<MoneyLend> implements MoneyLendDao {

	public BigDecimal queryArrearsAmount(MoneyLend moneyLend) {
		String sql = "SELECT SUM(LEND_AMOUNT) FROM T_MONEY_LEND WHERE PRACTI_ID = ? AND DEL_FLAG = ? AND APPLYFOR_STATE = ?";
		BigDecimal lendAmount = this.jdbcTemplate.queryForObject(sql, BigDecimal.class, moneyLend.getPractiId(), Constant.ENABLED, Status.Applyfor.passed);
		if (lendAmount == null) {
			lendAmount = EmmsConstant.ZERO;
		}
		sql = "SELECT SUM(BACK_AMOUNT) FROM T_MONEY_BACK WHERE PRACTI_ID = ? AND DEL_FLAG = ? AND APPLYFOR_STATE = ?";
		BigDecimal backAmount = this.jdbcTemplate.queryForObject(sql, BigDecimal.class, moneyLend.getPractiId(), Constant.ENABLED, Status.Applyfor.passed);
		if (backAmount == null) {
			backAmount = EmmsConstant.ZERO;
		}
		return lendAmount.subtract(backAmount);
	}

}

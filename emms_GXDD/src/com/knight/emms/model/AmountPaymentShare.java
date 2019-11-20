/**
 *====================================================
 * 文件名称: AmountPaymentShare.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2013-7-18			chenxy(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.model;

import java.math.BigDecimal;

import lombok.Data;
import lombok.ToString;

import com.google.gson.annotations.Expose;
import com.knight.core.model.BaseModel;
import com.knight.core.table.CodeFieldDeclare;
import com.knight.core.table.PersistantDeclare;

/**
 * @ClassName: AmountPaymentShare
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author chenxy
 * @date 2013-7-18 下午2:32:07
 */
@Data
@ToString(callSuper = false, doNotUseGetters = true)
@PersistantDeclare
public class AmountPaymentShare extends BaseModel {

	protected static final long serialVersionUID = 1L;

	@Expose
	private Long paymentShareId;

	@Expose
	private Long amountPaymentId;

	@Expose
	private Long instalmentId;

	@Expose
	private Long relateId;

	@Expose
	private String relateSerial;

	@Expose
	@CodeFieldDeclare(codeId = "RELATE_MODULE", valueField = "relateModuleName")
	private String relateModule;

	@Expose
	private String relateModuleName;

	@Expose
	private Short periods;

	@Expose
	private BigDecimal payment;

	@Expose
	private String payDate;

	@Expose
	private BigDecimal alreadyPayment;

	@Expose
	private String remark;

	@Expose
	private BigDecimal presentPayment;

}

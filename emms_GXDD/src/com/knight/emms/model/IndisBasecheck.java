/**
 *====================================================
 * 文件名称: IndisBasecheck.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2014-4-20			chenxy(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.model;

import java.util.HashSet;
import java.util.Set;

import lombok.Data;
import lombok.ToString;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.Since;
import com.google.gson.reflect.TypeToken;
import com.knight.core.table.PersistantDeclare;
import com.knight.core.util.GsonUtil;
import com.knight.emms.core.BusinessModel;
import com.knight.emms.core.model.SerialNumberStrategy;
import com.knight.system.constant.SystemConstant;

/**
 * @ClassName: IndisBasecheck
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author chenxy
 * @date 2014-4-20 上午7:41:19
 */
@Data
@ToString(callSuper = false, doNotUseGetters = true)
@PersistantDeclare
@SerialNumberStrategy(name = "basecheckSerial", strategy = "YS{yyyyMMdd}", maxseq = 99)
public class IndisBasecheck extends BusinessModel {

	private static final long serialVersionUID = 1L;

	@Expose
	private Long basecheckId;

	@Expose
	private String basecheckSerial;

	@Expose
	private String providedDate;

	private Long emEnt;

	private String emEntModule;

	@Expose
	private String emEntName;

	private Long inEnt;

	private String inEntModule;

	@Expose
	private String inEntName;

	private String buildingNum;

	private String managerProject;

	private String managerPhone;

	private String remark;

	private String relateModule;

	@Expose
	private Project project;

	private ContractLease contractLease;

	@Expose
	private Equipment equipment;

	@Expose(deserialize = false, serialize = false)
	@Since(value = 2.0)
	private Set<VerifyStandard> verifyStandardSet = new HashSet<VerifyStandard>(0);

	private String verifyStandards = "";

	public void setModelSerial(String serial) {
		this.basecheckSerial = serial;
	}

	// ==========================================================================================//
	public void setSubIndisBasecheck() {
		Set<VerifyStandard> verifyStandardSet = GsonUtil.fromJson(this.verifyStandards, new TypeToken<Set<VerifyStandard>>() {});
		if (verifyStandardSet != null) {
			for (VerifyStandard s : verifyStandardSet) {
				s.setRelateId(this.basecheckId);
				s.setRelateModule(SystemConstant.MODULE_INDIS_BASECHECK);
			}
			this.setVerifyStandardSet(verifyStandardSet);
		}
	}

}

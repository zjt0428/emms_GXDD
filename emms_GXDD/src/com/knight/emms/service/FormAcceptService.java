/**
 *====================================================
 * 文件名称: FormAcceptService.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2012-11-7			chenxy(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.service;

import com.knight.emms.model.FormAccept;
import com.knight.system.service.BusinessLongPKService;

;

/**
 * @ClassName: FormAcceptService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author chenxy
 * @date 2012-11-7 上午8:08:48
 */
public interface FormAcceptService extends BusinessLongPKService<FormAccept> {

	public void parserAccept(FormAccept formAccept);

}

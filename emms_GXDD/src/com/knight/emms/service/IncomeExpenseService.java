/**
 *====================================================
 * 文件名称: IncomeExpenseService.java
 * 修订记录：
 * No    日期				作者(操作:具体内容)
 * 1.    2013-8-1			chenxy(创建:创建文件)
 *====================================================
 * 类描述：(说明未实现或其它不应生成javadoc的内容)
 */
package com.knight.emms.service;

import java.util.List;
import java.util.Map;

import com.knight.core.filter.QueryFilter;
import com.knight.core.service.ExportService;

/**
 * @ClassName: IncomeExpenseService
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @author chenxy
 * @date 2013-8-1 下午11:00:13
 */
public interface IncomeExpenseService extends ExportService {

	List<Map<String, Object>> getAll(QueryFilter filter);

}
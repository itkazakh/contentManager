package cn.com.expense.eps.report.service.facade;

import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
/**
 * 声明报表操作方法的接口类
 * @author Administrator
 *
 */
public interface ReportService {
	/**
	 * 调用IReport生成的模版文件来生成指定类型的报表文件
	 * @param templetPath  模版文件的路径
	 * @param params	   要传递给模版文件的参数组成的Map类型对象
	 * @param reportPrintDtoList  要传递给模版文件的数据源集合
	 * @param contentType  指定要生成的报表文件类型
	 * @param response     用于输出报表文件的响应对象
	 * @param sheetName	   指定的生成的excel的表名
	 * @throws Exception
	 */
	public void generateReport(String templetPath,Map params,Collection reportPrintDtoList,String contentType,
			HttpServletResponse response,String sheetName) throws Exception;
}

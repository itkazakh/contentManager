package cn.com.expense.eps.report.service.spring;

import java.io.ByteArrayOutputStream;
import java.util.Collection;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.base.JRBaseReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRPdfExporterParameter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.util.JRLoader;

import ins.framework.dao.GenericDaoHibernate;
import cn.com.expense.eps.report.service.facade.ReportService;

public class ReportServiceSpringImpl extends GenericDaoHibernate implements ReportService {
	
	/**
	 * 调用IReport生成的模版文件来生成指定类型的报表文件
	 * @param templetPath  模版文件的路径
	 * @param params	   要传递给模版文件的参数组成的Map类型对象
	 * @param reportPrintDtoList  要传递给模版文件的数据源集合
	 * @param contentType  指定要生成的报表文件类型
	 * @param response     用于输出报表文件的响应对象
	 * @param sheetName	   指定的生成的excel的表名，如不是excel类型则不需要设置
	 * @throws Exception
	 */
	public void generateReport(String templetPath, Map params, Collection reportPrintDtoList, String contentType, HttpServletResponse response,String sheetName) throws Exception {
		try {
			/*Ireport默认导出的是excel格式*/
			String exportType="application/vnd.ms-excel";
			/*加载模版文件*/
			JasperReport jasperReport = (JasperReport)JRLoader.loadObject(templetPath);
			/*用于装载输出内容的输出流*/
	        ByteArrayOutputStream oSream = new ByteArrayOutputStream ();
	        /*用于输出报表文件的输出流*/
	        ServletOutputStream ouputStream = response.getOutputStream(); 
	        /*构造JavaBean数据源*/
	        JRDataSource jrDataSource = new JRBeanCollectionDataSource(reportPrintDtoList);
	        
	        /*设置要输出的报表文件的类型以及进行一些相应的设置*/
			if(contentType.equals("html")){
				/*输出html文件*/
				exportType="text/html;charset=GBK";
				JRHtmlExporter	exporterTarget = new JRHtmlExporter();
				/*用构造好的数据源填充模版*/
		        JasperPrint rptPnt = JasperFillManager.fillReport(jasperReport,params,jrDataSource);
				
				exporterTarget.setParameter(JRHtmlExporterParameter.CHARACTER_ENCODING,"GBK");       
				exporterTarget.setParameter(JRHtmlExporterParameter.JASPER_PRINT, rptPnt);
				exporterTarget.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN,Boolean.FALSE);
				exporterTarget.setParameter(JRHtmlExporterParameter.OUTPUT_STREAM, oSream);
				
				/*将数据填入模版文件中*/
				exporterTarget.exportReport();
			}else if(contentType.equals("pdf")){
				/*输出pdf文件*/
				exportType="application/pdf";
				JRPdfExporter	exporterTarget = new JRPdfExporter();
				 /*用构造好的数据源填充模版*/
		        JasperPrint rptPnt = JasperFillManager.fillReport(jasperReport,params,jrDataSource);
				
				exporterTarget.setParameter(JRPdfExporterParameter.JASPER_PRINT,rptPnt);
				exporterTarget.setParameter(JRPdfExporterParameter.OUTPUT_STREAM,oSream);
				
				/*将数据填入模版文件中*/
				exporterTarget.exportReport();
			}else if(contentType.equals("excel")){ 
				JRXlsExporter	exporterTarget = new JRXlsExporter();
				
				/*左边距的设置*/
				java.lang.reflect.Field margin = JRBaseReport.class.getDeclaredField("leftMargin");
				margin.setAccessible(true);
				margin.setInt(jasperReport,0);
				
				/*右边距的设置*/
				margin = JRBaseReport.class.getDeclaredField("rightMargin");
				margin.setAccessible(true);
				margin.setInt(jasperReport,0);
				
				/*上边距的设置*/
				margin = JRBaseReport.class.getDeclaredField("topMargin");
		        margin.setAccessible(true);  
		        margin.setInt(jasperReport,0);
		        
		        /*下边距的设置*/
		        margin = JRBaseReport.class.getDeclaredField("bottomMargin"); 
		        margin.setAccessible(true);
		        margin.setInt(jasperReport,0);
		        /*边距的设置结束*/
		        
		        /*不将组表头打印出来的设置*/
		        if (null != jasperReport.getGroups())
		        {
		            for (int i = 0; i < jasperReport.getGroups().length; i++)
		            {
		            	jasperReport.getGroups()[i].setReprintHeaderOnEachPage(false);
		            }
		        }
		        
		        /*页面的高度的设置*/
		        java.lang.reflect.Field pageHeight;
		        pageHeight = JRBaseReport.class.getDeclaredField("pageHeight");
		        pageHeight.setAccessible(true);
		        /*将一页的高度设为最大值，就不会出现分页的情况*/
		        pageHeight.setInt(jasperReport,Integer.MAX_VALUE);
				
		        /*用构造好的数据源填充模版*/
		        JasperPrint rptPnt = JasperFillManager.fillReport(jasperReport,params,jrDataSource);
		        
				exporterTarget.setParameter(JRXlsExporterParameter.CHARACTER_ENCODING, "GBK");
		        /*删除记录最下面的多出的空行（TRUE表示删除）*/
				exporterTarget.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE);
		        /*删除多余的ColumnHeader（FALSE表示删除）*/
				exporterTarget.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,Boolean.FALSE);
				exporterTarget.setParameter(JRXlsExporterParameter.SHEET_NAMES, new String[]{sheetName});
		        /*边框的设置（FALSE表示显示边框）*/
				exporterTarget.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.FALSE);		
				
				exporterTarget.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE,Boolean.TRUE);
				exporterTarget.setParameter(JRXlsExporterParameter.JASPER_PRINT,rptPnt);
				exporterTarget.setParameter(JRXlsExporterParameter.OUTPUT_STREAM,oSream);
				
				/*将数据填入模版文件中*/
				exporterTarget.exportReport();
			}        
	        
			/*用输出流将填充好数据的指定类型的文件输出*/
	        byte[] bytes = oSream.toByteArray();
	        response.reset();
	        response.setContentType(exportType);
	        response.setContentLength(bytes.length);  
	        ouputStream.write(bytes,0,bytes.length); 
	        ouputStream.flush(); 
	        ouputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}



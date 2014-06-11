package cn.com.hy369.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.com.hy369.servlet.service.facade.InterfaceService;
import cn.com.hy369.servlet.service.spring.InterfaceServiceSpringImpl;

@SuppressWarnings("serial")
public class InterfaceServlet extends HttpServlet{
	public InterfaceServlet() {
	}
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext servletContext = request.getSession().getServletContext();
		WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
		InterfaceService interfaceService = (InterfaceService)context.getBean("interfaceService");
		String Condition = null;
		BufferedReader reader = null;
		String strMessage = "";
		StringBuffer buffer = new StringBuffer();
		OutputStreamWriter writer = null;
		try{
			reader = new BufferedReader(new InputStreamReader(request.getInputStream(),Charset.forName("utf-8")));
			while ((strMessage = reader.readLine()) != null) {
                buffer.append(strMessage);
            }
			// 读取查询条件字符串
			Condition = buffer.toString();
			// 返回查询结果
			System.out.println("传过来的信息" + Condition);
			// 根据穿过来的信息进行解析。
			String XMLconent = "";
				
			Document document = DocumentHelper.parseText(Condition); 
			// 获取返回的信息，并转化为能够传输的字符串
			Document documentResponse = interfaceService.findAccMessage(document);
			XMLconent =  documentResponse.asXML();
			System.out.print(XMLconent);
			writer = new OutputStreamWriter(response.getOutputStream());
            writer.write(XMLconent);
            writer.flush();
            writer.close();
			
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			if (reader!=null)
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}
	
	
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
}

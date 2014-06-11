package cn.com.sinosoft.filter;

import ins.framework.common.ServiceFactory;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sinosoft.platform.ipservice.IpSelectAction;

import cn.com.sinosoft.saa.model.SaaUser;
import cn.com.sinosoft.saa.service.facade.SaaUserService;
public class SessionFilter implements Filter{

    public void init(FilterConfig filterconfig)
    	throws ServletException{
    }

    public void destroy(){
    }	
	
	public void doFilter(ServletRequest request, ServletResponse response,FilterChain chain) 
		throws IOException, ServletException {
		initSession( (HttpServletRequest)request,(HttpServletResponse)response );
		chain.doFilter(request, response);
	}
	
	
	private void initSession(HttpServletRequest request,HttpServletResponse response){
		HttpSession session =  request.getSession();
//			String powerType = IpSelectAction.getNetType(request);
//			if (!"0".equals(powerType)) {
//				session.setAttribute("PowerType", 2);
//			}else{
				session.setAttribute("PowerType", 1);
//			}
			try {
				if(session.getAttribute("UserCode").toString()==null||session.getAttribute("UserCode").toString().equals(""))
				{
					if(request.getParameter("UserCode")!=null&&!request.getParameter("UserCode").equals("")){
						
					}else{
						session.setAttribute("UserCode", "nomole");
						session.setAttribute("ComCode", "nomole");
						response.sendRedirect("/content");
					}
					
				}else if(!session.getAttribute("UserCode").equals("nomole")){
					String userCode=session.getAttribute("UserCode").toString();
					SaaUserService saaUserService=(SaaUserService)ServiceFactory.getService("saaUserService");
					SaaUser saaUser=saaUserService.findSaaUserByUserCode(userCode);
//					userService.checkLoginTime(userCode,request.getRemoteHost());
					session.setAttribute("UserCode",userCode);
					session.setAttribute("UserName",saaUser.getUserName());
				}else{
					response.sendRedirect("/content");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				if(request.getParameter("UserCode")!=null&&!request.getParameter("UserCode").equals("")){
					
				}else{
					session.setAttribute("UserCode", "nomole");
					session.setAttribute("ComCode", "nomole");
					try {
						response.sendRedirect("/content");
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
			}
		}
	}


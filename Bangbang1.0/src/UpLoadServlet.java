

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.opensymphony.xwork2.ActionContext;

/**
 * Servlet implementation class UpLoadServlet
 */
@WebServlet("/UpLoadServlet")
@MultipartConfig
public class UpLoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpLoadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		HttpSession session = request.getSession();
		Part filePart = request.getPart("filelist");
		String header = filePart.getHeader("Content-Disposition");
	    String fileName = header.substring(header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
		
	    
	    String username =(String) session.getAttribute("username");
	     
	    if(username == null){
	    	System.out.println("上传出错，用户名为空");
	    	response.getWriter().write("error");
	    }else{
	   
		    String path = request.getSession().getServletContext().getRealPath("/")+"\\index\\user\\"+username+"\\upload\\";
		    File targetFile = new File(path);
		    if(!targetFile.exists()){
		    	targetFile.mkdirs();
		    }
		    System.out.println("上传图片路径是："+path);
			filePart.write(path+fileName);
		    response.getWriter().write(username);
	    }
	}

}

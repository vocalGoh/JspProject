package member;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemberDAO;
import member.dto.MemberDTO;
import my.dto.MyMemberDTO;

@WebServlet("/member_servlet/*")
public class MemberController extends HttpServlet { private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {

      String uri = request.getRequestURI();
      MemberDAO dao = new MemberDAO(); 
      String context = request.getContextPath(); // : /jsp02
      
      
    //1. 회원가입 버튼 누르면 join.do가 발동
    if(uri.indexOf("join.do") != -1) {
       
          //2. 사용자가 입력한 값들 싸그리 긁어옴
         String name = request.getParameter("name");
         String birth = request.getParameter("birth");
         String email = request.getParameter("email");
         String phone = request.getParameter("phone");
         String userid = request.getParameter("userid");
         String pwd = request.getParameter("pwd");
         
         //3. 사용자가 입력한 값 싸그리 DTO에 입력
         MemberDTO dto=new MemberDTO();
         dto.setName(name);
         dto.setBirth(birth);
         dto.setEmail(email);
         dto.setPhone(phone);
         dto.setUserid(userid);
         dto.setPwd(pwd);
         
         //4. DAO에 값 집어넣음
         dao.insert(dto);
           
      
      //2. 로그인 처리
       }else if(uri.indexOf("login.do") != -1) {
            
         //3-1. 입력창에서 입력받은 아이디와 비밀번호가 새 변수로 저장됨
         String userid = request.getParameter("userid");
         String pwd = request.getParameter("pwd");
            
         MemberDTO dto = new MemberDTO();
         dto.setUserid(userid);
         dto.setPwd(pwd);
         String result = dao.loginCheck(dto);
         
         String message="";
         String page="";
         
         if(result != null) {//로그인 성공
            HttpSession session = request.getSession();
            session.setAttribute("userid", userid);
            session.setAttribute("result", result);
            page="/jsp_project/about2.jsp";
            response.sendRedirect(context+page);
         }else {
            message = "아이디 또는 비밀번호가 일치하지 않습니다.";
            page = "/jsp_project/loginFail.jsp?message="+message;
            response.sendRedirect(context+page);
         }
            
       }
         
         
           
         
         
   //33-1. 29번의 가상 URI, view.do가 들어왔을때 어떤 매핑이 벌어지나?
      else if(uri.indexOf("view.do") != -1) {
         
    	  HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			if(userid != null) {
				MemberDTO dto = dao.view(userid);
				request.setAttribute("dto", dto);
				String page ="/jsp_project/view.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}

      }
    
    
    

		else if(uri.indexOf("updateData.do") != -1) {
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			if(userid != null) {
				MemberDTO dto = dao.view(userid);
				request.setAttribute("dto", dto);
				String page ="/jsp_project/update.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}
    
    
		else if(uri.indexOf("update.do") != -1) {
			int result =0;
			HttpSession session = request.getSession(); 
			
			String name=request.getParameter("name");
			String birth=request.getParameter("birth");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String userid =(String)session.getAttribute("userid");
			String pwd = request.getParameter("pwd");
			
			MemberDTO dto = new MemberDTO();			
			dto.setName(name);
			dto.setBirth(birth);
			dto.setEmail(email);
			dto.setPhone(phone);
			dto.setUserid(userid);
			dto.setPwd(pwd);
			
			result = dao.update(dto);
			
			System.out.println(result);
			
			if(result > 0) {
				request.setAttribute("dto", dto);
				String page ="/member_servlet/view.do";
				response.sendRedirect(context+page);
			}else {
				String page="/member/update.jsp?message=error";
				response.sendRedirect(context+page);
				
			}
		}
    
    
		else if(uri.indexOf("logout.do") != -1) {
			HttpSession session = request.getSession();
			session.invalidate();
			String page= "/jsp_project/login1.jsp";
			response.sendRedirect(context+page);
		}
    
    
      


      
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      doGet(request, response);
   }
}
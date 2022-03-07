package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemberDAO;
import member.dto.MemberDTO;

//4. 웹서블릿 만들기
@WebServlet("/session_servlet/*") //4-1. 가상 URI
public class SessionController extends HttpServlet { private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//4-2. 서블릿 3대장 키기
		String uri = request.getRequestURI();//사용자가 요청한 주소
		System.out.println(uri); // /jsp02/session_servlet/*
		MemberDAO dao = new MemberDAO(); //이 한줄을 통해 미리 준비해두었던 MemberDAO.java가 실행됨.
		
		if(uri.indexOf("login.do") != -1) {//4-3. 로그인 처리 : DTO, DAO이용
			//입력창에서 입력받은 아이디와 비밀번호가 새 변수로 저장됨
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			
			MemberDTO dto = new MemberDTO(); //DTO 객체를 생성하고
			//DTO의 변수값들을 입력창에서 입력받은 값들로 바꾸기 시작
			dto.setUserid(userid);
			dto.setPwd(passwd);
			String result = dao.loginCheck(dto);
			//DTO 변수값들이 MemberDAO로 넘어가고 새로운 변수 result에 저장. 
			//참고로 MemberDAO의 loginCheck라는 함수는 로그인의 성공실패를 따져주는 함수였음
			//result = rs.getString("name") + "님 환영합니다."
			System.out.println(result);
			
			
			String page = "/ch07/session_login.jsp";
			if(!result.equals("로그인 실패")) {//4-4. 로그인 성공 : 메인 페이지 이동
				//세션 객체 생성
				HttpSession session = request.getSession();
				//세션에 값 저장
				session.setAttribute("userid", userid);
				session.setAttribute("message", result);
				page = "/ch07/main.jsp"; //로그인 성공시 메인페이지로 넘어감
				response.sendRedirect(request.getContextPath() + page);
				//request.getContextPath() : 웹프로젝트의 이름(식별자). 여기선 jsp02
				
			}else {//4-5. 로그인 실패
				response.sendRedirect(request.getContextPath() + page + "?message=error");//3-2번의 error 메시지
			}
			
		}else if(uri.indexOf("logout.do") != -1) {//4-6. 로그아웃 처리
			HttpSession session = request.getSession();//세션객체 생성
			session.invalidate();//세션을 지움(초기화)
			//로그인 페이지로 이동
			String page = request.getContextPath() + "/ch07/session_login.jsp?message=logout";//3-2번의 logout 메시지
			response.sendRedirect(page);
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}

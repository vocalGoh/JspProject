package page;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/page_servlet/*")//웹 서블릿 사용할거임
public class PageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		EmpDAO dao = new EmpDAO();

		//6. 주소 : "${path}/page_servlet/list.do"가 들어옴
		if(uri.indexOf("list.do") != -1) {
			int count = dao.empCount();//6-1. DB에 저장되어 있는 레코드 갯수 계산. 잠시 7번(DAO)으로 이동하자
			int curPage = 1;//6-2. null일때는 기본값 1을 줌
			
			if(request.getParameter("curPage") != null) {//6-3. 5-2번에서 현재 페이지 값을 가져옴
				//6-4. 그리고 그 페이지 값을 새 변수에 저장
				curPage = Integer.parseInt(request.getParameter("curPage")); 
			}
			//Pager.java 참조
			Pager pager = new Pager(count, curPage); //6-5. Pager(레코드갯수, 보여줄 페이지번호) 
			int start = pager.getPageBegin(); //6-6. #{start}에 전달될 값(Pager.java 참조)
			int end = pager.getPageEnd(); //6-7. #{end}에 전달될 값(Pager.java 참조)

			List<EmpDTO> list = dao.empList(start,end);//6-8. 다시 DAO(9번)로 이동하여 함수를 확인해보자
			
			request.setAttribute("list", list);//6-9. 요청/응답 페이지에 결과값 공유
			
			//6-10. 페이지 네비게이션에 필요한 정보 전달
			request.setAttribute("page", pager);
			String page="/page/list.jsp"; //페이지 이동. list.jsp의 11번으로 이동하자
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response); //페이지 나누기 프로젝트 종료
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}
}

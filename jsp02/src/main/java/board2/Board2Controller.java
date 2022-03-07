package board2;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board2.dao.Board2DAO;
import board.dto.BoardCommentDTO;
import board.dto.BoardDTO;
import board2.dto.Board2DTO;
import common.Constants;
import page.Pager;


public class Board2Controller extends HttpServlet { 
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		
		//가상 URL 들어가기 전에 키는 삼대장
		//a. 클라이언트에서 요청한 주소
		String url = request.getRequestURL().toString();
		//b. 컨텍스트 패스
		String contextPath = request.getContextPath();
		//c. dao 인스턴스 생성
		Board2DAO dao = new Board2DAO();
		

		
		
		//1-2. 가상 URL "/board_servlet/list.do"가 들어옴
		if(url.indexOf("list.do") != -1) {
			
			
			//12-4. 레코드 갯수 계산 : DAO의 12-5번으로 이동
			int count=dao.count();
			
			//12-8. 페이지 나누기를 위한 처리
			int curPage=1;
			//12-9. 숫자 처리는 null 포인트 익셉션이 잘 나기때문에 if문처리해줌
			if(request.getParameter("curPage") != null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			
			//12. 페이지 나누기
			//12-1. 오라클로 가서 183번줄~201번줄을 실행한다.
			//12-2. Pager.java 확인
			//12-3. 이제 page와 관련된 코드를 보기 위해 1-2번을 다시 읽자.
			
			//12-10. Pager 객체 생성 및 이용
			Pager pager=new Pager(count, curPage); //Ctrl + Shift + O
			int start=pager.getPageBegin(); // #{start}에 전달될 값
			int end=pager.getPageEnd(); // #{end}에 전달될 값
			//잘 모르겠으면 Pager의 변수이름 확인
			
			
			
			
			
			
			System.out.println("list.do 호출");	
			
			
			//12-11. 12-12번으로 이동(DAO)
			List<Board2DTO> list = dao.list(start, end);
			
			request.setAttribute("list", list);
			//12-15. 페이지 네비게이션 출력을 위한 정보 전달
			request.setAttribute("page", pager);
			
			//이제 list.jsp의 12-16번으로 이동
				
			//1-9. 포워딩
			String page="/board2/list.jsp";//1-10. 페이지 이동
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);




			
			
		//2-5. 가상 URL "${path}/board_servlet/insert.do"가 들어옴
		}else if(url.indexOf("insert.do") != -1) {
			
			//2-6. 파일업로드 처리
			File uploadDir = new File(Constants.UPLOAD_PATH);
			
			if(!uploadDir.exists()) {//2-6-1. 업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}

			//2-7. MultipartRequest : request를 확장한 객체
			//MultipartRequest(request, "업로드 디렉토리", 제한용량, "인코딩방식", 파일명 중복방지 처리옵션)
			MultipartRequest multi = new MultipartRequest( 
			request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, 
			"utf-8", new DefaultFileRenamePolicy());

			//2-8. 2-2번 페이지에서 입력받은 값들을 들고옴. 그리고 새 변수에 저장
			String writer = multi.getParameter("writer");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String passwd = multi.getParameter("passwd");
			
			//2-9. 클라이언트 ip주소 가져오기
			String ip = request.getRemoteAddr();
			if(ip.equalsIgnoreCase("0:0:0:0:0:0:0:1")) {
				InetAddress inetAddress=InetAddress.getLocalHost();
				ip = inetAddress.getHostAddress();
			}
			
			System.out.println("클라이언트IP주소 : "+ip);
			String filename = " "; //공백 1개
			int filesize = 0;
			
			//2-10. 본격적으로 파일 업로드
			try {
				Enumeration files = multi.getFileNames();//파일이름을 가져옴
				
				while(files.hasMoreElements()) {//다음 요소가 있으면
					String file1 = (String)files.nextElement();//클라이언트 파일네임1
					filename = multi.getFilesystemName(file1);//서버에 업로드된 파일 이름
	    			File f1 = multi.getFile(file1);//File : 파일의 정보를 참조
					if(f1 != null) {
						filesize = (int)f1.length();//파일 사이즈 저장
					}
				}
			} catch (Exception e) { e.printStackTrace();
			}
			
			//2-11. 사용자로부터 입력받은 값들과 클라이언트 ip주소, 파일이름과 파일 사이즈롤 DTO에 셋팅
			BoardDTO dto = new BoardDTO();
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			
			//파일 첨부를 하지 않을 경우, trim() 문자열의 좌우 공백 제거
			if(filename == null || filename.trim().equals("")) {
				filename="-";
			}

			dto.setFilename(filename);
			dto.setFilesize(filesize);

			dao.insert(dto); //2-12. DAO로 이동하여 insert()함수 확인
			//2-16. 포워딩
			String page="/board_servlet/list.do";//1-2번이 다시 반복된다...
			response.sendRedirect(contextPath+page);



			
		//3-1. 가상 URL "${path}/board_servlet/download.do?num=${dto.num}"가 들어옴
		}else if(url.indexOf("download.do") != -1) {
			
			//"내가 원하는 게시글의 번호"를 들고옴
			int num = Integer.parseInt(request.getParameter("num"));
			//3-2. DAO의 3-3번으로 이동. getFileName이 뭐하는 함수노?
			//n번째 게시물의 첨부파일 이름 가져오는 함수
			String filename = dao.getFileName(num);
			
			System.out.println("첨부파일 이름 : "+filename);
			
			//------------이제 파일의 다운로드가 본격적으로 시작된다.----------------------
			
			//3-6. 업로드되었던 파일의 위치정보값을 path에 저장
			String path = Constants.UPLOAD_PATH + filename;
			
			byte b[] = new byte[4096];//3-7. 바이트배열 생성
			
			//3-8. 업로드 폴더에 저장된 파일을 읽기 위한 InputStream 생성
			//(클라이언트한테 파일을 주려면 서버부터 파일을 읽어야함)
			FileInputStream fis = new FileInputStream(path);
			
			//3-9. mimeType(파일의 종류-img, mp3, txt..등을 판단하고 구분)
			String mimeType = getServletContext().getMimeType(path);
			
			//3-10. 스트림 방식의 파일 다운로드시 한글 파일명 관련 브라우저 헤더 처리
			//octet-stream : 8비트로 된 일련의 데이터를 뜻하며 모든 종류의 이진데이터를 처리하겠다는 의미
			if(mimeType==null) {
				mimeType="application/octet-stream;charset=utf-8";
			}
			//파일 이름에 한글이 포함된 경우 header에 값을 보낼때 header에는 한글이나 특수문자가
			//올 수 없기 때문에 톰캣서버의 기본셋팅언어인 서유럽언어 8859_1을 한글처리가 가능한
			//utf-8로 인코딩처리해야 한다.
			//3-11.new String(getBytes("변환할 인코딩값"),"기본인코딩값")
			filename = new String(filename.getBytes("utf-8"),"8859_1");
			response.setHeader("Content-Disposition", "attachment;filename="+filename);

			//3-11. OutputStream 생성(서버에서 클라이언트에 쓰기)
			ServletOutputStream out = response.getOutputStream();
			
			int numRead;
			
			while(true) {//3-12. 데이터 쓰기
				numRead = fis.read(b,0,b.length);//데이터를 읽음
				if(numRead == -1) break;//더 이상 내용이 없으면
				out.write(b, 0, numRead);//데이터 쓰기
			}
			//3-13. 파일 처리 관련 리소스 정리
			out.flush();
			out.close();
			fis.close();
			//3-14. 다운로드 횟수 증가 처리 : DAO의 3-15번으로 이동
			dao.plusDown(num);//끝



			
		//4-1. 가상의 URL "${path}/board_servlet/view.do?num=${dto.num}"이 들어옴
		}else if(url.indexOf("view.do") != -1) {
			//"내가 원하는 게시글의 번호"를 들고옴
			int num=Integer.parseInt(request.getParameter("num"));
			
			//세션 객체 생성
			HttpSession session = request.getSession();
			
			//4-2. 조회수 증가 처리 : plusReadCount()함수의 확인을 위해 DAO의 4-3번으로 이동
			dao.plusReadCount(num, session); //조회수 증가처리 함수였음
			
			//4-8. view()함수는 뭐하는 함수인지 확인하기 위해 DAO의 4-9번으로 이동하자
			BoardDTO dto = dao.viewReplace(num); //작성한 게시물을 우리한테 보여주게하는 함수
			
			//4-12. request영역에 저장
			request.setAttribute("dto", dto);
			
			//4-13. 화면전환
			String page="/board/view.jsp";//페이지 이동해보자.(4-14번으로)
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
			
			
			
			
			
		}else if(url.indexOf("commentList.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			System.out.println("댓글을 위한 게시물 번호 : " + num);
			//댓글 목록 리턴
			List<BoardCommentDTO> list=dao.commentList(num);
			//request 영역에 저장
			request.setAttribute("list", list);
			//출력페이지로 이동
			String page="/board/comment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
			
			
			
		}else if(url.indexOf("comment_add.do") != -1) {
			BoardCommentDTO dto=new BoardCommentDTO();
			//게시물 번호
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			String writer=request.getParameter("writer");
			String content=request.getParameter("content");
			dto.setBoard_num(board_num);
			dto.setWriter(writer);
			dto.setContent(content);
			dao.commentAdd(dto);

		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//8-3. 가상의 URL : "${path}/board_servlet/reply.do"이 들어옴
		else if(url.indexOf("reply.do") != -1) {
			
			//"내가 원하는 게시글의 번호"를 들고옴
			int num = Integer.parseInt(request.getParameter("num"));
			
			//8-4. view라는 함수를 확인하기 위해 DAO의 8-5번으로 이동
			BoardDTO dto = dao.view(num); //대댓글을 달 수 있게 해주는 함수
			
			dto.setContent("===게시물의 내용===\n"+dto.getContent());
			
			//8-9. 요청/응답 페이지에 전달
			request.setAttribute("dto", dto);
			
			String page="/board/reply.jsp";//8-10. 대댓글 쓰는 페이지로 이동해보자(8-11번)
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		
		
		
		else if(url.indexOf("insertReply.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			BoardDTO dto=dao.view(num);
			int ref=dto.getRef();//답변그룹번호
			int re_step=dto.getRe_step()+1;//출력순번
			int re_level=dto.getRe_level()+1;//답변단계
			String writer=request.getParameter("writer");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String passwd=request.getParameter("passwd");
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setRef(ref);
			dto.setRe_level(re_level);
			dto.setRe_step(re_step);
			//첨부파일 관련 정보
			dto.setFilename("-");
			dto.setFilesize(0);
			dto.setDown(0);
			//답글 순서 조정
			dao.updateStep(ref, re_step);
			//답글 쓰기
			dao.reply(dto);
			//목록으로 이동
			String page="/board_servlet/list.do";
			response.sendRedirect(contextPath+page);
			
			
			
			
			
		}else if(url.indexOf("pass_check.do") != -1) {
			//게시물 번호
			int num=Integer.parseInt(request.getParameter("num"));
			//입력한 비밀번호
			String passwd=request.getParameter("passwd");
			//비밀번호가 맞는지 확인
			String result = dao.passwdCheck(num, passwd);
			
			String page="";
			if(result != null) {//비밀번호가 맞으면
				page="/board/edit.jsp";
				request.setAttribute("dto", dao.view(num));
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {//비밀번호가 틀리면
				page=contextPath+"/board_servlet/view.do?num="+num+"&message=error";
				response.sendRedirect(page);
				
			}//else	
			
			
			
			
			
			
		}else if(url.indexOf("update.do") != -1) {
			//파일업로드 처리
			//디렉토리가 없으면 생성
			File uploadDir = new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			
			MultipartRequest multi=new MultipartRequest(
					request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, 
					"utf-8", new DefaultFileRenamePolicy());
			
			int num=Integer.parseInt(multi.getParameter("num"));
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();
			String filename=" ";//공백 1개
			int filesize=0;
			try {
				Enumeration files=multi.getFileNames();
				while(files.hasMoreElements()) {
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length();//파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			BoardDTO dto=new BoardDTO();
			dto.setNum(num);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			//파일 첨부를 하지 않을 경우
			//trim() 문자열의 좌우 공백 제거
			if(filename == null || filename.trim().equals("")) {
				//새로운 첨부파일이 없을 때(테이블의 기존정보를 가져옴)
				BoardDTO dto2=dao.view(num);
				String fName=dto2.getFilename();
				int fSize=dto2.getFilesize();
				int fDown=dto2.getDown();
				dto.setFilename(fName);
				dto.setFilesize(fSize);
				dto.setDown(fDown);
			}else {
				//새로운 첨부파일이 있을 때
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			//첨부파일 삭제 처리
			String fileDel=multi.getParameter("fileDel");
			//체크박스에 체크가되었으면, on이 디폴트가됨
			if(fileDel !=null && fileDel.equals("on")) {
				String fileName=dao.getFileName(num);
				File f=new File(Constants.UPLOAD_PATH+fileName);
				f.delete();//파일 삭제
				//첨부파일 정보를 지움
				dto.setFilename("-");
				dto.setFilesize(0);
				dto.setDown(0);
			}
			//레코드 수정
			dao.update(dto);
			//페이지 이동
			String page="/board_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("delete.do") != -1) {
			//파일업로드를 안쓰더라도 MultipartRequest처리를 해야한다.
			MultipartRequest multi=new MultipartRequest(
					request, Constants.UPLOAD_PATH, Constants.MAX_UPLOAD, 
					"utf-8", new DefaultFileRenamePolicy());
			//삭제할 게시물 번호
			int num=Integer.parseInt(multi.getParameter("num"));
			dao.delete(num);
			//페이지 이동
			String page="/board_servlet/list.do";
			response.sendRedirect(contextPath+page);
		
		
		
		
		
		//11-3. 가상의 URL "${path}/board_servlet/search.do"이 들어옴
		}else if(url.indexOf("search.do") != -1) {
			
			//11-4. 검색옵션과 검색 키워드
			String search_option=request.getParameter("search_option");
			String keyword=request.getParameter("keyword");
			
			//11-5. 리스트 만들고 DAO의 searchList() 함수로 이동 (11-6번)
			List<BoardDTO> list = dao.searchList(search_option, keyword);
			//검색 기능 함수였음
			
			//list, search_option, keyword를 요청/응답페이지가 나눠가짐
			request.setAttribute("list", list);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			
			//11-10. 포워딩
			String page="/board/search.jsp";//search.jsp로 이동(11-11번)
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
		
		

		
	}
		


	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, 
	IOException {
		doGet(request, response);
	}

}

package board2.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import board.dto.BoardCommentDTO;
import board.dto.BoardDTO;
import board2.dto.Board2DTO;
import sqlmap.MybatisManager;

public class Board2DAO {
	
	
	
	
	//12-12. 게시물 목록 
	public List<Board2DTO> list(int start, int end){
		
		List<Board2DTO> list=null;
		SqlSession session=null;//MyBatis 실행객체 생성
		
		try {//혹시 있을지 모를 예외발생을 처리하기 위해 try문 쓰는게 좋다.
			
			//MyBatis 실행객체
			session=MybatisManager.getInstance().openSession();
			
			//맵계열 만들고 start, end값을 집어넣음
			Map<String,Object> map=new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			list = session.selectList("board2.list", map);
			//12-13. board.xml로 이동(12-14번)
			
		} catch (Exception e) { e.printStackTrace();
		} finally { if(session != null) session.close();
		}
		return list;//게시물 목록을 뽑을 수 있는 SQL문을 들고왔다.
					//12-11번으로 복귀
	}
	
	
	
	

	//2-13. 게시물 저장
	public void insert(Board2DTO dto) {
		
		SqlSession session=null; //MyBatis 실행객체 생성
		
		try {
			session=MybatisManager.getInstance().openSession();//MyBatis 실행객체
			session.insert("board.insert", dto);//2-14. SQL문을 읽어야하니 board.xml로 이동
			session.commit();
			
		} catch (Exception e) { e.printStackTrace();
		} finally { if(session != null) session.close();
		}
	}//end insert() : 2-12번으로 돌아가자

	
	
	
	//3-3. 첨부파일 이름 찾기
	public String getFileName(int num) {
		
		String result="";
		SqlSession session=null; //MyBatis 실행객체 생성
		
		try {
			session=MybatisManager.getInstance().openSession();//MyBatis 실행객체
			result = session.selectOne("board.getFileName", num);
			//3-4. SQL문을 읽어야하니 board.xml의 3-5번으로 이동
		} catch (Exception e) { e.printStackTrace();
		} finally { if(session != null) session.close();
		}
		return result;//3-2번으로 돌아가자
	}

	//3-15. 다운로드 횟수 증가 처리
	public void plusDown(int num) {
		
		SqlSession session=null; //MyBatis 실행객체 생성
		
		try {
			session = MybatisManager.getInstance().openSession(); //MyBatis 실행객체
			session.update("board.plusDown", num);
			//3-16. SQL문을 읽어야하니 board.xml의 3-17번으로 이동
			session.commit();
		} catch (Exception e) { e.printStackTrace();
		} finally { if(session != null) session.close();
		}//3-14번으로 돌아가자
	}

	//4-9. 게시물의 상세정보를 볼 수 있게하는 함수
	public BoardDTO view(int num) {
		
		BoardDTO dto = null; //DTO 생성
		SqlSession session=null; //MyBatis 실행객체 생성
		
		try {
			session = MybatisManager.getInstance().openSession(); //MyBatis 실행객체
			dto = session.selectOne("board.view", num);
			//4-10. SQL문을 읽어야하니 board.xml의 4-11번으로 이동
		} catch (Exception e) { e.printStackTrace();
		} finally { if(session != null) session.close();
		}
		return dto;//4-8번으로 돌아가자
	}
	
	
	
	
	
	
	
	
	
	
	
	public BoardDTO viewReplace(int num) {
		BoardDTO dto=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			dto=session.selectOne("board.view", num);
			//줄바꿈 처리
			String content=dto.getContent();
			content=content.replace("\n", "<br>");
			dto.setContent(content);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return dto;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	//4-3. 조회수 증가 처리
	public void plusReadCount(int num, HttpSession count_session) {
		
		SqlSession session=null; //MyBatis 실행객체 생성
		
		try {
			session = MybatisManager.getInstance().openSession(); //MyBatis 실행객체
			
			//------------4-4. 반복된 새로고침을 통한 조회수 조작을 막기 위한 방법---------------
			//현재시간과 읽은 시간의 차이를 하루 또는 그 이상의 시간으로 정하여 
			//그만큼의 시간보다 적은 시간에는 새로고침을 해도 조회수가 올라가지 않게 설정하는 방법임
			
			long read_time = 0; //읽은 시간(조회 시간) 선언
			
			//4-4-1. 읽은 시간을 정해주는 법
			if(count_session.getAttribute("read_time_"+num) != null) {
				read_time = (long)count_session.getAttribute("read_time_"+num);
			}
			//4-4-2. 현재시각을 정해주는 법
			long current_time = System.currentTimeMillis();//현재시각
			//4-4-3. 현재시간과 읽은 시간의 차이 계산
			if(current_time-read_time > 5*1000) {//현재시간-읽은시간>5초,
				//참조 : 하루에 한번만 : 24시간 * 60분 * 60초 * 1000밀리초
				
				//4-5. SQL문을 읽어야하니 board.xml의 4-6번으로 이동
				session.update("board.plusReadCount", num);
				session.commit();
				//4-7. 최근 열람 시각 업데이트
				count_session.setAttribute("read_time_"+num, current_time);
			}
			
		} catch (Exception e) { e.printStackTrace();
		} finally { if(session != null) session.close();
		}
	}//4-2번으로 돌아가자
	
	

	//댓글 목록을 구하는 코드
	public List<BoardCommentDTO> commentList(int num) {
		List<BoardCommentDTO> list=null;
		SqlSession session=null;
		//혹시 있을지 모를 예외발생을 처리하기 위해 try문 쓰는게 좋다.
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("board.commentList", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;

	}

	//댓글 추가
	public void commentAdd(BoardCommentDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("board.commentAdd", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	//답글의 순서 조정
	public void updateStep(int ref, int re_step) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			BoardDTO dto=new BoardDTO();
			dto.setRef(ref);
			dto.setRe_step(re_step);
			session.update("board.updateStep", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}

	
	
	
	
	
	
	
	//8-5. 답글 쓰기
	public void reply(BoardDTO dto) {
		
		SqlSession session=null; //MyBatis 실행객체 생성
		
		try {
			//MyBatis 실행객체
			session=MybatisManager.getInstance().openSession();
			session.insert("board.reply", dto);
			//8-6. SQL문을 확인하기 위해 board.xml로 이동(8-7번)
			session.commit();
		} catch (Exception e) { e.printStackTrace();
		} finally { if(session!=null) session.close();
		}
	}//8-4번으로 돌아간다.

	
	
	//비밀번호 체크
	public String passwdCheck(int num, String passwd) {
		String result=null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			Map<String,Object> map=new HashMap<>();
			map.put("num", num);
			map.put("passwd", passwd);
			result=session.selectOne("board.pass_check", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}

		return result;
	}

	//수정기능
	public void update(BoardDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("board.update", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
		
	}

	//삭제
	public void delete(int num) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("board.delete", num);//진짜삭제가 아니기에 update()
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		
	}

	
	
	
	
	

	
		//11-6. 검색기능
		public List<BoardDTO> searchList(String search_option, String keyword) {
			
			List<BoardDTO> list=null;
			
			//11-7. try~with문 : Java1.7부터 사용가능
			//생김새 : try(){} 
			//특징 : finally절을 안써도 자동으로 리소스 정리가 된다.
			
			try(SqlSession session=MybatisManager.getInstance().openSession()){
				//MyBatis 실행객체 생성
				
				//맵 계열 생성해서 두가지 값(search_option, keyword)을 넣어서 
				//한가지 값(map)으로 압축 : 1+1=1
				Map<String,String> map=new HashMap<>();
				map.put("search_option", search_option);
				map.put("keyword", "%"+keyword+"%");
				list = session.selectList("board.searchList", map);
				//11-8. 와중에 board.xml로 SQL문 보러가자(11-9번)
				
			}catch (Exception e) { e.printStackTrace();
			}
			return list;//검색결과를 저장하고 11-5번으로 복귀
		}

		
		


		
		//12-5. 게시물 갯수 계산
		public int count() {
			
			int result=0;
			
			try(SqlSession session = MybatisManager.getInstance().openSession()){
			
				result = session.selectOne("board2.count");
				
			} catch (Exception e) {e.printStackTrace();
			}
			return result; //Controller의 12-4번으로 이동
		}
		

		
	
	

}

package memo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import memo.dto.MemoDTO;
import sqlmap.MybatisManager;

public class MemoDAO {

	public List<MemoDTO> listMemo(String searchkey, String search){//12.

		SqlSession session = MybatisManager.getInstance().openSession();//ctrl+shift+o
		//12-1. SqlSession 객체를 하나 만들어냈다.
	    //SqlSession은 데이터베이스에 대해 SQL명령어를 실행하기 위해 필요한 모든 메소드를 가지고 있어-
		//SqlSession 객체를 통해 직접 SQL 구문을 실행할 수 있다. 

		List<MemoDTO> list = null; //12-2. list도 하나 준비

		try {
			if(searchkey.equals("writer_memo")) {//12-3. 이름+메모로 검색. 
				//"writer_memo"는 memo.jsp파일의 <select>-<option> 중 하나의 value값임
				
				list = session.selectList("memo.listAll", search);
				//12-4. SQL문 읽기
				//보통 여기다 SQL문을 적는데 이번엔 SQL문을 읽어주는 session을 적어줬다.
				//어떤 SQL문을 읽는지 memo.xml에서 확인해보자. memo.listAll을 잘 기억해두셈. 13번으로 이동
				//이제 list에는 "이름과 내용으로 찾은 정보들"이 들어있음
				
			}else {//12-5. MyBatis에서는 입력매개변수는 1개만 전달 가능. 
				//따라서 map으로 압축하여 하나의 값으로 만들어 전달해준다.
				//지금 이름과 내용을 모두 찾은 위와 달리 이 경우는 "이름만 찾거나 내용만 찾은 경우"임 
				Map<String,String> map = new HashMap<>();
				map.put("searchkey", searchkey);
				map.put("search", search);
				list = session.selectList("memo.list", map);//12-6. 따라서 위와 달리 이번엔 14번으로 이동한다.
			}		
			
			
			
			//19. 태그,공백문자를 insert때보다 select때 처리가 더 좋다.
			//18-2번에 썼던 것들을 주석처리 해버린 후 여기 다시 적음 
			for(MemoDTO dto : list) {//for문으로 처리해야 한다.
				String memo = dto.getMemo();
				memo = memo.replace("  ", "&nbsp;&nbsp;");//공백문자처리
				memo = memo.replace("<", "&lt"); //Less Than ~보다 작다
				memo = memo.replace(">", "&gt"); //Greater Than
							
				//키워드에 색상 처리
				if(searchkey.equals("memo")) {
					if(memo.indexOf(search) != -1) {
						memo=memo.replace(search,"<font color='red'>"+search+"</font>");
					}
				}	
				dto.setMemo(memo);
			}				
			
		} catch (Exception e) { e.printStackTrace();
		} finally { if(session != null) session.close();//mybatis 객체 닫기
		}
		return list; //12-7. 이제 list에는 "DB에서 찾아낸 정보들"이 들어있음.listMemo() 함수 끝. 11-2번으로 이동
	}

	
	
	public void insertMemo(MemoDTO dto) {//18.
		//18-1. MyBatis 실행 객체 생성
		SqlSession session = MybatisManager.getInstance().openSession();

		//18-2. 태그 문자 처리 : 짖궂은 새끼들이 <xmp> 같은 태그를 넣었을때 대처법(태그를 읽지 않고 메모로 받아들이는 능력)
		//String memo = dto.getMemo();
		//memo = memo.replace("  ", "&nbsp;&nbsp;");//공백문자처리
		//memo = memo.replace("<", "&lt"); //Less Than ~보다 작다
		//memo = memo.replace(">", "&gt"); //Greater Than 
		//dto.setMemo(memo);


		session.insert("memo.insert", dto);//18-3. SQL문을 읽어야하니 memo.xml로 ㄱ(19번)
		//마이바티스의 insert 메소드는 파라미터가 1개밖에 허용안한다. 여기선 dto
		//파라미터가 두개가 되려면 map으로 묶어서 처리해야함
		//이것도 memo.xml가서 적자

		session.commit();//18-4. MyBatis는 수동커밋을 해야한다.(자동커밋을 막았다.)
		session.close();//18-5. MyBatis 세션 닫기. MemoController의 17-2번으로 이동
		
	}//insertMemo
	
	
	
	
	
	//23.
	public MemoDTO viewMemo(int idx) {
		//23-1. MyBatis 실행 객체 생성
		SqlSession session = MybatisManager.getInstance().openSession();
		//23-2. SQL문을 읽어야하니 memo.xml로 ㄱ(24번)
		MemoDTO dto = session.selectOne("memo.view", idx);
		
		//23-3. 참조 : selectOne() vs selectList()
		//selectOne() 레코드 1개만 가져올때
		//selectList() 레코드 2개 이상 가져올때(목록을 가져올때)
		session.close();
		return dto;//22번으로 돌아가자
	}


	//27. 수정
	public void updateMemo(MemoDTO dto) {
		//27-1. MyBatis 실행 객체 생성
		SqlSession session = MybatisManager.getInstance().openSession();
		session.update("memo.update", dto); //27-2. 기록을 업데이트 하는거니까 update 사용. 
											//SQL문을 읽어야하니 memo.xml로 ㄱ(28번)
		session.commit();
		session.close();//26번으로 돌아가자
	}


	//31. 삭제
	public void deleteMemo(int idx) {
		//31-1. MyBatis 실행 객체 생성
		SqlSession session = MybatisManager.getInstance().openSession();
		session.delete("memo.delete", idx);//31-2. 기록을 업데이트 하는거니까 delete 사용.
										   //SQL문을 읽어야하니 memo.xml로 ㄱ(32번)
		session.commit();
		session.close();//30번으로 돌아가자
		
	}
	
	
	
	
	
	
	

}

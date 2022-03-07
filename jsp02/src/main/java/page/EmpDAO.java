package page;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;

public class EmpDAO {
	
	public int empCount() {//7. DB에 저장되어 있는 레코드 갯수 계산
		
		//7-1. MyBatis 실행객체 생성
		SqlSession session = MybatisManager.getInstance().openSession();
		//7-2. SQL문을 읽어야하니 emp.xml ㄱ(8번으로 이동)
		int count = session.selectOne("emp.empCount");
		session.close();
		return count;//6-1번으로 돌아가자
		
	}
		
	public List<EmpDTO> empList(int start, int end){//9.
								//start : #{start}에 전달될 값
								//end : #{end}에 전달될 값
		
		//9-1. MyBatis 실행객체 생성
		SqlSession session = MybatisManager.getInstance().openSession();
		
		//9-2. MyBatis는 하나의 변수만 받을 수 있기 때문에 start, end 두변수를 map으로 압축해준다.
		Map<String,Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		System.out.println(map);
		
		List<EmpDTO> items = session.selectList("emp.empList", map);
		//9-3. SQL문을 읽어야하니 emp.xml ㄱ(10번으로 이동)
		//selectOne() : 레코드 1개만 가져올때
		//selectList() : 레코드 2개 이상 가져올때(목록을 가져올때)
		session.close();
		return items;//6-8번으로 돌아가자
	}
}

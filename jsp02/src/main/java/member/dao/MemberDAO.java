package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import config.DB; //7. DB와 connection 시켜주는 클래스를 불러온다
import member.dto.MemberDTO;
import my.dto.MyMemberDTO;
import sqlmap.MybatisManager;

public class MemberDAO {
   
   
   //5. 회원정보 추가하기
   public void insert(MemberDTO dto) {
      
      //6. SQL에 접속해주는 세션 키고
      try (SqlSession session = MybatisManager.getInstance().openSession()){
         
         //7. SQL문 읽고 commit-종료
         session.insert("member.insert",dto);
         session.commit();
         session.close();
         
      }catch (Exception e) { 
         e.printStackTrace();
      }
   }//end insert()
   
   
   
   
   
   
   //4. loginCheck()의 역할 : 
   public String loginCheck(MemberDTO dto) {
      String result="";
      try(SqlSession session = MybatisManager.getInstance().openSession()){
         
         result =session.selectOne("member.login_chechk", dto);
         
      }catch (Exception e) { 
         e.printStackTrace();
      }
      return result;
   }//end loginCheck()
   
   
   
   
   
   
	public MemberDTO view(String userid) {
		MemberDTO dto=null;
		try(SqlSession session=
				MybatisManager.getInstance().openSession()) {
			dto=session.selectOne("member.view",userid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	
	public int update(MemberDTO dto) {
		int result=0;
		try(SqlSession session=
				MybatisManager.getInstance().openSession()) {
			result=session.update("member.update",dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
   
   
   
   
   
   
   
   

   
   
   
   
   

   
   
   
   
   
 


   
   
   
   
   

   
}//public class MemberDAO


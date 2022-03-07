package sqlmap;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

//"싱글톤 기법"을 이용하여 DB에 접속하는 방법(아래 코드는 정형화된 코드임)
//MyBatis 설정정보를 담은 싱글톤 객체(sqlFactory)를 사용하여 sqlSession을 생성할 수 있다.

public class MybatisManager {
	//4. SqlSession 객체 생성기
	private static SqlSessionFactory instance; //instance라는 객체 선언(6-2번 참조)
	//SqlSessionFactory : SQL서버와 MyBatis를 연동시켜주는 객체
	//SqlSessionFactory의 인스턴스(객체)는 SqlSessionFactoryBuilder를 사용하여 만들수 있다.(6-2번 참조)
	
	private MybatisManager() {
	//5. 엥? 생성자에 private가 붙노?
	//생성자는 보통 public인데 여기선 private처리 했다. 따라서 외부에서는 접근이 안된다.
	//new를 통해서 접근이 안되기 때문에 아래의 getInstance()를 통해 우회 접근한다.
	//웹은 사용자들이 많은데, 접속할 때마다 "MybatisManager m = new MybatisManager();" 식의 인스턴스를 하나씩 만들어 실행하면 메모리가 감당이 안됨.
	//따라서 다수의 인스턴스 생성을 막고 하나의 인스턴스(getInstance())만 생성시켜 처리한다. 이 방법을 "싱글톤 패턴기법"이라고 한다.
	}

    //SqlSessionFactory라는 이름에서 보듯이 SqlSession 인스턴스(객체)를 만들수 있다.
    //SqlSession은 데이터베이스에 대해 SQL명령어를 실행하기 위해 필요한 모든 메소드를 가지고 있다.
    //그래서 SqlSession 인스턴스를 통해 직접 SQL 구문을 실행할 수 있다. 
	public static SqlSessionFactory getInstance() {//6. SQL 구문을 직접 실행할 수 있는 객체 생성하기
		
		Reader reader = null; //Reader는 InputStreamReader의 상위객체
		
		try {//아래 두줄로 SqlSession 객체를 만들어낸다.
			reader = Resources.getResourceAsReader("sqlmap/sqlMapConfig.xml");//6-1. 방금 전 만들었던 sqlMapConfig.xml파일을 읽어들이고
			instance = new SqlSessionFactoryBuilder().build(reader);//6-2. 그걸 기반으로 SqlSessionFactory객체(instance)를 만들어냄
		
		//여기선 개발자 위한 코드를 적어주고 오픈소스들을 닫아주는곳
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try { if (reader != null) reader.close();
			} catch (Exception e) { e.printStackTrace();
			}
		}//finally
		return instance; //6-3. SQL 구문을 직접 실행할 수 있는 객체 생성 완료
	}
}

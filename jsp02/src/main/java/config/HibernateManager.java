package config;

import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateManager {
	
	//1. SqlSession 객체 생성기(1-1번과 연관)
	private static SessionFactory sessionFactory;
	
	static {
		try {
			
			//2. hibernate설정 파일 로딩
			StandardServiceRegistry standardRegistry 
			= new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();
			
			//3. 설명데이터 생성
			Metadata metaData
			=new MetadataSources(standardRegistry).getMetadataBuilder().build();
			
			sessionFactory = metaData.getSessionFactoryBuilder().build();
			
		} catch (Exception e) { e.printStackTrace();
		}
	}
	
	//1-1. SQL 구문을 직접 실행할 수 있는 객체 생성하기
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}
}

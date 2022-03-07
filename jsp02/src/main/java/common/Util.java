package common;

import javax.servlet.http.Cookie;

//useCookie의 코드를 따로 메소드화해서 공용으로 사용
public class Util {
	public static String getCookie(Cookie[] cookies, String name) {
		
		String result="";
		
		if(cookies != null) {//쿠키가 존재하면
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals(name)) {
					//쿠키의 이름이 매개변수와 같으면
					result = cookies[i].getValue();
					//result에 쿠키의 값을 저장
					break;
				}
			}
		}
		return result;//즉, 쿠키들을 저장하는 함수
	}
}

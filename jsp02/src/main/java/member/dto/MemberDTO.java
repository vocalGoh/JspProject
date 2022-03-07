package member.dto;

import java.sql.Date;

public class MemberDTO {
	//6-1. 변수
	private String name;
	private String birth;
	private String email;
	private String phone;
	private String userid;
	private String pwd;
	private Date join_date;
	
	
	//6-2. getter,setter, toString(), 생성자(2개)
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "MemberDTO [name=" + name + ", birth=" + birth + ", email=" + email + ", phone=" + phone + ", userid="
				+ userid + ", pwd=" + pwd + ", join_date=" + join_date + "]";
	}
	
	
	public MemberDTO() {
		
	}
	
	
	public MemberDTO(String name, String birth, String email, String phone, String userid, String pwd, Date join_date) {
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.userid = userid;
		this.pwd = pwd;
		this.join_date = join_date;
	}

	
}

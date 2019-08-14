package com.dvdshop.vo;



public class MemberVO {
	
	private String member_id;
	private String member_pass;
	private String member_birth;
	private String member_phone;
	private String member_email;
	
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public MemberVO(String member_id, String member_pass, String member_birth, String member_phone,
			String member_email) {
		super();
		this.member_id = member_id;
		this.member_pass = member_pass;
		this.member_birth = member_birth;
		this.member_phone = member_phone;
		this.member_email = member_email;
	}




	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pass() {
		return member_pass;
	}
	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}
	public String getMember_birth() {
		return member_birth;
	}
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_pass=" + member_pass + ", member_birth=" + member_birth
				+ ", member_phone=" + member_phone + ", member_email=" + member_email + "]";
	}
	
	
	
	
	
	

}

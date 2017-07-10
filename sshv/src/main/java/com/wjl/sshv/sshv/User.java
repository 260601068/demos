package com.wjl.sshv.sshv;

public class User {
	private Integer id;
	private String userName;
	private int age;
	public User() {
		System.out.println("constructor user");
	}
	public User(String userName, int age) {
		super();
		this.userName = userName;
		this.age = age;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public String execute(){
		return "success";
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", age=" + age + "]";
	}
	
}

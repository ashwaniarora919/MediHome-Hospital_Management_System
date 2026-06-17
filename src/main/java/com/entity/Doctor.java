package com.entity;

public class Doctor {

	private int id;
	private String fullName;
	private String email;
	private String password;
	private String specialist;

	public Doctor() {
	}

	public Doctor(String fullName, String email, String password, String specialist) {
		this.fullName = fullName;
		this.email = email;
		this.password = password;
		this.specialist = specialist;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSpecialist() {
		return specialist;
	}

	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}

}
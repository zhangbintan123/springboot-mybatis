package com.po;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Student implements Serializable {
	private Integer sid;
	private String sname;
	private String sex;
	private String address;
	private Date birthday;
	private Integer classid;
	private String cname;
	private String sdate;

	public Student() {
	}

	public Student(Integer sid, String sname, String sex, String address, Date birthday, Integer classid, String cname) {
		this.sid = sid;
		this.sname = sname;
		this.sex = sex;
		this.address = address;
		this.birthday = birthday;
		this.classid = classid;
		this.cname = cname;
	}

	public Student(String sname, String sex, String address, Date birthday, Integer classid) {
		this.sname = sname;
		this.sex = sex;
		this.address = address;
		this.birthday = birthday;
		this.classid = classid;
	}

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {

		this.birthday = birthday;
	}

	public Integer getClassid() {
		return classid;
	}

	public void setClassid(Integer classid) {
		this.classid = classid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getSdate() {
		if(birthday!=null){
			sdate=new SimpleDateFormat("yyyy-MM-dd").format(birthday);
		}
		return sdate;
	}

	public void setSdate(String sdate) {
		if(sdate!=null&&!sdate.trim().equals("")){
			try {
				birthday=new SimpleDateFormat("yyyy-MM-dd").parse(sdate);
			} catch (ParseException e) {
				e.printStackTrace();
			}

		}
		this.sdate = sdate;
	}
}

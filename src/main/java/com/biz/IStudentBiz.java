package com.biz;

import com.po.Clazz;
import com.po.Student;

import java.util.List;

public interface IStudentBiz {
	public  int save(Student st);
	public  int update(Student st);
	public  int delById(Integer sid);
	public  Student findById(Integer sid);
	public List<Student> findAll();
	public List<Clazz> findAllClazz();
}

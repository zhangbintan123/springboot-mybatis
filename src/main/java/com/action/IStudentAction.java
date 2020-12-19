package com.action;
import java.util.*;
import com.po.*;
import com.biz.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IStudentAction {
	public  int save(HttpServletResponse response, HttpServletRequest request, Student st);
	public  int update(HttpServletResponse response, HttpServletRequest request, Student st);
	public  int delById(HttpServletResponse response, HttpServletRequest request, Integer sid);
	public  Student findById(HttpServletResponse response, HttpServletRequest request, Integer sid);
	public List<Student> findAll(HttpServletResponse response, HttpServletRequest request);
	public List<Clazz> findAllClazz(HttpServletResponse response, HttpServletRequest request);
}

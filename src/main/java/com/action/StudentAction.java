package com.action;

import com.biz.IStudentBiz;
import com.po.Clazz;
import com.po.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
public class StudentAction implements IStudentAction {
	@Autowired
	private IStudentBiz studentBiz;

	public IStudentBiz getStudentBiz() {
		return studentBiz;
	}

	public void setStudentBiz(IStudentBiz studentBiz) {
		this.studentBiz = studentBiz;
	}

	@Override
	@RequestMapping(value = "save_Student.do")
	public int save(HttpServletResponse response, HttpServletRequest request, Student st) {
		return studentBiz.save(st);
	}

	@Override
	@RequestMapping(value = "update_Student.do")
	public int update(HttpServletResponse response, HttpServletRequest request, Student st) {
		return studentBiz.update(st);
	}

	@Override
	@RequestMapping(value = "delById_Student.do")
	public int delById(HttpServletResponse response, HttpServletRequest request, Integer sid) {
		return studentBiz.delById(sid);
	}

	@Override
	@RequestMapping(value = "findById_Student.do")
	public Student findById(HttpServletResponse response, HttpServletRequest request, Integer sid) {
		return studentBiz.findById(sid);
	}

	@Override
	@RequestMapping(value = "findAll_Student.do")
	public List<Student> findAll(HttpServletResponse response, HttpServletRequest request) {
		return studentBiz.findAll();
	}

	@Override
	@RequestMapping(value = "findAllClazz_Student.do")
	public List<Clazz> findAllClazz(HttpServletResponse response, HttpServletRequest request) {

		return studentBiz.findAllClazz();
	}
}

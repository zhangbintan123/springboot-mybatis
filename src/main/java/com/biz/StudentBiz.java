package com.biz;

import com.mapper.StudentMapper;
import com.po.Clazz;
import com.po.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StudentBiz implements IStudentBiz {
	@Autowired
	private StudentMapper studentMapper;

	public StudentMapper getStudentMapper() {
		return studentMapper;
	}

	public void setStudentMapper(StudentMapper studentMapper) {
		this.studentMapper = studentMapper;
	}

	@Override
	public int save(Student st) {
		return studentMapper.save(st);
	}

	@Override
	public int update(Student st) {
		return studentMapper.update(st);
	}

	@Override
	public int delById(Integer sid) {
		return studentMapper.delById(sid);
	}

	@Override
	public Student findById(Integer sid) {
		return studentMapper.findById(sid);
	}

	@Override
	public List<Student> findAll() {
		return studentMapper.findAll();
	}
	public List<Clazz> findAllClazz(){
		return studentMapper.findAllClazz();
	}
}

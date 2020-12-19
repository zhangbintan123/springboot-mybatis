package com.mapper;
import com.po.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.*;
@Mapper
public interface StudentMapper {
	public  int save(Student st);
	public  int update(Student st);
	public  int delById(Integer sid);
	public  Student findById(Integer sid);
	public  List<Student> findAll();
	public List<Clazz> findAllClazz();
}

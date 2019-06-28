package learn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import learn.dao.*;
import learn.entity.*;
import learn.service.*;
import org.springframework.stereotype.Service;

/**
 * Created by Kai on 2019/4/5.
 */

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public Course selectByPrimaryKey(Integer courseId) {
        Course course = courseMapper.selectByPrimaryKey(courseId);
        return course;
    }

    @Override
    public int deleteByPrimaryKey(Integer courseId) {
        return 0;
    }

    @Override
    public int insert(Course record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeySelective(Course record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Course record) {
        return 0;
    }

    @Override
    public List<Course> selectAll() {
        return courseMapper.selectAll();
    }

    @Override
    public List<Course> selectByType(String type){
        return courseMapper.selectByType(type);
    }

    @Override
    public List<Course> search(String searchString){
        return courseMapper.search(searchString);
    }

    @Override
    public List<Course> selectFive(){
        return courseMapper.selectFive();
    }

}

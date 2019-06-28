package learn.dao;

import learn.entity.Course;
import learn.entity.CourseTypeDefine;

import java.util.List;

public interface CourseTypeDefineMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CourseTypeDefine record);

    int insertSelective(CourseTypeDefine record);

    CourseTypeDefine selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CourseTypeDefine record);

    int updateByPrimaryKey(CourseTypeDefine record);

    List<CourseTypeDefine> selectAll();

}
package learn.dao;

import learn.entity.*;
import java.util.List;

/**
 * Created by Kai on 2019/4/5.
 */


public interface CourseMapper {

    int deleteByPrimaryKey(Integer courseId);

    int insert(Course record);

    Course selectByPrimaryKey(Integer courseId);

    int updateByPrimaryKeySelective(Course record);

    int updateByPrimaryKey(Course record);

    List<Course> selectAll();

    List<Course> selectByType(String type);

    List<Course> search(String searchString);

    List<Course> selectFive();

}

package learn.service;

import learn.entity.CourseTypeDefine;

import java.util.List;

/**
 * Created by Kai on 2019/4/10.
 */
public interface CourseTypeDefineService {
    int deleteByPrimaryKey(Integer id);

    int insert(CourseTypeDefine record);

    int insertSelective(CourseTypeDefine record);

    CourseTypeDefine selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CourseTypeDefine record);

    int updateByPrimaryKey(CourseTypeDefine record);

    List<CourseTypeDefine> selectAll();

}

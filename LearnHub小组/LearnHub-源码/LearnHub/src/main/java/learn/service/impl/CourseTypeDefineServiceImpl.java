package learn.service.impl;

import learn.dao.CourseTypeDefineMapper;
import learn.entity.CourseTypeDefine;
import learn.service.CourseTypeDefineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Kai on 2019/4/10.
 */
@Service
public class CourseTypeDefineServiceImpl implements CourseTypeDefineService {

    @Autowired
    CourseTypeDefineMapper courseTypeDefineMapper;

    @Override
    public int deleteByPrimaryKey(Integer id){
        return 0;
    }

    @Override
    public int insert(CourseTypeDefine record){
        return 0;
    }

    @Override
    public int insertSelective(CourseTypeDefine record){
        return 0;
    }

    @Override
    public CourseTypeDefine selectByPrimaryKey(Integer id){
        CourseTypeDefine courseTypeDefine = courseTypeDefineMapper.selectByPrimaryKey(id);
        return courseTypeDefine;
    }

    @Override
    public int updateByPrimaryKeySelective(CourseTypeDefine record){
        return 0;
    }

    @Override
    public int updateByPrimaryKey(CourseTypeDefine record){
        return 0;
    }

    @Override
    public List<CourseTypeDefine> selectAll(){
        return courseTypeDefineMapper.selectAll();
    }

}

package learn.service.impl;

import learn.dao.ExamMapper;
import learn.entity.Exam;
import learn.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Kai on 2019/4/17.
 */
@Service
public class ExamServiceImpl implements ExamService {
    @Autowired
    private ExamMapper examMapper;

    @Override
    public int deleteByPrimaryKey(Integer id){
        return 0;
    }

    @Override
    public int insert(Exam record){
        examMapper.insert(record);
        return 0;
    }

    @Override
    public int insertSelective(Exam record){
        examMapper.insertSelective(record);
        return 0;
    }

    @Override
    public Exam selectByPrimaryKey(Integer id){
        return examMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Exam record){
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Exam record){
        return 0;
    }

    @Override
    public Exam selectExamByCourseId(Integer courseId){
        return examMapper.selectExamByCourseId(courseId);
    }

    @Override
    public List<Exam> selectAll(){
        return examMapper.selectAll();
    }
}

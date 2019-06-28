package learn.service.impl;

import learn.dao.ExamQuestionMapper;
import learn.entity.ExamQuestion;
import learn.service.ExamQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Kai on 2019/4/17.
 */
@Service
public class ExamQuestionServiceImpl implements ExamQuestionService {
    @Autowired
    private ExamQuestionMapper examQuestionMapper;

    @Override
    public int deleteByPrimaryKey(Integer id){
        return 0;
    }

    @Override
    public int insert(ExamQuestion record){
        examQuestionMapper.insert(record);
        return 0;
    }

    @Override
    public int insertSelective(ExamQuestion record){
        examQuestionMapper.insertSelective(record);
        return 0;
    }

    @Override
    public ExamQuestion selectByPrimaryKey(Integer id){
        return examQuestionMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(ExamQuestion record){
        return 0;
    }

    @Override
    public int updateByPrimaryKey(ExamQuestion record){
        return 0;
    }

    @Override
    public List<ExamQuestion> selectByExamId(Integer examId){
        return examQuestionMapper.selectByExamId(examId);
    }

}

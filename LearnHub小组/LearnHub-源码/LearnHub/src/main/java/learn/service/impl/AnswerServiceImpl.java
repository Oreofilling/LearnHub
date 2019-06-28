package learn.service.impl;

import learn.dao.AnswerMapper;
import learn.entity.Answer;
import learn.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Kai on 2019/4/12.
 */
@Service
public class AnswerServiceImpl implements AnswerService {
    @Autowired
    private AnswerMapper answerMapper;

    @Override
    public int deleteByPrimaryKey(Integer id){
        return 0;
    }

    @Override
    public int insert(Answer record){
        answerMapper.insert(record);
        return 0;
    }

    @Override
    public int insertSelective(Answer record){
        answerMapper.insertSelective(record);
        return 0;
    }

    @Override
    public Answer selectByPrimaryKey(Integer id){
        return answerMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Answer record){
        return 0;
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(Answer record){
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Answer record){
        return 0;
    }

    @Override
    public Answer selectBestByQuestionId(Integer questionId){
        return answerMapper.selectBestByQuestionId(questionId);
    }

    @Override
    public int updateCommentNum(Integer change, Integer id){
        answerMapper.updateCommentNum(change, id);
        return 0;
    }

    @Override
    public int updatePraiseNum(Integer change, Integer id){
        answerMapper.updatePraiseNum(change, id);
        return 0;
    }

    @Override
    public List<Answer> selectByQuestionId(Integer questionId){
        return answerMapper.selectByQuestionId(questionId);
    }

    @Override
    public List<Answer> selectByUserId(Integer userId){
        return answerMapper.selectByUserId(userId);
    }

}

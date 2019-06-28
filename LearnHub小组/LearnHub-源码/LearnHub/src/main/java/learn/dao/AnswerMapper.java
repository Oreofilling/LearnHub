package learn.dao;

import learn.entity.Answer;

import java.util.List;

public interface AnswerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Answer record);

    int insertSelective(Answer record);

    Answer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Answer record);

    int updateByPrimaryKeyWithBLOBs(Answer record);

    int updateByPrimaryKey(Answer record);

    Answer selectBestByQuestionId(Integer questionId);

    int updateCommentNum(Integer change, Integer id);

    int updatePraiseNum(Integer change, Integer id);

    List<Answer> selectByQuestionId(Integer questionId);

    List<Answer> selectByUserId(Integer userId);

}
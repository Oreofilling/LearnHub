package learn.dao;

import learn.entity.ExamQuestion;

import java.util.List;

public interface ExamQuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ExamQuestion record);

    int insertSelective(ExamQuestion record);

    ExamQuestion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ExamQuestion record);

    int updateByPrimaryKey(ExamQuestion record);

    List<ExamQuestion> selectByExamId(Integer examId);
}
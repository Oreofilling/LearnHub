package learn.service;

import learn.entity.ExamQuestion;

import java.util.List;

/**
 * Created by Kai on 2019/4/17.
 */
public interface ExamQuestionService {
    int deleteByPrimaryKey(Integer id);

    int insert(ExamQuestion record);

    int insertSelective(ExamQuestion record);

    ExamQuestion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ExamQuestion record);

    int updateByPrimaryKey(ExamQuestion record);

    List<ExamQuestion> selectByExamId(Integer examId);

}

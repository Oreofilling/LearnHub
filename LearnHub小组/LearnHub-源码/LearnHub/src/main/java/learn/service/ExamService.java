package learn.service;

import learn.entity.Exam;

import java.util.List;

/**
 * Created by Kai on 2019/4/17.
 */
public interface ExamService {
    int deleteByPrimaryKey(Integer id);

    int insert(Exam record);

    int insertSelective(Exam record);

    Exam selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Exam record);

    int updateByPrimaryKey(Exam record);

    Exam selectExamByCourseId(Integer courseId);

    List<Exam> selectAll();

}

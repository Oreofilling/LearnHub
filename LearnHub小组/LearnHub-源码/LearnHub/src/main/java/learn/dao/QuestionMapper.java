package learn.dao;

import learn.entity.Question;

import java.util.List;

public interface QuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Question record);

    int insertSelective(Question record);

    Question selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKeyWithBLOBs(Question record);

    int updateByPrimaryKey(Question record);

    List<Question> selectAll();

    List<Question> selectEmptyAnswer();

    List<Question> selectByType(String type);

    List<Question> selectEmptyAnswerByType(String type);

    List<Question> search(String searchString);

    int updateAnswerNum(Integer change, Integer id);

    int updateClickNum(Integer change, Integer id);

    List<Question> selectFive();
}
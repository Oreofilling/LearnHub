package learn.service;

import learn.entity.Question;
import learn.entity.QuestionAndBestAnswer;

import java.util.List;

/**
 * Created by Kai on 2019/4/12.
 */
public interface QuestionService {
    int deleteByPrimaryKey(Integer id);

    int insert(Question record);

    int insertSelective(Question record);

    Question selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKeyWithBLOBs(Question record);

    int updateByPrimaryKey(Question record);

    List<QuestionAndBestAnswer> queryQuestionAndBestAnswer(String type, int tab);

    List<Question> selectAll();

    List<Question> selectEmptyAnswer();

    List<Question> selectByType(String type);

    List<Question> selectEmptyAnswerByType(String type);

    List<Question> search(String searchString);

    List<QuestionAndBestAnswer> searchQuestionAndBestAnswer(String searchString);

    int updateAnswerNum(Integer change, Integer id);

    int updateClickNum(Integer change, Integer id);

    QuestionAndBestAnswer selectQuestionAndBestAnswer(Integer id);

    List<Question> selectFive();

    List<QuestionAndBestAnswer> selectFiveQuestionAndBestAnswer();

}

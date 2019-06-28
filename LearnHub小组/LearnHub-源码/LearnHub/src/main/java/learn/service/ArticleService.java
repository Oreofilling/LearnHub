package learn.service;

import learn.entity.Article;

import java.util.List;

/**
 * Created by Kai on 2019/4/10.
 */
public interface ArticleService {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);

    List<Article> selectAll();

    List<Article> selectByType(String type);

    List<Article> search(String searchString);

    int updateCommentNum(Integer change, Integer id);

    int updatePraiseNum(Integer change, Integer id);

    int updateClickNum(Integer change, Integer id);

    List<Article> selectByUser(Integer userId);

    List<Article> selectFive();

}

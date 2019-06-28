package learn.service.impl;

import learn.dao.ArticleMapper;
import learn.entity.Article;
import learn.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Kai on 2019/4/10.
 */
@Service
public class ArticleServiceImpl implements ArticleService{
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public int deleteByPrimaryKey(Integer id){
        articleMapper.deleteByPrimaryKey(id);
        return 0;
    }

    @Override
    public int insert(Article record){
        articleMapper.insert(record);
        return 0;
    }

    @Override
    public int insertSelective(Article record){
        return 0;
    }

    @Override
    public Article selectByPrimaryKey(Integer id){
        Article article = articleMapper.selectByPrimaryKey(id);
        return article;
    }

    @Override
    public int updateByPrimaryKeySelective(Article record){
        articleMapper.updateByPrimaryKeySelective(record);
        return 0;
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(Article record){
        return 0;
    }
    @Override
    public int updateByPrimaryKey(Article record){
        return 0;
    }

    @Override
    public List<Article> selectAll(){
        return articleMapper.selectAll();
    }
    @Override
    public List<Article> selectByType(String type){
        return articleMapper.selectByType(type);
    }

    @Override
    public List<Article> search(String searchString){
        return articleMapper.search(searchString);
    }
    @Override
    public int updateCommentNum(Integer change, Integer id){
        articleMapper.updateCommentNum(change, id);
        return 0;
    }

    @Override
    public int updatePraiseNum(Integer change, Integer id){
        articleMapper.updatePraiseNum(change, id);
        return 0;
    }

    @Override
    public int updateClickNum(Integer change, Integer id){
        articleMapper.updateClickNum(change, id);
        return 0;
    }

    @Override
    public List<Article> selectByUser(Integer userId){
        return articleMapper.selectByUser(userId);
    }

    @Override
    public List<Article> selectFive(){
        return articleMapper.selectFive();
    }

}

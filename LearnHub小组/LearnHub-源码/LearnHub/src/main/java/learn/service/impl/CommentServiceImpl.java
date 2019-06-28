package learn.service.impl;

import learn.dao.*;
import learn.entity.*;
import learn.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Kai on 2019/4/12.
 */
@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public int deleteByPrimaryKey(Integer id){
        return 0;
    }

    @Override
    public int insert(Comment record){
        commentMapper.insert(record);
        return 0;
    }

    @Override
    public int insertSelective(Comment record){
        commentMapper.insertSelective(record);
        return 0;
    }

    @Override
    public Comment selectByPrimaryKey(Integer id){
        return commentMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Comment record){
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Comment record){
        return 0;
    }

    @Override
    public List<Comment> selectCommentByCourseId(Integer comment_ref_id){
        return commentMapper.selectCommentByCourseId(comment_ref_id);
    }

    @Override
    public List<Comment> selectCommentByArticleId(Integer comment_ref_id){
        return commentMapper.selectCommentByArticleId(comment_ref_id);
    }

    @Override
    public List<Comment> selectCommentByAnswerId(Integer comment_ref_id){
        return commentMapper.selectCommentByAnswerId(comment_ref_id);
    }

    @Override
    public int updateReplyNum(Integer change, Integer id){
        commentMapper.updateReplyNum(change, id);
        return 0;
    }

    @Override
    public int updatePraiseNum(Integer change, Integer id){
        commentMapper.updatePraiseNum(change, id);
        return 0;
    }

    @Override
    public int deleteByRefId(Integer refId){
        commentMapper.deleteByRefId(refId);
        return 0;
    }
}

package learn.service;

import learn.entity.Comment;

import java.util.List;

/**
 * Created by Kai on 2019/4/12.
 */
public interface CommentService {

    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);

    List<Comment> selectCommentByCourseId(Integer comment_ref_id);

    List<Comment> selectCommentByArticleId(Integer comment_ref_id);

    List<Comment> selectCommentByAnswerId(Integer comment_ref_id);

    int updateReplyNum(Integer change, Integer id);

    int updatePraiseNum(Integer change, Integer id);

    int deleteByRefId(Integer refId);
}

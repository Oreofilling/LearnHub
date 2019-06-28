package learn.dao;

import learn.entity.Reply;

import java.util.List;

public interface ReplyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Reply record);

    int insertSelective(Reply record);

    Reply selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKey(Reply record);

    List<Reply> selectReplyByCourseId(Integer reply_ref_id);

    List<Reply> selectReplyByArticleId(Integer reply_ref_id);

    List<Reply> selectReplyByAnswerId(Integer reply_ref_id);

    int updatePraiseNum(Integer change, Integer id);

    int deleteByRefId(Integer refId);

}
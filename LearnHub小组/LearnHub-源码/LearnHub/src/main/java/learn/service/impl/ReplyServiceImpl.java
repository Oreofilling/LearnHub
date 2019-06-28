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
public class ReplyServiceImpl implements ReplyService{
    @Autowired
    private ReplyMapper replyMapper;

    @Override
    public int deleteByPrimaryKey(Integer id){
        return 0;
    }

    @Override
    public int insert(Reply record){
        replyMapper.insert(record);
        return 0;
    }

    @Override
    public int insertSelective(Reply record){
        replyMapper.insertSelective(record);
        return 0;
    }

    @Override
    public Reply selectByPrimaryKey(Integer id){
        return replyMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Reply record){
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Reply record){
        return 0;
    }

    @Override
    public List<Reply> selectReplyByCourseId(Integer reply_ref_id){
        return replyMapper.selectReplyByCourseId(reply_ref_id);
    }

    @Override
    public List<Reply> selectReplyByArticleId(Integer reply_ref_id){
        return replyMapper.selectReplyByArticleId(reply_ref_id);
    }

    @Override
    public List<Reply> selectReplyByAnswerId(Integer reply_ref_id){
        return replyMapper.selectReplyByAnswerId(reply_ref_id);
    }

    @Override
    public int updatePraiseNum(Integer change, Integer id){
        replyMapper.updatePraiseNum(change, id);
        return 0;
    }

    @Override
    public int deleteByRefId(Integer refId){
        replyMapper.deleteByRefId(refId);
        return 0;
    }
}

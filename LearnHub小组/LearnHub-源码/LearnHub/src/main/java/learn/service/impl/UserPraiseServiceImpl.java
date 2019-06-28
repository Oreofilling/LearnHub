package learn.service.impl;

import learn.dao.UserPraiseMapper;
import learn.entity.UserPraise;
import learn.service.UserPraiseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Kai on 2019/4/19.
 */
@Service
public class UserPraiseServiceImpl implements UserPraiseService {
    @Autowired
    private UserPraiseMapper userPraiseMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        userPraiseMapper.deleteByPrimaryKey(id);
        return 0;
    }

    @Override
    public int insert(UserPraise record) {
        userPraiseMapper.insert(record);
        return 0;
    }

    @Override
    public int insertSelective(UserPraise record) {
        return 0;
    }

    @Override
    public UserPraise selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(UserPraise record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(UserPraise record) {
        return 0;
    }

    @Override
    public UserPraise selectByUserIdAndPraiseId(Integer userId, Integer praiseId, Integer type){
        return userPraiseMapper.selectByUserIdAndPraiseId(userId, praiseId, type);
    }
}

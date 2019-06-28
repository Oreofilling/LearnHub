package learn.service;

import learn.entity.UserPraise;

/**
 * Created by Kai on 2019/4/19.
 */
public interface UserPraiseService {
    int deleteByPrimaryKey(Integer id);

    int insert(UserPraise record);

    int insertSelective(UserPraise record);

    UserPraise selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserPraise record);

    int updateByPrimaryKey(UserPraise record);

    UserPraise selectByUserIdAndPraiseId(Integer userId, Integer praiseId, Integer type);

}

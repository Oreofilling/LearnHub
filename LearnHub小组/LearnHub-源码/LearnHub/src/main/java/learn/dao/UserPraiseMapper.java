package learn.dao;

import learn.entity.UserPraise;

public interface UserPraiseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserPraise record);

    int insertSelective(UserPraise record);

    UserPraise selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserPraise record);

    int updateByPrimaryKey(UserPraise record);

    UserPraise selectByUserIdAndPraiseId(Integer userId, Integer praiseId, Integer type);
}
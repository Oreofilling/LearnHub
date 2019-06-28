package learn.dao;

import learn.entity.UserFocus;

import java.util.List;

public interface UserFocusMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserFocus record);

    int insertSelective(UserFocus record);

    UserFocus selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserFocus record);

    int updateByPrimaryKey(UserFocus record);

    UserFocus selectByUserIdAndFocusId(Integer userId, Integer focusId, Integer type);

    List<UserFocus> selectByUserId(Integer userId);
}
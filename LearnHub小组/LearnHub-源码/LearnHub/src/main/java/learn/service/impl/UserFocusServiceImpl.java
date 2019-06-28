package learn.service.impl;

import learn.dao.UserFocusMapper;
import learn.entity.UserFocus;
import learn.service.UserFocusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Kai on 2019/4/18.
 */
@Service
public class UserFocusServiceImpl implements UserFocusService {
    @Autowired
    private UserFocusMapper userFocusMapper;

    @Override
    public int deleteByPrimaryKey(Integer id) {
        userFocusMapper.deleteByPrimaryKey(id);
        return 0;
    }

    @Override
    public int insert(UserFocus record) {
        userFocusMapper.insert(record);
        return 0;
    }

    @Override
    public int insertSelective(UserFocus record) {
        return 0;
    }

    @Override
    public UserFocus selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(UserFocus record) {
        userFocusMapper.updateByPrimaryKeySelective(record);
        return 0;
    }

    @Override
    public int updateByPrimaryKey(UserFocus record) {
        return 0;
    }

    @Override
    public UserFocus selectByUserIdAndFocusId(Integer userId, Integer focusId, Integer type) {
        return userFocusMapper.selectByUserIdAndFocusId(userId, focusId, type);
    }

    @Override
    public List<UserFocus> selectByUserId(Integer userId){
        return userFocusMapper.selectByUserId(userId);
    }
}

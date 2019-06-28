package learn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import learn.dao.*;
import learn.entity.*;
import learn.service.*;

/**
 * Created by Kai on 2019/4/4.
 */


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User selectById(Integer id) {
        User user = userMapper.selectById(id);
        return user;
    }

    @Override
    public void save(User user) {
        userMapper.insert(user);

    }

    @Override
    public User selectByUsername(String username) {
        return userMapper.selectByUsername(username);
    }

    @Override
    public boolean userIsExist(String username) {
        User user = userMapper.selectByUsername(username);
        if(user == null){
            return false;
        }else{
            return true;
        }
    }

    @Override
    public List<User> selectAll() {
        return userMapper.selectAll();
    }

    @Override
    public void deleteById(Integer id) {
        userMapper.deleteById(id);
    }

    @Override
    public User checkLogin(String username, String password) {

        User user = userMapper.selectByUsername(username);
        if(user != null && user.getPassword().equals(password)){
            return user;
        }
        return null;
    }

    @Override
    public int updateByIdSelective(User record){
        userMapper.updateByIdSelective(record);
        return 0;
    }
}

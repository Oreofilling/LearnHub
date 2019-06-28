package learn.service;

import learn.entity.*;
import java.util.List;

/**
 * Created by Kai on 2019/4/4.
 */

public interface UserService {

    List<User> selectAll();

    User selectById(Integer id);

    User selectByUsername(String username);

    void save(User user);

    boolean userIsExist(String username);

    void deleteById(Integer id);

    User checkLogin(String username, String password);

    int updateByIdSelective(User record);

}
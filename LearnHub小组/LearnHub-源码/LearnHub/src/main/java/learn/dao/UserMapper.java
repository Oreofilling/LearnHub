package learn.dao;

import learn.entity.*;
import java.util.List;

/**
 * Created by Kai on 2019/4/4.
 */

public interface UserMapper {

    void deleteById(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectAll();

    User selectById(Integer id);

    User selectByUsername(String username);

    int updateByIdSelective(User record);

    int updateById(User record);
}

package com.train.modules.test.dao;

import com.train.modules.test.entity.Test;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017/4/11 0011.
 */
@Repository
public interface TestDao {
    public void addUser(Test test);
}

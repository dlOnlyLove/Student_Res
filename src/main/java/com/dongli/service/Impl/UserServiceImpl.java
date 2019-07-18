package com.dongli.service.Impl;


import com.dongli.dao.UserDao;
import com.dongli.entity.User;
import com.dongli.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Override
    public User selectUserByAccount(Map<String, Object> map) {
        return userDao.selectUserByAccount(map);
    }

    public User selectSchoolOfUser(String account) {
     return userDao.selectSchoolOfUser(account);
    }

    public User selectStudentOfUser(String account) {
        return userDao.selectStudentOfUser(account);
    }

    public void insertUser(User user) {
        userDao.insertUser(user);
    }

    public boolean selectUserByPhoneAndAccount(Map<String, Object> map) {
        if (userDao.selectUserByPhoneAndAccount(map) > 0) {
            return true;
        } else {
            return false;
        }
    }

    public int updatePwdByAccount(Map<String, Object> map) {
        return userDao.updatePwdByAccount(map);
    }
}

package com.dongli.service;


import com.dongli.entity.User;

import java.util.Map;

public interface UserService {
    User selectUserByAccount(Map<String, Object> map);
    User selectSchoolOfUser(String account);
    User selectStudentOfUser(String account);
    void insertUser(User user);
    boolean selectUserByPhoneAndAccount(Map<String, Object> map);
    int updatePwdByAccount(Map<String, Object> map);
}

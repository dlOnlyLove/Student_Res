package com.dongli.dao;




import com.dongli.entity.User;

import java.util.Map;

public interface UserDao {
    User selectUserByAccount(Map<String, Object> map); // 查找用户
    User selectSchoolOfUser(String account); // 查找教务处管理员
    User selectStudentOfUser(String account); // 查找学生
    void insertUser(User user); // 添加新用户
    int selectUserByPhoneAndAccount(Map<String, Object> map); // 短信验证码确认用户
    int updatePwdByAccount(Map<String, Object> map); // 找回密码后重置密码
}

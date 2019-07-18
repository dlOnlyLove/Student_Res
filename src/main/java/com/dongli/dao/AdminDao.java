package com.dongli.dao;

import com.dongli.entity.Admin;
import com.dongli.entity.School;
import com.dongli.entity.Student;

import java.util.List;
import java.util.Map;

public interface AdminDao {
    //查看个人信息
    Admin selectByAccount(String account);

    //更新个人信息
    int updateProfileByAccount(Admin admin);

    //查询教务管理员角色状态
    List<School> selectSchoolRoleState();

    //查询学生角色状态
    List<Student> selectStudentRoleState();

    //更改用户角色状态
    int changeSchoolStateByAccount(School school);

    int changeStudentStateByIDNum(Student student);

    int resetPwd(Map<String, Object> map); // 修改管理员密码

    int resetUserPwd(Map<String, Object> map); // 修改用户密码

}

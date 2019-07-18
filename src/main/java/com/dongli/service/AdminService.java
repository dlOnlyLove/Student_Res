package com.dongli.service;

import com.dongli.entity.Admin;
import com.dongli.entity.School;
import com.dongli.entity.Student;

import java.util.Map;

public interface AdminService {
    Admin selectByAccount(String account);
    int updateProfileByAccount(Admin admin);
    Map<String, Object> selectAllRoleState();
    int changeSchoolStateByAccount(School school);
    int changeStudentStateByIDNum(Student student);
    int resetPwd(Map<String, Object> map);
    int resetUserPwd(Map<String, Object> map);
}

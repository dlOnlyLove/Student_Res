package com.dongli.service.Impl;

import com.dongli.dao.AdminDao;
import com.dongli.entity.Admin;
import com.dongli.entity.School;
import com.dongli.entity.Student;
import com.dongli.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDao adminDao;

    public Admin selectByAccount(String account) {
        return adminDao.selectByAccount(account);
    }

    public int updateProfileByAccount(Admin admin) {
        return adminDao.updateProfileByAccount(admin);
    }

    public Map<String, Object> selectAllRoleState() {
        Map<String, Object> map = new HashMap<>();
        List<School> schoolList;
        schoolList = adminDao.selectSchoolRoleState();
        List<Student> studentList;
        studentList = adminDao.selectStudentRoleState();
        map.put("schools", schoolList);
        map.put("students", studentList);
        return map;
    }

    public int changeSchoolStateByAccount(School school) {
        return adminDao.changeSchoolStateByAccount(school);
    }

    public int changeStudentStateByIDNum(Student student) {
        return adminDao.changeStudentStateByIDNum(student);
    }

    public int resetPwd(Map<String, Object> map) {
        return adminDao.resetPwd(map);
    }

    public int resetUserPwd(Map<String, Object> map) {
        return adminDao.resetUserPwd(map);
    }
}

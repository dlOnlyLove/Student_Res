package com.dongli.service.Impl;

import com.dongli.dao.StudentDao;
import com.dongli.entity.Pay;
import com.dongli.entity.Room;
import com.dongli.entity.Student;
import com.dongli.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.IDN;
import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    StudentDao studentDao;

    public List<Room> selectRoom() {
        return studentDao.selectRoom();
    }

    public Student selectByIDNum(String IDNum) {
        return studentDao.selectByIDNum(IDNum);
    }

    public int updateByIDNum(Student student) {
        return studentDao.updateByIDNum(student);
    }

    public int updatePwdByIDNum(Student student) {
        return studentDao.updatePwdByIDNum(student);
    }

    public int updateGreen(Map<String, Object> map) {
        return studentDao.updateGreen(map);
    }

    public int updateRoomByRno(Room room) {
        return studentDao.updateRoomByRno(room);
    }

    public int updateRooomOfStudentByIDNum(Student student) {
        return studentDao.updateRooomOfStudentByIDNum(student);
    }

    public String selectGreenByIDNum(String IDNum) {
        return studentDao.selectGreenByIDNum(IDNum);
    }

    public int updatePay(Map<String, Object> map) {
        return studentDao.updatePay(map);
    }

    public Pay selectPayByIDNum(String IDNum) {
        return studentDao.selectPayByIDNum(IDNum);
    }

    public void updateResByIDNum(String IDNum) {
        studentDao.updateResByIDNum(IDNum);
    }

}

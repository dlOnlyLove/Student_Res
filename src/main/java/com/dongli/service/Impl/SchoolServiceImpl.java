package com.dongli.service.Impl;

import com.dongli.dao.SchoolDao;
import com.dongli.entity.Pay;
import com.dongli.entity.Room;
import com.dongli.entity.School;
import com.dongli.entity.Student;
import com.dongli.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SchoolServiceImpl implements SchoolService {
    @Autowired
    SchoolDao schoolDao;
    public void insertSchool(School school) {
        schoolDao.insertSchool(school);
    }

    public List<School> selectAllSchool() {
        return schoolDao.selectAllSchool();
    }

    public int insertStudent(Student student) {
        return schoolDao.insertStudent(student);
    }

    public int selectStudentByIDNum(String IDNum) {
        return schoolDao.selectStudentByIDNum(IDNum);
    }

    public List<Student> selectAllStudent() {
        return schoolDao.selectAllStudent();
    }

    public List<Room> selectAllRoom() {
        return schoolDao.selectAllRoom();
    }

    public Map<String, Object> selectSex() {
        return schoolDao.selectSex();
    }

    public Map<String, Object> selectAll() {
        return schoolDao.selectAll();
    }

    public int insertRoom(Room room) {
       return schoolDao.insertRoom(room);
    }

    public int updateRoom(Room room) {
        return schoolDao.updateRoom(room);
    }

    public int deleteRoom(Room room) {
        return schoolDao.deleteRoom(room);
    }

    public List<Pay> selectAllPay() {
        return schoolDao.selectAllPay();
    }

    public int deleteStudent(String IDNum) {
        return schoolDao.deleteStudent(IDNum);
    }

    public int updateStudent(Student student) {
        return schoolDao.updateStudent(student);
    }

    public List<Pay> selectGreen() {
        return schoolDao.selectGreen();
    }

    public void greenAction(Pay pay) {
        schoolDao.greenAction(pay);
    }

    public int initPay(Student student) {
        return schoolDao.initPay(student);
    }

    public int initUser(Student student) {
        return schoolDao.initUser(student);
    }

    public int deletePayByIDNum(String IDNum) {
        return schoolDao.deletePayByIDNum(IDNum);
    }

    public int deleteUserByIDNum(String IDNum) {
        return schoolDao.deleteUserByIDNum(IDNum);
    }

    public int updateRoomOfStudent(String rno) {
        return schoolDao.updateRoomOfStudent(rno);
    }
}

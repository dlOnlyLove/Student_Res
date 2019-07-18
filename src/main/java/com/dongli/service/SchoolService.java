package com.dongli.service;

import com.dongli.entity.Pay;
import com.dongli.entity.Room;
import com.dongli.entity.School;
import com.dongli.entity.Student;

import java.util.List;
import java.util.Map;

public interface SchoolService {
    void insertSchool(School school);
    List<School> selectAllSchool();
    int insertStudent(Student student);
    int selectStudentByIDNum(String IDNum);
    List<Student> selectAllStudent();
    List<Room> selectAllRoom();
    Map<String, Object> selectSex();
    Map<String, Object> selectAll();
    int insertRoom(Room room);
    int updateRoom(Room room);
    int deleteRoom(Room room);
    List<Pay> selectAllPay();
    int deleteStudent(String IDNum);
    int updateStudent(Student student);
    List<Pay> selectGreen();
    void greenAction(Pay pay);
    int initPay(Student student);
    int initUser(Student student);
    int deletePayByIDNum(String IDNum);
    int deleteUserByIDNum(String IDNum);
    int updateRoomOfStudent(String rno);
}

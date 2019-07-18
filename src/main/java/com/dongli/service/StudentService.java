package com.dongli.service;

import com.dongli.entity.Pay;
import com.dongli.entity.Room;
import com.dongli.entity.Student;

import java.util.List;
import java.util.Map;

public interface StudentService {
    List<Room> selectRoom();
    Student selectByIDNum(String IDNum);
    int updateByIDNum(Student student);
    int updatePwdByIDNum(Student student);
    int updateGreen(Map<String, Object> map);
    int updateRoomByRno(Room room);
    int updateRooomOfStudentByIDNum(Student student);
    String selectGreenByIDNum(String IDNum);
    int updatePay(Map<String, Object> map);
    Pay selectPayByIDNum(String IDNum);
    void updateResByIDNum(String IDNum);
}

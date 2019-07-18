package com.dongli.dao;

import com.dongli.entity.Pay;
import com.dongli.entity.Room;
import com.dongli.entity.Student;

import java.util.List;
import java.util.Map;

public interface StudentDao {
    List<Room> selectRoom(); // 查找所有的寝室
    Student selectByIDNum(String IDNum); // 根据身份证号查找学生
    int updateByIDNum(Student student); // 根据身份证号更新学生
    int updatePwdByIDNum(Student student); // 根据身份证号修改密码
    int updateGreen(Map<String, Object> map); // 申请绿色通道
    int updateRoomByRno(Room room); // 更新寝室信息
    int updateRooomOfStudentByIDNum(Student student); // 更新学生中的寝室信息
    String selectGreenByIDNum(String IDNum); // 根据身份证号查询绿色通道审核信息
    Pay selectPayByIDNum(String IDNum); // 根据身份证号查询缴费信息
    int updatePay(Map<String, Object> map); // 更新支付状态
    void updateResByIDNum(String IDNum); // 根据身份证更新报到状态
}

package com.dongli.dao;

import com.dongli.entity.Pay;
import com.dongli.entity.Room;
import com.dongli.entity.School;
import com.dongli.entity.Student;

import java.util.List;
import java.util.Map;

public interface SchoolDao {
    void insertSchool(School school); // 增加教务处管理员
    List<School> selectAllSchool(); // 查询所有教务处管理员
    int insertStudent(Student student); // 添加学生
    int selectStudentByIDNum(String IDNum); // 根据身份证号查询学生
    List<Student> selectAllStudent(); // 查询所有学生
    List<Room> selectAllRoom(); // 查询所有班级
    Map<String, Object> selectSex(); // 查询报到的男女人数
    Map<String, Object> selectAll(); // 查询全校报到情况
    int insertRoom(Room room); // 增加寝室
    int updateRoom(Room room); // 修改寝室
    int deleteRoom(Room room); // 删除寝室
    List<Pay> selectAllPay(); // 查询交费记录
    int deleteStudent(String IDNum); // 删除学生
    int updateStudent(Student student); // 更新学生
    List<Pay> selectGreen(); // 绿色通道审核
    void greenAction(Pay pay); // 绿色通道状态更改
    int initPay(Student student); // 初始化缴费信息
    int initUser(Student student); // 初始化账户
    int deletePayByIDNum(String IDNum); // 根据身份证号删除缴费信息
    int deleteUserByIDNum(String IDNum); // 根据身份证号删除账户信息
    int updateRoomOfStudent(String rno); // 根据寝室号更新学生寝室状态
}

package com.dongli.controller;

import com.dongli.entity.Pay;
import com.dongli.entity.Room;
import com.dongli.entity.Student;
import com.dongli.service.SchoolService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("school")
public class SchoolController {
    @Autowired
    SchoolService schoolService;

    /*=========== 学生信息导入导出 Start ===========*/
    // 主页
    @RequestMapping("schoolinandout")
    public String inAndOut(Model model) {
        List<Student> students;
        students = schoolService.selectAllStudent();
        model.addAttribute("students", students);
        return "school/schoolinandout";
    }

    // 文件上传
    @RequestMapping("fileUpload")
    public String fileUpload(MultipartFile file, HttpServletRequest request, Model model, HttpSession session) {
        /*=========== 将文件保存到服务器 Start ===========*/
        String savePath = request.getServletContext().getRealPath("upload/");
        String fileName = "a.xls";
        File newFile = new File(savePath + fileName); // 新文件
        System.out.println(newFile);
        if(!newFile.exists()) {
            newFile.mkdirs();
        }
        try{
            file.transferTo(newFile); // 将内存中的数据写入磁盘
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        /*=========== 将文件保存到服务器 End ===========*/


        /*=========== 读取服务器上的Excel文件 Start ===========*/
        String excelPath = savePath + fileName;
        try{
            File excel = new File(excelPath);
            if(excel.isFile() && excel.exists()) {
                String[] split = excel.getName().split("\\.");
                Workbook wb;
                if("xls".equals(split[1])) {
                    FileInputStream fis = new FileInputStream(excel);
                    wb = new HSSFWorkbook(fis);
                } else if("xlsx".equals(split[1])) {
                    wb = new XSSFWorkbook(excel);
                } else {
                    System.out.println("文件类型错误!");
                    return "";
                }


                /*=========== 解析Excel文件 Start ===========*/
                List<Student> students = new ArrayList<>();
                Sheet sheet = wb.getSheetAt(0);
                int firstRowIndex = sheet.getFirstRowNum() + 1; // 跳过第一行为列名
                int lastRowIndex = sheet.getLastRowNum();

                for(int rIndex = firstRowIndex; rIndex <= lastRowIndex; rIndex++) { // 遍历行
                    Row row = sheet.getRow(rIndex);
                    Student student;

                    if (row != null) { // 遍历列
                        float f = Float.valueOf(row.getCell(3).toString());
                        Integer age = (int)Math.ceil(f);
                        student = new Student(row.getCell(0).toString(),row.getCell(1).toString(),
                                row.getCell(2).toString(),age,row.getCell(4).toString(),row.getCell(5).toString(),
                                row.getCell(6).toString(),row.getCell(7).toString(),row.getCell(8).toString());
                        students.add(student);
                    }
                }
                session.setAttribute("students", students);
                model.addAttribute("students", students);
                /*=========== 解析Excel文件 End ===========*/


            } else {
                System.out.println("系统找不到指定文件!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        /*=========== 读取服务器上的Excel文件 End ===========*/


        return "school/showstudent";
    }


    // 错误信息回显
    @RequestMapping("repeatInfo")
    public String repeatInfo(HttpSession session, Model model) {
        List<Student> students = (ArrayList<Student>)session.getAttribute("students"); // 获取数据
        List<Student> errorStudents = new ArrayList<>();
        for(int i = 0; i < students.size(); i++) {

            if(schoolService.selectStudentByIDNum(students.get(i).getIDNum()) != 0) { // 判断数据是否已存在
                errorStudents.add(students.get(i));
                continue;
            }

            schoolService.insertStudent(students.get(i)); // 插入数据
            schoolService.initPay(students.get(i)); // 插入缴费信息
            schoolService.initUser(students.get(i)); // 插入账户信息

        }
        model.addAttribute("errorStudents", errorStudents);
        String result;
        result = errorStudents.size() > 0 ? "school/errorstudent" : "redirect:schoolinandout";
        return result;
    }


    // 删除学生
    @RequestMapping("deleteStudent")
    @ResponseBody
    public Map deleteStudent(String IDNum) {
        Map map = new HashMap();
        String msg;
        schoolService.deletePayByIDNum(IDNum);
        schoolService.deleteUserByIDNum(IDNum);
        msg = schoolService.deleteStudent(IDNum) != 0 ? "删除成功！" : "删除失败！";
        map.put("msg", msg);
        return map;
    }

    // 查看学生是否重复
    @RequestMapping("selectStudent")
    @ResponseBody
    public Map selectStudent(String IDNum) {
        Map map = new HashMap();
        String msg;
        msg = schoolService.selectStudentByIDNum(IDNum) > 0 ? "身份证号已存在!" : "可以使用!";
        map.put("msg", msg);
        return map;
    }

    // 添加学生
    @RequestMapping("addStudent")
    @ResponseBody
    public Map addStudent(Student student) {
        Map map = new HashMap();
        String msg;
        schoolService.initPay(student);
        schoolService.initUser(student);
        msg = schoolService.insertStudent(student) > 0 ? "添加成功!" : "添加失败!";
        map.put("msg", msg);
        return map;
    }

    // 更新学生
    @RequestMapping("updateStudent")
    @ResponseBody
    public Map updateStudent(Student student) {
        Map map = new HashMap();
        String msg;
        msg = schoolService.updateStudent(student) > 0 ? "更新成功！" : "更新失败！";
        map.put("msg", msg);
        return map;
    }


    /*=========== 学生信息导入导出 End ===========*/




    @RequestMapping("reportStatistics")
    public String reportStatistics() {
        return "school/reportstatistics";
    }

    // 班级报到统计
    @RequestMapping("report")
    @ResponseBody
    public List<Room> report() {
        return schoolService.selectAllRoom();
    }

    // 男女报到统计
    @RequestMapping("reportSex")
    @ResponseBody
    public Map<String, Object> reportSex() {
        return schoolService.selectSex();
    }

    // 全校报到统计
    @RequestMapping("reportAll")
    @ResponseBody
    public Map<String, Object> reportAll() {
        return schoolService.selectAll();
    }



    /* 绿色通道审核 */



    /*=========== 学生寝室管理 Start ===========*/

    // 选择寝室主页
    @RequestMapping("roomIndex")
    public String room(Model model) {
        List<Room> rooms = schoolService.selectAllRoom();
        model.addAttribute("rooms", rooms);
        return "school/room";
    }

    // 添加新寝室
    @RequestMapping("addRoom")
    @ResponseBody
    public Map addRoom(Room room) {
        Map map = new HashMap();
        String msg;
        msg = schoolService.insertRoom(room) != 0 ? "添加成功！" : "添加失败！";
        map.put("msg", msg);
        return map;
    }

    // 修改寝室
    @RequestMapping("updateRoom")
    @ResponseBody
    public Map updateRoom(Room room) {
        Map map = new HashMap();
        String msg;
        msg = schoolService.updateRoom(room) != 0 ? "更新成功！" : "更新失败！";
        map.put("msg", msg);
        return map;
    }

    // 删除寝室
    @RequestMapping("deleteRoom")
    @ResponseBody
    public Map deleteRoom(Room room) {
        Map map = new HashMap();
        String rno = room.getRno();
        String msg;
        schoolService.updateRoomOfStudent(rno);
        msg = schoolService.deleteRoom(room) != 0 ? "删除成功！" : "删除失败！";
        map.put("msg", msg);
        return map;
    }

    /*=========== 学生寝室管理 End ===========*/


    /*=========== 学生缴费管理 Start ===========*/
    // 付款记录主页
    @RequestMapping("payIndex")
    public String payIndex(Model model) {
        List<Pay> pays = schoolService.selectAllPay();
        model.addAttribute("pays", pays);
        return "school/pay";
    }

    /*=========== 学生缴费管理 End ===========*/


    /*=========== 绿色通道管理 Start ===========*/
    // 主页
    @RequestMapping("greenIndex")
    public String green(Model model) {
        List<Pay> pays;
        pays = schoolService.selectGreen();
        model.addAttribute("greens", pays);
        return "school/green";
    }

    @RequestMapping("greenAction")
    public String greenAction(Pay pay) {
        if(pay.getGreen().equals("审核通过")) {
            pay.setResult("已完成");
        } else {
            pay.setResult("未完成");
        }
        schoolService.greenAction(pay);
        return "redirect:greenIndex";
    }
    /*=========== 绿色通道管理 End ===========*/

}

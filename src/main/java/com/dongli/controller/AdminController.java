//file.encoding is UTF-8
package com.dongli.controller;

import com.dongli.entity.*;
import com.dongli.service.AdminService;
import com.dongli.service.RoleService;
import com.dongli.service.SchoolService;
import com.dongli.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    SchoolService schoolService;
    @Autowired
    AdminService adminService;
    @Autowired
    RoleService roleService;
    @Autowired
    UserService userService;

    @RequestMapping("index")
    public String index() {
        return "admin/admin";
    }

    @RequestMapping("schoolRes")
    public String schoolRes(HttpSession session, Model model) {
        model.addAttribute("custom", session.getAttribute("custom"));
        return "admin/adminschoolres";
    }

    @RequestMapping("schoolInfo")
    public String schoolInfo(HttpSession session, Model model) {
        List<School> list;
        list = schoolService.selectAllSchool();
        model.addAttribute("custom", session.getAttribute("custom"));
        model.addAttribute("schools", list);
        return "admin/adminschoolinfo";
    }

    @RequestMapping("roleCat")
    public String roleCat(HttpSession session, Model model) {
        List<Role> list;
        list = roleService.selectAllRole();
        model.addAttribute("custom", session.getAttribute("custom"));
        model.addAttribute("roles", list);
        return "admin/adminrolecat";
    }

    @RequestMapping("roleCatAction")
    public String roleCatAction(HttpSession session, String roleName, Model model) {
        List<Role> list;
        list = roleService.selectRoleByName(roleName);
        model.addAttribute("custom", session.getAttribute("custom"));
        model.addAttribute("roles", list);
        return "admin/adminrolecat";
    }

    @RequestMapping("schoolResAction")
    public String schoolResAction(School school) {
        schoolService.insertSchool(school);
        User user = new User();
        user.setAccount(school.getAccount());
        user.setPassword("123456");
        user.setRole(1);
        userService.insertUser(user);
        return "admin/adminschoolres";
    }

    /*========== 角色管理开始 ==========*/
    @RequestMapping("roleManager")
    public String roleManager(HttpSession session, Model model) {
        Map<String, Object> map;
        map = adminService.selectAllRoleState();
        model.addAttribute("custom", session.getAttribute("custom"));
        model.addAttribute("map", map);
        return "admin/adminrolemanager";
    }

    @RequestMapping("changeState")
    @ResponseBody
    public Map changeState(School school) {
        Map map = new HashMap();
        if(adminService.changeSchoolStateByAccount(school) == 1) {
            map.put("msg", "操作成功!");
        } else {
            map.put("msg", "操作失败! 请刷新页面");
        }
        return map;
    }

    @RequestMapping("changeStateOfStu")
    @ResponseBody
    public Map changeStateOfStu(Student student) {
        Map map = new HashMap();
        if(adminService.changeStudentStateByIDNum(student) == 1) {
            map.put("msg", "操作成功!");
        } else {
            map.put("msg", "操作失败! 请刷新页面");
        }
        return map;
    }
    /*========== 角色管理结束 ==========*/

    /*========== 重置密码开始 ==========*/
    @RequestMapping("pwdReset")
    public String pwdReset() {
        return "admin/adminpwdreset";
    }

    @RequestMapping("userPwdReset")
    public String userPwdReset() {
        return "admin/adminresetusrpwd";
    }

    @RequestMapping("resetPwdAction")
    @ResponseBody
    public Map resetPwdAction(String oldPwd, String newPwd, String confirmPwd, HttpSession session) {
        String account = (String)session.getAttribute("custom");
        int result;
        Map<String, Object> map = new HashMap<>();
        map.put("password", confirmPwd);
        map.put("account", account);
        result = adminService.resetPwd(map);
        map.clear();
        map.put("msg", result == 0 ? "修改失败!" : "修改成功!");
        return map;
    }

    @RequestMapping("resetUserPwdAction")
    @ResponseBody
    public Map resetUserPwdAction(String account, String newPwd, String confirmPwd, HttpSession session) {
        int result;
        Map<String, Object> map = new HashMap<>();
        map.put("account", account);
        if (userService.selectUserByAccount(map) == null) {
            map.clear();
            map.put("msg", "此用户不存在!");
        } else {
            map.put("password", confirmPwd);
            result = adminService.resetUserPwd(map);
            map.clear();
            map.put("msg", result == 0 ? "修改失败!" : "修改成功!");
        }
        return map;
    }


    /*========== 重置密码结束 ==========*/

    @RequestMapping("profileEdit")
    @ResponseBody
    public Admin profileEdit(String account) {
        Admin admin;
        admin = adminService.selectByAccount(account);
        return admin;
    }

    @RequestMapping("profileSave")
    @ResponseBody
    public Map profileSave(Admin admin) {
        Map<String, Object> map = new HashMap<>();
        String msg = adminService.updateProfileByAccount(admin) == 0 ? "保存失败!" : "保存成功!";
        map.put("msg", msg);
        return map;
    }
}

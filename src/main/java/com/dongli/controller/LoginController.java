package com.dongli.controller;

import com.dongli.service.UserService;
import com.dongli.util.SendMsgUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@Controller
public class LoginController {
    @Autowired
    UserService userService;

    /*=========== 用户登录 Start ===========*/
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String userLogin() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView userLoginAction(HttpSession session, String username, String password, String role) {
        ModelAndView mav = new ModelAndView();
        try {
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            Subject subject = SecurityUtils.getSubject();
            ((Subject) subject).login(token);
            String viewName;
            if (role.equals("admin")) {
                viewName = "redirect:admin/index";
            } else if (role.equals("school")) {
                viewName = "redirect:school/schoolinandout";
            } else {
                viewName = "redirect:student/index";
            }
            // 在Session中加入当前登录用户
            if (subject.hasRole(role)) {
                session.setAttribute("custom", subject.getPrincipal());
                mav.setViewName(viewName);
                mav.addObject("custom", session.getAttribute("custom"));
            } else {
                String errorMsg = "您没有操作权限!";
                mav.addObject("errorMsg", errorMsg);
                mav.setViewName("login");
            }
        } catch (UnknownAccountException e) {
            String errorMsg = "当前用户不存在!";
            mav.addObject("errorMsg", errorMsg);
            mav.setViewName("login");
        } catch (IncorrectCredentialsException e) {
            String errorMsg = "用户密码错误!";
            mav.addObject("errorMsg", errorMsg);
            mav.setViewName("login");
        } catch (DisabledAccountException e) {
            String errorMsg = "账户已停用! 请联系管理员";
            mav.addObject("errorMsg", errorMsg);
            mav.setViewName("login");
        }
        return mav;
    }

    /*=========== 用户登录 End ===========*/


    /*=========== 找回密码 Start ===========*/
    @RequestMapping("forgetPwd")
    public String forgetPwd() {
        return "forgetPwd";
    }

    @ResponseBody
    @RequestMapping("sendMe")
    public Map<String, Object> sendme(String account, String tel, HttpSession session) throws IOException {
        // 验证用户和密码是否对应
        Map<String, Object> map = new HashMap<>();
        String msg;
        map.put("account", account);
        map.put("tel", tel);
        if(userService.selectUserByPhoneAndAccount(map)) {
            // 发送验证码
            HashMap<String, String> hashMap = SendMsgUtil.getMessageStatus(tel);
            String result = hashMap.get("result");
            if(result.trim().equals("1")) {
                String code = hashMap.get("code");
                session.setAttribute("code", code);
                msg = "发送成功";
            } else {
                msg = "发送失败";
            }
        } else {
            msg = "用户名或手机号码不正确";
        }

        map.clear();
        map.put("msg", msg);
        return map;
    }

    @RequestMapping("comparecode")
    @ResponseBody
    public Map comparecode(String code, String account, String password, HttpSession session) {
        String sessionCode = (String)session.getAttribute("code");
        String msg;
        Map<String, Object> map = new HashMap<>();
        if (code.equals(sessionCode)) {
            map.put("name", account);
            map.put("password", password);
            userService.updatePwdByAccount(map);
            msg = "修改成功！";
        } else {
            msg = "验证码不正确！";
        }
        map.clear();
        map.put("msg", msg);
        return map;
    }
    /*=========== 找回密码 End ===========*/
}

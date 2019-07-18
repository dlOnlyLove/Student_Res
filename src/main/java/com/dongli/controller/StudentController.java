package com.dongli.controller;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.dongli.entity.Pay;
import com.dongli.entity.Room;
import com.dongli.entity.Student;
import com.dongli.service.StudentService;
import com.dongli.util.AlipayConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@Controller
@RequestMapping("student")
public class StudentController {
    @Autowired
    StudentService studentService;

    // 主页
    @RequestMapping("index")
    public String getIndex() {
//        String IDNum = (String)session.getAttribute("custom");
//        Student student = studentService.selectByIDNum(IDNum);
//        model.addAttribute("student", student);
        return "student/student";
    }


    /*========== 学生缴费开始 ==========*/
    @RequestMapping("pay")
    public String getPay(Model model, HttpSession session) {
        String IDNum = (String)session.getAttribute("custom");
        Student student;
        Pay pay;
        pay = studentService.selectPayByIDNum(IDNum);
        if(pay.getResult().equals("已完成") || pay.getGreen().equals("审核通过")) {
            model.addAttribute("msg", "你已完成缴费！即将跳转");
            return "student/showPay";
        }
        student = studentService.selectByIDNum(IDNum);
        model.addAttribute("student", student);
        return "student/pay";
    }

    @RequestMapping("alipayAction")
    public Object alipayAction(HttpServletResponse response, String out_trade_no, String total_amount) throws Exception{
        // 获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
                AlipayConfig.merchant_private_key, "json", AlipayConfig.charset,
                AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        // 设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //订单名称，必填
        String subject = "学生缴费";

        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        // 请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        AlipayConfig.logResult(result);// 记录支付日志
        response.setContentType("text/html; charset=UFT-8");
        PrintWriter out = response.getWriter();
        out.print(result);
        return null;
    }

    @RequestMapping("payReturn")
    public String returnPay(HttpServletRequest request, HttpServletResponse response,
                            HttpSession session, Model model) throws Exception{
        String IDNum = (String)session.getAttribute("custom");
        String msg;
        Map<String, Object> map = new HashMap<>();

        //获取支付宝GET过来反馈信息
        Map<String,String> params = new HashMap<>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name =  iter.next();
            String[] values =  requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
        if(signVerified) {
            //商户订单号
            String out_trade_no = request.getParameter("out_trade_no");

            //支付宝交易号
            String trade_no = request.getParameter("trade_no");

            //付款金额
            String total_amount = request.getParameter("total_amount");
            map.put("IDNum", IDNum);
            map.put("money", total_amount);
            msg = studentService.updatePay(map) != 0 ? "支付成功！即将跳转页面" : "支付失败！即将跳转页面";
        }else {
            msg = "支付失败！即将跳转页面";
        }

        model.addAttribute("msg", msg);
        return "student/showPay";
    }
    /*========== 学生缴费结束 ==========*/


    /*========== 个人信息开始 ==========*/
    @RequestMapping("info")
    public String getInfo(HttpSession session, Model model) {
        String IDNum = (String)session.getAttribute("custom");
        Student student = studentService.selectByIDNum(IDNum);
        if(student != null) {
            model.addAttribute("student", student);
        }
        return "student/studentinfo";
    }

    // 更新个人信息
    @RequestMapping("updateInfo")
    @ResponseBody
    public Map updateInfo(Student student) {
        String msg;
        msg = studentService.updateByIDNum(student) != 0 ? "操作成功!" : "操作失败!";
        Map map = new HashMap();
        map.put("msg", msg);
        return map;
    }

    // 修改个人密码
    @RequestMapping("updatePwd")
    @ResponseBody
    public Map updatePwd(Student student) {
        String msg;
        msg = studentService.updatePwdByIDNum(student) != 0 ? "操作成功!" : "操作失败!";
        Map map = new HashMap();
        map.put("msg", msg);
        return map;
    }
    /*========== 个人信息结束 ==========*/


    /*========== 绿色通道开始 ==========*/
    @RequestMapping("greenAction")
    @ResponseBody
    public Map greenAction(MultipartFile proofMaterial, String loan, String IDNum, String costumes,
                            String money, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        UUID uuid = UUID.randomUUID();
        String savePath = request.getServletContext().getRealPath("upload/");
        String originalFilename = proofMaterial.getOriginalFilename();

        String[] names = originalFilename.split("\\.");
        String filename = uuid.toString() + "." + names[1];
        String pathName = savePath + filename;
        String photoPath = "../../upload/" + filename;
        File newPhoto = new File(pathName);

        map.put("loan", loan);
        map.put("IDNum", IDNum);
        map.put("costumes", costumes);
        map.put("money", money);
        map.put("proofMaterial", photoPath);
        map.put("green", "待审核");

        if(!newPhoto.exists()) {
            newPhoto.mkdirs();
        }

        try{
            proofMaterial.transferTo(newPhoto);
            studentService.updateGreen(map);
            map.clear();
            map.put("msg", "申请已提交！");
        } catch (IOException ex) {
            map.clear();
            map.put("msg", "申请失败！");
            ex.printStackTrace();
        }

        return map;
    }

    @RequestMapping("green")
    public String getGreen(HttpSession session, Model model) {
        String IDNum = (String)session.getAttribute("custom");
        String green;
        Pay pay = studentService.selectPayByIDNum(IDNum);
        if(pay.getResult().equals("已完成") && pay.getGreen().equals("未提交")) {
            model.addAttribute("msg", "你已完成缴费！即将跳转");
            return "student/showPay";
        }
        Student student = studentService.selectByIDNum(IDNum);
        green = studentService.selectGreenByIDNum(IDNum);
        model.addAttribute("green", green);
        model.addAttribute("student", student);
        return "student/studentgreen";
    }
    /*========== 绿色通道结束 ==========*/


    /*========== 寝室选择开始 ==========*/
    @RequestMapping("room")
    public String getRoom(Model model, HttpSession session) {
        List<Room> rooms = studentService.selectRoom();
        model.addAttribute("IDNum", session.getAttribute("custom"));
        model.addAttribute("rooms", rooms);
        return "student/room";
    }

    //选择寝室
    @RequestMapping("selectRoomAction")
    @ResponseBody
    public Map selectRoom(String rno, String IDNum, int currentSize, int roomSize) {
        Map map = new HashMap();
        String msg;
        Student student;
        student = studentService.selectByIDNum(IDNum);
        if(!student.getRno().equals("未选择")) {
            msg = "请勿重复选择！";
            map.put("msg", msg);
            return map;
        }

        // 更新寝室信息
        Room room = new Room();
        String roomStatus = currentSize + 1 == roomSize ? "已满" : "可选";
        room.setCurrentSize(currentSize + 1);
        room.setRno(rno);
        room.setRoomStatus(roomStatus);
        msg = studentService.updateRoomByRno(room) != 0 ? "操作成功!" : "操作失败!";

        // 更新学生信息
        student = new Student();
        student.setIDNum(IDNum);
        student.setRno(rno);
        msg = studentService.updateRooomOfStudentByIDNum(student) != 0 ? "操作成功!" : "操作失败!";

        map.put("msg", msg);
        return map;
    }
    /*========== 寝室选择结束 ==========*/


    /*========== 确认报到开始 ==========*/
    @RequestMapping("confirm")
    public String confirm(HttpSession session, Model model) {
        String IDNum = (String)session.getAttribute("custom");
        String payResult; // 缴费结果
        String roomSelecetResult;
        String registration;

        Pay pay = studentService.selectPayByIDNum(IDNum); // 查询缴费信息
        Student student = studentService.selectByIDNum(IDNum); // 查询寝室选择信息

        if(pay.getResult().equals("未完成")) {
            payResult = "缴费未完成！请及时缴费";
        } else {
            payResult = "费用已缴纳";
        }

        if (student.getRegistration().equals("未报到")) {
            registration = "确认报到";
        } else {
            registration = "已报到";
        }

        if (student.getRno().equals("未选择")) {
            roomSelecetResult = "寝室未选择！请及时选择寝室";
        } else {
            roomSelecetResult = "已选择" + student.getRno() + "寝室";
        }

        model.addAttribute("payResult", payResult);
        model.addAttribute("roomSelectResult", roomSelecetResult);
        model.addAttribute("green", pay.getGreen());
        model.addAttribute("registration", registration);

        return "student/confirm";
    }

    @RequestMapping("confirmResAction")
    public String confirmResAction(HttpSession session) {
        String IDNum = (String)session.getAttribute("custom");
        studentService.updateResByIDNum(IDNum);
        return "redirect:confirm";
    }
    /*========== 确认报到结束 ==========*/
}

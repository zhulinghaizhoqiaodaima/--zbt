package com.ly.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ly.model.Daw;
import com.ly.model.Dorecord;
import com.ly.model.User;
import com.ly.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

//-------------------------------------------------

    public static final int PAGE_SIZE=10;
    @RequestMapping(value = "/login",produces = "text/html;charset=utf-8")
    public String login(@RequestParam("username") String username, @RequestParam("password") String password, @RequestParam("UserType") String UserType
            , Model model, HttpSession session) {
        User user = userService.selectUserByUserName(username);
        if(user==null){
            model.addAttribute("failure1", "用户名未输入");
            model.addAttribute("failure2", "该用户不存在");
            return "loginError";
        }
        if (user != null||UserType!=null||password!=null) {
            if (user.getpassword().equals(password)) {
                //将用户名传到session
                session.setAttribute("uname",username);
                User realname=userService.selectName(username);
                if (user.getUserType().equals(UserType)) {
                    switch (UserType) {
                        case "管理员":
                            model.addAttribute("name",realname);
                            return "admain";
                        case "后勤人员":
                            model.addAttribute("name",realname);
                            return "main";
                        case "员工":
                            model.addAttribute("name",realname);
                            return "empmain";
                    }
                }
                else if(user.getUserType().equals(UserType)==false){
                    model.addAttribute("failure1", "用户身份错误！");
                    return "loginError";
                }
            }
            else if(user.getpassword().equals(password)==false){
                model.addAttribute("failure1","密码错误");
                return "loginError";
            }
        }
        return null;
    }


    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> register(@RequestParam("department") String department,@RequestParam("username") String username, @RequestParam("password") String password
                                        ,@RequestParam("name") String name,@RequestParam("sex") String sex,@RequestParam("age") int age
                                        ,@RequestParam("phone") long phone,@RequestParam("address") String address) {
        String UserType="员工";
        User user = new User();
        user.setDepartment(department);
        user.setUsername(username);
        user.setpassword(password);
        user.setUserType(UserType);
        user.setName(name);
        user.setSex(sex);
        user.setAge(age);
        user.setPhone(phone);
        user.setAddress(address);
        User fuser = userService.selectUserByUserName(username);
        Map<String, Object> map = new HashMap<>();
        if (fuser != null) {
            map.put("result", false);
            map.put("message", "用户名已存在");
            return map;
        }
        boolean flag = userService.insertUser(user);
        System.out.println(flag);
        map.put("result", flag);
        map.put("message", flag ? "注册成功" : "注册失败");
        return map;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> update(@RequestParam("username") String username, @RequestParam("password") String password, HttpServletRequest request, Model model) {
        User user = new User();
        user.setUsername(username);
        user.setpassword(password);
        User isExistUser = userService.selectUserByUserName(username);
        Map<String, Object> map = new HashMap<>();
        if (isExistUser == null) {
            map.put("result", false);
            map.put("message", "用户名不存在");
            return map;
        }
        boolean flag = userService.updateUser(user);
        System.out.println(flag);
        map.put("result", flag);
        map.put("message", flag ? "修改成功" : "修改失败");
        return map;
    }

    @RequestMapping("/findEmp")
    public ModelAndView findEmp(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        ModelAndView modelAndView=new ModelAndView();
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<User> userList=userService.findEmp();
        PageInfo pageInfo=new PageInfo<>(userList);
        modelAndView.addObject("userList",userList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("empm-list");
        return modelAndView;
    }

    @RequestMapping("/CfindEmp")
    public ModelAndView CfindEmp(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,@RequestParam("UserType") String UserType,
                                 @RequestParam("department") String department,@RequestParam("username") String username,@RequestParam("name") String name){
        ModelAndView modelAndView=new ModelAndView();
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<User> userList=userService.CfindEmp(UserType,department,username,name);
        PageInfo pageInfo=new PageInfo<>(userList);
        modelAndView.addObject("userList",userList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("empm-list");
        return modelAndView;
    }

    @RequestMapping("message")
    public String message(String username,Model model){
        User user = userService.selectUserByUserName(username);
        model.addAttribute("user",user);
        return "usermessage";
    }

    @RequestMapping("/backuserlist")
    public String backuserlist(){
        return "redirect:/user/findEmp";
    }

    @RequestMapping("/delEmp/{username}")
    public String delEmp(@PathVariable("username") String username){
        userService.delEmpByusername(username);
        return "redirect:/user/findEmp";
    }

    @RequestMapping("toupdatem")
    public String toupdate(Model model,String username){
        User user = userService.selectUserByUserName(username);
        model.addAttribute("user",user);
        return "updateuserm";
    }

    @RequestMapping("doupdatem")
    public String doupeatem(User user){
        userService.doupdatem(user);
        return "redirect:/user/findEmp";
    }

    @RequestMapping("findAW")
    public String findAw(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Daw> dawList=userService.findDaw();
        PageInfo pageInfo=new PageInfo<>(dawList);
        model.addAttribute("dawList",dawList);
        model.addAttribute("page",pageInfo);
        return "Daw-list";
    }

    @RequestMapping("CfindAW")
    public String CfindAw(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,@RequestParam("post") String post,
                          @RequestParam("dname") String dname){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Daw> dawList=userService.CfindDaw(post,dname);
        PageInfo pageInfo=new PageInfo<>(dawList);
        model.addAttribute("dawList",dawList);
        model.addAttribute("page",pageInfo);
        return "Daw-list";
    }

    @RequestMapping("toaddDaw")
    public String toaddDaw(Model model){
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String ddate = dateFormat.format(date);
        model.addAttribute("ddate",ddate);
        return "addDaw";
    }

    @RequestMapping(value = "/addDaw", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addDaw(@RequestParam("ddate") String ddate,@RequestParam("dname") String danme,@RequestParam("post") String post,HttpSession httpSession) {
        Daw daw=new Daw();
        daw.setDdate(ddate);
        daw.setDname(danme);
        daw.setPost(post);
        Daw Pd=userService.PdDawByPostAndName(daw);
        Map<String, Object> map = new HashMap<>();
        //获取处理人名字
        Object name=httpSession.getAttribute("uname");
        String username=(String)name;
        User user=userService.selectUserByUserName(username);
        String cname=user.getName();
        daw.setCname(cname);
        daw.setAwdate(ddate);
        //判断是否生成新记录，若每日排班表为空则生成
        int PD=userService.PDAWOrder();
        if(Pd==null){
            if(PD==0){
                //先插入记录表
                userService.intoAWordert(daw);
                int AWid=userService.findAwid();
                daw.setAWid(AWid);
                //插入详细记录表
                userService.intoDayAw(daw);
                int DAid=userService.findDAid();
                daw.setDAid(DAid);
                //插入每日排班表
                boolean flag=userService.intoAwgordert(daw);
                //修改每日排班人数
                int num=userService.PDAWOrder();
                userService.updateNum(num, AWid);
                userService.updateNum(PD,AWid);
                map.put("result", flag);
                map.put("message", flag ? "添加信息成功" : "失败");
                return map;
            }
            if(PD!=0) {
                int AWid = userService.findAwid();
                daw.setAWid(AWid);
                userService.intoDayAw(daw);
                int DAid = userService.findDAid();
                daw.setDAid(DAid);
                boolean flag = userService.intoAwgordert(daw);
                int num=userService.PDAWOrder();
                userService.updateNum(num, AWid);
                map.put("result", flag);
                map.put("message", flag ? "添加信息成功" : "失败");
                return map;
            }
        }
        map.put("result", false);
        map.put("message", "该人员已在该岗位");
        return map;
    }

    @RequestMapping("findOAW")
    public String findOAw(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Daw> oawList=userService.findOaw();
        PageInfo pageInfo=new PageInfo<>(oawList);
        model.addAttribute("oawList",oawList);
        model.addAttribute("page",pageInfo);
        return "Oaw-list";
    }

    @RequestMapping("CfindOAW")
    public String CfindOAw(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,@RequestParam("awdate") String awdate){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Daw> oawList=userService.CfindOaw(awdate);
        PageInfo pageInfo=new PageInfo<>(oawList);
        model.addAttribute("oawList",oawList);
        model.addAttribute("page",pageInfo);
        return "Oaw-list";
    }

    @RequestMapping("findOgAW")
    public String findOgAW(Model model,int AWid){
        List<Daw> ogawList=userService.findOgawByAWid(AWid);
        model.addAttribute("ogawList",ogawList);
        return "Ogaw-list";
    }

    @RequestMapping("/endDAW")
    public String endDAW(){
        //清空周菜单表
        userService.endDaw();
        return "redirect:/user/findAW";
    }

    @RequestMapping("/toupdateDaw")
    public String toupdateDaw(Model model,int DAid){
        Daw daw=userService.findDawByDAid(DAid);
        model.addAttribute("daw",daw);
        return "updateDaw";
    }

    @RequestMapping("/updateDaw")
    public String updateDaw(Daw daw){
        userService.updateDawByDAid(daw);
        return "redirect:/user/findAW";
    }

    @RequestMapping("/delDaw/{DAid}")
    public String delDaw(@PathVariable("DAid") int DAid){
        userService.delDaw(DAid);
        //改变当天的排班人数
        int PD=userService.PDAWOrder();
        int AWid=userService.findAwid();
        userService.updateNum(PD,AWid);
        return "redirect:/user/findAW";
    }

    @RequestMapping("admfindAW")
    public String admfindAw(Model model){
        List<Daw> dawList=userService.findDaw();
        model.addAttribute("dawList",dawList);
        return "admDaw-list";
    }

    @RequestMapping(value = "/toregister")
    public String toregister(){
        return "register";
    }

    @RequestMapping(value = "/toupdatepass")
    public String toupdatepass(){
        return "updateUser";
    }
    @RequestMapping(value = "/tologin")
    public String tologin(){
        return "login";
    }


    /**
     * 退出登录：从主页面跳转到登录页面并将状态设置为离线
     * @return
     */
    @RequestMapping(value = "/Quit")
    public String Quit(){
        return "login";
    }
    @RequestMapping(value = "/logout")
    public String logout(){
     return "login";
    }

}

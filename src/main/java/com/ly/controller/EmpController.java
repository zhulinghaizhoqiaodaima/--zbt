package com.ly.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ly.model.*;
import com.ly.service.EmpService;
import com.ly.service.MenuService;
import com.ly.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/emp")
public class EmpController {
    @Autowired
    EmpService empService;
    @Autowired
    MenuService menuService;
    @Autowired
    UserService userService;

    public static final int PAGE_SIZE=10;

    @RequestMapping("/menulist")
    public ModelAndView menulist(){
        ModelAndView modelAndView=new ModelAndView();
        List<Menu> menuList= menuService.list();
        modelAndView.addObject("menuList",menuList);
        modelAndView.setViewName("empweek-menu");
        return modelAndView;
    }

    @RequestMapping(value="/eating")
    public String eating(Integer mid, HttpSession httpSession, HttpServletResponse response){
        Menu menu=menuService.selectMenuByMid(mid);
        //获取当前时间并给set方法
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String etime = dateFormat.format(date);
        //获取session中的姓名并转化为String类型
        Object uname=httpSession.getAttribute("uname");
        String username=(String)uname;
        User user=userService.selectUserByUserName(username);
        Emp emp=new Emp();
        //获取当前时间编号，插入员工详细用餐表
        String y=String.valueOf(menu.getYear());
        String m=String.valueOf(menu.getMonth());
        String w=String.valueOf(menu.getWeek());
        String wd=String.valueOf(menu.getWeekday());
        String ymwwd=y+m+w+wd;
        emp.setYmwwd(ymwwd);
        emp.setMid(mid);
        emp.setYear(menu.getYear());
        emp.setMonth(menu.getMonth());
        emp.setWeek(menu.getWeek());
        emp.setWeekday(menu.getWeekday());
        emp.setMeatone(menu.getMeatone());
        emp.setMeattwo(menu.getMeattwo());
        emp.setVegetable(menu.getVegetable());
        emp.setSoup(menu.getSoup());
        emp.setEtime(etime);
        emp.setUsername(username);
        emp.setName(user.getName());
        emp.setUserType(user.getUserType());
        emp.setDepartment(user.getDepartment());
        //查询该天用餐是否已经选择
        Emp fmenu=empService.PdMenu(mid,username);
        //判断是否生成新记录,num=0就生成，不=0就不生成
        int num=empService.FindeNum(username);
        if (fmenu != null) {
            try {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().write("<script>alert('该天已选择');</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(fmenu==null) {
            if (num == 0) {
                empService.intoEmOrdert(emp);
                int eOid = empService.FindeOid(username);
                emp.seteOid(eOid);
                empService.intoEmgOredert(emp);
                empService.updateeNum(username,eOid);
                empService.updateeTotal(eOid);
                try {
                    response.setContentType("text/html;charset=utf-8");
                    response.getWriter().write("<script>alert('选择成功');</script>");
                } catch (IOException e) {
                    e.printStackTrace();
                }

            }
            if (num != 0) {
                int eOid = empService.FindeOid(username);
                emp.seteOid(eOid);
                empService.intoEmgOredert(emp);
                empService.updateeNum(username,eOid);
                empService.updateeTotal(eOid);
                try {
                    response.setContentType("text/html;charset=utf-8");
                    response.getWriter().write("<script>alert('选择成功');</script>");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    @RequestMapping("/emolist")
    public ModelAndView emolist(HttpSession httpSession,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        ModelAndView modelAndView=new ModelAndView();
        PageHelper.startPage(pageNum,PAGE_SIZE);
        Object name=httpSession.getAttribute("uname");
        String username=(String)name;
        List<Emp> empList= empService.emplist(username);
        PageInfo pageInfo=new PageInfo<>(empList);
        modelAndView.addObject("empList",empList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("emo-list");
        return modelAndView;
    }

    @RequestMapping("/Cemolist")
    public ModelAndView Cemolist(HttpSession httpSession,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                                 @RequestParam("year") Integer year,@RequestParam("month") Integer month){
        ModelAndView modelAndView=new ModelAndView();
        PageHelper.startPage(pageNum,PAGE_SIZE);
        Object name=httpSession.getAttribute("uname");
        String username=(String)name;
        List<Emp> empList= empService.Cemplist(username,year,month);
        PageInfo pageInfo=new PageInfo<>(empList);
        modelAndView.addObject("empList",empList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("emo-list");
        return modelAndView;
    }

    @RequestMapping("/emglist")
    public String emglist(int eOid, Model model){
        List<Emp> gemorderList=empService.findgemOrdertByeOid(eOid);
        model.addAttribute("gemorderList",gemorderList);
        return "emgo-list";
    }

    @RequestMapping("/lMessage")
    public String lMessage(Model model,HttpSession httpSession,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        Object uname=httpSession.getAttribute("uname");
        String username=(String)uname;
        User user=userService.selectUserByUserName(username);
        String name=user.getName();
        List<Lmessage> lmessageList=empService.findlMessage(name);
        PageInfo pageInfo=new PageInfo<>(lmessageList);
        model.addAttribute("lmessageList",lmessageList);
        model.addAttribute("page",pageInfo);
        return "lmessage-list";
    }

    @RequestMapping("toaddlm")
    public String toaddlm(Model model,HttpSession httpSession){
        //获取session中的姓名并转化为String类型
        Object uname=httpSession.getAttribute("uname");
        String username=(String)uname;
        User user=userService.selectUserByUserName(username);
        String name=user.getName();
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String ltime = dateFormat.format(date);
        model.addAttribute("name",name);
        model.addAttribute("ltime",ltime);
        return "addlMessage";
    }

    @RequestMapping(value = "/addlm")
    @ResponseBody
    public Map<String, Object> addlm(@RequestParam("name") String name, @RequestParam("message") String message, @RequestParam("ltime") String ltime) {
        Lmessage lm=new Lmessage();
        lm.setName(name);
        lm.setMessage(message);
        lm.setLtime(ltime);
        Map<String, Object> map = new HashMap<>();
        boolean flag=empService.insertlMessage(lm);
        System.out.println(flag);
        map.put("result", flag);
        map.put("message", flag ? "添加成功" : "添加失败");
        return map;
    }

    @RequestMapping("/toupdatelm")
    public String toupdatelm(int lMid,Model model){
        Lmessage lm=empService.findlMessageBylMid(lMid);
        model.addAttribute("lmessage",lm);
        return "updatelmessage";
    }

    @RequestMapping("/doupdatelm")
    public String doupdate(Lmessage lm){
        empService.updatelMBylMid(lm);
        return "redirect:/emp/lMessage";
    }

    @RequestMapping("/dellm/{lMid}")
    public String dellm(@PathVariable("lMid") int lMid){
        empService.dellm(lMid);
        return "redirect:/emp/lMessage";
    }

    @RequestMapping("findDoM")
    public String findDoM(Model model,HttpSession httpSession,HttpServletResponse response){
        Object uname=httpSession.getAttribute("uname");
        String username=(String)uname;
        User user=userService.selectUserByUserName(username);
        String rname=user.getName();
        Dormitory dormitory=empService.findEmpDByName(rname);
        if(dormitory==null){
            try {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().write("<script>alert('您未入住');</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(dormitory!=null) {
            model.addAttribute("dormitory", dormitory);
            return "empDormitory";
        }
        return null;
    }

    @RequestMapping("findDor")
    public ModelAndView findDor(HttpSession httpSession,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        ModelAndView modelAndView=new ModelAndView();
        PageHelper.startPage(pageNum,PAGE_SIZE);
        Object uname=httpSession.getAttribute("uname");
        String username=(String)uname;
        User user=userService.selectUserByUserName(username);
        String bname=user.getName();
        List<Dorecord> dorecordList=empService.findEmpDoRecordByBname(bname);
        PageInfo pageInfo=new PageInfo<>(dorecordList);
        modelAndView.addObject("dorlist",dorecordList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("empDorecord");
        return modelAndView;
    }

    @RequestMapping("CfindDor")
    public ModelAndView CfindDor(HttpSession httpSession,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,@RequestParam("bdate") String bdate){
        ModelAndView modelAndView=new ModelAndView();
        PageHelper.startPage(pageNum,PAGE_SIZE);
        Object uname=httpSession.getAttribute("uname");
        String username=(String)uname;
        User user=userService.selectUserByUserName(username);
        String bname=user.getName();
        List<Dorecord> dorecordList=empService.CfindEmpDoRecordByBname(bname,bdate);
        PageInfo pageInfo=new PageInfo<>(dorecordList);
        modelAndView.addObject("dorlist",dorecordList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("empDorecord");
        return modelAndView;
    }
}

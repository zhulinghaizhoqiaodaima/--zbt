package com.ly.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ly.model.*;
import com.ly.service.EmpService;
import com.ly.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/eat")
public class EatController {
    @Autowired
    EmpService empService;
    @Autowired
    UserService userService;

    //设置分页参数：pageSize(每页记录数)，pageNo(页码)
    public static final int PAGE_SIZE=10;

    @RequestMapping("/empeatlist")
    public ModelAndView empeatlist(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        //获取当日时间并转化为年月周
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH)+1;
        int week= cal.get(Calendar.WEEK_OF_MONTH);
        int weekday = cal.get(Calendar.DAY_OF_WEEK)-1;
        //做一个分页拦截，重构sql语句，生成分页的sql语句
        PageHelper.startPage(pageNum,PAGE_SIZE);
        ModelAndView modelAndView=new ModelAndView();
        if(weekday==0){
            int week1=week-1;
            int weekday1=weekday+7;
            List<Emp> eatList= empService.empEatlist(year,month,week1,weekday1);
            PageInfo pageInfo=new PageInfo<>(eatList);
            modelAndView.addObject("eatList",eatList);
            modelAndView.addObject("page",pageInfo);
            modelAndView.setViewName("eatemp-list");
            return modelAndView;
        }
        List<Emp> eatList= empService.empEatlist(year,month,week,weekday);
        //创建分页对象
        PageInfo pageInfo=new PageInfo<>(eatList);
        modelAndView.addObject("eatList",eatList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("eatemp-list");
        return modelAndView;
    }

    @RequestMapping("/Cfindeatemp")
    public ModelAndView Cfindeatemp(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                              @RequestParam("department") String department,@RequestParam("name") String name){
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH)+1;
        int week= cal.get(Calendar.WEEK_OF_MONTH);
        int weekday = cal.get(Calendar.DAY_OF_WEEK)-1;
        //做一个分页拦截，重构sql语句，生成分页的sql语句
        PageHelper.startPage(pageNum,PAGE_SIZE);
        ModelAndView modelAndView=new ModelAndView();
        if(weekday==0){
            int week1=week-1;
            int weekday1=weekday+7;
            List<Emp> eatList= empService.CempEatlist(year,month,week1,weekday1,department,name);
            PageInfo pageInfo=new PageInfo<>(eatList);
            modelAndView.addObject("eatList",eatList);
            modelAndView.addObject("page",pageInfo);
            modelAndView.setViewName("eatemp-list");
            return modelAndView;
        }
        List<Emp> eatList= empService.CempEatlist(year,month,week,weekday,department,name);
        //创建分页对象
        PageInfo pageInfo=new PageInfo<>(eatList);
        modelAndView.addObject("eatList",eatList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("eatemp-list");
        return modelAndView;
    }

    @RequestMapping("/deleatemp/{geOid}")
    public String deleatemp(@PathVariable("geOid") int geOid){
        String username=empService.findUnameBygeOid(geOid);
        int eOid=empService.findeOidBygeOid(geOid);
        empService.updateeNumd(username,eOid);
        empService.deleatemp(geOid);
        empService.updateeTotal(eOid);
        return "redirect:/eat/empeatlist";
    }

    @RequestMapping("/choiceemp")
    public ModelAndView choiceemp(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        ModelAndView modelAndView=new ModelAndView();
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<User> userList=empService.findemp();
        PageInfo pageInfo=new PageInfo<>(userList);
        modelAndView.addObject("userList",userList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("choiceeat-list");
        return modelAndView;
    }

    @RequestMapping("/Cfindemp")
    public ModelAndView Cfindemp(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                              @RequestParam("department") String department,@RequestParam("name") String name){
        ModelAndView modelAndView=new ModelAndView();
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<User> userCList= userService.ConditionFindEatEmp(department,name);
        PageInfo pageInfo=new PageInfo<>(userCList);
        modelAndView.addObject("userList",userCList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("choiceeat-list");
        return modelAndView;
    }

    @RequestMapping("/choiceEat")
    public String choiceEat(int id, HttpServletResponse response){
        Emp emp=new Emp();
        //获取员工信息
        User user=empService.selectByid(id);
        String username=user.getUsername();
        String name=user.getName();
        emp.setUserType(user.getUserType());
        emp.setDepartment(user.getDepartment());
        emp.setUsername(username);
        emp.setName(name);
        //获取当日时间并转化为年月周
        Calendar cal = Calendar.getInstance();
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String etime=sdf.format(date);
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH)+1;
        int week= cal.get(Calendar.WEEK_OF_MONTH);
        int weekday = cal.get(Calendar.DAY_OF_WEEK)-1;
        String y=String.valueOf(year);
        String m=String.valueOf(month);
        if(weekday==0){
            int week1=week-1;
            int weekday1=weekday+7;
            String w=String.valueOf(week1);
            String wd=String.valueOf(weekday1);
            System.out.println(y+m+w+wd);
            String ymwwd=y+m+w+wd;
            emp.setYmwwd(ymwwd);
            emp.setYear(year);
            emp.setMonth(month);
            emp.setWeek(week1);
            emp.setWeekday(weekday1);
            Emp emp1=empService.findMenuByDate(emp);
            emp.setMeatone(emp1.getMeatone());
            emp.setMeattwo(emp1.getMeattwo());
            emp.setVegetable(emp1.getVegetable());
            emp.setSoup(emp1.getSoup());
            emp.setEtime(etime);
            int mid=emp.getMid();
            //查询该天用餐是否已经选择
            Emp fmenu=empService.PdMenu(mid,username);
            //判断是否生成新记录,num=0就生成，不=0就不生成
            int num=empService.FindeNum(username);
            if (fmenu != null) {
                try {
                    response.setContentType("text/html;charset=utf-8");
                    response.getWriter().write("<script>alert('该员工，该天已选择');</script>");
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
        }
        if(weekday!=0) {
            String w = String.valueOf(week);
            String wd = String.valueOf(weekday);
            String ymwwd = y + m + w + wd;
            emp.setYmwwd(ymwwd);
            emp.setYear(year);
            emp.setMonth(month);
            emp.setWeek(week);
            emp.setWeekday(weekday);
            Emp emp1 = empService.findMenuByDate(emp);
            emp.setMeatone(emp1.getMeatone());
            emp.setMeattwo(emp1.getMeattwo());
            emp.setVegetable(emp1.getVegetable());
            emp.setSoup(emp1.getSoup());
            emp.setEtime(etime);
            int mid = emp1.getMid();
            //查询该天用餐是否已经选择
            Emp fmenu = empService.PdMenu(mid, username);
            //判断是否生成新记录,num=0就生成，不=0就不生成
            int num = empService.FindeNum(username);
            if (fmenu == null) {
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
            if (fmenu != null) {
                try {
                    response.setContentType("text/html;charset=utf-8");
                    response.getWriter().write("<script>alert('该员工，该天已选择');</script>");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    @RequestMapping("/findoldeemp")
    public String findoldeemp(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Emp> oldeempList=empService.findoldeemp();
        PageInfo pageInfo=new PageInfo<>(oldeempList);
        model.addAttribute("oldeempList",oldeempList);
        model.addAttribute("page",pageInfo);
        return "oldeemp-list";
    }

    @RequestMapping("/oldeatmessage")
    public String oldeatmessage(String ymwwd, Model model){
        List<Emp> oldeatList=empService.findempoldeatlist(ymwwd);
        int eenum=empService.findeatnum(ymwwd);
        model.addAttribute("oldeatList",oldeatList);
        model.addAttribute("eenum",eenum);
        return "oldeempmessage";
    }

    @RequestMapping("/othereemp")
    public String othereemp(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Oemp> oempList=empService.findOtheremp();
        PageInfo pageInfo=new PageInfo<>(oempList);
        model.addAttribute("oempList",oempList);
        model.addAttribute("page",pageInfo);
        return "othereemp-list";
    }

    @RequestMapping("/Cothereemp")
    public String Cothereemp(Model model,@RequestParam("year") Integer year,@RequestParam("month") Integer month,
                             @RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Oemp> oempList=empService.CfindOtheremp(year,month);
        PageInfo pageInfo=new PageInfo<>(oempList);
        model.addAttribute("oempList",oempList);
        model.addAttribute("page",pageInfo);
        return "othereemp-list";
    }

    @RequestMapping("/oempmessage")
    public String oempmessage(Model model,int oEid){
        Oemp oemp=empService.findoMessageByoEid(oEid);
        model.addAttribute("oemp",oemp);
        return "oempmessage";
    }

    @RequestMapping("toaddoemp")
    public String toaddoemp(){
        return "addoemp";
    }

    @RequestMapping(value = "/addoemp", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addoemp(@RequestParam("empType") String empType,@RequestParam("pnum") int pnum,@RequestParam("fnum") int fnum,
                                       @RequestParam("food") String food) {
        Oemp oemp=new Oemp();
        Calendar cal = Calendar.getInstance();
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String etime=sdf.format(date);
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH)+1;
        int week= cal.get(Calendar.WEEK_OF_MONTH);
        int weekday = cal.get(Calendar.DAY_OF_WEEK)-1;
        oemp.setYear(year);
        oemp.setMonth(month);
        if(weekday==0){
            int week1=week-1;
            int weekday1=weekday+7;
            oemp.setWeek(week1);
            oemp.setWeekday(weekday1);
            oemp.setEmpType(empType);
            oemp.setPnum(pnum);
            oemp.setFnum(fnum);
            oemp.setFood(food);
            Map<String, Object> map = new HashMap<>();
            boolean flag = empService.insertOelist(oemp);
            System.out.println(flag);
            map.put("result", flag);
            map.put("message", flag ? "添加成功" : "添加失败");
            return map;
        }
        oemp.setWeek(week);
        oemp.setWeekday(weekday);
        oemp.setEmpType(empType);
        oemp.setPnum(pnum);
        oemp.setFnum(fnum);
        oemp.setFood(food);
        Map<String, Object> map = new HashMap<>();
        boolean flag = empService.insertOelist(oemp);
        System.out.println(flag);
        map.put("result", flag);
        map.put("message", flag ? "添加成功" : "添加失败");
        return map;
    }

    @RequestMapping("/toupdateoemp")
    public String toupdateoemp(int oEid,Model model){
        Oemp oemp=empService.findoMessageByoEid(oEid);
        model.addAttribute("oemp",oemp);
        return "updateoemp";
    }

    @RequestMapping("/doupdate")
    public String doupdate(Oemp oemp){
        empService.updateOemByoEid(oemp);
        return "redirect:/eat/othereemp";
    }

    @RequestMapping("/deloem/{oEid}")
    public String deloem(@PathVariable("oEid") int oEid){
        empService.deloem(oEid);
        return "redirect:/eat/othereemp";
    }

    @RequestMapping("/lmessage")
    public String lmessage(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,Model model){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Lmessage> lmessageList=empService.findAlllMessage();
        PageInfo pageInfo=new PageInfo<>(lmessageList);
        model.addAttribute("lmessageList",lmessageList);
        model.addAttribute("page",pageInfo);
        return "alllmessage-list";
    }

    @RequestMapping("/Clmessage")
    public String Clmessage(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,Model model,@RequestParam("name") String name){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Lmessage> lmessageList=empService.CfindAlllMessage(name);
        PageInfo pageInfo=new PageInfo<>(lmessageList);
        model.addAttribute("lmessageList",lmessageList);
        model.addAttribute("page",pageInfo);
        return "alllmessage-list";
    }

    @RequestMapping("/dellm/{lMid}")
    public String dellm(@PathVariable("lMid") int lMid){
        empService.dellm(lMid);
        return "redirect:/eat/lmessage";
    }

    @RequestMapping("/emordert")
    public ModelAndView emordert(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        ModelAndView modelAndView=new ModelAndView();
        List<Emp> empList= empService.findemplist();
        PageInfo pageInfo=new PageInfo<>(empList);
        modelAndView.addObject("empList",empList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("allemo-list");
        return modelAndView;
    }

    @RequestMapping("/Cemordert")
    public ModelAndView Cemordert(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                                  @RequestParam("year") Integer year, @RequestParam("month") Integer month,
                                  @RequestParam("state") String state,@RequestParam("name") String name){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        ModelAndView modelAndView=new ModelAndView();
        List<Emp> empList= empService.Cfindemplist(year,month,state,name);
        PageInfo pageInfo=new PageInfo<>(empList);
        modelAndView.addObject("empList",empList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("allemo-list");
        return modelAndView;
    }

    @RequestMapping("/over/{eOid}")
    public String over(@PathVariable("eOid") int eOid){
        String username=empService.findUsernameByeOid(eOid);
        empService.eatOver(username,eOid);
        return "redirect:/eat/emordert";
    }

    @RequestMapping("/admfindeatlist")
    public ModelAndView admfindeatlist(){
        //获取当日时间并转化为年月周
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH)+1;
        int week= cal.get(Calendar.WEEK_OF_MONTH);
        int weekday = cal.get(Calendar.DAY_OF_WEEK)-1;
        ModelAndView modelAndView=new ModelAndView();
        if(weekday==0){
            int week1=week-1;
            int weekday1=weekday+7;
            List<Emp> eatList= empService.empEatlist(year,month,week1,weekday1);
            modelAndView.addObject("eatList",eatList);
            modelAndView.setViewName("admeatemp-list");
            return modelAndView;
        }
        List<Emp> eatList= empService.empEatlist(year,month,week,weekday);
        modelAndView.addObject("eatList",eatList);
        modelAndView.setViewName("admeatemp-list");
        return modelAndView;
    }

    @RequestMapping("/admothereemp")
    public String admothereemp(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Oemp> oempList=empService.findOtheremp();
        PageInfo pageInfo=new PageInfo<>(oempList);
        model.addAttribute("oempList",oempList);
        model.addAttribute("page",pageInfo);
        return "admothereemp-list";
    }

    @RequestMapping("/Cadmothereemp")
    public String Cadmothereemp(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                                @RequestParam("year") Integer year,@RequestParam("month") Integer month){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Oemp> oempList=empService.CfindOtheremp(year, month);
        PageInfo pageInfo=new PageInfo<>(oempList);
        model.addAttribute("oempList",oempList);
        model.addAttribute("page",pageInfo);
        return "admothereemp-list";
    }

    @RequestMapping("/admoempmessage")
    public String admoempmessage(Model model,int oEid){
        Oemp oemp=empService.findoMessageByoEid(oEid);
        model.addAttribute("oemp",oemp);
        return "admoempmessage";
    }

    @RequestMapping("/admemordert")
    public ModelAndView admemordert(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        ModelAndView modelAndView=new ModelAndView();
        List<Emp> empList= empService.findemplist();
        PageInfo pageInfo=new PageInfo<>(empList);
        modelAndView.addObject("empList",empList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("admallemo-list");
        return modelAndView;
    }

    @RequestMapping("/Cadmemordert")
    public ModelAndView Cadmemordert(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                                     @RequestParam("year") Integer year, @RequestParam("month") Integer month,
                                     @RequestParam("state") String state,@RequestParam("name") String name){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        ModelAndView modelAndView=new ModelAndView();
        List<Emp> empList= empService.Cfindemplist(year,month,state,name);
        PageInfo pageInfo=new PageInfo<>(empList);
        modelAndView.addObject("empList",empList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("admallemo-list");
        return modelAndView;
    }
}

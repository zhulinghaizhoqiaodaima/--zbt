package com.ly.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ly.model.Dorecord;
import com.ly.model.Dormitory;
import com.ly.service.DormitoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/dormitory")
public class DormitoryController {
    @Autowired
    DormitoryService dormitoryService;

    public static final int PAGE_SIZE=10;
    @RequestMapping("/toDolist")
    public ModelAndView toDolist(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        ModelAndView modelAndView=new ModelAndView();
        List<Dormitory> doList=dormitoryService.findDormitory();
        PageInfo pageInfo=new PageInfo<>(doList);
        modelAndView.addObject("doList",doList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("dormitory-list");
        return modelAndView;
    }

    @RequestMapping("/CtoDolist")
    public ModelAndView CtoDolist(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                                  @RequestParam("dcoding") String dcoding,@RequestParam("dstate") String dstate,@RequestParam("rname") String rname){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        ModelAndView modelAndView=new ModelAndView();
        List<Dormitory> doList=dormitoryService.CfindDormitory(dcoding,dstate,rname);
        PageInfo pageInfo=new PageInfo<>(doList);
        modelAndView.addObject("doList",doList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("dormitory-list");
        return modelAndView;
    }

    @RequestMapping("/toaddDo")
    public String toaddDo(){
        return "addDom";
    }

    @RequestMapping("/addDo")
    @ResponseBody
    public Map<String, Object> addDo(@RequestParam("dcoding") String dcoding,@RequestParam("dmessage") String dmessage)
    {
        Dormitory dormitory=new Dormitory();
        String dstate="未入住";
        dormitory.setDcoding(dcoding);
        dormitory.setDmessage(dmessage);
        dormitory.setDstate(dstate);
        Map<String, Object> map = new HashMap<>();
        Dormitory dorm=dormitoryService.findDormitoryByDcoding(dcoding);
        if (dorm != null) {
            map.put("result", false);
            map.put("message", "该宿舍信息已存在");
            return map;
        }
        if(dorm==null) {
            boolean flag = dormitoryService.intoDormitory(dormitory);
            System.out.println(flag);
            map.put("result", flag);
            map.put("message", flag ? "新增成功" : "添加失败");
            return map;
        }
        return null;
    }

    @RequestMapping("/todonmupdate")
    public String todomupdate(int did,Model model){
        Dormitory dormitory=dormitoryService.findDormitoryByDid(did);
        model.addAttribute("dormitory",dormitory);
        return "updateDom";
    }

    @RequestMapping("/domupdate")
    public String domupdate(Dormitory dormitory){
        dormitoryService.UpdateDormitory(dormitory);
        return "redirect:/dormitory/toDolist";
    }

    @RequestMapping("/toempIn")
    public String toempIn(int did, Model model, HttpServletResponse response){
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String rdate = dateFormat.format(date);
        Dormitory dormitory=dormitoryService.findDormitoryByDid(did);
        dormitory.setRdate(rdate);
        String dstate=dormitory.getDstate();
        if(dstate.equals("未入住")){
             model.addAttribute("dormitory",dormitory);
             return "empIny";
        }
        try {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("<script>alert('该宿已入住');</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/empIn")
    public String empIn(Dormitory dormitory,HttpServletResponse response){
        String rname=dormitory.getRname();
        int PD=dormitoryService.findRname(rname);
        if(PD==0){
            Dorecord dorecord=new Dorecord();
            dorecord.setBehavior("入住");
            dorecord.setDcoding(dormitory.getDcoding());
            dorecord.setBname(dormitory.getRname());
            dorecord.setBdate(dormitory.getRdate());
            dormitoryService.RnameInDormitory(dormitory);
            dormitoryService.intoRecord(dorecord);
            return "redirect:/dormitory/toDolist";
        }
        try {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("<script>alert('该员工已入住');</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/findRecord")
    public ModelAndView findRecord(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        ModelAndView modelAndView=new ModelAndView();
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Dorecord> drList=dormitoryService.findDoRecord();
        PageInfo pageInfo=new PageInfo<>(drList);
        modelAndView.addObject("drList",drList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("dorecord-list");
        return modelAndView;
    }

    @RequestMapping("/CfindRecord")
    public ModelAndView CfindRecord(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                                   @RequestParam("dcoding") String dcoding,@RequestParam("bname") String bname){
        ModelAndView modelAndView=new ModelAndView();
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Dorecord> drList=dormitoryService.CfindDoRecord(dcoding,bname);
        PageInfo pageInfo=new PageInfo<>(drList);
        modelAndView.addObject("drList",drList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("dorecord-list");
        return modelAndView;
    }

    @RequestMapping("/empOut/{did}")
    public String empOut(@PathVariable("did") int did, HttpServletResponse response){
        Dorecord dorecord=new Dorecord();
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
        String bdate = dateFormat.format(date);
        Dormitory dormitory=dormitoryService.findDormitoryByDid(did);
        String PD=dormitory.getDstate();
        if(PD.equals("已入住")){
            dorecord.setBehavior("离宿");
            dorecord.setDcoding(dormitory.getDcoding());
            dorecord.setBname(dormitory.getRname());
            dorecord.setBdate(bdate);
            dormitoryService.intoRecord(dorecord);
            dormitoryService.updateDstate(did);
            return "redirect:/dormitory/toDolist";
        }
        try {
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("<script>alert('该宿舍未入住');</script>");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping("/admtoDolist")
    public ModelAndView admtoDolist(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        ModelAndView modelAndView=new ModelAndView();
        List<Dormitory> doList=dormitoryService.findDormitory();
        PageInfo pageInfo=new PageInfo<>(doList);
        modelAndView.addObject("doList",doList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("admdormitory-list");
        return modelAndView;
    }

    @RequestMapping("/CadmtoDolist")
    public ModelAndView CadmtoDolist(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                                  @RequestParam("dcoding") String dcoding,@RequestParam("dstate") String dstate,@RequestParam("rname") String rname){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        ModelAndView modelAndView=new ModelAndView();
        List<Dormitory> doList=dormitoryService.CfindDormitory(dcoding,dstate,rname);
        PageInfo pageInfo=new PageInfo<>(doList);
        modelAndView.addObject("doList",doList);
        modelAndView.addObject("page",pageInfo);
        modelAndView.setViewName("admdormitory-list");
        return modelAndView;
    }
}

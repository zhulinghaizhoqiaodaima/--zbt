package com.ly.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ly.model.*;
import com.ly.service.PcgService;
import com.ly.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/pcg")
public class PcgController {
    @Autowired
    PcgService pcgService;
    @Autowired
    UserService userService;

    public static final int PAGE_SIZE=10;

    @RequestMapping("/topcgplan")
    public String topcgplan(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Pcgplan> pcgplanList=pcgService.findPcgPlan();
        PageInfo pageInfo=new PageInfo<>(pcgplanList);
        model.addAttribute("pcgList", pcgplanList);
        model.addAttribute("page",pageInfo);
        return "pcgplan-list";
    }

    @RequestMapping("/Ctopcgplan")
    public String Ctopcgplan(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,@RequestParam("ctime") String ctime){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Pcgplan> pcgplanList=pcgService.CfindPcgPlanByCtime(ctime);
        PageInfo pageInfo=new PageInfo<>(pcgplanList);
        model.addAttribute("pcgList", pcgplanList);
        model.addAttribute("page",pageInfo);
        return "pcgplan-list";
    }

    @RequestMapping("/addPcg")
    public String addPcg(HttpSession httpSession){
        Pcgplan pcg=new Pcgplan();
        Date date=new Date();
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH)+1;
        int week= cal.get(Calendar.WEEK_OF_MONTH);
        int weekday = cal.get(Calendar.DAY_OF_WEEK)-1;
        String y=String.valueOf(year);
        String m=String.valueOf(month);
        String w=String.valueOf(week);
        String wd=String.valueOf(weekday);
        String ctime=y+"年-"+m+"月-"+"第"+w+"周-"+"周"+wd;
        Object name=httpSession.getAttribute("uname");
        String username=(String)name;
        User user=userService.selectUserByUserName(username);
        pcg.setName(user.getName());
        pcg.setCtime(ctime);
        pcgService.intoPcgplan(pcg);
        return "redirect:/pcg/topcgplan";
    }

    @RequestMapping("/pcgmessage")
    public String pcgmessage(Model model,int ppid){
        List<Pcgplan> pcgplangList=pcgService.findPcgPlanByPpid(ppid);
        int sum=pcgService.findSumByPpid(ppid);
        pcgService.sumintoPcgplan(sum,ppid);
        model.addAttribute("pcggList", pcgplangList);
        model.addAttribute("ppid",ppid);
        return "pcgmessage";
    }

    @RequestMapping("/toaddPcggm")
    public String toaddPcggm(Model model,int ppid){
        model.addAttribute("ppid",ppid);
        return "addpcgm";
    }

    @RequestMapping("/intopcggo")
    @ResponseBody
    public Map<String, Object> intopcggo(@RequestParam("ppid") int ppid, @RequestParam("kind") String kind, @RequestParam("kmessage") String kmessage,
                                         @RequestParam("num") int num, @RequestParam("unit") String unit, @RequestParam("ksum") int ksum, @RequestParam("buyaddrs") String buyaddrs)
    {
        Pcgplan pcg=new Pcgplan();
        pcg.setPpid(ppid);
        pcg.setKind(kind);
        pcg.setKmessage(kmessage);
        pcg.setNum(num);
        pcg.setUnit(unit);
        pcg.setKsum(ksum);
        pcg.setBuyaddrs(buyaddrs);
        Map<String, Object> map = new HashMap<>();
        boolean flag=pcgService.intoPcgOrdert(pcg);
        System.out.println(flag);
        map.put("result", flag);
        map.put("message", flag ? "添加成功" : "添加失败");
        pcgService.updateKindnum(ppid);
        return map;
    }

    @RequestMapping("/delpcgm/{pgid}")
    public String delpcgm(@PathVariable("pgid") int pgid){
        int ppid=pcgService.findPpidByPgid(pgid);
        pcgService.reduceKindnum(ppid);
        pcgService.delpcgm(pgid);
        return "redirect:/pcg/topcgplan";
    }

    @RequestMapping("/delpcg/{ppid}")
    public String delpcg(@PathVariable("ppid") int ppid){
        pcgService.delpcg(ppid);
        return "redirect:/pcg/topcgplan";
    }

    @RequestMapping("/updatepcgm")
    public String updatepcgm(int pgid,Model model){
        Pcgplan pcgm=pcgService.findPcgmByPgid(pgid);
        model.addAttribute("pcgm",pcgm);
        return "updatepcgm";
    }

    @RequestMapping("/doupdatepcgm")
    public String doupdatepcgm(Pcgplan pcg){
        pcgService.updatePcgmByPgid(pcg);
        return "redirect:/pcg/topcgplan";
    }

    @RequestMapping("/toCAA")
    public String toCAA(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Pcgplan> pcgplanList=pcgService.findPcgPlan();
        PageInfo pageInfo=new PageInfo<>(pcgplanList);
        model.addAttribute("pcgList", pcgplanList);
        model.addAttribute("page",pageInfo);
        return "CAA-list";
    }

    @RequestMapping("/CtoCAA")
    public String CtoCAA(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                         @RequestParam("state") String state,@RequestParam("ARstate") String ARstate){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Pcgplan> pcgplanList=pcgService.CfindPcgPlan(state,ARstate);
        PageInfo pageInfo=new PageInfo<>(pcgplanList);
        model.addAttribute("pcgList", pcgplanList);
        model.addAttribute("page",pageInfo);
        return "CAA-list";
    }

    @RequestMapping("/CAAmessage")
    public String CAAmessage(Model model,int ppid){
        List<Pcgplan> pcgplangList=pcgService.findPcgPlanByPpid(ppid);
        int sum=pcgService.findSumByPpid(ppid);
        pcgService.sumintoPcgplan(sum,ppid);
        model.addAttribute("pcggList", pcgplangList);
        model.addAttribute("ppid",ppid);
        return "CAAmessage";
    }

    @RequestMapping("/updateState/{ppid}")
    public String updateState(@PathVariable("ppid") int ppid){
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String wtime=dateFormat.format(date);
        pcgService.updateStateByPpid(ppid,wtime);
        return "redirect:/pcg/toCAA";
    }

    @RequestMapping("/updateCAAm")
    public String updateCAAm(int pgid,Model model){
        Pcgplan pcgm=pcgService.findPcgmByPgid(pgid);
        model.addAttribute("pcgm",pcgm);
        return "updateCAAm";
    }

    @RequestMapping("/doupdateCAAm")
    public String doupdateCAAm(Pcgplan pcg){
        pcgService.updatePcgmByPgid(pcg);
        return "redirect:/pcg/toCAA";
    }

    @RequestMapping("/toIvtm")
    public String toIvtm(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Ivt> IvtList=pcgService.findIvtlist();
        PageInfo pageInfo=new PageInfo<>(IvtList);
        model.addAttribute("IvtList", IvtList);
        model.addAttribute("page",pageInfo);
        return "Ivtm-list";
    }

    @RequestMapping("/CtoIvtm")
    public String CtoIvtm(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                          @RequestParam("kind") String kind,@RequestParam("imessage") String imessage){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Ivt> IvtList=pcgService.CfindIvtlist(kind,imessage);
        PageInfo pageInfo=new PageInfo<>(IvtList);
        model.addAttribute("IvtList", IvtList);
        model.addAttribute("page",pageInfo);
        return "Ivtm-list";
    }

    @RequestMapping("/findaddIvtm")
    public String findaddIvtm(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,Model model){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<AddIvt> addList=pcgService.findAddIvt();
        PageInfo pageInfo=new PageInfo<>(addList);
        model.addAttribute("addList", addList);
        model.addAttribute("page",pageInfo);
        return "PutinRecord";
    }

    @RequestMapping("/CfindaddIvtm")
    public String CfindaddIvtm(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,Model model,
                               @RequestParam("kind") String kind,@RequestParam("iname") String iname){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<AddIvt> addList=pcgService.CfindAddIvt(kind,iname);
        PageInfo pageInfo=new PageInfo<>(addList);
        model.addAttribute("addList", addList);
        model.addAttribute("page",pageInfo);
        return "PutinRecord";
    }

    @RequestMapping("/findoutIvtm")
    public String findoutIvtm(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,Model model){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<OutIvt> outList=pcgService.findOutIvt();
        PageInfo pageInfo=new PageInfo<>(outList);
        model.addAttribute("outList", outList);
        model.addAttribute("page",pageInfo);
        return "outIvt-list";
    }

    @RequestMapping("/CfindoutIvtm")
    public String CfindoutIvtm(@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,Model model,
                               @RequestParam("uname") String uname,@RequestParam("iname") String iname){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<OutIvt> outList=pcgService.CfindOutIvt(uname,iname);
        PageInfo pageInfo=new PageInfo<>(outList);
        model.addAttribute("outList", outList);
        model.addAttribute("page",pageInfo);
        return "outIvt-list";
    }

    @RequestMapping("/addIvty")
    public String addIvty(){
        return "addIvty";
    }

    @RequestMapping("/addIvt")
    @ResponseBody
    public Map<String, Object> addIvt(@RequestParam("kind") String kind,@RequestParam("imessage") String imessage,@RequestParam("inum") int inum,
                                      @RequestParam("unit") String unit,HttpSession httpSession)
    {
        //将数据用ivt.set方赋值，用于插入库存表
        Ivt ivt=new Ivt();
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String rtime=dateFormat.format(date);
        ivt.setKind(kind);
        ivt.setImessage(imessage);
        ivt.setInum(inum);
        ivt.setUnit(unit);
        //将数据用addivt.set方法赋值，用于插入入库记录表
        Object uname=httpSession.getAttribute("uname");
        String username=(String)uname;
        User user=userService.selectUserByUserName(username);
        AddIvt addIvt=new AddIvt();
        addIvt.setIname(imessage);
        addIvt.setNum(inum);
        addIvt.setRtime(rtime);
        addIvt.setCname(user.getName());
        Map<String, Object> map = new HashMap<>();
        Ivt pd=pcgService.findIvtByName(ivt);
        //将信息插入入库记录表中
        pcgService.intoAddIvt(addIvt);
        if(pd==null){
            boolean flag=pcgService.intoIvtList(ivt);
            map.put("result", flag);
            map.put("message", flag ? "添加成功" : "添加失败");
            return map;
        }
        boolean flag=pcgService.updateNumByName(ivt);
        map.put("result", flag);
        map.put("message", flag ? "数量增加" : "添加失败");
        return map;
    }

    @RequestMapping("/toupdateIvt")
    public String toupdateIvt(int Ivid,Model model){
        Ivt ivtm=pcgService.findIvtByIvid(Ivid);
        model.addAttribute("ivtm",ivtm);
        return "updateIvt";
    }

    @RequestMapping("/doupdateIvt")
    public String doupdateIvt(Ivt ivt){
        pcgService.updateIvtByIvid(ivt);
        return "redirect:/pcg/toIvtm";
    }

    @RequestMapping("/toaddIvtyByCAA")
    public String toaddIvtyByCAA(Model model){
        List<Pcgplan> pcgplanList=pcgService.findPcgPlan();
        model.addAttribute("pcgList", pcgplanList);
        return "addIvty-list";
    }

    @RequestMapping("/addIvtm")
    public String addIvtm(Model model,int ppid){
        List<Pcgplan> pcgplangList=pcgService.findPcgPlanByPpid(ppid);
        model.addAttribute("pcggList", pcgplangList);
        return "addIvtm";
    }

    @RequestMapping("BPS")
    public String BPS(int ppid, HttpServletResponse response,HttpSession httpSession){ ;
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String rtime=dateFormat.format(date);
        List<Pcgplan> pcgplangList=pcgService.findPcgPlanByPpid(ppid);
        int Pd=pcgService.findIvtByPpid(ppid);
        if(Pd>0) {
            try {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().write("<script>alert('该购物车物品已入库');</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(Pd==0) {
            Object uname=httpSession.getAttribute("uname");
            String username=(String)uname;
            User user=userService.selectUserByUserName(username);
            String cname=user.getName();
            //该方法将物品插入库存以及入库记录表
            pcgService.intoIvts(pcgplangList);
            //之后再将时间，处理人插入入库记录表
            pcgService.updateIvtStateByPpid(rtime,cname,ppid);
            try {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().write("<script>alert('入库成功');</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @RequestMapping("/toOutIvt")
    public String toOutIvt(int Ivid,Model model,HttpSession httpSession){
        Ivt ivtm=pcgService.findIvtByIvid(Ivid);
        Object username=httpSession.getAttribute("uname");
        String uname=(String)username;
        User user=userService.selectUserByUserName(uname);
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd ");
        String ctime=dateFormat.format(date);
        model.addAttribute("ivtm",ivtm);
        model.addAttribute("ctime",ctime);
        model.addAttribute("cname",user.getName());
        return "outIvtm";
    }

    @RequestMapping("/outIvt")
    @ResponseBody
    public Map<String, Object> outIvt(@RequestParam("iname") String iname,@RequestParam("uname") String uname,@RequestParam("num") int num,
                                      @RequestParam("ctime") String ctime,@RequestParam("cname") String cname)
    {
        OutIvt OI=new OutIvt();
        OI.setIname(iname);
        OI.setUname(uname);
        OI.setNum(num);
        OI.setCtime(ctime);
        OI.setCname(cname);
        Map<String, Object> map = new HashMap<>();
        boolean flag=pcgService.outIvt(OI);
        pcgService.updateNum(iname,num);
        map.put("result", flag);
        map.put("message", flag ? "出库成功" : "出库失败");
        return map;
    }

    @RequestMapping("/admtoIvtm")
    public String admtoIvtm(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Ivt> IvtList=pcgService.findIvtlist();
        PageInfo pageInfo=new PageInfo<>(IvtList);
        model.addAttribute("IvtList", IvtList);
        model.addAttribute("page",pageInfo);
        return "admIvtm-list";
    }

    @RequestMapping("/CadmtoIvtm")
    public String CadmtoIvtm(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                          @RequestParam("kind") String kind,@RequestParam("imessage") String imessage){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Ivt> IvtList=pcgService.CfindIvtlist(kind,imessage);
        PageInfo pageInfo=new PageInfo<>(IvtList);
        model.addAttribute("IvtList", IvtList);
        model.addAttribute("page",pageInfo);
        return "admIvtm-list";
    }

    @RequestMapping("/admtopcgplan")
    public String admtopcgplan(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Pcgplan> pcgplanList=pcgService.findPcgPlan();
        PageInfo pageInfo=new PageInfo<>(pcgplanList);
        model.addAttribute("pcgList", pcgplanList);
        model.addAttribute("page",pageInfo);
        return "admpcgplan-list";
    }

    @RequestMapping("/Cadmtopcgplan")
    public String Cadmtopcgplan(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,@RequestParam("ctime") String ctime){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Pcgplan> pcgplanList=pcgService.CfindPcgPlanByCtime(ctime);
        PageInfo pageInfo=new PageInfo<>(pcgplanList);
        model.addAttribute("pcgList", pcgplanList);
        model.addAttribute("page",pageInfo);
        return "admpcgplan-list";
    }

    @RequestMapping("/admpcgmessage")
    public String admpcgmessage(Model model,int ppid){
        List<Pcgplan> pcgplangList=pcgService.findPcgPlanByPpid(ppid);
        int sum=pcgService.findSumByPpid(ppid);
        pcgService.sumintoPcgplan(sum,ppid);
        model.addAttribute("pcggList", pcgplangList);
        model.addAttribute("ppid",ppid);
        return "admpcgmessage";
    }

    @RequestMapping("/admtoCAA")
    public String admtoCAA(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Pcgplan> pcgplanList=pcgService.findPcgPlan();
        PageInfo pageInfo=new PageInfo<>(pcgplanList);
        model.addAttribute("pcgList", pcgplanList);
        model.addAttribute("page",pageInfo);
        return "admCAA-list";
    }

    @RequestMapping("/CadmtoCAA")
    public String CadmtoCAA(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                            @RequestParam("state") String state,@RequestParam("ARstate") String ARstate){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Pcgplan> pcgplanList=pcgService.CfindPcgPlan(state,ARstate);
        PageInfo pageInfo=new PageInfo<>(pcgplanList);
        model.addAttribute("pcgList", pcgplanList);
        model.addAttribute("page",pageInfo);
        return "admCAA-list";
    }

    @RequestMapping("/admCAAmessage")
    public String admCAAmessage(Model model,int ppid){
        List<Pcgplan> pcgplangList=pcgService.findPcgPlanByPpid(ppid);
        int sum=pcgService.findSumByPpid(ppid);
        pcgService.sumintoPcgplan(sum,ppid);
        model.addAttribute("pcggList", pcgplangList);
        model.addAttribute("ppid",ppid);
        return "admCAAmessage";
    }

    @RequestMapping("/updateARState/{ppid}")
    public String updateARState(@PathVariable("ppid") int ppid){
        pcgService.updateARStateByPpid(ppid);
        return "redirect:/pcg/admtoCAA";
    }

}

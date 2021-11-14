package com.ly.controller;



import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ly.model.Equipment;
import com.ly.model.Menu;
import com.ly.model.Repairs;
import com.ly.service.EquipmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/equipment")
public class EquipmentController {
    @Autowired
    EquipmentService equipmentService;

    public static final int PAGE_SIZE=10;
    @RequestMapping("/tofindequipment")
    public String tofindequipment(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Equipment> EqList=equipmentService.findEquipment();
        PageInfo pageInfo=new PageInfo<>(EqList);
        model.addAttribute("EqList", EqList);
        model.addAttribute("page",pageInfo);
        return "equipment-list";
    }

    @RequestMapping("/Ctofindequipment")
    public String Ctofindequipment(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                                   @RequestParam("department") String department,@RequestParam("eqname") String eqname,@RequestParam("eqstate") String eqstate){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Equipment> EqList=equipmentService.CfindEquipment(department,eqname,eqstate);
        PageInfo pageInfo=new PageInfo<>(EqList);
        model.addAttribute("EqList", EqList);
        model.addAttribute("page",pageInfo);
        return "equipment-list";
    }

    @RequestMapping("toaddEq")
    public String toaddEq(){
        return "addEqmessage";
    }

    @RequestMapping(value = "/addEq", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addEq(@RequestParam("eqname") String eqname,@RequestParam("department") String department,
                                       @RequestParam("eqmessage") String eqmessage) {
        Equipment equipment=new Equipment();
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd ");
        String rtime=dateFormat.format(date);
        equipment.setEqname(eqname);
        equipment.setDepartment(department);
        equipment.setEqmessage(eqmessage);
        equipment.setRtime(rtime);
        equipment.setEqstate("正常");
        Map<String, Object> map = new HashMap<>();
        boolean flag = equipmentService.insertEquipment(equipment);
        System.out.println(flag);
        map.put("result", flag);
        map.put("message", flag ? "添加成功" : "添加失败");
        return map;
    }

    @RequestMapping("/torepairs/{eqid}")
    public String torepairs(Model model,@PathVariable("eqid") int eqid){
        Equipment Eq=equipmentService.findEquipmentByEqid(eqid);
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd ");
        String btime=dateFormat.format(date);
        model.addAttribute("btime",btime);
        model.addAttribute("department",Eq.getDepartment());
        model.addAttribute("eqname",Eq.getEqname());
        model.addAttribute("eqid",eqid);
        return "repairsm";
    }

    @RequestMapping(value = "/repairs", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> repairs(@RequestParam("eqname") String eqname,@RequestParam("department") String department,
                                       @RequestParam("issue") String issue,@RequestParam("btime") String btime,@RequestParam("eqid") int eqid) {

        Repairs repairs=new Repairs();
        String state="维修中";
        repairs.setState(state);
        repairs.setEqname(eqname);
        repairs.setDepartment(department);
        repairs.setIssue(issue);
        repairs.setBtime(btime);
        repairs.setEqid(eqid);
        Map<String, Object> map = new HashMap<>();
        boolean flag = equipmentService.insertRepairs(repairs);
        System.out.println(flag);
        map.put("result", flag);
        map.put("message", flag ? "报修成功" : "报修失败");
        equipmentService.updateEqState(eqid);
        return map;
    }

    @RequestMapping("/findeRecord")
    public String findRecord(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Repairs> reList=equipmentService.findeRepairs();
        PageInfo pageInfo=new PageInfo<>(reList);
        model.addAttribute("reList", reList);
        model.addAttribute("page",pageInfo);
        return "repairs-list";
    }

    @RequestMapping("/CfindeRecord")
    public String CfindRecord(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                              @RequestParam("eqname") String eqname,@RequestParam("state") String state){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Repairs> reList=equipmentService.CfindeRepairs(eqname,state);
        PageInfo pageInfo=new PageInfo<>(reList);
        model.addAttribute("reList", reList);
        model.addAttribute("page",pageInfo);
        return "repairs-list";
    }

    @RequestMapping("/maintain")
    public String maintain(Model model, int rid){
        Repairs repairs=equipmentService.findRepairsByRid(rid);
        repairs.setRid(rid);
        model.addAttribute("repairs",repairs);
        return "finishmaintain";
    }

    @RequestMapping("/finish")
    public String finish(Repairs repairs, HttpServletResponse response) {
        Date date=new Date();
        SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String wtime=dateFormat.format(date);
        int rid=repairs.getRid();
        int eqid=equipmentService.findEqidByRid(rid);
        repairs.setWtime(wtime);
        repairs.setEqid(eqid);
        String state=equipmentService.findStateByRid(rid);
        System.out.println("--------------"+rid+state+repairs.getWtime()+repairs.getWname());
        if(state.equals("维修中")) {
            equipmentService.FinishMaintain(repairs);
            try {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().write("<script>alert('维修完成');</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if(state.equals("维修完成")) {
            try {
                response.setContentType("text/html;charset=utf-8");
                response.getWriter().write("<script>alert('该设备已完成维修');</script>");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @RequestMapping("/updateEq")
    public String updatemenu(int eqid, Model model){
        Equipment equipment=equipmentService.findEquipmentByEqid(eqid);
        model.addAttribute("equipment",equipment);
        return "equipment-update";
    }

    @RequestMapping("/doupdateEq")
    public String doupdateEq(Equipment equipment){
        equipmentService.updateEq(equipment);
        return "redirect:/equipment/tofindequipment";
    }

    @RequestMapping("/admtofindequipment")
    public String admtofindequipment(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Equipment> EqList=equipmentService.findEquipment();
        PageInfo pageInfo=new PageInfo<>(EqList);
        model.addAttribute("page",pageInfo);
        model.addAttribute("EqList", EqList);
        return "admequipment-list";
    }

    @RequestMapping("/Cadmtofindequipment")
    public String Cadmtofindequipment(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                                   @RequestParam("department") String department,@RequestParam("eqname") String eqname,@RequestParam("eqstate") String eqstate){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Equipment> EqList=equipmentService.CfindEquipment(department,eqname,eqstate);
        PageInfo pageInfo=new PageInfo<>(EqList);
        model.addAttribute("EqList", EqList);
        model.addAttribute("page",pageInfo);
        return "admequipment-list";
    }

    @RequestMapping("/admfindeRecord")
    public String admfindRecord(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Repairs> reList=equipmentService.findeRepairs();
        PageInfo pageInfo=new PageInfo<>(reList);
        model.addAttribute("reList", reList);
        model.addAttribute("page",pageInfo);
        return "admrepairs-list";
    }

    @RequestMapping("/CadmfindeRecord")
    public String CadmfindRecord(Model model,@RequestParam(value="pageNum",required=false,defaultValue="1") int pageNum,
                              @RequestParam("eqname") String eqname,@RequestParam("state") String state){
        PageHelper.startPage(pageNum,PAGE_SIZE);
        List<Repairs> reList=equipmentService.CfindeRepairs(eqname,state);
        PageInfo pageInfo=new PageInfo<>(reList);
        model.addAttribute("reList", reList);
        model.addAttribute("page",pageInfo);
        return "admrepairs-list";
    }
}

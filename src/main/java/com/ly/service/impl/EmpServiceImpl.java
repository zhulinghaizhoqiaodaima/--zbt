package com.ly.service.impl;


import com.ly.dao.EmpDao;
import com.ly.model.*;
import com.ly.service.EmpService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("EmpService")
public class EmpServiceImpl implements EmpService {
    @Resource
    private EmpDao empDao;

    @Override
    public Emp PdMenu(Integer mid,String username) {
        return empDao.PdMenu(mid,username);
    }

    @Override
    public void intoEmgOredert(Emp emp) {
        empDao.intoEmgOrdert(emp);
    }

    @Override
    public int FindeNum(String username) {
        return empDao.FindeNum(username);
    }

    @Override
    public void intoEmOrdert(Emp emp) {
        empDao.intoEmOrdert(emp);
    }

    @Override
    public int FindeOid(String username) {
        return empDao.FindeOid(username);
    }

    @Override
    public List<Emp> emplist(String username) {
        List<Emp> empList=empDao.findemordert(username);
        return empList;
    }

    @Override
    public List<Emp> findgemOrdertByeOid(int eOid) {
        List<Emp> gemordertlist=empDao.findgemOrdertByeOid(eOid);
        return gemordertlist;

    }

    @Override
    public List<Emp> empEatlist(int year, int month, int week, int weekday) {
        List<Emp> empEatList=empDao.findEatEmp(year,month,week,weekday);
        return empEatList;
    }

    @Override
    public void deleatemp(int geOid) {
        empDao.deleatemp(geOid);
    }

    @Override
    public String findUnameBygeOid(int geOid) {
        return empDao.findUnameBygeOid(geOid);
    }

    @Override
    public List<User> findemp() {
        List<User> userList=empDao.findemp();
        return userList;
    }

    @Override
    public User selectByid(int id) {
        return empDao.selectByid(id);
    }

    @Override
    public Emp findMenuByDate(Emp emp) {
        return empDao.findMenuByDate(emp);
    }

    @Override
    public List<Emp> findoldeemp() {
        List<Emp> oldeempList=empDao.findoldeemp();
        return oldeempList;
    }

    @Override
    public List<Emp> findempoldeatlist(String ymwwd) {
        List<Emp> gemorderList=empDao.findempoldeatlist(ymwwd);
        return gemorderList;
    }

    @Override
    public int findeatnum(String ymwwd) {
        return empDao.findeatnum(ymwwd);
    }

    @Override
    public List<Oemp> findOtheremp() {
        List<Oemp> oempList=empDao.findOtheremp();
        return oempList;
    }

    @Override
    public Oemp findoMessageByoEid(int oEid) {
        return empDao.findoMessageByoEid(oEid);
    }

    @Override
    public boolean insertOelist(Oemp oemp) {
        return empDao.insertOelist(oemp);
    }

    @Override
    public void updateOemByoEid(Oemp oemp) {
        empDao.updateOemByoEid(oemp);
    }

    @Override
    public void deloem(int oEid) {
        empDao.deloem(oEid);
    }

    @Override
    public List<Lmessage> findlMessage(String name) {
        List<Lmessage> lmessageList=empDao.findlMessage(name);
        return lmessageList;
    }

    @Override
    public boolean insertlMessage(Lmessage lm) {
         return empDao.insertlMessage(lm);
    }

    @Override
    public Lmessage findlMessageBylMid(int lMid) {
        return empDao.findlMessageBylMid(lMid);
    }

    @Override
    public void updatelMBylMid(Lmessage lm) {
        empDao.updatelMBylMid(lm);
    }

    @Override
    public void dellm(int lMid) {
        empDao.dellm(lMid);
    }

    @Override
    public List<Lmessage> findAlllMessage() {
        List<Lmessage> lmessageList=empDao.findAlllMessage();
        return lmessageList;
    }

    @Override
    public List<Emp> findemplist() {
        List<Emp> empList=empDao.findemplist();
        return empList;
    }

    @Override
    public void updateeTotal(int eOid) {
        empDao.updateeTotal(eOid);
    }

    @Override
    public int findeOidBygeOid(int geOid) {
        return empDao.findeOidBygeOid(geOid);
    }

    @Override
    public void updateeNum(String username, int eOid) {
        empDao.updateeNum(username,eOid);
    }

    @Override
    public void updateeNumd(String username, int eOid) {
        empDao.updateeNumd(username,eOid);
    }

    @Override
    public String findUsernameByeOid(int eOid) {
        return empDao.findUsernameByeOid(eOid);
    }

    @Override
    public void eatOver(String username, int eOid) {
        empDao.eatOver(username,eOid);
    }

    @Override
    public Dormitory findEmpDByName(String rname) {
        return empDao.findEmpDByName(rname);
    }

    @Override
    public List<Dorecord> findEmpDoRecordByBname(String bname) {
        List<Dorecord> dorecordList=empDao.findEmpDoRecordByBname(bname);
        return dorecordList;
    }

    @Override
    public List<Emp> CempEatlist(int year, int month, int week, int weekday, String department, String name) {
        List<Emp> eatList=empDao.CempEatlist(year,month,week,weekday,department,name);
        return eatList;
    }

    @Override
    public List<Lmessage> CfindAlllMessage(String name) {
        List<Lmessage> lmessageList=empDao.CfindAlllMessage(name);
        return lmessageList;
    }

    @Override
    public List<Emp> Cfindemplist(Integer year,Integer month,String state, String name) {
        List<Emp> empList=empDao.Cfindemplist(year,month,state,name);
        return empList;
    }

    @Override
    public List<Oemp> CfindOtheremp(Integer year, Integer month) {
        List<Oemp> oempList=empDao.CfindOtheremp(year,month);
        return oempList;
    }

    @Override
    public List<Emp> Cemplist(String username, Integer year, Integer month) {
        List<Emp> empList=empDao.Cfindemordert(username,year,month);
        return empList;
    }

    @Override
    public List<Dorecord> CfindEmpDoRecordByBname(String bname, String bdate) {
        List<Dorecord> dorecordList=empDao.CfindEmpDoRecordByBname(bname,bdate);
        return dorecordList;
    }


}

package com.ly.service;

import com.ly.model.*;

import java.util.List;

public interface EmpService{
    Emp PdMenu(Integer mid,String username);

     void intoEmgOredert(Emp emp);

    int FindeNum(String username);

    void intoEmOrdert(Emp emp);

    int FindeOid(String username);

    List<Emp> emplist(String username);

    List<Emp> findgemOrdertByeOid(int eOid);

    List<Emp> empEatlist(int year,int month,int week,int weekday);

    void deleatemp(int geOid);

    String findUnameBygeOid(int geOid);

    List<User> findemp();

    User selectByid(int id);

    Emp findMenuByDate(Emp emp);

    List<Emp> findoldeemp();

    List<Emp> findempoldeatlist(String ymwwd);

    int findeatnum(String ymwwd);

    List<Oemp> findOtheremp();

    Oemp findoMessageByoEid(int oEid);

    boolean insertOelist(Oemp oemp);

    void updateOemByoEid(Oemp oemp);

    void deloem(int oEid);

    List<Lmessage> findlMessage(String name);

    boolean insertlMessage(Lmessage lm);

    Lmessage findlMessageBylMid(int lMid);

    void updatelMBylMid(Lmessage lm);

    void dellm(int lMid);

    List<Lmessage> findAlllMessage();

    List<Emp> findemplist();

    void updateeTotal(int eOid);

    int findeOidBygeOid(int geOid);

    void updateeNum(String username, int eOid);

    void updateeNumd(String username, int eOid);

    String findUsernameByeOid(int eOid);

    void eatOver(String username, int eOid);

    Dormitory findEmpDByName(String rname);

    List<Dorecord> findEmpDoRecordByBname(String bname);

    List<Emp> CempEatlist(int year, int month, int week, int weekday, String department, String name);

    List<Lmessage> CfindAlllMessage(String name);

    List<Emp> Cfindemplist(Integer year,Integer month,String state, String name);

    List<Oemp> CfindOtheremp(Integer year, Integer month);

    List<Emp> Cemplist(String username, Integer year, Integer month);

    List<Dorecord> CfindEmpDoRecordByBname(String bname, String bdate);
}

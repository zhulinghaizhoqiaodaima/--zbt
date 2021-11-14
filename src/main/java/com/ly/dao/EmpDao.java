package com.ly.dao;

import com.ly.model.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface EmpDao {
    Emp PdMenu(@Param("mid") Integer mid,@Param("username") String username);

    void intoEmgOrdert(Emp emp);

    int FindeNum(@Param("username") String username);

    void intoEmOrdert(Emp emp);

    int FindeOid(@Param("username") String username);

    List<Emp> findemordert(@Param("username") String username);

    List<Emp> findgemOrdertByeOid(@Param("eOid") int eOid);

    List<Emp> findEatEmp(@Param("year") int year,@Param("month") int month,@Param("week") int week,@Param("weekday") int weekday);

    void deleatemp(@Param("geOid") int geOid);

    String findUnameBygeOid(@Param("geOid") int geOid);

    void updateeNum(@Param("username") String username,@Param("eOid") int eOid);

    void updateeNumd(@Param("username") String username,@Param("eOid") int eOid);

    List<User> findemp();

    User selectByid(@Param("id") int id);

    Emp findMenuByDate(Emp emp);

    List<Emp> findoldeemp();

    List<Emp> findempoldeatlist(@Param("ymwwd") String ymwwd);

    int findeatnum(@Param("ymwwd") String ymwwd);

    List<Oemp> findOtheremp();

    Oemp findoMessageByoEid(@Param("oEid") int oEid);

    boolean insertOelist(Oemp oemp);

    void updateOemByoEid(Oemp oemp);

    void deloem(@Param("oEid") int oEid);

    List<Lmessage> findlMessage(@Param("name") String name);

    boolean insertlMessage(Lmessage lm);

    Lmessage findlMessageBylMid(@Param("lMid") int lMid);

    void updatelMBylMid(Lmessage lm);

    void dellm(@Param("lMid") int lMid);

    List<Lmessage> findAlllMessage();

    List<Emp> findemplist();

    int findeOidBygeOid(int geOid);

    void updateeTotal(int eOid);

    String findUsernameByeOid(int eOid);

    void eatOver(@Param("username") String username,@Param("eOid") int eOid);

    Dormitory findEmpDByName(String rname);

    List<Dorecord> findEmpDoRecordByBname(String bname);

    List<Emp> CempEatlist(@Param("year") int year,@Param("month") int month,@Param("week") int week,@Param("weekday") int weekday,@Param("department") String department,@Param("name") String name);

    List<Lmessage> CfindAlllMessage(@Param("name") String name);

    List<Emp> Cfindemplist(@Param("year") Integer year, @Param("month") Integer month, @Param("state") String state, @Param("name") String name);

    List<Oemp> CfindOtheremp(@Param("year") Integer year,@Param("month") Integer month);

    List<Emp> Cfindemordert(@Param("username") String username,@Param("year") Integer year,@Param("month") Integer month);

    List<Dorecord> CfindEmpDoRecordByBname(@Param("bname") String bname,@Param("bdate") String bdate);
}

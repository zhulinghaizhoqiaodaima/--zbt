package com.ly.service;

import com.ly.model.Daw;
import com.ly.model.User;

import java.util.List;


public interface UserService {
    User selectUserByUserName(String username);

    boolean insertUser(User user);

    boolean updateUser(User user);

    User selectName(String username);

    List<User> findEmp();

    void delEmpByusername(String username);

    void doupdatem(User user);

    List<Daw> findDaw();

    Daw PdDawByPostAndName(Daw daw);

    int PDAWOrder();

    void intoAWordert(Daw daw);

    void intoDayAw(Daw daw);

    int findAwid();

    List<Daw> findOaw();

    List<Daw> findOgawByAWid(int aWid);

    void updateNum(int pd, int aWid);

    void endDaw();

    Daw findDawByDAid(int dAid);

    int findDAid();

    boolean intoAwgordert(Daw daw);

    void updateDawByDAid(Daw daw);

    void delDaw(int dAid);

    List<User> ConditionFindEatEmp(String department, String name);

    List<User> CfindEmp(String userType, String department, String username, String name);

    List<Daw> CfindDaw(String post, String dname);

    List<Daw> CfindOaw(String awdate);
}

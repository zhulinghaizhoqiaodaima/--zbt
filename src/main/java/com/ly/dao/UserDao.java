package com.ly.dao;


import com.ly.model.Daw;
import com.ly.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface UserDao {

   User selectUserByUserName(@Param("username") String username);

   boolean insertUser(User user);

   boolean updateUser(User user);

    User  selectName(@Param("username") String username);

    List<User> findEmp();

    void delEmpByusername(String username);

    void doupdatem(User user);

    List<Daw> findDaw();

    Daw PdDawByPostAndName(Daw daw);

    int PDAWOrder();

    void intoAWordert(Daw daw);

    void intoDayAW(Daw daw);

    int findAwid();

    List<Daw> findOaw();

    List<Daw> findOgawByAWid(int aWid);

    void updateNum(@Param("pd") int pd,@Param("aWid") int aWid);

    void endDaw();

    Daw findDawByDAid(int dAid);

    int findDAid();

    boolean intoAwgordert(Daw daw);

    void updateDawByDAid(Daw daw);

    void delDaw(int dAid);

    List<User> ConditionFindEatEmp(@Param("department") String department,@Param("name") String name);

    List<User> CfindEmp(@Param("UserType") String userType,@Param("department") String department,@Param("username") String username,@Param("name") String name);

    List<Daw> CfindDaw(@Param("post") String post,@Param("dname") String dname);

    List<Daw> CfindOaw(@Param("awdate") String awdate);
}

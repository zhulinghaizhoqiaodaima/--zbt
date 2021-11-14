package com.ly.service.impl;

import com.ly.dao.UserDao;
import com.ly.model.Daw;
import com.ly.model.Dorecord;
import com.ly.model.User;
import com.ly.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    public User selectUserByUserName(String username) {
        return userDao.selectUserByUserName(username);
    }

    public boolean insertUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public boolean updateUser(User user) {
        return userDao.updateUser(user);
    }


    @Override
    public User selectName(String username) {
        return userDao.selectName(username);
    }

    @Override
    public List<User> findEmp() {
        List<User> userList=userDao.findEmp();
        return userList;
    }

    @Override
    public void delEmpByusername(String username) {
        userDao.delEmpByusername(username);
    }

    @Override
    public void doupdatem(User user) {
        userDao.doupdatem(user);
    }

    @Override
    public List<Daw> findDaw() {
        List<Daw> dawList=userDao.findDaw();
        return dawList;
    }

    @Override
    public Daw PdDawByPostAndName(Daw daw) {
        return userDao.PdDawByPostAndName(daw);
    }

    @Override
    public int PDAWOrder() {
        return userDao.PDAWOrder();
    }

    @Override
    public void intoAWordert(Daw daw) {
        userDao.intoAWordert(daw);
    }

    @Override
    public void intoDayAw(Daw daw) {
        userDao.intoDayAW(daw);
    }

    @Override
    public int findAwid() {
        return userDao.findAwid();
    }

    @Override
    public List<Daw> findOaw() {
        List<Daw> oawList=userDao.findOaw();
        return oawList;
    }

    @Override
    public List<Daw> findOgawByAWid(int aWid) {
        List<Daw> ogawList=userDao.findOgawByAWid(aWid);
        return ogawList;
    }

    @Override
    public void updateNum(int pd, int aWid) {
        userDao.updateNum(pd,aWid);
    }

    @Override
    public void endDaw() {
        userDao.endDaw();
    }

    @Override
    public Daw findDawByDAid(int dAid) {
        return userDao.findDawByDAid(dAid);
    }

    @Override
    public int findDAid() {
        return userDao.findDAid();
    }

    @Override
    public boolean intoAwgordert(Daw daw) {
        return userDao.intoAwgordert(daw);
    }

    @Override
    public void updateDawByDAid(Daw daw) {
        userDao.updateDawByDAid(daw);
    }

    @Override
    public void delDaw(int dAid) {
        userDao.delDaw(dAid);
    }

    @Override
    public List<User> ConditionFindEatEmp(String department, String name) {
        List<User> userCList=userDao.ConditionFindEatEmp(department,name);
        return userCList;
    }

    @Override
    public List<User> CfindEmp(String userType, String department, String username, String name) {
        List<User> userList=userDao.CfindEmp(userType,department,username,name);
        return userList;
    }

    @Override
    public List<Daw> CfindDaw(String post, String dname) {
        List<Daw> dawList=userDao.CfindDaw(post,dname);
        return dawList;
    }

    @Override
    public List<Daw> CfindOaw(String awdate) {
        List<Daw> oawList=userDao.CfindOaw(awdate);
        return oawList;
    }


}

package com.ly.service.impl;

import com.ly.dao.MenuDao;
import com.ly.model.Menu;
import com.ly.model.Worder;
import com.ly.service.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("MenuService")
public class MenuServiceImpl implements MenuService {
    @Resource
    private MenuDao menuDao;

    public List<Menu> list(){
        List<Menu> menuList=menuDao.findWeekMenu();
        return menuList;
    }

    @Override
    public Menu PdMenu(int year,int month, int week, int weekday) {
        return menuDao.PdMenu(year,month,week,weekday);
    }

    @Override
    public void insertweekmenu(Menu menu) {
        menuDao.insertweekmenu(menu);
    }

    @Override
    public int FcMenu() {
        return menuDao.FcMenu();
    }

    @Override
    public Menu selectMenuByMid(Integer mid) {
        return menuDao.selectMenuByMid(mid);
    }

    @Override
    public void updateMenuByMid(Menu menu) {
        menuDao.updateMenuByMid(menu);
    }

    @Override
    public void del(int mid) {
        menuDao.del(mid);
    }

    @Override
    public Worder findWeek(int wOid) {
        return menuDao.findWeek(wOid);
    }

    @Override
    public void clear() {
        menuDao.clear();
    }

    @Override
    public List<Worder> worderlist() {
        List<Worder> worderList=menuDao.findoldMenu();
        return worderList;
    }

    @Override
    public List<Worder> Cworderlist(Integer year, Integer month) {
        List<Worder> worderList=menuDao.CfindoldMenu(year,month);
        return worderList;
    }

}

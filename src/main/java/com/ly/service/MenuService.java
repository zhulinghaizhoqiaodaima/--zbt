package com.ly.service;

import com.ly.model.Emp;
import com.ly.model.Menu;
import com.ly.model.Worder;

import java.util.List;

public interface MenuService {
    List<Menu> list();

    Menu PdMenu(int year,int month, int week, int weekday);

    void insertweekmenu(Menu menu);

    int FcMenu();

    Menu selectMenuByMid(Integer mid);

    void updateMenuByMid(Menu menu);

    void del(int mid);

    Worder findWeek(int wOid);

    void clear();

    List<Worder> worderlist();

    List<Worder> Cworderlist(Integer year, Integer month);
}

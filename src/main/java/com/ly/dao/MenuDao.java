package com.ly.dao;


import com.ly.model.Menu;
import com.ly.model.Worder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuDao {
    List<Menu> findWeekMenu();

    Menu PdMenu(@Param("year") int year,@Param("month") int month,@Param("week") int week,@Param("weekday") int weekday);

    void insertweekmenu(Menu menu);

    int FcMenu();

    Menu selectMenuByMid(@Param("mid") Integer mid);

    void updateMenuByMid(Menu menu);

    void del(@Param("mid") int mid);

    Worder findWeek(@Param("wOid") int wOid);

    void clear();

    List<Worder> findoldMenu();

    List<Worder> CfindoldMenu(@Param("year") Integer year,@Param("month") Integer month);
}

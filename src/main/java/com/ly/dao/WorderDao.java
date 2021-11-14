package com.ly.dao;

import com.ly.model.Gworder;
import com.ly.model.Worder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WorderDao {
    void intowOrdert(Worder worder);

    int findwOid();

    boolean intoGwordert(Gworder gworder);

    void timeintoWordert(@Param("year") int year,@Param("month") int month,@Param("week") int week);

    List<Gworder> findmordertBywOid(@Param("wOid") int wOid);

    int findMidByWeekday(@Param("weekday") int weekday);
}

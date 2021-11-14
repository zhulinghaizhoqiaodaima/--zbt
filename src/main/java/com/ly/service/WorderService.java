package com.ly.service;

import com.ly.model.Gworder;
import com.ly.model.Worder;

import java.util.List;

public interface WorderService {
    void intowOrdert(Worder worder);

    int findwOid();

    boolean intoGwordert(Gworder gworder);

    void timeintoWordert(int year, int month, int week);

    List<Gworder> findmordertBywOid(int wOid);

    int findMidByWeekday(int weekday);
}

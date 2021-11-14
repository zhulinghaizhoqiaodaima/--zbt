package com.ly.service.impl;

import com.ly.dao.WorderDao;
import com.ly.model.Gworder;
import com.ly.model.Worder;
import com.ly.service.WorderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("WorderService")
public class WorderServiceImpl implements WorderService {
    @Resource
    private WorderDao worderDao;

    @Override
    public void intowOrdert(Worder worder) {
        worderDao.intowOrdert(worder);
    }

    @Override
    public int findwOid() {
        return worderDao.findwOid();
    }

    @Override
    public boolean intoGwordert(Gworder gworder) {
        return worderDao.intoGwordert(gworder);
    }

    @Override
    public void timeintoWordert(int year, int month, int week) {
        worderDao.timeintoWordert(year,month,week);
    }

    @Override
    public List<Gworder> findmordertBywOid(int wOid) {
        List<Gworder> gworderList=worderDao.findmordertBywOid(wOid);
        return gworderList;
    }

    @Override
    public int findMidByWeekday(int weekday) {
        return worderDao.findMidByWeekday(weekday);
    }
}

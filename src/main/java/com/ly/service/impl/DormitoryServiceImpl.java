package com.ly.service.impl;

import com.ly.dao.DormitoryDao;
import com.ly.model.Dorecord;
import com.ly.model.Dormitory;
import com.ly.service.DormitoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("DormitoryService")
public class DormitoryServiceImpl implements DormitoryService {
    @Resource
    private DormitoryDao dormitoryDao;

    @Override
    public List<Dormitory> findDormitory() {
        List<Dormitory> doList=dormitoryDao.findDormitory();
        return doList;
    }

    @Override
    public Dormitory findDormitoryByDcoding(String dcoding) {
        return dormitoryDao.findDormitoryByDcoding(dcoding);
    }

    @Override
    public boolean intoDormitory(Dormitory dormitory) {
        return dormitoryDao.intoDormitory(dormitory);
    }

    @Override
    public Dormitory findDormitoryByDid(int did) {
        return dormitoryDao.findDormitoryByDid(did);
    }

    @Override
    public void UpdateDormitory(Dormitory dormitory) {
        dormitoryDao.UpdateDormitory(dormitory);
    }

    @Override
    public void RnameInDormitory(Dormitory dormitory) {
        dormitoryDao.RnameInDormitory(dormitory);
    }

    @Override
    public int findRname(String rname) {
        return dormitoryDao.findRname(rname);
    }

    @Override
    public void intoRecord(Dorecord dorecord) {
        dormitoryDao.intoRecord(dorecord);
    }

    @Override
    public List<Dorecord> findDoRecord() {
        List<Dorecord> drList=dormitoryDao.findDoRecord();
        return drList;
    }

    @Override
    public void updateDstate(int did) {
        dormitoryDao.updateDstate(did);
    }

    @Override
    public List<Dormitory> CfindDormitory(String dcoding, String dstate, String rname) {
        List<Dormitory> doList=dormitoryDao.CfindDormitory(dcoding,dstate,rname);
        return doList;
    }

    @Override
    public List<Dorecord> CfindDoRecord(String dcoding, String bname) {
        List<Dorecord> drList=dormitoryDao.CfindDoRecord(dcoding,bname);
        return drList;
    }

}

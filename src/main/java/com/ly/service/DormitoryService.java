package com.ly.service;

import com.ly.model.Dorecord;
import com.ly.model.Dormitory;

import java.util.List;

//宿舍功能的实现

public interface DormitoryService {
    List<Dormitory> findDormitory();

    Dormitory findDormitoryByDcoding(String dcoding);

    boolean intoDormitory(Dormitory dormitory);

    Dormitory findDormitoryByDid(int did);

    void UpdateDormitory(Dormitory dormitory);

    void RnameInDormitory(Dormitory dormitory);

    int findRname(String rname);

    void intoRecord(Dorecord dorecord);

    List<Dorecord> findDoRecord();

    void updateDstate(int did);

    List<Dormitory> CfindDormitory(String dcoding, String dstate, String rname);

    List<Dorecord> CfindDoRecord(String dcoding, String bname);
}

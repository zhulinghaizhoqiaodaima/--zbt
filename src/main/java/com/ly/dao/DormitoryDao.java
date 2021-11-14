package com.ly.dao;

import com.ly.model.Dorecord;
import com.ly.model.Dormitory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DormitoryDao {
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

    List<Dormitory> CfindDormitory(@Param("dcoding") String dcoding,@Param("dstate") String dstate,@Param("rname") String rname);

    List<Dorecord> CfindDoRecord(@Param("dcoding") String dcoding,@Param("bname") String bname);
}

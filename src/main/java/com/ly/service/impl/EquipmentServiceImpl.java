package com.ly.service.impl;

import com.ly.dao.EquipmentDao;
import com.ly.model.Equipment;
import com.ly.model.Repairs;
import com.ly.service.EquipmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("EquipmentService")
public class EquipmentServiceImpl implements EquipmentService {
    @Resource
    private EquipmentDao equipmentDao;

    @Override
    public List<Equipment> findEquipment() {
        List<Equipment> EqList=equipmentDao.FindEqMessage();
        return EqList;
    }

    @Override
    public Equipment findEquipmentByEqid(int eqid) {
        return equipmentDao.FindEquipmentByEqid(eqid);
    }

    @Override
    public boolean insertRepairs(Repairs repairs) {
        return equipmentDao.insertRepairs(repairs);
    }

    @Override
    public void updateEqState(int eqid) {
        equipmentDao.updateEqState(eqid);
    }

    @Override
    public boolean insertEquipment(Equipment equipment) {
        return equipmentDao.insertEquipment(equipment);
    }

    @Override
    public List<Repairs> findeRepairs() {
        List<Repairs> reList=equipmentDao.findeRepairs();
        return reList;
    }

    @Override
    public int findEqidByRid(int rid) {
        return equipmentDao.findEqidByRid(rid);
    }

    @Override
    public void FinishMaintain(Repairs repairs) {
        equipmentDao.FinishMaintain(repairs);
    }

    @Override
    public Repairs findRepairsByRid(int rid) {
        return equipmentDao.findRepairsByRid(rid);
    }

    @Override
    public String findStateByRid(int rid) {
        return equipmentDao.findStateByRid(rid);
    }

    @Override
    public void updateEq(Equipment equipment) {
        equipmentDao.updateEq(equipment);
    }

    @Override
    public List<Equipment> CfindEquipment(String department, String eqname, String eqstate) {
        List<Equipment> EqList=equipmentDao.CFindEqMessage(department,eqname,eqstate);
        return EqList;
    }

    @Override
    public List<Repairs> CfindeRepairs(String eqname, String state) {
        List<Repairs> reList=equipmentDao.CfindeRepairs(eqname,state);
        return reList;
    }
}

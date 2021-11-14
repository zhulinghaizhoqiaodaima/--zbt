package com.ly.service;

import com.ly.model.Equipment;
import com.ly.model.Repairs;

import java.util.List;

public interface EquipmentService {
    List<Equipment> findEquipment();

    Equipment findEquipmentByEqid(int eqid);

    boolean insertRepairs(Repairs repairs);

    void updateEqState(int eqid);

    boolean insertEquipment(Equipment equipment);

    List<Repairs> findeRepairs();

    int findEqidByRid(int rid);

    void FinishMaintain(Repairs repairs);

    Repairs findRepairsByRid(int rid);

    String findStateByRid(int rid);

    void updateEq(Equipment equipment);

    List<Equipment> CfindEquipment(String department, String eqname, String eqstate);

    List<Repairs> CfindeRepairs(String eqname, String state);
}

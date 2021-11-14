package com.ly.dao;

import com.ly.model.Equipment;
import com.ly.model.Repairs;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface EquipmentDao {
    List<Equipment> FindEqMessage();

    Equipment FindEquipmentByEqid(int eqid);

    boolean insertRepairs(Repairs repairs);

    void updateEqState(int eqid);

    boolean insertEquipment(Equipment equipment);

    List<Repairs> findeRepairs();

    int findEqidByRid(int rid);

    void FinishMaintain(Repairs repairs);

    Repairs findRepairsByRid(int rid);

    String findStateByRid(int rid);

    void updateEq(Equipment equipment);

    List<Equipment> CFindEqMessage(@Param("department") String department,@Param("eqname") String eqname,@Param("eqstate") String eqstate);

    List<Repairs> CfindeRepairs(@Param("eqname") String eqname,@Param("state") String state);
}

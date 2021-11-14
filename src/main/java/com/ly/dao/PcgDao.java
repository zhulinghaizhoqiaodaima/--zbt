package com.ly.dao;


import com.ly.model.AddIvt;
import com.ly.model.Ivt;
import com.ly.model.OutIvt;
import com.ly.model.Pcgplan;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.List;

public interface PcgDao {
    List<Pcgplan> findPcgPlan();

    void intoPcgplan(Pcgplan pcg);

    List<Pcgplan> findPcgPlanByPpid(@Param("ppid") int ppid);

    boolean intoPcgOrdert(Pcgplan pcg);

    void updateKindnum(@Param("ppid") int ppid);

    void delpcgm(@Param("pgid") int pgid);

    void delpcg(@Param("ppid") int ppid);

    Pcgplan findPcgmByPgid(@Param("pgid") int pgid);

    void updatePcgmByPgid(Pcgplan pcg);

    int findPpidByPgid(@Param("pgid") int pgid);

    void reduceKindnum(@Param("ppid") int ppid);

    int findSumByPpid(@Param("ppid") int ppid);

    void sumintoPcgplan(@Param("sum") int sum,@Param("ppid") int ppid);

    void updateStateByPpid(@Param("ppid") int ppid,@Param("wtime") String wtime);

    List<Ivt> findIvtlist();

    Ivt findIvtByname(Ivt ivt);

    boolean intoIvtList(Ivt ivt);

    boolean updateNumByName(Ivt ivt);

    Ivt findIvtByIvid(@Param("ivid") int ivid);

    void updateIvtByIvid(Ivt ivt);

    int findIvtByPpid(@Param("ppid") int ppid);

    void intoIvts(@Param("pcgplangList") List<Pcgplan> pcgplangList);

    void updateIvtStateByPpid(@Param("rtime") String rtime,@Param("cname") String cname,@Param("ppid") int ppid);

    List<Pcgplan> findPcgPlanByState();

    boolean outIvt(OutIvt oi);

    void updateNum(@Param("iname") String iname,@Param("num") int num);

    List<OutIvt> findOutIvt();

    void intoAddIvt(AddIvt addIvt);

    List<AddIvt> findAddIvt();

    void updateARStateByPpid(int ppid);

    List<Pcgplan> CfindPcgPlan(@Param("state") String state,@Param("ARstate") String ARstate);

    List<Ivt> CfindIvtlist(@Param("kind") String kind,@Param("imessage") String imessage);

    List<AddIvt> CfindAddIvt(@Param("kind") String kind,@Param("iname") String iname);

    List<OutIvt> CfindOutIvt(@Param("uname") String uname,@Param("iname") String iname);

    List<Pcgplan> CfindPcgPlanByCtime(@Param("ctime") String ctime);
}

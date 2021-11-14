package com.ly.service;

import com.ly.model.AddIvt;
import com.ly.model.Ivt;
import com.ly.model.OutIvt;
import com.ly.model.Pcgplan;

import java.util.List;

public interface PcgService {
    List<Pcgplan> findPcgPlan();

    void intoPcgplan(Pcgplan pcg);

    List<Pcgplan> findPcgPlanByPpid(int ppid);

    boolean intoPcgOrdert(Pcgplan pcg);

    void updateKindnum(int ppid);

    void delpcgm(int pgid);

    void delpcg(int ppid);

    Pcgplan findPcgmByPgid(int pgid);

    void updatePcgmByPgid(Pcgplan pcg);

    int findPpidByPgid(int pgid);

    void reduceKindnum(int ppid);

    int findSumByPpid(int ppid);

    void sumintoPcgplan(int sum, int ppid);

    void updateStateByPpid(int ppid,String wtime);

    List<Ivt> findIvtlist();

    Ivt findIvtByName(Ivt ivt);

    boolean intoIvtList(Ivt ivt);

    boolean updateNumByName(Ivt ivt);

    Ivt findIvtByIvid(int ivid);

    void updateIvtByIvid(Ivt ivt);

    void intoIvts(List<Pcgplan> pcgplangList);

    int findIvtByPpid(int ppid);

    void updateIvtStateByPpid(String rtime, String cname,int ppid);

    List<Pcgplan> findPcgPlanByState();

    boolean outIvt(OutIvt oi);

    void updateNum(String iname, int num);

    List<OutIvt> findOutIvt();

    void intoAddIvt(AddIvt addIvt);

    List<AddIvt> findAddIvt();

    void updateARStateByPpid(int ppid);

    List<Pcgplan> CfindPcgPlan(String state, String ARstate);

    List<Ivt> CfindIvtlist(String kind, String imessage);

    List<AddIvt> CfindAddIvt(String kind, String iname);

    List<OutIvt> CfindOutIvt(String uname, String iname);

    List<Pcgplan> CfindPcgPlanByCtime(String ctime);
}

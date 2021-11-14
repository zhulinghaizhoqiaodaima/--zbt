package com.ly.service.impl;

import com.ly.dao.PcgDao;
import com.ly.model.AddIvt;
import com.ly.model.Ivt;
import com.ly.model.OutIvt;
import com.ly.model.Pcgplan;
import com.ly.service.PcgService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("PcgService")
public class PcgServiceImpl implements PcgService {
    @Resource
    private PcgDao pcgDao;

    @Override
    public List<Pcgplan> findPcgPlan() {
        List<Pcgplan> pcgplanList=pcgDao.findPcgPlan();
        return pcgplanList;
    }

    @Override
    public void intoPcgplan(Pcgplan pcg) {
        pcgDao.intoPcgplan(pcg);
    }

    @Override
    public List<Pcgplan> findPcgPlanByPpid(int ppid) {
        List<Pcgplan> pcgplangList=pcgDao.findPcgPlanByPpid(ppid);
        return pcgplangList;
    }

    @Override
    public boolean intoPcgOrdert(Pcgplan pcg) {
        return pcgDao.intoPcgOrdert(pcg);
    }

    @Override
    public void updateKindnum(int ppid) {
        pcgDao.updateKindnum(ppid);
    }

    @Override
    public void delpcgm(int pgid) {
        pcgDao.delpcgm(pgid);
    }

    @Override
    public void delpcg(int ppid) {
        pcgDao.delpcg(ppid);
    }

    @Override
    public Pcgplan findPcgmByPgid(int pgid) {
        return pcgDao.findPcgmByPgid(pgid);
    }

    @Override
    public void updatePcgmByPgid(Pcgplan pcg) {
        pcgDao.updatePcgmByPgid(pcg);
    }

    @Override
    public int findPpidByPgid(int pgid) {
        return pcgDao.findPpidByPgid(pgid);
    }

    @Override
    public void reduceKindnum(int ppid) {
        pcgDao.reduceKindnum(ppid);
    }

    @Override
    public int findSumByPpid(int ppid) {
        return pcgDao.findSumByPpid(ppid);
    }

    @Override
    public void sumintoPcgplan(int sum, int ppid) {
        pcgDao.sumintoPcgplan(sum,ppid);
    }

    @Override
    public void updateStateByPpid(int ppid,String wtime) {
        pcgDao.updateStateByPpid(ppid,wtime);
    }

    @Override
    public List<Ivt> findIvtlist() {
        List<Ivt> IvtList=pcgDao.findIvtlist();
        return IvtList;
    }

    @Override
    public Ivt findIvtByName(Ivt ivt) {
        return pcgDao.findIvtByname(ivt);
    }

    @Override
    public boolean intoIvtList(Ivt ivt) {
        return pcgDao.intoIvtList(ivt);
    }

    @Override
    public boolean updateNumByName(Ivt ivt) {
        return pcgDao.updateNumByName(ivt);
    }

    @Override
    public Ivt findIvtByIvid(int ivid) {
        return pcgDao.findIvtByIvid(ivid);
    }

    @Override
    public void updateIvtByIvid(Ivt ivt) {
        pcgDao.updateIvtByIvid(ivt);
    }

    @Override
    public void intoIvts(List<Pcgplan> pcgplangList) {
        pcgDao.intoIvts(pcgplangList);
    }

    @Override
    public int findIvtByPpid(int ppid) {
        return pcgDao.findIvtByPpid(ppid);
    }

    @Override
    public void updateIvtStateByPpid(String rtime,String cname,int ppid) {
        pcgDao.updateIvtStateByPpid(rtime,cname,ppid);
    }

    @Override
    public List<Pcgplan> findPcgPlanByState() {
        List<Pcgplan> PcgList=pcgDao.findPcgPlanByState();
        return PcgList;
    }

    @Override
    public boolean outIvt(OutIvt oi) {
        return pcgDao.outIvt(oi);
    }

    @Override
    public void updateNum(String iname, int num) {
        pcgDao.updateNum(iname,num);
    }

    @Override
    public List<OutIvt> findOutIvt() {
        List<OutIvt> outList=pcgDao.findOutIvt();
        return outList;
    }

    @Override
    public void intoAddIvt(AddIvt addIvt) {
        pcgDao.intoAddIvt(addIvt);
    }

    @Override
    public List<AddIvt> findAddIvt() {
        List<AddIvt> addList=pcgDao.findAddIvt();
        return addList;
    }

    @Override
    public void updateARStateByPpid(int ppid) {
        pcgDao.updateARStateByPpid(ppid);
    }

    @Override
    public List<Pcgplan> CfindPcgPlan(String state, String ARstate) {
        List<Pcgplan> pcgplanList=pcgDao.CfindPcgPlan(state,ARstate);
        return pcgplanList;
    }

    @Override
    public List<Ivt> CfindIvtlist(String kind, String imessage) {
        List<Ivt> IvtList=pcgDao.CfindIvtlist(kind,imessage);
        return IvtList;
    }

    @Override
    public List<AddIvt> CfindAddIvt(String kind, String iname) {
        List<AddIvt> addList=pcgDao.CfindAddIvt(kind,iname);
        return addList;
    }

    @Override
    public List<OutIvt> CfindOutIvt(String uname, String iname) {
        List<OutIvt> outList=pcgDao.CfindOutIvt(uname,iname);
        return outList;
    }

    @Override
    public List<Pcgplan> CfindPcgPlanByCtime(String ctime) {
        List<Pcgplan> pcgplanList=pcgDao.CfindPcgPlanByCtime(ctime);
        return pcgplanList;
    }


}

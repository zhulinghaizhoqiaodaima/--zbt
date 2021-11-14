package com.ly.model;

public class AddIvt {
    private int Aid;
    private String iname;
    private String kind;
    private String cname;
    private int num;
    private String unit;
    private String rtime;
    private String buyaddress;
    private String Ppid;

    public int getAid() {
        return Aid;
    }

    public void setAid(int aid) {
        Aid = aid;
    }

    public String getIname() {
        return iname;
    }

    public void setIname(String iname) {
        this.iname = iname;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getRtime() {
        return rtime;
    }

    public void setRtime(String rtime) {
        this.rtime = rtime;
    }

    public String getBuyaddress() {
        return buyaddress;
    }

    public void setBuyaddress(String buyaddress) {
        this.buyaddress = buyaddress;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getPpid() {
        return Ppid;
    }

    public void setPpid(String ppid) {
        Ppid = ppid;
    }
}

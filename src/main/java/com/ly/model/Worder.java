package com.ly.model;

public class Worder {
    private int wOid;
    private int year;
    private int month;
    private int week;
    private int weekday;
    private String wtime;
    private String name;

    public int getwOid() {
        return wOid;
    }

    public void setwOid(int wOid) {
        this.wOid = wOid;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getWeek() {
        return week;
    }

    public void setWeek(int week) {
        this.week = week;
    }

    public int getWeekday() {
        return weekday;
    }

    public void setWeekday(int weekday) {
        this.weekday = weekday;
    }

    public String getWtime() {
        return wtime;
    }

    public void setWtime(String wtime) {
        this.wtime = wtime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

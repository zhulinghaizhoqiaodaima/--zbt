package com.ly.model;

public class User {
    private long id;
    private String department;
    private String password;
    private String username;
    private String UserType;
    private String name;
    private String sex;
    private int age;
    private long phone;
    private int money;

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public int getMoney() {
        return money;
    }

    public void setMoney(int money) {
        this.money = money;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    private String address;

    public long getId() {
        return id;
    }

    public void setId(long id){
        this.id = id;
    }

    public String getpassword(){
        return password;
    }
    public void setpassword(String password){
        this.password = password;
    }

    public String getUsername(){
        return username;
    }
    public void setUsername(String username){
        this.username = username;
    }
    public String getUserType(){
        return UserType;
    }
    public void setUserType(String UserType){
        this.UserType=UserType;
    }


}
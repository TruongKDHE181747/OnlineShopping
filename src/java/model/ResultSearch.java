/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author 84983
 */
public class ResultSearch {
    int pid;
    String pname;
    int is_active;

    public ResultSearch() {
    }

    public ResultSearch(int pid, String pname, int is_active) {
        this.pid = pid;
        this.pname = pname;
        this.is_active = is_active;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getIs_active() {
        return is_active;
    }

    public void setIs_active(int is_active) {
        this.is_active = is_active;
    }

    @Override
    public String toString() {
        return "ResultSearch{" + "pid=" + pid + ", pname=" + pname + ", is_active=" + is_active + '}';
    }
    
}

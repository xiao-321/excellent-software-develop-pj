package com.daddy.entity;

public class Collect {
    private int cid;
    private String uname;
    private int oid;

    public Collect() {
    }

    public Collect(int cid, String uname, int oid) {
        this.cid = cid;
        this.uname = uname;
        this.oid = oid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    @Override
    public String toString() {
        return "Collect{" +
                "cid=" + cid +
                ", uname='" + uname + '\'' +
                ", oid=" + oid +
                '}';
    }
}

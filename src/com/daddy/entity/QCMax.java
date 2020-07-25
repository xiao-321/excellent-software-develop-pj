package com.daddy.entity;

public class QCMax {
    private int oid;
    private int count;

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "QCMax{" +
                "oid=" + oid +
                ", count=" + count +
                '}';
    }
}

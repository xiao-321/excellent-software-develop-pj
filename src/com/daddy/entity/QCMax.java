package com.daddy.entity;

public class QCMax {
    private int oid;
    private long count;

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
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

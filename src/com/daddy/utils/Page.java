package com.daddy.utils;

public class Page {
    //    分页条数
    int limit;
    //    当前页数
    int page;
    //    当前跳过条数
    int size;
    //    总数
    int sum;

    public Page() {

    }

    public Page(int limit, int page) {
        this.limit = limit;
        this.page = page;
        this.size = page * limit;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
        this.size = limit * page;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
        this.size = page * limit;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    @Override
    public String toString() {
        return "Page{" +
                "limit=" + limit +
                ", page=" + page +
                ", size=" + size +
                ", sum=" + sum +
                '}';
    }
}

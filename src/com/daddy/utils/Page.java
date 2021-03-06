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
    //   内容
    Object data;
    //    总页数
    int total;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Page() {

    }

    public Page(Integer limit, Integer page) {
        if (limit==null||limit<=0)
            limit=5;
        if (page==null||page<=0)
            page=1;
        this.limit = limit;
        this.page = page;
        this.size =(page-1) * limit;
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
        int i = sum / limit;
        if (i<=0){
            this.total=1;
        } else if (i*limit<sum){
            this.total=i+1;
        }else {
            this.total=i;
        }
    }

    @Override
    public String toString() {
        return "Page{" +
                "limit=" + limit +
                ", page=" + page +
                ", size=" + size +
                ", sum=" + sum +
                ", data=" + data +
                ", total=" + total +
                '}';
    }
}

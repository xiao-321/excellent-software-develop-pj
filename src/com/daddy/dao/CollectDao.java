package com.daddy.dao;

import com.daddy.entity.Collect;
import com.daddy.utils.BaseDao;

import java.util.List;

public class CollectDao {
    private BaseDao baseDao = new BaseDao();

    public Collect verfiy(String name, int pid) {
        return baseDao.queryOne("select * from collect where uname = ? and oid = ?", Collect.class, name, pid);
    }

    public boolean insert(Collect c) {
        return baseDao.inUpDel("insert into collect (uname,oid) values (?,?)", c.getUname(), c.getOid());
    }

    public boolean delete(int cid) {
        return baseDao.inUpDel("delete from collect where cid = ?", cid);
    }

    public List<Collect> queryByName(String uname) {
        return baseDao.querySome("select * from collect where uname = ?", Collect.class, uname);
    }
    public boolean deleteByOid(int oid){
        return baseDao.inUpDel("delete from collect where oid = ?", oid);
    }
}

package com.daddy.service;

import com.daddy.dao.CollectDao;
import com.daddy.entity.Collect;

import java.util.List;

public class CollectService {
    private CollectDao collectDao = new CollectDao();

    public Collect verfiy(String name, int pid) {
        return collectDao.verfiy(name, pid);
    }

    public boolean insert(Collect c) {
        return collectDao.insert(c);
    }

    public boolean delete(int cid) {
        return collectDao.delete(cid);
    }

    public List<Collect> queryByName(String uname) {
        return collectDao.queryByName(uname);
    }

    public boolean deleteByOid(int oid) {
        return collectDao.deleteByOid(oid);
    }
}

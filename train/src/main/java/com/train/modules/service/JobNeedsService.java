package com.train.modules.service;

import com.train.modules.dao.JobNeedsDao;
import com.train.modules.entity.JobNeeds;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Tanli on 2017/5/7 0007.
 */
@Service
public class JobNeedsService {

    @Resource
    private JobNeedsDao jobNeedsDao;
    /**
     * 插入一个岗位需求
     * @param jobNeeds
     * @return
     */
    public int insertJobNeed(JobNeeds jobNeeds)
    {
        return jobNeedsDao.insertJobNeed(jobNeeds);
    }

    /**
     * 按照岗位id删除
     * @param jobid
     * @return
     */
    public int deleteByJobId(int jobid)
    {
        return jobNeedsDao.deleteByJobId(jobid);
    }

    /**
     * 将某个课程从某个岗位需求中删除
     * @param courseid
     * @return
     */
    public int deleteByIds( int jobid,int courseid)
    {
        return jobNeedsDao.deleteByIds(jobid, courseid);
    }

    /**
     * 获取某个岗位的岗位需求
     * @param jobid
     * @return
     */
    public List<Map> getByJobId(int jobid)
    {
        return jobNeedsDao.getByJobId(jobid);
    }

    /**
     * 获取某个部门的所有岗位的岗位需求
     * @param deptid 部门id
     * @return
     */
    public List<Map> getJobNeedsDetail(int deptid, int empid)
    {
        return jobNeedsDao.getJobNeedsDetail(deptid, empid);
    }


}

package com.train.modules.service;

import com.train.modules.dao.JobDao;
import com.train.modules.entity.Job;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Tanli on 2017/4/18 0018.
 */
@Service
public class JobService {

    @Resource
    private JobDao jobDao;

    /**
     * 增加一个岗位（Job）
     */
    public int insertJob(Job job)
    {
        return jobDao.insertJob(job);
    }

    /**
     * 删除一个岗位
     */
    public int deleteJobById(int id)
    {
        return jobDao.deleteJobById(id);
    }

    /**
     * 修改岗位
     */
    public int updateJob(Job job)
    {
        return jobDao.updateJob(job);
    }

    /**
     * 根据Id查询一个岗位
     */
    public Job getJobById(int id)
    {
        return jobDao.getJobById(id);
    }

    /**
     * 获取全部岗位
     */
    public List<Job> getAllJobs()
    {
        return jobDao.getAllJobs();
    }

    /**
     * 获取某个部门的全部岗位
     */
    public List<Job> getJobByDeptId(int deptId)
    {
        return  jobDao.getJobByDeptId(deptId);
    }

//    public List<Job> getJobDetail()
//    {
//        return jobDao.getJobDetail();
//    }

    public List<Map> getJobDetail()
    {
        return jobDao.getJobDetail();
    }

    /**
     * 批量删除岗位
     * @param jobids
     * @return
     */
    public int deleteByIds(String[] jobids){
        return jobDao.deleteByIds(jobids);
    }
}

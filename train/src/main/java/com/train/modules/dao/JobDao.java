package com.train.modules.dao;

import com.train.modules.entity.Job;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Tanli on 2017/4/18 0018.
 */
@Repository
public interface JobDao {

    /**
     * 增加一个岗位（Job）
     */
    public int insertJob(Job job);

    /**
     * 删除一个岗位
     */
    public int deleteJobById(int id);

    /**
     * 修改岗位
     */
    public int updateJob(Job job);

    /**
     * 根据Id查询一个岗位
     */
    public Job getJobById(int id);

    /**
     * 获取全部岗位
     */
    public List<Job> getAllJobs();

    /**
     * 获取某个部门的全部岗位
     */
    public List<Job> getJobByDeptId(int deptId);

    /**
     * 获取岗位的详细信息，包括岗位所属的部门 废了
     * @return
     */
//    public List<Job> getJobDetail();

    public List<Map> getJobDetail();

    /**
     * 批量删除岗位
     * @param jobids
     * @return
     */
    public int deleteByIds(String[] jobids);
}

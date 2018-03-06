package com.train.modules.dao;

import com.train.modules.entity.JobNeeds;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Tanli on 2017/5/7 0007.
 */

/**
 * 说明：岗位需求是有多个课程组成的。具体地，表现在数据库中，一个岗位需求有多条记录。over！
 */
@Repository
public interface JobNeedsDao {

    /**
     * 插入一个岗位需求
     * @param jobNeeds
     * @return
     */
    public int insertJobNeed(JobNeeds jobNeeds);

    /**
     * 按照岗位id删除
     * @param jobid
     * @return
     */
    public int deleteByJobId(int jobid);

    /**
     * 将某个课程从某个岗位需求中删除
     * @param courseid
     * @return
     */
    public int deleteByIds(@Param("jobid") int jobid, @Param("courseid") int courseid);


    /**
     * 获取某个岗位的岗位需求
     * @param jobid
     * @return
     */
    public List<Map> getByJobId(int jobid);

    /**
     * 获取某个部门的所有岗位的岗位需求
     * @param deptid 部门id
     * @return
     */
    public List<Map> getJobNeedsDetail(@Param("deptid") int deptid,@Param("empid") int empid);


}

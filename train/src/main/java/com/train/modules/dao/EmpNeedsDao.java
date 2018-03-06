package com.train.modules.dao;

import com.train.modules.entity.EmpNeeds;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Tanli on 2017/5/7 0007.
 */
@Repository
public interface EmpNeedsDao {

    /**
     * 增加 员工个人需求
     * @param empNeeds
     * @return
     */
    public int insertEmpNeeds(EmpNeeds empNeeds);

    /**
     * 删除某个员工的某个选课
     * @param empid
     * @param courseid
     * @return
     */
    public int deleteByIds(int empid, int courseid);

    /**
     * 成绩
     * @param empid
     * @param courseid
     * @param score
     * @return
     */
    public int setScore(int empid, int  courseid, double score);

    /**
     * 获取某位员工的全部选课
     * @param empid
     * @return
     */
    public List<EmpNeeds> getByEmpid(int empid);

    /**
     * 获取某位员工某个学期的全部选课，包括成绩
     * @param empid
     * @param term
     * @return
     */
    public List<EmpNeeds> getTermByEmpId(int empid, String term);

    /**
     * 根据员工id获取员工选课的详细信息，包括成绩
     * @param empid
     * @return
     */
    public List<Map> getEmpNeedsDetail(int empid);

    /**
     * 获取选课信息以及课程的评价信息
     * @param empid
     * @return
     */
    public List<Map> checkScore(int empid);

    /**
     * 批量设置成绩
     * @param scores
     * @return
     */
    public int setScoresBat(@Param("scores") ArrayList<Map> scores);

    /**
     * 获取某个老师某门课的全部成绩信息
     * @param courseid
     * @param teaid
     * @return
     */
    public List<Map> checkScores(@Param("courseid") int courseid);
}

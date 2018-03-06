package com.train.modules.dao;

import com.train.modules.entity.Teacher;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Tanli on 2017/4/17 0017.
 */
@Repository
public interface TeacherDao {

    /**
     * 教师登录
     * @param username
     * @param psw
     * @return
     */
    public Teacher teacherLogin(String username, String psw);

    /**
     * 增加教师
     * @param teacher
     * @return
     */
    public int insertTeacher(Teacher teacher);

    /**
     * 根据教师编号删除教师
     * @param id
     * @return
     */
    public int deleteByTeaId(int id);

    /**
     * 教师自己更改自己的信息
     * @param teacher
     * @return
     */
    public int updateTeacher(Teacher teacher);

    /**
     * 管理员更新教师信息
     * @param teacher
     * @return
     */
    public int updateBySys(Teacher teacher);

    /**
     * 修改密码
     * @param id
     * @param psw
     * @return
     */
    public int modifyPsw(int id, String psw);

    /**
     * 根据教师编号获取教师信息
     * @param id
     * @return
     */
    public Teacher getTeacherById(int id);

    /**
     * 获取所有教师信息
     * @return
     */
    public List<Teacher> getAllTeacher();

    /**
     * 获取id为teaid的老师的某个课程的选课名单
     * @param teaid
     * @param courseid
     * @return
     */
    public List<Map> chooseList(@Param("teaid") int teaid, @Param("courseid") int courseid);

    /**
     * 批量删除教师
     * @param teacherids
     * @return
     */
    public int deleteTeaBat(String[] teacherids);
}

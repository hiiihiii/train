package com.train.modules.service;

import com.train.modules.dao.TeacherDao;
import com.train.modules.entity.Teacher;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Tanli on 2017/4/17 0017.
 */
@Service
public class TeacherService {

    @Resource
    TeacherDao teacherDao;
    public Teacher teacherLogin(String username, String psw)
    {
        return teacherDao.teacherLogin(username, psw);
    }

    /**
     * 增加教师
     * @param teacher
     * @return
     */
    public int insertTeacher(Teacher teacher)
    {
        return teacherDao.insertTeacher(teacher);
    }

    /**
     * 根据教师编号删除教师
     * @param id
     * @return
     */
    public int deleteByTeaId(int id)
    {
        return teacherDao.deleteByTeaId(id);
    }

    /**
     * 更改教师信息
     * @param teacher
     * @return
     */
    public int updateTeacher(Teacher teacher)
    {
        return teacherDao.updateTeacher(teacher);
    }

    /**
     * 管理员更新教师信息
     * @param teacher
     * @return
     */
    public int updateBySys(Teacher teacher)
    {
        return teacherDao.updateBySys(teacher);
    }

    /**
     * 修改密码
     * @param id
     * @param psw
     * @return
     */
    public int modifyPsw(int id, String psw)
    {
        return teacherDao.modifyPsw(id, psw);
    }

    /**
     * 根据教师编号获取教师信息
     * @param id
     * @return
     */
    public Teacher getTeacherById(int id)
    {
        return teacherDao.getTeacherById(id);
    }

    /**
     * 获取所有教师信息
     * @return
     */
    public List<Teacher> getAllTeacher()
    {
        return teacherDao.getAllTeacher();
    }

    /**
     * 获取id为teaid的老师的某个课程的选课名单
     * @param teaid
     * @param courseid
     * @return
     */
    public List<Map> chooseList(int teaid, int courseid)
    {
        return teacherDao.chooseList(teaid, courseid);
    }

    /**
     * 批量删除教师
     * @param teacherids
     * @return
     */
    public int deleteTeaBat(String[] teacherids){
        return teacherDao.deleteTeaBat(teacherids);
    }
}

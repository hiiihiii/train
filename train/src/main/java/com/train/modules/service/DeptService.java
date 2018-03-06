package com.train.modules.service;

import com.train.modules.dao.DeptDao;
import com.train.modules.entity.Department;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Tanli on 2017/4/18 0018.
 */
@Service
public class DeptService {

    @Resource
    private DeptDao deptDao;

    /**
     * 增加一个部门
     */
    public int insertDept(Department department)
    {
        return deptDao.insertDept(department);
    }

    /**
     * 根据id删除一个部门
     */
    public int deleteDeptById(int id)
    {
        return deptDao.deleteDeptById(id);
    }

    /**
     * 更新一个部门
     */
    public int updateDept(Department department)
    {
        return deptDao.updateDept(department);
    }

    /**
     * 查询一个部门
     */
    public Department getOneDept(int id)
    {
        return deptDao.getOneDept(id);
    }

    /**
     * 获取所有的部门信息
     */
    public List<Department> getAllDepts()
    {
        return deptDao.getAllDepts();
    }

    /**
     * 根据员工号获取部门
     * @param empid
     * @return
     */
    public List<Department> getByEmpid(int empid)
    {
        return deptDao.getByEmpid(empid);
    }

    /**
     * 批量删除部门
     * @param ids
     * @return
     */
    public int deleteByIds(String[] ids)
    {
        return deptDao.deleteByIds(ids);
    }
}

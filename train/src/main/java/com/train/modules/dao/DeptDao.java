package com.train.modules.dao;

import com.train.modules.entity.Department;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Tanli on 2017/4/18 0018.
 */
@Repository
public interface DeptDao {

    /**
     *  增加一个部门
     */
    public int insertDept(Department department);

    /**
     * 根据id删除一个部门
     */
    public int deleteDeptById(int id);

    /**
     * 更新一个部门
     */
    public int updateDept(Department department);

    /**
     * 根据id查询一个部门
     */
    public Department getOneDept(int id);

    /**
     * 获取所有的部门信息
     */
    public List<Department> getAllDepts();

    /**
     * 根据员工号获取部门
     * @param empid
     * @return
     */
    public List<Department> getByEmpid(int empid);

    /**
     * 批量删除部门
     * @param ids
     * @return
     */
    public int deleteByIds(String[] ids);
}

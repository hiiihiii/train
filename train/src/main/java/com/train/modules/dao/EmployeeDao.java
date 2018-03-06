package com.train.modules.dao;

import com.train.modules.entity.Employee;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Tanli on 2017/4/18 0018.
 */
@Repository
public interface EmployeeDao {
    /**
     * 员工登录
     * @param empno
     * @param psw
     * @return
     */
    public Employee employeeLogin(String empno, String psw);

    /**
     * 增加员工
     * @param employee
     * @return
     */
    public int insertEmp(Employee employee);

    /**
     * 按照员工号删除Id
     * @param empId
     * @return
     */
    public int deleteByEmpId(int empId);

    /**
     * 更新员工信息
     * @param employee
     * @return
     */
    public int updateEmp(Employee employee);

    /**
     * 修改密码
     * @param empId
     * @param newPsw
     * @return
     */
    public int modifyPsw(int empId, String newPsw);

    /**
     * 根据员工Id获取员工
     * @param empId
     * @return
     */
    public Employee getEmpByEmpId(String empId);

    /**
     * 获取所有的员工信息
     * @return
     */
    public List<Employee> getAllEmp();

    /**
     * 获取某部门的全部员工
     * @param deptId
     * @return
     */
    public List<Employee> getEmpByDeptId(int deptId);

    /**
     * 根据课程编号获取选课名单
     * @param courseid
     * @return
     */
    public List<Employee> getEmpByCourseId(@Param(value = "courseid") int courseid , @Param("teaid") int teacherid);

    /**
     * 批量删除员工
     * @param empids
     * @return
     */
    public  int deleteByEmpIds(String[] empids);
}

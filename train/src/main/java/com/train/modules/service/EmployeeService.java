package com.train.modules.service;

import com.train.modules.dao.EmployeeDao;
import com.train.modules.entity.Employee;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2017/4/18 0018.
 */
@Service
public class EmployeeService {
    @Resource
    private EmployeeDao employeeDao;

    /**
     * 员工登录
     * @param empno
     * @param psw
     * @return
     */
    public Employee employeeLogin(String empno, String psw)
    {
        return employeeDao.employeeLogin(empno, psw);
    }

    /**
     * 增加员工
     * @param employee
     * @return
     */
    public int insertEmp(Employee employee)
    {
        return employeeDao.insertEmp(employee);
    }

    /**
     * 按照员工号删除Id
     * @param empId
     * @return
     */
    public int deleteByEmpId(int empId)
    {
        return employeeDao.deleteByEmpId(empId);
    }

    /**
     * 更新员工信息
     * @param employee
     * @return
     */
    public int updateEmp(Employee employee)
    {
        return employeeDao.updateEmp(employee);
    }

    /**
     * 修改密码
     * @param empId
     * @param newPsw
     * @return
     */
    public int modifyPsw(int empId, String newPsw)
    {
        return employeeDao.modifyPsw(empId, newPsw);
    }

    /**
     * 根据员工Id获取员工
     * @param empId
     * @return
     */
    public Employee getEmpByEmpId(String empId)
    {
        return employeeDao.getEmpByEmpId(empId);
    }

    /**
     * 获取所有的员工信息
     * @return
     */
    public List<Employee> getAllEmp()
    {
        return employeeDao.getAllEmp();
    }

    /**
     * 获取某部门的全部员工
     * @param deptId
     * @return
     */
    public List<Employee> getEmpByDeptId(int deptId)
    {
        return employeeDao.getEmpByDeptId(deptId);
    }

    /**
     * 根据课程编号获取选课名单
     * @param courseid
     * @return
     */
    public List<Employee> getEmpByCourseId(int courseid, int teacherid)
    {
        return employeeDao.getEmpByCourseId(courseid, teacherid);
    }

    /**
     * 批量删除员工
     * @param empids
     * @return
     */
    public  int deleteByEmpIds(String[] empids){
        return employeeDao.deleteByEmpIds(empids);
    }
}

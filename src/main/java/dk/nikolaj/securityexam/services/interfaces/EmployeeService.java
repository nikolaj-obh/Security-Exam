package dk.nikolaj.securityexam.services.interfaces;

import dk.nikolaj.securityexam.entities.Employee;

import java.util.List;

public interface EmployeeService {

    List<Employee> listAllEmployees();

    Employee getEmployee(Long id);

    void saveEmployee(Employee employee);

    void deleteEmployee(Long id);
}

package dk.nikolaj.securityexam.services;

import dk.nikolaj.securityexam.entities.Employee;
import dk.nikolaj.securityexam.repositories.EmployeeRepository;
import dk.nikolaj.securityexam.services.interfaces.EmployeeService;
import javax.transaction.Transactional;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

    private final EmployeeRepository employeeRepository;

    public EmployeeServiceImpl(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    public List<Employee> listAllEmployees() {
        return employeeRepository.findAll();
    }

    public Employee getEmployee(Long id) {
        return employeeRepository.findById(id).get();
    }

    public void saveEmployee(Employee employee) {
        employeeRepository.save(employee);
    }

    public void deleteEmployee(Long id) {
        employeeRepository.deleteById(id);
    }
}

package dk.nikolaj.securityexam.repositories;

import dk.nikolaj.securityexam.entities.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
}

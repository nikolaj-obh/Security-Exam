package dk.nikolaj.securityexam.repositories;

import dk.nikolaj.securityexam.entities.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
}

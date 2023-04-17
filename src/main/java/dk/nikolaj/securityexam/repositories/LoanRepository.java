package dk.nikolaj.securityexam.repositories;

import dk.nikolaj.securityexam.entities.Loan;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LoanRepository extends JpaRepository<Loan, Long> {
}

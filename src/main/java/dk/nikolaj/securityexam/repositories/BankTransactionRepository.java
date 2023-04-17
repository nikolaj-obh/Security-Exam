package dk.nikolaj.securityexam.repositories;

import dk.nikolaj.securityexam.entities.BankTransaction;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BankTransactionRepository extends JpaRepository<BankTransaction, Long> {
}

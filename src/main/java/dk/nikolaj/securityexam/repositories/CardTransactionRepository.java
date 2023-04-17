package dk.nikolaj.securityexam.repositories;

import dk.nikolaj.securityexam.entities.CardTransaction;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CardTransactionRepository extends JpaRepository<CardTransaction, Long> {
}

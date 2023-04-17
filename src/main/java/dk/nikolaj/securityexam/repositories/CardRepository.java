package dk.nikolaj.securityexam.repositories;

import dk.nikolaj.securityexam.entities.Card;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CardRepository extends JpaRepository<Card, Long> {
}

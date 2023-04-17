package dk.nikolaj.securityexam.repositories;

import dk.nikolaj.securityexam.entities.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountRepository extends JpaRepository<Account, Long> {
}

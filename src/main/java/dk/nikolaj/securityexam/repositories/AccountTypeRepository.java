package dk.nikolaj.securityexam.repositories;

import dk.nikolaj.securityexam.entities.AccountType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountTypeRepository extends JpaRepository<AccountType, Long> {
}

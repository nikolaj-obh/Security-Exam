package dk.nikolaj.securityexam.repositories;

import dk.nikolaj.securityexam.entities.Branch;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BranchRepository extends JpaRepository<Branch,Long> {
}

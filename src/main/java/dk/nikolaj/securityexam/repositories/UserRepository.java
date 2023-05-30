package dk.nikolaj.securityexam.repositories;

import dk.nikolaj.securityexam.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query(value = "SELECT * FROM users u WHERE u.email = :username", nativeQuery = true)
    Optional<User> findByUsername(@Param("username") String username);
    Boolean existsByEmail(String email);

    //@Query(value = "SELECT * FROM users u WHERE u.email = ?1", nativeQuery = true)
    //Optional<User> findByUsername(String username);
    //Boolean existsByEmail(String email);
}

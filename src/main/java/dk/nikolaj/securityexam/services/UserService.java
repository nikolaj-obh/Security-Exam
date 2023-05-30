package dk.nikolaj.securityexam.services;

import dk.nikolaj.securityexam.entities.User;
import dk.nikolaj.securityexam.repositories.UserRepository;
import dk.nikolaj.securityexam.exceptions.NotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getUsers() {
        return new ArrayList<>(userRepository.findAll());
    }

    public boolean existsByUsername(String email) {
        return userRepository.existsByEmail(email);
    }

    public User addUser(User user) {
        return userRepository.save(user);
    }

    public User findUserById(int id) {
        return userRepository.findById(id).orElseThrow(NotFoundException::new);
    }

    public void deleteUserById(int id) {
        userRepository.deleteById(id);
    }

    public User updateUser(User user){
        return userRepository.save(user);
    }
}

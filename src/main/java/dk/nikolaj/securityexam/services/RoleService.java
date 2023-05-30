package dk.nikolaj.securityexam.services;

import dk.nikolaj.securityexam.entities.Role;
import dk.nikolaj.securityexam.exceptions.NotFoundException;
import dk.nikolaj.securityexam.repositories.RoleRepository;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Service
public class RoleService {

    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public Set<Role> getRoles() {
        return new HashSet<>(roleRepository.findAll());
    }

    public Role addRole(Role role) {
        return roleRepository.save(role);
    }

    public Role findRoleById(int id) {
        return roleRepository.findById(id).orElseThrow(NotFoundException::new);
    }

    public Optional<Role> findRoleByName(String name) {
        return roleRepository.findByName(name);
    }

    public void deleteRoleById(int id) {
        roleRepository.deleteById(id);
    }

    public Role updateRole(Role role){
        return roleRepository.save(role);
    }
}

package dk.nikolaj.securityexam.controllers;

import dk.nikolaj.securityexam.dto.AuthDto;
import dk.nikolaj.securityexam.dto.LoginDto;
import dk.nikolaj.securityexam.dto.RegisterDto;
import dk.nikolaj.securityexam.entities.Role;
import dk.nikolaj.securityexam.entities.User;
import dk.nikolaj.securityexam.security.jwt.JwtAuthToken;
import dk.nikolaj.securityexam.services.RoleService;
import dk.nikolaj.securityexam.services.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashSet;
import java.util.Set;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final UserService userService;
    private final RoleService roleService;
    private final PasswordEncoder passwordEncoder;
    private final JwtAuthToken jwtAuthToken;

    public AuthController(AuthenticationManager authenticationManager, UserService userService, RoleService roleService, PasswordEncoder passwordEncoder, JwtAuthToken jwtAuthToken) {
        this.authenticationManager = authenticationManager;
        this.userService = userService;
        this.roleService = roleService;
        this.passwordEncoder = passwordEncoder;
        this.jwtAuthToken = jwtAuthToken;
    }

    @PostMapping("login")
    public ResponseEntity<AuthDto> login(@Valid @RequestBody LoginDto loginDto){
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginDto.getEmail(), loginDto.getPassword()));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String token = jwtAuthToken.generateToken(authentication);
        return new ResponseEntity<>(new AuthDto(token), HttpStatus.OK);
    }

    @PostMapping("register")
    public ResponseEntity<String> register(@Valid @RequestBody RegisterDto registerDto){
        if(userService.existsByUsername(registerDto.getEmail())){
            return new ResponseEntity<>("Username already exist", HttpStatus.BAD_REQUEST);
        }

        User user = new User();
        user.setEmail(registerDto.getEmail());
        user.setPassword(passwordEncoder.encode(registerDto.getPassword()));
        user.setName(registerDto.getName());

        Role role = roleService.findRoleByName("USER").get();
        Set<Role> userRoles = new HashSet<>();
        userRoles.add(role);
        user.setRoles(userRoles);

        userService.addUser(user);

        return new ResponseEntity<>("User registration successful", HttpStatus.OK);
    }
}

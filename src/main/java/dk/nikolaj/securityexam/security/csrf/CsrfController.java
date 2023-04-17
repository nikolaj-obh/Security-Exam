package dk.nikolaj.securityexam.security.csrf;

import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class CsrfController {

    @GetMapping("api/csrf")
    public CsrfToken csrf(CsrfToken token){
        return token;
    }
}

package dk.nikolaj.securityexam.dto;

import lombok.Data;

@Data
public class AuthDto {

    private String token;
    private String tokenType = "Bearer ";

    public AuthDto(String token) {
        this.token = token;
    }
}

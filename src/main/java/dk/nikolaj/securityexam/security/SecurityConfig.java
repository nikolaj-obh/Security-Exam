package dk.nikolaj.securityexam.security;

import dk.nikolaj.securityexam.security.jwt.JwtAuthEntryPoint;
import dk.nikolaj.securityexam.security.jwt.JwtAuthenticationFilter;
import dk.nikolaj.securityexam.security.service.MyUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;


@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final JwtAuthEntryPoint authEntryPoint;

    private final MyUserDetailsService myUserDetailsService;

    @Autowired
    public SecurityConfig(MyUserDetailsService myUserDetailsService, JwtAuthEntryPoint authEntryPoint) {
        this.myUserDetailsService = myUserDetailsService;
        this.authEntryPoint = authEntryPoint;
    }

    //@Override
    //protected void configure(HttpSecurity http) throws Exception {
    //    http
    //            .headers()
    //            .contentSecurityPolicy("default-src 'self'; script-src 'self' https://trustedcdn.com; object-src 'none'; style-src 'self' https://trustedcdn.com; img-src 'self' data:; font-src 'self' https://trustedcdn.com; connect-src 'self' https://apiserver.com");
    //}

    //@Bean
    //public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
    //    http.cors().and().csrf().disable()//.csrf()
    //            //.csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse())
    //            //.and()
    //            .exceptionHandling()
    //            .authenticationEntryPoint(authEntryPoint)
    //            .and()
    //            .sessionManagement()
    //            .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
    //            .and()
    //            .authorizeRequests()
    //            .mvcMatchers("/api/auth/**", "/api/trips/**","/api/users/**").permitAll()
    //            //.antMatchers("api/csrf").permitAll()
    //            //.mvcMatchers("/**").permitAll()
    //            .anyRequest().authenticated()
    //            .and()
    //            .httpBasic();
    //    http.addFilterBefore(jwtAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class);
//
    //    return http.build();
    //}

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.cors().and().csrf().disable()
                .headers(headers -> headers
                        .contentSecurityPolicy("default-src 'self'; script-src 'self' https://somecdn.com; object-src 'none'; style-src 'self' https://somecdn.com; img-src 'self' data:; font-src 'self' https://somecdn.com; connect-src 'self' https://someserver.com"))
                .exceptionHandling()
                .authenticationEntryPoint(authEntryPoint)
                .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeRequests()
                .mvcMatchers("/api/auth/**", "/api/trips/**","/api/users/**").permitAll()
                .anyRequest().authenticated()
                .and()
                .httpBasic();

        http.addFilterBefore(jwtAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider auth = new DaoAuthenticationProvider();
        auth.setUserDetailsService(myUserDetailsService);
        auth.setPasswordEncoder(passwordEncoder());
        return auth;
    }


    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception{
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public JwtAuthenticationFilter jwtAuthenticationFilter(){
        return new JwtAuthenticationFilter();
    }
}


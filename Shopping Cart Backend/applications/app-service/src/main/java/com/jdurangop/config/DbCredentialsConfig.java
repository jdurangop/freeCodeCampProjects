package com.jdurangop.config;

import com.jdurangop.jpa.config.DBSecret;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DbCredentialsConfig {
    @Bean
    public DBSecret getDbCredentials(@Value("${spring.datasource.url}") String url,
                                     @Value("${spring.datasource.username}") String username,
                                     @Value("${spring.datasource.password}") String password) {
        return DBSecret.builder()
            .url(url)
            .username(username)
            .password(password)
            .build();
    }
}

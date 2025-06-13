package com.example.jwtauthdemo.service;

import com.example.jwtauthdemo.model.User;
import com.example.jwtauthdemo.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    public boolean isUserSelf(Long userId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated()) {
            return false;
        }

        String email = authentication.getName();
        return userRepository.findByEmail(email)
                .map(User::getId)
                .map(id -> id.equals(userId))
                .orElse(false);
    }
} 
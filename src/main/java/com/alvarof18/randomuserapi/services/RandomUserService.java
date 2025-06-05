package com.alvarof18.randomuserapi.services;

import com.alvarof18.randomuserapi.entity.User;
import com.alvarof18.randomuserapi.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class RandomUserService {

    private final UserRepository userRepository;

    @Autowired
    public RandomUserService(UserRepository repository) {
        this.userRepository = repository;
    }

    @Transactional(readOnly = true)
    public User getRandomUser() {
        return userRepository.findRandomUser();
    }

}

package com.alvarof18.randomuserapi.controller;

import com.alvarof18.randomuserapi.entity.User;
import com.alvarof18.randomuserapi.services.RandomUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/users")
@CrossOrigin(origins = "*")
public class RandomUserController {

    private final RandomUserService randomUserService;

    @Autowired
    public RandomUserController(RandomUserService randomUserService) {
        this.randomUserService = randomUserService;

    }

    @GetMapping("/random")
    public ResponseEntity<?> getRandomUsername() {
        User user = randomUserService.getRandomUser();

        if (user == null) {
            return ResponseEntity.noContent().build();
        }

        return ResponseEntity.ok().body(
                new RandomUserResponse(user.getUsername())
        );
    }

    /**
     * DTO interno para enviar solo el "username" en la respuesta.
     */
    static class RandomUserResponse {
        private String username;

        public RandomUserResponse(String username) {
            this.username = username;
        }

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

    }
}

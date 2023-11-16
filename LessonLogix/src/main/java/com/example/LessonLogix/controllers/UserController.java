package com.example.LessonLogix.controllers;

import com.example.LessonLogix.models.Image;
import com.example.LessonLogix.models.User;
import com.example.LessonLogix.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    @GetMapping("/login")
    public String login(){
        return "login";
    }

    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @GetMapping("/profile")
    public String profile(Principal principal, Model model){
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "profile";
    }

    @PostMapping("/registration")
    public String createUser(@ModelAttribute("user") User user,
                             @RequestParam("avatarFile") MultipartFile avatarFile,
                             Model model) {
        if (!userService.createUser(user, avatarFile)) {
            model.addAttribute("errorMessage", "Користувач з email:" + user.getEmail() + " вже існує");
            return "/registration";
        }
        return "redirect:/login";
    }


    @PostMapping("/login")
    public String login(@RequestParam(name = "error", required = false) String error,
                        @RequestParam(name = "username", required = false) String username,
                        Model model) {
        if (error != null) {
            model.addAttribute(
                    "usernameError",
                    "Помилка входу: невірна електронна пошта або пароль"
            );
        }
        model.addAttribute("username", username);
        return "login";
    }

    @GetMapping("/user/{user}")
    public String userInfo(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        return "user-info";
    }

}

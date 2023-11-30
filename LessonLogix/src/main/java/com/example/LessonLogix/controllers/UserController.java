package com.example.LessonLogix.controllers;

import com.example.LessonLogix.models.User;
import com.example.LessonLogix.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

/**
 * Контролер для обробки запитів, пов'язаних з користувачами.
 */
@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    /**
     * Отримати сторінку входу користувача.
     *
     * @return Назва представлення "login".
     */
    @GetMapping("/login")
    public String login(){
        return "login";
    }

    /**
     * Отримати сторінку реєстрації нового користувача.
     *
     * @return Назва представлення "registration".
     */
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    /**
     * Створити нового користувача за допомогою POST-запиту.
     *
     * @param user Об'єкт, що представляє нового користувача.
     * @param avatarFile Зображення аватара для нового користувача.
     * @param model Модель для передачі даних у представлення.
     * @return Редірект на сторінку входу.
     */
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

    /**
     * Вхід користувача за допомогою POST-запиту.
     *
     * @param error Рядок для визначення наявності помилки входу.
     * @param username Електронна пошта користувача (для передачі в поле введення).
     * @param model Модель для передачі даних у представлення.
     * @return Назва представлення "login".
     */
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

    /**
     * Отримати профіль автентифікованого користувача.
     *
     * @param principal Об'єкт, що представляє автентифікованого користувача.
     * @param model Модель для передачі даних у представлення.
     * @return Назва представлення "profile".
     */
    @GetMapping("/profile")
    public String profile(Principal principal, Model model){
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "profile";
    }

    /**
     * Отримати сторінку інформації про користувача за його ідентифікатором.
     *
     * @param user Об'єкт користувача, якого потрібно відобразити.
     * @param model Модель для передачі даних у представлення.
     * @return Назва представлення "user-info".
     */
    @GetMapping("/user/{user}")
    public String userInfo(@PathVariable("user") User user, Model model) {
        model.addAttribute("user", user);
        return "user-info";
    }

}

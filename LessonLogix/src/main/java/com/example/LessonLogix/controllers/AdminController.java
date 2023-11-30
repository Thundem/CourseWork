package com.example.LessonLogix.controllers;

import com.example.LessonLogix.models.User;
import com.example.LessonLogix.models.enums.Role;
import com.example.LessonLogix.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

/**
 * Контролер адміністратора для керування користувачами.
 */
@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;

    /**
     * Отримати сторінку адміністратора зі списком користувачів.
     *
     * @param model Модель для передачі даних у представлення.
     * @return Назва представлення "admin" для адміністратора.
     */
    @GetMapping("/admin")
    public String admin(Model model){
        model.addAttribute("users", userService.list());
        return "admin";
    }

    /**
     * Заборонити користувача за його ID.
     *
     * @param id ID користувача, якого потрібно заборонити.
     * @return Редірект на сторінку адміністратора після виконання дії.
     */
    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Long id){
        userService.banUser(id);
        return "redirect:/admin";
    }

    /**
     * Отримати сторінку редагування користувача за його ID.
     *
     * @param user Об'єкт користувача, якого потрібно редагувати.
     * @param model Модель для передачі даних у представлення.
     * @return Назва представлення "user-edit" для редагування користувача.
     */
    @GetMapping("/admin/user/edit/{user}")
    public String userEdit(@PathVariable("user") User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "user-edit";
    }

    /**
     * Зберегти зміни після редагування користувача.
     *
     * @param user Об'єкт користувача, якого потрібно редагувати.
     * @param form Мапа параметрів для оновлення ролей користувача.
     * @return Редірект на сторінку адміністратора після виконання дії.
     */
    @PostMapping("/admin/user/edit")
    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form){
        userService.changeUserRoles(user, form);
        return "redirect:/admin";
    }

    /**
     * Видалити користувача за його ID.
     *
     * @param id ID користувача, якого потрібно видалити.
     * @return Редірект на сторінку адміністратора після виконання дії.
     */
    @PostMapping("/admin/user/delete/{id}")
    public String deleteUserById(@PathVariable("id") Long id){
        userService.deleteUserById(id);
        return "redirect:/admin";
    }
}

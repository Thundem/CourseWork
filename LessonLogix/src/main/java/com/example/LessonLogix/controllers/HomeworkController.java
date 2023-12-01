package com.example.LessonLogix.controllers;

import com.example.LessonLogix.models.Subject;
import com.example.LessonLogix.models.User;
import com.example.LessonLogix.service.LessonsService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.DayOfWeek;
import java.util.List;
/**
 * Контролер для роботи з домашніми завданнями та предметами.
 */
@Controller
@RequiredArgsConstructor
public class HomeworkController {
    @Autowired
    private LessonsService lessonsService;

    /**
     * Отримати інформацію про домашні завдання для конкретного дня тижня.
     *
     * @param dayOfWeek День тижня, для якого потрібна інформація про домашні завдання.
     * @param model Модель для передачі даних у представлення.
     * @param principal Об'єкт, що представляє автентифікованого користувача.
     * @return Назва представлення "homework-info".
     */
    @GetMapping("/homework-info/{dayOfWeek}")
    public String homeworkInfo(@PathVariable String dayOfWeek, Model model, Principal principal) {
        User user = lessonsService.getUserByPrincipal(principal);

        if (user != null) {
            // Отримати список предметів для конкретного дня тижня (dayOfWeek) і конкретного користувача
            DayOfWeek day = DayOfWeek.valueOf(dayOfWeek);
            List<Subject> lessons = lessonsService.getLessonsByDayAndUser(day, user);

            model.addAttribute("dayOfWeek", dayOfWeek);
            model.addAttribute("lessons", lessons);
        }

        return "homework-info";
    }

    /**
     * Отримати сторінку редагування домашнього завдання.
     *
     * @param id ID домашнього завдання, яке потрібно редагувати.
     * @param dayOfWeek День тижня, для якого потрібно редагувати домашнє завдання.
     * @param model Модель для передачі даних у представлення.
     * @return Назва представлення "homework-edit" для редагування домашнього завдання.
     */
    @PostMapping("/homework-edit")
    public String homeworkEdit(@RequestParam("id") Long id, @RequestParam("dayOfWeek") String dayOfWeek, Model model) {
        // Отримати деталі предмету для редагування (на основі id)
        Subject lessonToEdit = lessonsService.getLessonById(id);

        model.addAttribute("lesson", lessonToEdit);
        model.addAttribute("dayOfWeek", dayOfWeek);

        return "homework-edit";
    }

    /**
     * Зберегти оновлене домашнє завдання після редагування.
     *
     * @param id ID домашнього завдання, яке потрібно оновити.
     * @param dayOfWeek День тижня, для якого потрібно оновити домашнє завдання.
     * @param updatedHomework Оновлене текстове опис домашнього завдання.
     * @return Редірект на сторінку інформації про домашнє завдання після виконання дії.
     */
    @PostMapping("/updated-homework")
    public String updatedHomework(@RequestParam("id") Long id, @RequestParam("dayOfWeek") String dayOfWeek,
                                  @RequestParam("homework") String updatedHomework) {
        DayOfWeek day = DayOfWeek.valueOf(dayOfWeek);
        lessonsService.updateHomework(id, updatedHomework, day);

        return "redirect:/homework-info/" + dayOfWeek;
    }

}

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
import java.util.*;

/**
 * Контролер для обробки запитів, пов'язаних з уроками та розкладом.
 */
@Controller
@RequiredArgsConstructor
public class LessonsController {
    @Autowired
    private LessonsService lessonsService;

    /**
     * Отримати головну сторінку з розкладом уроків на тиждень.
     *
     * @param model Модель для передачі даних у представлення.
     * @param principal Об'єкт, що представляє автентифікованого користувача.
     * @return Назва представлення "daily".
     */
    @GetMapping("/")
    public String daily(Model model, Principal principal) {
        User user = lessonsService.getUserByPrincipal(principal);

        if (user != null) {
            List<DayOfWeek> customOrder = Arrays.asList(
                    DayOfWeek.MONDAY, DayOfWeek.TUESDAY,
                    DayOfWeek.WEDNESDAY, DayOfWeek.THURSDAY,
                    DayOfWeek.FRIDAY, DayOfWeek.SATURDAY
            );

            Map<DayOfWeek, List<Subject>> lessonsByDay = new LinkedHashMap<>();

            for (DayOfWeek dayOfWeek : customOrder) {
                List<Subject> lessons = lessonsService.getLessonsByDayAndUser(dayOfWeek, user);
                lessonsByDay.put(dayOfWeek, lessons);
            }

            model.addAttribute("lessonsByDay", lessonsByDay);
        }

        model.addAttribute("user", user);
        return "daily";
    }

    /**
     * Додати новий урок за допомогою POST-запиту.
     *
     * @param lesson Об'єкт, що представляє новий урок.
     * @param dayOfWeek День тижня, на який додається урок.
     * @param principal Об'єкт, що представляє автентифікованого користувача.
     * @param homework Домашнє завдання для нового уроку.
     * @return Перенаправлення на головну сторінку з розкладом.
     */
    @PostMapping("/lesson/add")
    public String addLesson(@ModelAttribute Subject lesson, @RequestParam("dayOfWeek") String dayOfWeek,
                            Principal principal, String homework) {
        DayOfWeek day = DayOfWeek.valueOf(dayOfWeek);
        lessonsService.addLesson(principal, homework, lesson, day);
        return "redirect:/";
    }

    /**
     * Видалити урок за допомогою POST-запиту.
     *
     * @param id Ідентифікатор уроку, який потрібно видалити.
     * @param dayOfWeek День тижня, на якому знаходиться урок.
     * @return Перенаправлення на головну сторінку з розкладом.
     */
    @PostMapping("/lesson/delete/one")
    public String deleteLesson(@RequestParam("id") Long id, @RequestParam("dayOfWeek") String dayOfWeek) {
        DayOfWeek day = DayOfWeek.valueOf(dayOfWeek);
        lessonsService.deleteLessonById(id, day);
        return "redirect:/";
    }

}

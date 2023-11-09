package com.example.LessonLogix.controllers;

import com.example.LessonLogix.models.Subject;
import com.example.LessonLogix.service.LessonsService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.DayOfWeek;
import java.util.*;

@Controller
@RequiredArgsConstructor
public class LessonsController {
    @Autowired
    private LessonsService lessonsService;

    @GetMapping("/")
    public String daily(Model model, Principal principal) {
        List<DayOfWeek> customOrder = Arrays.asList
                (
                        DayOfWeek.MONDAY, DayOfWeek.TUESDAY,
                        DayOfWeek.WEDNESDAY, DayOfWeek.THURSDAY,
                        DayOfWeek.FRIDAY, DayOfWeek.SATURDAY
                );

        Map<DayOfWeek, List<Subject>> lessonsByDay = new LinkedHashMap<>();

        for (DayOfWeek dayOfWeek : customOrder) {
            List<Subject> lessons = lessonsService.getLessonsByDay(dayOfWeek);
            lessonsByDay.put(dayOfWeek, lessons);
        }

        model.addAttribute("lessonsByDay", lessonsByDay);
        model.addAttribute("user", lessonsService.getUserByPrincipal(principal));
        return "daily";
    }


    @PostMapping("/lesson/add")
    public String addLesson(@ModelAttribute Subject lesson, @RequestParam("dayOfWeek") String dayOfWeek, Principal principal, String homework) {
        DayOfWeek day = DayOfWeek.valueOf(dayOfWeek);
        lessonsService.addLesson(principal, homework, lesson, day);
        return "redirect:/";
    }

    @PostMapping("/lesson/delete/one")
    public String deleteLesson(@RequestParam("id") Long id, @RequestParam("dayOfWeek") String dayOfWeek) {
        DayOfWeek day = DayOfWeek.valueOf(dayOfWeek);
        lessonsService.deleteLessonById(id, day);
        return "redirect:/";
    }

    @PostMapping("/lesson/delete/all")
    public String deleteAllLessons(@RequestParam("dayOfWeek") String dayOfWeek) {
        DayOfWeek day = DayOfWeek.valueOf(dayOfWeek);
        lessonsService.deleteAllLessons(day);
        return "redirect:/";
    }
}

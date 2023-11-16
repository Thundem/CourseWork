package com.example.LessonLogix.controllers;

import com.example.LessonLogix.models.Subject;
import com.example.LessonLogix.service.LessonsService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.DayOfWeek;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeworkController {
    @Autowired
    private LessonsService lessonsService;

    @GetMapping("/homework-info/{dayOfWeek}")
    public String homeworkInfo(@PathVariable String dayOfWeek, Model model) {
        // Отримати список предметів для конкретного дня тижня (dayOfWeek)
        DayOfWeek day = DayOfWeek.valueOf(dayOfWeek);
        List<Subject> lessons = lessonsService.getLessonsByDay(day);

        model.addAttribute("dayOfWeek", dayOfWeek);
        model.addAttribute("lessons", lessons);

        return "homework-info";
    }

    @PostMapping("/homework-edit")
    public String homeworkEdit(@RequestParam("id") Long id, @RequestParam("dayOfWeek") String dayOfWeek, Model model) {
        // Отримати деталі предмету для редагування (на основі id)
        Subject lessonToEdit = lessonsService.getLessonById(id);

        model.addAttribute("lesson", lessonToEdit);
        model.addAttribute("dayOfWeek", dayOfWeek);

        return "homework-edit";
    }

    @PostMapping("/updated-homework")
    public String updatedHomework(@RequestParam("id") Long id, @RequestParam("dayOfWeek") String dayOfWeek, @RequestParam("homework") String updatedHomework) {
        DayOfWeek day = DayOfWeek.valueOf(dayOfWeek);
        lessonsService.updateHomework(id, updatedHomework, day);

        return "redirect:/homework-info/" + dayOfWeek;
    }

}

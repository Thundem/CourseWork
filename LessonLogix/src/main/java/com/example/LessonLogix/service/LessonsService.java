package com.example.LessonLogix.service;

import com.example.LessonLogix.models.Subject;
import com.example.LessonLogix.models.User;
import com.example.LessonLogix.repository.LessonRepository;
import com.example.LessonLogix.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.time.DayOfWeek;
import java.util.*;

@Service
public class LessonsService {
    @Autowired
    private LessonRepository lessonRepository;

    @Autowired
    private UserRepository userRepository;

    public List<Subject> getLessonsByDayAndUser(DayOfWeek day, User user) {
        // Перевірте, чи користувач зареєстрований
        if (user != null && user.getId() != null) {
            return lessonRepository.findByDayOfWeekAndUser(day, user);
        } else {
            return Collections.emptyList();
        }
    }

    public void addLesson(Principal principal, String homework, Subject lesson, DayOfWeek dayOfWeek) {
        lesson.setUser(getUserByPrincipal(principal));
        lesson.setHomework(homework);
        lesson.setDayOfWeek(dayOfWeek);
        lessonRepository.save(lesson);
    }

    public User getUserByPrincipal(Principal principal) {
        if(principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteLessonById(Long id, DayOfWeek dayOfWeek) {
        Optional<Subject> lesson = lessonRepository.findById(id);
        if (lesson.isPresent() && lesson.get().getDayOfWeek() == dayOfWeek) {
            lessonRepository.deleteById(id);
        }
    }

    public Subject getLessonById(Long id) {
        return lessonRepository.findById(id).orElse(null);
    }

    public void updateHomework(Long id, String updatedHomework, DayOfWeek dayOfWeek) {
        Optional<Subject> lesson = lessonRepository.findById(id);

        if (lesson.isPresent() && lesson.get().getDayOfWeek() == dayOfWeek) {
            lesson.get().setHomework(updatedHomework);
            lessonRepository.save(lesson.get());
        }
    }

}


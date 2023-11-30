package com.example.LessonLogix.repository;

import com.example.LessonLogix.models.Subject;
import com.example.LessonLogix.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.DayOfWeek;
import java.util.List;

@Repository
public interface LessonRepository extends JpaRepository<Subject, Long> {
    List<Subject> findByDayOfWeek(DayOfWeek dayOfWeek);

    List<Subject> findByDayOfWeekAndUser(DayOfWeek dayOfWeek, User user);

    List<Subject> findByUser(User user);
    List<Subject> findByUserAndDayOfWeek(User user, DayOfWeek dayOfWeek);
}
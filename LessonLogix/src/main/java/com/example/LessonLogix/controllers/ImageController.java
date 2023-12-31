package com.example.LessonLogix.controllers;

import com.example.LessonLogix.models.Image;
import com.example.LessonLogix.repository.ImageRepository;
import com.example.LessonLogix.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.InputSourceEditor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayInputStream;

/**
 * Контролер для роботи з зображеннями.
 */
@RestController
@RequiredArgsConstructor
public class ImageController {
    private final ImageRepository imageRepository;

    /**
     * Отримати зображення за його унікальним ідентифікатором.
     *
     * @param id Унікальний ідентифікатор зображення.
     * @return Відповідь, що містить зображення та інформацію про нього.
     */
    @GetMapping("/images/{id}")
    private ResponseEntity<?> getImageById(@PathVariable Long id) {
        Image image = imageRepository.findById(id).orElse(null);

        if (image != null) {
            return ResponseEntity.ok()
                    .header("fileName", image.getOriginalFileName())
                    .contentType(MediaType.valueOf(image.getContentType()))
                    .contentLength(image.getSize())
                    .body(new InputStreamResource(new ByteArrayInputStream(image.getBytes())));
        }else {
            return ResponseEntity.notFound().build();
        }
    }
}

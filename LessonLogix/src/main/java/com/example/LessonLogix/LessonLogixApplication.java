package com.example.LessonLogix;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.Console;

@SpringBootApplication
public class LessonLogixApplication {

	public static void main(String[] args) {
		SpringApplication.run(LessonLogixApplication.class, args);
		System.out.println("Сервер запущено на localhost:8000");
	}

}

package com.unison.backups.utils;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

@Component
public class SimpleFileHandler {
    public List<String> readAllLinesFromFile(String filePath)  {
        try {
            return Files.readAllLines(Paths.get(filePath));
        } catch (IOException exception) {
            throw new RuntimeException(exception);
        }
    }
}
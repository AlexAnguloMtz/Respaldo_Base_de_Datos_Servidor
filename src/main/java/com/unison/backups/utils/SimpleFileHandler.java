package com.unison.backups.utils;

import org.springframework.stereotype.Component;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Component
public class SimpleFileHandler {
    public List<String> readLines(String filePath)  {
        try {
            return Files.readAllLines(Paths.get(filePath));
        } catch (IOException exception) {
            throw new RuntimeException(exception);
        }
    }

    public List<String> fileNamesFromDirectory(String directoryPath) {
        var fileNames = new ArrayList<String>();
        File folder = new File(directoryPath);

        if (folder.exists() && folder.isDirectory()) {
            File[] files = folder.listFiles();

            if (files != null) {
                for (File file : files) {
                    if (file.isFile()) {
                        fileNames.add(file.getName());
                    }
                }
            }
        } else {
            throw new RuntimeException("The specified folder does not exist or is not a directory.");
        }
        return fileNames;
    }
}
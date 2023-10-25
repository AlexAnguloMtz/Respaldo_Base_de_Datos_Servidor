package com.unison.backups.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static java.util.stream.IntStream.range;
import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
public class IntegrationTest {

    @Autowired
    private MockMvc client;

    ObjectMapper objectMapper = new ObjectMapper();

    @Test
    void postgres_can_create_100_backups() throws Exception {
        can_create_N_backups("database-1", 100);
    }

    void mysql_can_create_100_backups() throws Exception {
        can_create_N_backups("database-2", 100);
    }

    private void can_create_N_backups(String databaseId, int amount) throws Exception {
        var directory = "%s/database_backups/%s".formatted(System.getProperty("user.dir"), databaseId);
        assertThat(directoryExists(directory)).isTrue();
        range(0, amount).forEach(i -> createDatabaseBackup(databaseId, directory,i));
        assertThat(filesInFolder(directory)).isEqualTo(100);
    }

    private void createDatabaseBackup(String databaseId, String directory, int i) {
            try {
                client.perform(post("/databases/%s/backups".formatted(databaseId))
                    .contentType(MediaType.APPLICATION_JSON))
                    .andExpect(status().isOk());
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            List<String> fileNames = fileNamesFromDirectory(directory);
            assertThat(allDifferent(fileNames)).isTrue();
    }

    private void deleteAllFiles(String directory) {
        File folder = new File(directory);

        if (!folder.exists() || !folder.isDirectory()) {
            throw new RuntimeException("The provided directory does not exist or is not a directory.");
        }

        File[] files = folder.listFiles();

        if (files != null) {
            for (File file : files) {
                if (file.isFile()) {
                    if (!file.delete()) {
                        throw new RuntimeException("Failed to delete file: " + file.getName());
                    }
                }
            }
        }
    }

    private String json(Object object) throws JsonProcessingException {
        return objectMapper.writeValueAsString(object);
    }

    private int filesInFolder(String path) {
        File folder = new File(path);

        if (!folder.isDirectory()) {
            System.err.println("The provided path is not a directory.");
            return -1;
        }

        File[] files = folder.listFiles();
        int fileCount = 0;

        if (files != null) {
            for (File file : files) {
                if (file.isFile()) {
                    fileCount++;
                }
            }
        }

        return fileCount;
    }

    boolean directoryExists(String path) {
        File directory = new File(path);
        return directory.exists() && directory.isDirectory();
    }

    private boolean allDifferent(List<String> elements) {
        Set<String> seen = new HashSet<>();

        for (String element : elements) {
            if (seen.contains(element)) {
                return false; // A duplicate element was found
            }
            seen.add(element);
        }

        return true; // All elements are different
    }

    private List<String> fileNamesFromDirectory(String directory) {
        List<String> fileNames = new ArrayList<>();
        File folder = new File(directory);

        // Check if the provided directory exists and is a directory
        if (folder.exists() && folder.isDirectory()) {
            File[] files = folder.listFiles();

            if (files != null) {
                for (File file : files) {
                    if (file.isFile()) {
                        fileNames.add(file.getName()); // Add the file name to the list
                    }
                }
            }
        } else {
            throw new RuntimeException("The provided directory does not exist or is not a directory.");
        }

        return fileNames;
    }

}

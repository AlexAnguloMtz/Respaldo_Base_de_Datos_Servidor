package com.unison.backups.persistence;

import com.unison.backups.domain.BackupCreationResponse;
import com.unison.backups.domain.DatabaseBackupDetails;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Repository
public class DatabaseBackupRepository {

    private static final String TIME_STAMP_FORMAT = "yyyy-MM-dd_HH-mm-ss";

    @Value("${datasource.postgres.username}")
    private String postgresUsername;

    public List<DatabaseBackupDetails> findBackupsForDatabase(String databaseId) {
        String directoryPath = "%s/database_backups/%s".formatted(currentDirectory(), databaseId);
        return fileNamesFromDirectory(directoryPath).stream()
                .map(fileName -> new DatabaseBackupDetails(fileName, parseTimeStamp(fileName)))
                .toList();
    }

    public BackupCreationResponse createDatabaseBackup(String databaseId) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(TIME_STAMP_FORMAT);
        String dateTimeString = LocalDateTime.now().format(formatter);

        var backupFileName = "%s/database_backups/%s/%s.sql".formatted(currentDirectory(), databaseId, dateTimeString);

        // Communication with postgres container in the same network
        try {
            ProcessBuilder processBuilder = createBackupProcess();
            Process process = processBuilder.start();
            writeInputStreamToLocalFile(process, backupFileName);
            int exitCode = process.waitFor();
            if (exitCode != 0) {
                throw new RuntimeException("Could not handle process output");
            }
        } catch (IOException | InterruptedException e) {
            throw new RuntimeException(e);
        }
        return new BackupCreationResponse(findBackupsForDatabase(databaseId));
    }

    private void writeInputStreamToLocalFile(Process process, String backupFileName) {
        try (InputStream inputStream = process.getInputStream();
            var inputStreamReader = new InputStreamReader(inputStream);
            var reader = new BufferedReader(inputStreamReader);
            var fileWriter = new FileWriter(backupFileName);
            var writer = new BufferedWriter(fileWriter)) {
            String line;
            while ((line = reader.readLine()) != null) {
                writer.write(line + "\n");
            }
        } catch (IOException exception) {
            throw new RuntimeException(exception);
        }
    }

    private ProcessBuilder createBackupProcess() {
        return new ProcessBuilder(
                "docker",
                "exec",
                "postgres",
                "pg_dumpall",
                "-U",
                postgresUsername
        );
    }

    LocalDateTime parseTimeStamp(String fileName) {
        return LocalDateTime.parse(
                removeExtension(fileName),
                DateTimeFormatter.ofPattern(TIME_STAMP_FORMAT)
        );
    }

    String removeExtension(String fileName) {
        if (fileName.endsWith(".sql")) {
            return fileName.substring(0, fileName.length() - 4);
        }
        return fileName;
    }

    String currentDirectory() {
        return System.getProperty("user.dir");
    }

    List<String> fileNamesFromDirectory(String directoryPath) {
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
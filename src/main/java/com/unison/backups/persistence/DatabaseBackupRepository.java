package com.unison.backups.persistence;

import com.unison.backups.domain.BackupCreationResponse;
import com.unison.backups.domain.DatabaseBackupDetails;
import com.unison.backups.utils.SimpleFileHandler;

import java.io.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public abstract class DatabaseBackupRepository {

    private static final String TIME_STAMP_FORMAT = "yyyy-MM-dd_HH-mm-ss";

    private final List<String> databaseIds;

    private SimpleFileHandler fileHandler;

    protected abstract ProcessBuilder createBackupProcess();

    protected DatabaseBackupRepository(List<String> databaseIds, SimpleFileHandler fileHandler) {
        this.databaseIds = databaseIds;
        this.fileHandler = fileHandler;
    }

    public List<DatabaseBackupDetails> findBackupsForDatabase(String databaseId) {
        String directoryPath = "%s/database_backups/%s".formatted(currentDirectory(), databaseId);
        return fileHandler.fileNamesFromDirectory(directoryPath).stream()
                .map(fileName -> new DatabaseBackupDetails(fileName, parseTimeStamp(fileName)))
                .toList();
    }

    public BackupCreationResponse createDatabaseBackup(String databaseId) {
        doCreateBackup(createBackupPath(databaseId));
        return new BackupCreationResponse(findBackupsForDatabase(databaseId));
    }

    private String createBackupPath(String databaseId) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(TIME_STAMP_FORMAT);
        String dateTimeString = LocalDateTime.now().format(formatter);
        return "%s/database_backups/%s/%s.sql".formatted(currentDirectory(), databaseId, dateTimeString);
    }

    public List<String> readBackup(String databaseId, String backupId) {
        return fileHandler.readLines("%s/database_backups/%s/%s".formatted(currentDirectory(), databaseId, backupId));
    }

    public boolean canHandleDatabase(String databaseId) {
        return databaseIds.stream()
                .anyMatch(id -> id.equals(databaseId));
    }

    private void doCreateBackup(String outputPath) {
        try {
            ProcessBuilder processBuilder = createBackupProcess();
            Process process = processBuilder.start();
            writeInputStreamToLocalFile(process, outputPath);
            int exitCode = process.waitFor();
            if (exitCode != 0) {
                throw new RuntimeException("Could not handle process output");
            }
        } catch (IOException | InterruptedException e) {
            throw new RuntimeException(e);
        }
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

    private LocalDateTime parseTimeStamp(String fileName) {
        return LocalDateTime.parse(
                removeExtension(fileName),
                DateTimeFormatter.ofPattern(TIME_STAMP_FORMAT)
        );
    }

    private String removeExtension(String fileName) {
        if (fileName.endsWith(".sql")) {
            return fileName.substring(0, fileName.length() - 4);
        }
        return fileName;
    }

    private String currentDirectory() {
        return System.getProperty("user.dir");
    }
}
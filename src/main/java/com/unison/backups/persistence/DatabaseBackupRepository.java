package com.unison.backups.persistence;

import com.unison.backups.domain.BackupCreationResponse;
import com.unison.backups.domain.DatabaseBackupDetails;
import com.unison.backups.utils.SimpleFileHandler;
import org.springframework.beans.factory.annotation.Autowired;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public abstract class DatabaseBackupRepository {

    private static final String TIME_STAMP_FORMAT = "yyyy-MM-dd_HH-mm-ss";

    @Autowired
    private SimpleFileHandler fileHandler;

    abstract void doCreateBackup(String outputPath);

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

}
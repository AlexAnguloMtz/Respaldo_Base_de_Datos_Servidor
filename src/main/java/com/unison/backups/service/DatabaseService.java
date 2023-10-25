package com.unison.backups.service;

import com.unison.backups.domain.BackupCreationResponse;
import com.unison.backups.domain.DatabaseBackupDetails;
import com.unison.backups.domain.DatabaseDetails;
import com.unison.backups.persistence.DatabaseBackupRepository;
import com.unison.backups.persistence.DatabaseDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DatabaseService {

    @Autowired
    private List<DatabaseDetailsRepository> databaseDetailsRepositories;

    @Autowired
    private List<DatabaseBackupRepository> databaseBackupRepositories;

    public List<DatabaseDetails> findAll() {
        return databaseDetailsRepositories.stream()
            .map(DatabaseDetailsRepository::getDetails)
            .toList();
    }

    public DatabaseDetails findDatabaseDetails(String id, boolean backups) {
        return databaseDetailsRepositories.stream()
                .filter(repository -> repository.getDatabaseId().equals(id))
                .map(DatabaseDetailsRepository::getDetails)
                .map(details -> backups ? addBackups(details) : details)
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Could not find database details for id %s".formatted(id)));
    }

    public BackupCreationResponse createNewBackup(String databaseId) {
        return repositoryForDatabase(databaseId).createDatabaseBackup(databaseId);
    }

    private DatabaseDetails addBackups(DatabaseDetails details) {
        details.setBackups(findDatabaseBackups(details.getId()));
        return details;
    }

    private List<DatabaseBackupDetails> findDatabaseBackups(String databaseId) {
        return repositoryForDatabase(databaseId).findBackupsForDatabase(databaseId);
    }

    public List<String> readBackup(String databaseId, String backupId) {
        return repositoryForDatabase(databaseId).readBackup(databaseId, backupId);
    }

    private DatabaseBackupRepository repositoryForDatabase(String databaseId) {
        return databaseBackupRepositories.stream()
                .filter(repository -> repository.canHandleDatabase(databaseId))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Invalid database id: %s".formatted(databaseId)));
    }
}

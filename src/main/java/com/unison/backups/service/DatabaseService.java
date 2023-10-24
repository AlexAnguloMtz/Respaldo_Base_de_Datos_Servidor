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
    private DatabaseBackupRepository databaseBackupRepository;

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

    private DatabaseDetails addBackups(DatabaseDetails details) {
        details.setBackups(findDatabaseBackups(details.getId()));
        return details;
    }

    private List<DatabaseBackupDetails> findDatabaseBackups(String id) {
        return databaseBackupRepository.findBackupsForDatabase(id);
    }

    public BackupCreationResponse createNewBackup(String id) {
        return databaseBackupRepository.createDatabaseBackup(id);
    }
}

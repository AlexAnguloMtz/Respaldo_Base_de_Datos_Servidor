package com.unison.backups.service;

import com.unison.backups.domain.DatabaseDetails;
import com.unison.backups.persistence.DatabaseDetailsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DatabaseService {

    @Autowired
    private List<DatabaseDetailsRepository> databaseDetailsRepositories;

    public List<DatabaseDetails> findAll() {
        return databaseDetailsRepositories.stream()
            .map(DatabaseDetailsRepository::getDetails)
            .toList();
    }
}

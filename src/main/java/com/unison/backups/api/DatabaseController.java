package com.unison.backups.api;

import com.unison.backups.domain.BackupCreationResponse;
import com.unison.backups.domain.DatabaseDetails;
import com.unison.backups.service.DatabaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/databases")
public class DatabaseController {

    @Autowired
    private DatabaseService databaseService;

    @GetMapping
    ResponseEntity<List<DatabaseDetails>> findAll() {
        return ResponseEntity.ok(databaseService.findAll());
    }

    @GetMapping("/{id}")
    ResponseEntity<DatabaseDetails> findById(
            @PathVariable String id,
            @RequestParam(name = "backups", required = false) boolean backups
    ) {
        return ResponseEntity.ok(databaseService.findDatabaseDetails(id, backups));
    }

    @PostMapping("/{id}/new-backup")
    ResponseEntity<BackupCreationResponse> createNewBackup(
            @PathVariable String id
    ) {
        return ResponseEntity.ok(databaseService.createNewBackup(id));
    }

}
package com.unison.backups.api;

import com.unison.backups.domain.DatabaseDetails;
import com.unison.backups.service.DatabaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}

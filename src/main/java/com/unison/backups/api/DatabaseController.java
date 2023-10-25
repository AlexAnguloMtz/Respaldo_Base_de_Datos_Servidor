package com.unison.backups.api;

import com.unison.backups.domain.BackupCreationResponse;
import com.unison.backups.domain.DatabaseDetails;
import com.unison.backups.service.DatabaseService;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
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

    // TODO Clean this mess
    @GetMapping("/{id}/backups/{backupId}")
    public void export(
            @PathVariable String id,
            @PathVariable String backupId,
            HttpServletResponse response
    ) throws IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain; charset=UTF-8");
        response.setHeader("Content-Disposition","attachment;filename=%s".formatted(backupId));
        PrintWriter out = response.getWriter();
        List<String> backup = databaseService.readBackup(id, backupId);
        backup.forEach(out::println);
        out.flush();
        out.close();
    }

    @PostMapping("/{id}/backups")
    ResponseEntity<BackupCreationResponse> createNewBackup(
            @PathVariable String id
    ) {
        return ResponseEntity.ok(databaseService.createNewBackup(id));
    }

}
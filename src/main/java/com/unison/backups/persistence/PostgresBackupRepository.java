package com.unison.backups.persistence;

import com.unison.backups.utils.SimpleFileHandler;
import java.util.List;

public class PostgresBackupRepository extends DatabaseBackupRepository {

    private final String postgresUsername;

    public PostgresBackupRepository(
            List<String> databaseIds,
            SimpleFileHandler fileHandler,
            String postgresUsername
    ) {
        super(databaseIds, fileHandler);
        this.postgresUsername = postgresUsername;
    }

    @Override
    protected ProcessBuilder createBackupProcess() {
        return new ProcessBuilder(
                "docker",
                "exec",
                "postgres",
                "pg_dumpall",
                "-U",
                postgresUsername
        );
    }

}
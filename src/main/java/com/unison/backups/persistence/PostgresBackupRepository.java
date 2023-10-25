package com.unison.backups.persistence;

import com.unison.backups.utils.SimpleFileHandler;
import java.util.List;

public class PostgresBackupRepository extends DatabaseBackupRepository {

    private final String postgresHost;
    private final String postgresPort;
    private final String postgresUsername;
    private final String postgresPassword;

    public PostgresBackupRepository(
            List<String> databaseIds,
            SimpleFileHandler fileHandler,
            String postgresHost,
            String postgresPort,
            String postgresUsername,
            String postgresPassword
    ) {
        super(databaseIds, fileHandler);
        this.postgresHost = postgresHost;
        this.postgresPort = postgresPort;
        this.postgresUsername = postgresUsername;
        this.postgresPassword = postgresPassword;
    }

    @Override
    protected ProcessBuilder createBackupProcess() {
        ProcessBuilder process = new ProcessBuilder(
                "pg_dumpall",
                "-h",
                postgresHost,
                "-p",
                String.valueOf(postgresPort),
                "-U",
                postgresUsername
        );
        process.environment().put("PGPASSWORD", postgresPassword);
        return process;
    }

}
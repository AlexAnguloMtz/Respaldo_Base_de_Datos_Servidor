package com.unison.backups.persistence;

import com.unison.backups.utils.SimpleFileHandler;
import java.util.List;

public class MySQLBackupRepository extends DatabaseBackupRepository {

    private final String mysqlHost;
    private final String mysqlUsername;
    private final String mysqlPassword;

    public MySQLBackupRepository(
            List<String> databaseIds,
            SimpleFileHandler fileHandler,
            String mysqlHost,
            String mysqlUsername,
            String mysqlPassword
    ) {
        super(databaseIds, fileHandler);
        this.mysqlHost = mysqlHost;
        this.mysqlUsername = mysqlUsername; 
        this.mysqlPassword = mysqlPassword;
    }

    @Override
    protected ProcessBuilder createBackupProcess() {
        return new ProcessBuilder(
                "mysqldump",
                "-h" + mysqlHost,
                "-u" + mysqlUsername,
                "-p" + mysqlPassword,
                "--all-databases"
        );
    }

}
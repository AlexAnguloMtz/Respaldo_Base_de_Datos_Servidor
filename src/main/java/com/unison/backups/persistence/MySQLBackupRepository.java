package com.unison.backups.persistence;

import com.unison.backups.utils.SimpleFileHandler;
import java.util.List;

public class MySQLBackupRepository extends DatabaseBackupRepository {

    private final String mysqlUsername;
    private final String mysqlPassword;

    public MySQLBackupRepository(
            List<String> databaseIds, 
            SimpleFileHandler fileHandler,
            String mysqlUsername,
            String mysqlPassword
    ) {
        super(databaseIds, fileHandler);
        this.mysqlUsername = mysqlUsername; 
        this.mysqlPassword = mysqlPassword;
    }

    @Override
    protected ProcessBuilder createBackupProcess() {
        return new ProcessBuilder(
                "docker",
                "exec",
                "mysql",
                "mysqldump",
                "-u" + mysqlUsername,
                "-p" + mysqlPassword,
                "--all-databases"
        );
    }

}
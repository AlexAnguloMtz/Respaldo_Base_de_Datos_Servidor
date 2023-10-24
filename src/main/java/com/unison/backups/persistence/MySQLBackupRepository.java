package com.unison.backups.persistence;

import org.springframework.stereotype.Repository;

@Repository
class MySQLBackupRepository extends DatabaseBackupRepository {

    @Override
    void doCreateBackup(String outputPath) {

    }
}

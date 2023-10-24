package com.unison.backups.persistence;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import java.io.*;

@Repository
class PostgresBackupRepository extends DatabaseBackupRepository {

    @Value("${datasource.postgres.username}")
    private String postgresUsername;

    @Override
    void doCreateBackup(String outputPath) {
        try {
            ProcessBuilder processBuilder = createBackupProcess();
            Process process = processBuilder.start();
            writeInputStreamToLocalFile(process, outputPath);
            int exitCode = process.waitFor();
            if (exitCode != 0) {
                throw new RuntimeException("Could not handle process output");
            }
        } catch (IOException | InterruptedException e) {
            throw new RuntimeException(e);
        }
    }

    // Connect to postgres docker container
    private ProcessBuilder createBackupProcess() {
        return new ProcessBuilder(
                "docker",
                "exec",
                "postgres",
                "pg_dumpall",
                "-U",
                postgresUsername
        );
    }

    private void writeInputStreamToLocalFile(Process process, String backupFileName) {
        try (InputStream inputStream = process.getInputStream();
             var inputStreamReader = new InputStreamReader(inputStream);
             var reader = new BufferedReader(inputStreamReader);
             var fileWriter = new FileWriter(backupFileName);
             var writer = new BufferedWriter(fileWriter)) {
            String line;
            while ((line = reader.readLine()) != null) {
                writer.write(line + "\n");
            }
        } catch (IOException exception) {
            throw new RuntimeException(exception);
        }
    }

}
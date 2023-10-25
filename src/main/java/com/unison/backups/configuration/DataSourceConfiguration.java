package com.unison.backups.configuration;

import com.mysql.cj.jdbc.MysqlDataSource;
import com.unison.backups.persistence.*;
import com.unison.backups.utils.SimpleFileHandler;
import org.postgresql.ds.PGSimpleDataSource;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.util.List;

@Configuration
class DataSourceConfiguration {

    @Value("${datasource.postgres.host}")
    private String postgresHost;
    @Value("${datasource.postgres.username}")
    private String postgresUsername;
    @Value("${datasource.postgres.password}")
    private String postgresPassword;
    @Value("${datasource.postgres.port}")
    private int postgresPort;

    @Value("${datasource.mysql.host}")
    private String mysqlHost;
    @Value("${datasource.mysql.username}")
    private String mysqlUsername;
    @Value("${datasource.mysql.password}")
    private String mysqlPassword;
    @Value("${datasource.mysql.port}")
    private int mysqlPort;

    private final String postgresDatabaseId = "database-1";
    private final String mysqlDatabaseId = "database-2";

    @Bean
    List<DatabaseDetailsRepository> databaseDetailsRepositories() {
        return List.of(
            new PostgresDetailsRepository(postgresDatabaseId, postgresDataSource()),
            new MySQLDetailsRepository(mysqlDatabaseId, mysqlDataSource())
        );
    }

    @Bean
    List<DatabaseBackupRepository> databaseBackupRepositories() {
        return List.of(
            new PostgresBackupRepository(
                    List.of(postgresDatabaseId),
                    fileHandler(),
                    postgresHost,
                    String.valueOf(postgresPort),
                    postgresUsername,
                    postgresPassword
            ),
            new MySQLBackupRepository(
                    List.of(mysqlDatabaseId),
                    fileHandler(),
                    mysqlHost,
                    mysqlUsername,
                    mysqlPassword
            )
        );
    }

    private DataSource postgresDataSource() {
        PGSimpleDataSource dataSource = new PGSimpleDataSource();
        dataSource.setServerNames(new String[] { postgresHost });
        dataSource.setUser(postgresUsername);
        dataSource.setPassword(postgresPassword);
        dataSource.setPortNumbers(new int[] { postgresPort });
        return dataSource;
    }

    private DataSource mysqlDataSource() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setServerName(mysqlHost);
        dataSource.setUser(mysqlUsername);
        dataSource.setPassword(mysqlPassword);
        dataSource.setPort(mysqlPort);
        return dataSource;
    }

    private SimpleFileHandler fileHandler() {
        return new SimpleFileHandler();
    }

}
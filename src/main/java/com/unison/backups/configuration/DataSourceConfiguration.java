package com.unison.backups.configuration;

import com.mysql.cj.jdbc.MysqlDataSource;
import com.unison.backups.persistence.DatabaseDetailsRepository;
import com.unison.backups.persistence.MySQLDetailsRepository;
import com.unison.backups.persistence.PostgresDetailsRepository;
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

    @Bean
    List<DatabaseDetailsRepository> databaseDetailsRepositories() {
        return List.of(
            new PostgresDetailsRepository("database-1", postgresDataSource()),
            new MySQLDetailsRepository("database-2", mysqlDataSource())
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

}
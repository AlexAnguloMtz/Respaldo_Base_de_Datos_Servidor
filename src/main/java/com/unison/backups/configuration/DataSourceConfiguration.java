package com.unison.backups.configuration;

import com.unison.backups.persistence.DatabaseDetailsRepository;
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

    @Bean
    List<DatabaseDetailsRepository> databaseDetailsRepositories() {
        return List.of(
                new PostgresDetailsRepository(postgresDataSource())
        );
    }
    DataSource postgresDataSource() {
        PGSimpleDataSource dataSource = new PGSimpleDataSource();
        dataSource.setServerNames(new String[] { postgresHost });
        dataSource.setUser(postgresUsername);
        dataSource.setPassword(postgresPassword);
        dataSource.setPortNumbers(new int[] { postgresPort });
        return dataSource;
    }

}
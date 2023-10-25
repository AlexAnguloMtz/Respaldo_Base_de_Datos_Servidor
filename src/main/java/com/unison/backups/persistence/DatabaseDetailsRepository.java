package com.unison.backups.persistence;

import com.unison.backups.domain.DatabaseDetails;
import com.unison.backups.domain.DatabaseSchema;
import com.unison.backups.enums.DBMS;
import lombok.Getter;

import javax.sql.DataSource;
import java.sql.*;
import java.util.List;

public abstract class DatabaseDetailsRepository {

    @Getter
    private final String databaseId;
    private final DataSource dataSource;

    public DatabaseDetailsRepository(String databaseId, DataSource dataSource) {
        this.databaseId = databaseId;
        this.dataSource = dataSource;
    }

    protected abstract List<String> queryRoles(Connection connection);

    protected abstract List<DatabaseSchema> querySchemas(DatabaseMetaData metaData);

    protected abstract List<String> excludedSchemas();

    public DatabaseDetails getDetails() {
        try (Connection connection = dataSource.getConnection()) {
            DatabaseMetaData metadata = connection.getMetaData();
            return DatabaseDetails.builder()
                .id(databaseId)
                .dbms(DBMS.forName(metadata.getDatabaseProductName()))
                .version(metadata.getDatabaseProductVersion())
                .users(queryRoles(connection))
                .schemas(filterSchemas(querySchemas(metadata)))
                .build();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private List<DatabaseSchema> filterSchemas(List<DatabaseSchema> schemas) {
        return schemas.stream()
                .filter(this::shouldIncludeSchema)
                .toList();
    }

    private boolean shouldIncludeSchema(DatabaseSchema schema) {
        return ! (excludedSchemas().contains(schema.getName()));
    }

}
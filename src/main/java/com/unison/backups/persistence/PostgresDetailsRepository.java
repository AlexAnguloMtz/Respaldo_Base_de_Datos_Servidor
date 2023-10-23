package com.unison.backups.persistence;

import com.unison.backups.domain.DatabaseSchema;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PostgresDetailsRepository extends DatabaseDetailsRepository {

    public PostgresDetailsRepository(DataSource dataSource) {
        super(dataSource);
    }

    @Override
    List<DatabaseSchema> filterSchemas(List<DatabaseSchema> schemas) {
        return schemas.stream()
            .filter(this::shouldIncludeSchema)
            .toList();
    }

    @Override
    List<String> queryRoles(Connection connection) {
        var query = "SELECT rolname FROM pg_roles WHERE rolname NOT LIKE 'pg_%'";
        try (Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query)) {
            var rolesNames = new ArrayList<String>();
            while (resultSet.next()) {
                rolesNames.add(resultSet.getString("rolname"));
            }
            return rolesNames;
        } catch (SQLException exception) {
            throw new RuntimeException(exception);
        }
    }

    private boolean shouldIncludeSchema(DatabaseSchema schema) {
        return ! (excludedSchemas().contains(schema.getName()));
    }

    private List<String> excludedSchemas() {
        return List.of("information_schema", "pg_catalog", "public");
    }

}
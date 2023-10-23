package com.unison.backups.persistence;

import com.unison.backups.domain.DatabaseSchema;

import javax.sql.DataSource;
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

    private boolean shouldIncludeSchema(DatabaseSchema schema) {
        return ! (excludedSchemas().contains(schema.getName()));
    }

    private List<String> excludedSchemas() {
        return List.of("information_schema", "pg_catalog", "public");
    }

}
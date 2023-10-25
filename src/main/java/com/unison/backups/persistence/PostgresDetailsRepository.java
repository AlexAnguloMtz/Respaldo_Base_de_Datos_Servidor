package com.unison.backups.persistence;

import com.unison.backups.domain.DatabaseSchema;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostgresDetailsRepository extends DatabaseDetailsRepository {

    public PostgresDetailsRepository(String databaseId, DataSource dataSource) {
        super(databaseId, dataSource);
    }

    @Override
    protected List<DatabaseSchema> querySchemas(DatabaseMetaData metadata) {
        try (ResultSet schemas = metadata.getSchemas()) {
            var schemasList = new ArrayList<DatabaseSchema>();
            while (schemas.next()) {
                String catalogName = schemas.getString("TABLE_CATALOG");
                String schemaName = schemas.getString("TABLE_SCHEM");
                List<String> tableNames = queryTableNames(metadata, catalogName, schemaName);
                schemasList.add(databaseSchema(schemas, tableNames));
            }
            return schemasList;
        } catch (SQLException exception) {
            throw new RuntimeException(exception);
        }
    }

    @Override
    protected List<String> queryRoles(Connection connection) {
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

    @Override
    protected List<String> excludedSchemas() {
        return List.of("information_schema", "pg_catalog", "public");
    }

    private List<String> queryTableNames(DatabaseMetaData metadata, String catalogName, String schemaName) throws SQLException {
        try (ResultSet tables = metadata.getTables(catalogName, schemaName, null, new String[] { "TABLE" })) {
            var tablesNames = new ArrayList<String>();
            while(tables.next()) {
                tablesNames.add(tables.getString("TABLE_NAME"));
            }
            return tablesNames;
        } catch (SQLException exception) {
            throw new RuntimeException(exception);
        }
    }

    private DatabaseSchema databaseSchema(ResultSet row, List<String> tables) throws SQLException {
        return DatabaseSchema.builder()
                .name(row.getString("TABLE_SCHEM"))
                .tables(tables)
                .build();
    }

}
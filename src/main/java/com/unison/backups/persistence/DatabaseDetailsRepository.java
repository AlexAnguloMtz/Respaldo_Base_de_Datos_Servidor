package com.unison.backups.persistence;

import com.unison.backups.domain.DatabaseDetails;
import com.unison.backups.domain.DatabaseSchema;
import com.unison.backups.enums.DBMS;
import org.springframework.beans.factory.annotation.Autowired;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public abstract class DatabaseDetailsRepository {

    private final DataSource dataSource;

    @Autowired
    public DatabaseDetailsRepository(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    abstract List<DatabaseSchema> filterSchemas(List<DatabaseSchema> schemas);

    public DatabaseDetails getDetails() {
        try (Connection connection = dataSource.getConnection()) {
            DatabaseMetaData metadata = connection.getMetaData();
            return DatabaseDetails.builder()
                .dbms(DBMS.forName(metadata.getDatabaseProductName()))
                .version(metadata.getDatabaseProductVersion())
                .users(List.of("luis", "pedro"))
                .schemas(filterSchemas(querySchemas(metadata)))
                .build();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    List<DatabaseSchema> querySchemas(DatabaseMetaData metadata) {
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

    private DatabaseSchema databaseSchema(ResultSet row, List<String> tables) throws SQLException {
        return DatabaseSchema.builder()
            .name(row.getString("TABLE_SCHEM"))
            .tables(tables)
            .build();
    }

    List<String> queryTableNames(DatabaseMetaData metadata, String catalogName, String schemaName) throws SQLException {
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

}
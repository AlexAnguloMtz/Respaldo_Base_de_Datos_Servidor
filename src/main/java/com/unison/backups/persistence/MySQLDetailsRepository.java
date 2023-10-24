package com.unison.backups.persistence;

import com.unison.backups.domain.DatabaseSchema;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class MySQLDetailsRepository extends DatabaseDetailsRepository {


    public MySQLDetailsRepository(String databaseId, DataSource dataSource) {
        super(databaseId, dataSource);
    }

    @Override
    protected List<DatabaseSchema> querySchemas(DatabaseMetaData metaData) {
        try (ResultSet catalogs = metaData.getCatalogs()) {
            List<DatabaseSchema> schemas = new ArrayList<>();
            while (catalogs.next()) {
                String catalogName = catalogs.getString("TABLE_CAT");
                schemas.add(databaseSchema(catalogs, queryTables(metaData, catalogName)));
            }
            return schemas;
        } catch (SQLException exception) {
            throw new RuntimeException(exception);
        }
    }

    @Override
    protected List<String> excludedSchemas() {
        return List.of("information_schema", "mysql", "performance_schema", "sys");
    }

    @Override
    protected List<String> queryRoles(Connection connection) {
        var query = "SELECT DISTINCT user FROM mysql.user WHERE user NOT LIKE 'mysql%'";
        try (Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query)) {
            var roles = new ArrayList<String>();
            while (resultSet.next()) {
                roles.add(resultSet.getString("user"));
            }
            return roles;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private List<String> queryTables(DatabaseMetaData metaData, String catalogName) {
        try (ResultSet tables = metaData.getTables(catalogName, null, null, new String[] { "TABLE" })) {
            List<String> tableNames = new ArrayList<>();
            while (tables.next()) {
                tableNames.add(tables.getString("TABLE_NAME"));
            }
            return tableNames;
        } catch (SQLException exception) {
            throw new RuntimeException(exception);
        }
    }

    private DatabaseSchema databaseSchema(ResultSet row, List<String> tables) throws SQLException {
        return DatabaseSchema.builder()
            .name(row.getString("TABLE_CAT"))
            .tables(tables)
            .build();
    }

}
package com.unison.backups.persistence;

import com.unison.backups.domain.DatabaseSchema;

import javax.sql.DataSource;
import java.sql.Connection;
import java.util.List;


public class MySQLDetailsRepository extends DatabaseDetailsRepository {

    public MySQLDetailsRepository(DataSource dataSource) {
        super(dataSource);
    }

    @Override
    List<DatabaseSchema> filterSchemas(List<DatabaseSchema> schemas) {
        return null;
    }

    @Override
    List<String> queryRoles(Connection connection) {
        return null;
    }
}

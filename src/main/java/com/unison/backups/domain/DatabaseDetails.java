package com.unison.backups.domain;

import com.unison.backups.enums.DBMS;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
@AllArgsConstructor
public class DatabaseDetails {

    private final DBMS dbms;

    private final String version;

    private final List<DatabaseSchema> schemas;

    private final List<String> users;

    public String getDbms() {
        return dbms.formattedName();
    }

}
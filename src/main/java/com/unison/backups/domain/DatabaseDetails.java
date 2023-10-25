package com.unison.backups.domain;

import com.unison.backups.enums.DBMS;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Builder
@AllArgsConstructor
public class DatabaseDetails {

    private String id;
    private DBMS dbms;
    private String version;
    private List<DatabaseSchema> schemas;
    private List<String> users;
    @Setter
    private List<DatabaseBackupDetails> backups;

    public String getDbms() {
        return dbms.formattedName();
    }

}
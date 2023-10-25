package com.unison.backups.enums;

import lombok.Getter;

import java.util.Arrays;

public enum DBMS {

    POSTGRESQL("PostgreSQL"),
    MYSQL("MySQL");

    private final String formattedName;

    DBMS(String formattedName) {
        this.formattedName = formattedName;
    }

    public static DBMS forName(String name) {
        return Arrays.stream(values())
                .filter(dbms -> dbms.formattedName().equalsIgnoreCase(name))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Cannot find DBMS for name %s".formatted(name)));
    }

    public String formattedName() {
        return formattedName;
    }

}

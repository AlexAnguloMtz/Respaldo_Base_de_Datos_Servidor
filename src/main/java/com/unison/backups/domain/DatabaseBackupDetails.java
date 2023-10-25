package com.unison.backups.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
public class DatabaseBackupDetails {
    private final String id;
    private final LocalDateTime creationTimeStamp;
}
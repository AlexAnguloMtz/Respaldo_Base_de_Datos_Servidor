package com.unison.backups.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
@AllArgsConstructor
public class DatabaseSchema {

    private final String name;
    private final List<String> tables;

}
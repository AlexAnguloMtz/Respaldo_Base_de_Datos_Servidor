package com.unison.backups.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.unison.backups.domain.DatabaseDetails;
import com.unison.backups.domain.DatabaseSchema;
import com.unison.backups.enums.DBMS;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
public class DatabaseControllerTest {

    @Autowired
    private MockMvc client;

    ObjectMapper objectMapper = new ObjectMapper();


    @Test
    void can_find_all_database_details() throws Exception {
        var schemas =  List.of(
            DatabaseSchema.builder()
                .name("restaurante")
                .tables(List.of("almacenes"))
                .build()
        );

        var expected = List.of(
            DatabaseDetails.builder()
                .id("hello")
                .dbms(DBMS.MYSQL)
                .version("8.0.33")
                .users(List.of("app_user", "root", "luis", "pedro"))
                .schemas(schemas)
                .build()
        );

        client.perform(get("/databases")
                .contentType(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().json(json(expected)));
    }

    private String json(Object object) throws JsonProcessingException {
        return objectMapper.writeValueAsString(object);
    }

}

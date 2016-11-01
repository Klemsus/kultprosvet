package org.klems.spark.example;

import static io.restassured.RestAssured.when;

import java.util.List;

import io.restassured.response.Response;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class EventController {

  static List<Event> getEvents() {
    Response resp = when().get("/v1/services/simple/events");
    return new Gson().fromJson(resp.body().asString(), new TypeToken<List<Event>>(){}.getType());
  }

}

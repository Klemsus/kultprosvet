package org.klems.spark.example;

import static freemarker.template.Configuration.VERSION_2_3_25;

import java.util.Locale;

import freemarker.template.Configuration;
import io.restassured.RestAssured;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.specification.ProxySpecification;
import spark.template.freemarker.FreeMarkerEngine;

public class Initialization {

  public static void initRestAssured() {
    RestAssured.baseURI = "https://api.ticketscloud.org/";
    RestAssured.requestSpecification = new RequestSpecBuilder()
                                        .addHeader("Authorization", "key 728509f20e2041b5be2879f30c320263")
                                        .addHeader("Accept", "application/json")
                                        .build();
    //RestAssured.proxy = new ProxySpecification("192.168.254.49", 8080, "http");
  }
  
  public static FreeMarkerEngine initFreemarker() {
    Configuration conf = new Configuration(VERSION_2_3_25);
    conf.setClassForTemplateLoading(FreeMarkerEngine.class, "");
    conf.setEncoding(new Locale("ru", "RU"), "utf-8");
    return new FreeMarkerEngine(conf);
  }
  
}

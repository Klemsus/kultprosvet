package org.klems.spark.example.css;

public enum CommonCSS implements CSS {
  BOOTSTRAP("webjars/bootstrap/3.3.6/js/bootstrap.min.js"),
  BOOTSTRAP_CDN("//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css");

  private final String href;

  private CommonCSS(String href) {
    this.href = href;
  }
  
  @Override
  public String getHref() {
    return href;
  }
  
}

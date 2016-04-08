package org.klems.spark.example.components;

import java.util.List;

import j2html.tags.Tag;

import static java.util.Arrays.asList;

public class Link extends Block<Link> {

  private String href = "#";
  private String text = "";
  private String toggle;
  private Block modal;
  private List<Link> dropdown;
  
  public static Link get(String href, String text) {
    return new Link().href(href).text(text);
  }
  
  public Link href(String href) {
    this.href = href;
    return this;
  }
  
  public Link text(String text) {
    this.text = text;
    return this;
  }
  
  public Link addDropDown(Link ... links) {
    assert toggle == null;
    toggle = "dropdown";
    dropdown = asList(links);
    return this;
  }
  
  public Link addModal(Block block) {
    assert toggle == null;
    toggle = "modal";
    modal = block;
    return this;
  }
  
  @Override
  public Tag getTag() {
    throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
  }

}

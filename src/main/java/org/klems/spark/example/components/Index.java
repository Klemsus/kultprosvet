package org.klems.spark.example.components;

import java.util.ArrayList;
import java.util.List;

import j2html.tags.Tag;

import static java.util.stream.Collectors.toList;

import static j2html.TagCreator.body;
import static j2html.TagCreator.head;
import static j2html.TagCreator.html;
import static j2html.TagCreator.link;
import static j2html.TagCreator.meta;
import static j2html.TagCreator.title;

public class Index extends Block<Index> {
  
  private final String title;
  private final List<String> css = new ArrayList<>();
  private final List<Block> children = new ArrayList<>();

  public Index(String title) {
    this.title = title;
  }

  public Index css(String href) {
    css.add(href);
    return this;
  }
  
  @Override
  public Tag getTag() {
   return html().with(
          head().with(title(title), meta().attr("charset", "utf-8"))
                .with(link().withRel("stylesheet").withHref("//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"))
                .with(css.stream().map(href -> link().withRel("stylesheet").withHref(href)).collect(toList())),
          body().with(children.stream().map(block -> block.getTag()).collect(toList()))
        );
  }
}
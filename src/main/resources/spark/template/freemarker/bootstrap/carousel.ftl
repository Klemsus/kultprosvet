<#macro carousel id images control=true width=974 height=92>
<div id="${id}" class="carousel slide container" data-ride="carousel">
  <div class="carousel-inner">
    <#list images as image>
    <div class="item <#if image?index == 0>active</#if>">
      <#if image.href??><a href="${image.href}"></#if><img src="${image.src}" <#if image.alt??>alt="${image.alt}"</#if> width="${width}" height="${height}" /><#if image.href??></a></#if>
    </div>
    </#list>
  </div>
  <#if control>
  <a class="left carousel-control" href="#${id}" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#${id}" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
  </a>
  </#if>
</div>
</#macro>
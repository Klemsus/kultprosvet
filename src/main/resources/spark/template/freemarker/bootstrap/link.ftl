<#macro link link button=false>
<#if button>
<button type="${link.type!button}" <#if link.id??>id="${link.id}"</#if> class="btn btn-${link.style!"default"} ${link.classes!}" <#if link.dropdown??>data-toggle="dropdown" data-target="#${link.dropdown}"<#elseif link.modal??>data-toggle="modal" data-target="#${link.modal}"</#if> <#if link.attrs??>
<#list link.attrs?keys as attr>
${attr}="${link.attrs[attr]}"
</#list>
</#if>>
<#else>
<#if link.modal??>
<#local href="#${link.modal}">
<#elseif link.dropdown??>
<#local href="#">
<#else>
<#local href=link.href>
</#if>
<a href="${href}" class="${link.classes!}" <#if link.dropdown??>data-toggle="dropdown"<#elseif link.modal??>data-toggle="modal"</#if>>
</#if>
<#if link.name??>
${link.name}
<#else>
<#nested>
</#if>
<#if link.dropdown??><strong class="caret"></strong></#if>
<#if button>
</button>
<#else>
</a>
</#if>
<#if link.dropdown??>
<ul class="dropdown-menu <#if link.dropdown[0].label??>dropdown-labeled</#if>">
  <#list link.dropdown as ld>
    <li><a href="${ld.href}"><#if ld.label??><span class="label label-default pull-right">${ld.label}</span></#if>${ld.name}</a></li>
  </#list>
</ul>
</#if>
</#macro>
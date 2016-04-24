<#include "link.ftl">
<#macro navbar links brand="" navbar_types=["inverse", "fixed-top"] role="navigation" fluid=false toggle={"role":"navigation", "id":"navigation-collapse"}>
    <nav class="navbar navbar-default <#list navbar_types as type>navbar-${type} </#list>" role="${role}">
      <div class="container<#if fluid>-fluid</#if>">
        <#if brand?has_content>
        <div class="navbar-header pull-left">
          <div class="navbar-brand" href="#">${brand}</div>
        </div>
        </#if>

        <div class="navbar-header pull-right">
          <#nested "fixed_right">
          <#if toggle?has_content>
          <button type="button" class="navbar-toggle ${toggle.classes!""}" style="padding: 6px 10px;<#if toggle.style??>${toggle.style}</#if>" data-toggle="collapse" data-target="#${toggle.id}">
            <span class="sr-only">Toggle ${toggle.role}</span><i style="font-size:12px; color:#fff;" class="glyphicon glyphicon-${toggle.icon!"menu-hamburger"}"></i>
          </button> 
          </#if>
        </div>

        <#if toggle?has_content>
        <div class="collapse navbar-collapse navbar-left" id="${toggle.id}">
        </#if>
          <ul class="nav navbar-nav pull-left">
          <#list links as li>
            <#if li.dropdown??>
            <li class="dropdown">
              <@link li/>
            </li>
            <#else>
            <li><@link li/></li>
            </#if>
          </#list>
          <#nested "links">
          </ul>
        <#if toggle?has_content>
        </div>
        </#if>
      </div>
    </nav>
  
</#macro>
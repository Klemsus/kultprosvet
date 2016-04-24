<#macro tabs active links>
  <div class="tabbable">
    <ul class="nav nav-tabs" role="tablist">
    <#list links as link>
      <li role="presentation" <#if active==link.id> class="active"</#if>><a href="#${link.id}" aria-controls="${link.id}" role="tab" data-toggle="tab">${link.name}</a></li>
    </#list>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
    <#list links as link>
      <div role="tabpanel" class="tab-pane <#if active==link.id> active</#if>" id="${link.id}">
        <#nested link.id>
      </div>
    </#list>
    </div><!--tab-content-->
  </div><!--tabbable-->
</#macro>
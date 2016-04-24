<#macro accordion id panels>
<div class="panel-group" id="${id}" role="tablist" >
  <#list panels as panel>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab">
      <h4 class="panel-title">
        <a role="button" data-parent="#${id}" data-toggle="collapse" href="#collapse${panel?index}" aria-controls="collapse${panel?index}">${panel.name}</a>
      </h4>
     </div>
    <div class="panel-collapse collapse" id="collapse${panel?index}">
      <div class="panel-body">
        <#nested panel.id>
      </div>
    </div>
  </div>
  </#list>
</div><!--panel-group-->
</#macro>
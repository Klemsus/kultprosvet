<#include "link.ftl">

<#macro input input col=12>
<#if input.label??>
<label class="col-sm-2 control-label" for="${input.id}">${input.label}</label>
</#if>
<div class="<#if input.label??>col-sm-${col-2}<#else>col-sm-${col}</#if>">
  <#if input.icon??><div class="input-group"></#if>
  <${input.input!"input"} <#if input.type??>type="${input.type}"</#if> class="form-control" name="${input.id}" id="${input.id}" placeholder="${input.placeholder!input.label!input.id}" <#if input.attrs??>
<#list input.attrs?keys as attr>
${attr}="${input.attrs[attr]}"
</#list>
</#if><#list input?keys as key><#if input[key]?is_boolean && input[key]> ${key}</#if></#list>><#if input.input?? && input.input=="select">
<#list input.options?keys as option>
<option value="${option}">${input.options[option]}</option>
</#list>
</#if><#if input.input??></${input.input}></#if>
  <#if input.icon??>
  <span class="input-group-addon"><i class="glyphicon glyphicon-${input.icon}"></i></span>
  </#if>
  <#if input.icon??></div></#if>
</div>  
</#macro>

<#macro form_horizontal id action inputs submit={"type":"submit", "name":"submit", "id":"submit"}>
<form class="form-horizontal" role="form" id="${id}">
  <#list inputs as inp>
  <div class="form-group">
    <#if inp?is_sequence>
      <div class="row">
      <#list inp as single>
      <@input single 12/inp?size />
      </#list>
      </div>
    <#else>
      <@input inp />
    </#if>
  </div>
  </#list>
  <#nested>
  <#if submit?has_content>
  <div class="form-group">
    <div class="col-xs-12">
      <@link link=submit button=true/>
    </div>
  </div>
  </#if>
</form>
<#-- <script>
 (function($) {
 $("form#${id}").live('submit', function(event){
  var $form = $(this);
  $.ajax({
    type: $form.attr('method'),
    url: $form.attr('action'),
    data: JSON.stringify($form).serializeArray()),
    dataType: "json",
    contentType : "application/json",
    success: function(){
               alert("succecss");
            },
    error: function(){
            alert("failure");
          }
  });
 });
})(jQuery);
</script> -->
</#macro>
<#macro modal id header dismiss="Отмена">
<div class="modal fade" id="${id}" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<h4 class="modal-title">${header}</h4>
			</div><!--header-->
			<!-- Modal Body -->
			<div class="modal-body">
				<#nested "body">
			</div> <!-- /.modal-body -->
      <!-- Modal Footer -->
      <div class="modal-footer">
        <#if dismiss?has_content>
        <button type="button" class="btn btn-default" data-dismiss="modal">${dismiss}</button>
        </#if>
        <#nested "footer">
      </div>
		</div><!--content-->
	</div><!--dialog-->
</div><!--modal-->
</#macro>
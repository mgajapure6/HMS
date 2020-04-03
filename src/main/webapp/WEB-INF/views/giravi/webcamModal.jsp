<div class="modal fade" id="webcamModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 662px;">
		<div class="modal-content bg-transparent" style="line-height: 0;">
			<div class="modal-body pd-10">
				<a href="" role="button" class="close pos-absolute t-15 r-15 z-index-10" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</a>
				<div id="camera-container"></div>
				<div id="capturedImageAppender wd-100p ht-100p"></div>
				<a href="javascript:;" class="btn btn-primary btn-block btn-uppercase" id="snapshot">
					<i class="fa fa-camera" style="font-size: 1.2rem;"></i> Capture
				</a>
			</div>
		</div>
	</div>
</div>
<script>
	var cameraContainer = cameraContainer = $('#camera-container');
	$(function() {
		cameraContainer.userCam({
			start : function(event, video) {}
		});
		
		$('#snapshot').on('click',function(e) {
			var dataURI = cameraContainer.data('userCam').getStill();
			saveImageDataToserver(dataURI);
		});
	});

	$('#webcamModal').on('hidden.bs.modal', function() {
		cameraContainer.data('userCam').stop();
	});
</script>
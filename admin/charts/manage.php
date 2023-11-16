<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<?php 
if(isset($_GET['order_id'])){
	$qry = $conn->query("SELECT * from orders where order_id = '{$_GET['order_id']}' ");
	foreach($qry->fetch_array() as $k => $v){
		if(!is_numeric($k)){
			$$k = $v;
		}
	}
}
?>
<style>
	#cimg{
		max-width: 50%;
		object-fit: contain;
	}
</style>
<div class="col-lg-12">
	<div class="card card-outline card-primary">
		<div class="card-header">
			<h5 class="card-title"><?php echo isset($order_id) ? "Manage" : "Create" ?> Charts</h5>
		</div>
		<div class="card-body">
			<form id="chart">	
				<div class="row" class="details">
					<input type="hidden" name="order_id" value="<?php echo isset($order_id) ? $order_id : '' ?>">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="" class="control-label">Created_at</label>
							<textarea name="created_at" cols="30" rows="2" class="form-control" pattern="\d{4}-\d{2}-\d{2}" placeholder="гггг.мм.дд"><?php echo isset($created_at) ? $created_at : '' ?></textarea>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="" class="control-label">Price</label>
				            <textarea name="price" id="" cols="30" rows="2" class="form-control" oninput="this.value = this.value.replace(/[^-0-9]/g, '')" placeholder="только цифры"><?php echo isset($price) ? $price : '' ?></textarea>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="card-footer">
			<button class="btn btn-primary btn-sm" form="chart"><?php echo isset($_GET['order_id']) ? "Update": "Save" ?></button>
			<a class="btn btn-primary btn-sm" href="./?page=charts">Cancel</a>
		</div>
	</div>
</div>

<script>
	$(document).ready(function(){
		$('.select')
		$('#chart').submit(function(e){
			e.preventDefault();
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Content.php?f=chart",
				data: new FormData($(this)[0]),
			    cache: false,
			    contentType: false,
			    processData: false,
			    method: 'POST',
			    type: 'POST',
			    dataType: 'json',
				error: err=>{
					alert_toast("An error occured",'error')
					console.log(err);
					end_loader();
				},
				success:function(resp){
					if(resp != undefined){
						if(resp.status == 'success'){
							location.href=_base_url_+"admin/?page=charts";
						}else{
							alert_toast("An error occured",'error')
							console.log(resp);
						}
						end_loader();
					}
				}
			})
		})
		$('.summernote').summernote({
		        height: 200,
		        toolbar: [
		            [ 'style', [ 'style' ] ],
		            [ 'font', [ 'bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear'] ],
		            [ 'fontname', [ 'fontname' ] ],
		            [ 'fontsize', [ 'fontsize' ] ],
		            [ 'color', [ 'color' ] ],
		            [ 'para', [ 'ol', 'ul', 'paragraph', 'height' ] ],
		            [ 'table', [ 'table' ] ],
		            [ 'view', [ 'link','undo', 'redo', 'fullscreen', 'codeview', 'help' ] ]
		        ]
		    })
	})
</script>
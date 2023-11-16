<?php if($_settings->chk_flashdata('success')): ?>
<script>
	alert_toast("<?php echo $_settings->flashdata('success') ?>",'success')
</script>
<?php endif;?>
<style>
	.banner-img{
		width: 75px;
		object-fit:contain;
	}
</style>
<div class="col-lg-12">
	<div class="card card-outline card-primary">
		<div class="card-header">
			<div class="card-tools">
				<a class="btn btn-block btn-sm btn-default btn-flat border-primary new_chart" href="javascript:void(0)"><i class="fa fa-plus"></i> Add New</a>
			</div>
		</div>
		<div class="card-body">
			<table class="table tabe-hover table-bordered table-compact" id="list">
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">#</th>
						<th>Created_at</th>
						<th>Price</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$i = 1;
					$qry = $conn->query("SELECT * FROM `orders` order by created_at asc ");
					while($row= $qry->fetch_assoc()):
					?>
					<tr>
						<th class="text-center"><?php echo $i++ ?></th>						
						<td><b class=""><?php echo date("Y-m-d", strtotime($row['created_at'])) ?></b></td>
						<td><b class=""><?php echo number_format($row['price'], 0, '', '') ?></b></td>
						<td class="text-center">
		                    <div class="btn-group">
		                        <a href="javascript:void(0)" data-id='<?php echo $row['order_id'] ?>' class="btn btn-primary btn-flat btn-sm manage_chart">
		                          <i class="fas fa-edit"></i>
		                        </a>
		                        <button type="button" class="btn btn-danger btn-sm btn-flat delete_chart" data-id="<?php echo $row['order_id'] ?>">
		                          <i class="fas fa-trash"></i>
		                        </button>
	                      </div>
						</td>
					</tr>	
				<?php endwhile; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.new_chart').click(function(){
			location.href = _base_url_+"admin/?page=charts/manage";
		})
		$('.manage_chart').click(function(){
			location.href = _base_url_+"admin/?page=charts/manage&order_id="+$(this).attr('data-id')
		})
		$('.delete_chart').click(function(){
		_conf("Are you sure to delete this Chart detail?","delete_chart",[$(this).attr('data-id')])
		})
		$('#list').dataTable()
	})
	function delete_chart($order_id){
		start_loader()
		$.ajax({
			url:_base_url_+'classes/Content.php?f=chart_delete',
			method:'POST',
			data:{order_id:$order_id},
			dataType:'json',
			success:function(resp){
				if(resp.status == 'success'){
					location.reload()
				}else{
					alert_toast(resp.err_msg,'error')
				}
				end_loader();
			}
		})
	}
</script>
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
				<a class="btn btn-block btn-sm btn-default btn-flat border-primary new_chatbot" href="javascript:void(0)"><i class="fa fa-plus"></i> Add New</a>
			</div>
		</div>
		<div class="card-body">
			<table class="table tabe-hover table-bordered table-compact" id="list">
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="15%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">#</th>
						<th>Client_id</th>
						<th>Message_type</th>
						<th>Message_content</th>
						<th>Date_time</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$i = 1;
					$qry = $conn->query("SELECT * FROM `chatbot_messages` order by id asc ");
					while($row= $qry->fetch_assoc()):
					?>
					<tr>
						<th class="text-center"><?php echo $i++ ?></th>						
						<td><b class=""><?php echo $row['client_id'] ?></b></td>
						<td><b class=""><?php echo $row['message_type'] ?></b></td>
						<td><b class=""><?php echo $row['message_content'] ?></b></td>
						<td><b class=""><?php echo date("Y-m-d H:i:s",strtotime($row['date_time'])) ?></b></td>
						<td class="text-center">
		                    <div class="btn-group">
		                        <a href="javascript:void(0)" data-id='<?php echo $row['id'] ?>' class="btn btn-primary btn-flat btn-sm manage_chatbot">
		                          <i class="fas fa-edit"></i>
		                        </a>
		                        <button type="button" class="btn btn-danger btn-sm btn-flat delete_chatbot" data-id="<?php echo $row['id'] ?>">
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
		$('.new_chatbot').click(function(){
			location.href = _base_url_+"admin/?page=chatbots/manage";
		})
		$('.manage_chatbot').click(function(){
			location.href = _base_url_+"admin/?page=chatbots/manage&id="+$(this).attr('data-id')
		})
		$('.delete_chatbot').click(function(){
		_conf("Are you sure to delete this Chatbot detail?","delete_chatbot",[$(this).attr('data-id')])
		})
		$('#list').dataTable()
	})
	function delete_chatbot($id){
		start_loader()
		$.ajax({
			url:_base_url_+'classes/Content.php?f=chatbot_delete',
			method:'POST',
			data:{id:$id},
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
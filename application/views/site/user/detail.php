<div class="row">
	<ol class="breadcrumb">
		
		<li class="active">Chi tiết đơn đặt hàng</li>
	</ol>
</div><!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-info">
			<div class="panel-body">
				<h3>Thông tin khách hàng</h3>
				<div class="table-responsive">
					<table class="table table-bordered">
					  <tbody>
					  
					  	<tr>
					  		<td style="width: 100px">Họ và tên</td>
					  		<td><?php echo $transaction->user_name; ?></td>
					  	</tr>				  	
					  	<tr>
					  		<td>Số điện thoại</td>
					  		<td><?php echo $transaction->user_phone; ?></td>
					  	</tr>
					  	<tr>
					  		<td>Địa chỉ</td>
					  		<td><?php echo $transaction->user_address; ?></td>
					  	</tr>
					  	<tr>
					  		<td>Tin nhắn</td>
					  		<td><?php echo $transaction->message; ?></td>
					  	</tr>
					  	<tr>
					  		<td>Hình thức thanh toán</td>
					  		<td><?php echo $transaction->payment; ?></td>
					  	</tr>
					  	<tr>
					  		<td>Ngày đặt</td>
					  		<td><?php 
							// $timestamp = strtotime($transaction->date);
							// $new_format = date("H:i:s d/m/Y", $timestamp);
							// echo $new_format; 
							echo $transaction->date;
							?></td>
					  	</tr>
					  </tbody>
					</table>
				</div><br>
				<h3>Chi tiết đơn đặt hàng</h3>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead style="background-color: #5A9DA1;color:white">
							<tr >										
								<th class="text-center">ID</th>
								<th>Tên sản phẩm</th>
								<th>Số lượng</th>
                                <th>Size</th>
								<th>Tổng Giá</th>
							</tr>
						</thead>
						<tbody>
							<?php 
							
							foreach ($list_product as $value) { 
								?>
								<tr>
									<td style="vertical-align: middle;text-align: center;"><strong><?php echo $value->id ?></strong></td>
									<td><img src="<?php echo base_url(); ?>upload/product/<?php echo $value->image_link; ?>" alt="" style="width: 50px;float:left;margin-right: 10px;"><strong><?php echo $value->name; ?></strong>
									</td>
									<td style="vertical-align: middle"><strong ><?php echo $value->qty; ?></strong></td>
                                                                        <td style="vertical-align: middle"><strong ><?php echo $value->size_name; ?></strong></td>
                                                                        <td style="vertical-align: middle">
										<?php echo number_format($value->price); ?> VNĐ
									</td>
									
									   
				                </tr>
							<?php } ?>

			    		</tbody>

					</table>
					
					<?php
					if ($transaction->status == 0 ) { ?>
    					<a href="<?php echo base_url('admin/transaction/accept/'.$transaction->id); ?>" class="btn btn-success"> Hủy đơn hàng</a> 
					<?php  } 
					?>
				</div>
			</div>
		</div>
	</div>
</div><!--/.row-->

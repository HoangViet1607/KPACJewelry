<div class="row">
<ol class="breadcrumb">
            <li><a href="<?php echo base_url(); ?>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a></li>
            <li class="active">Danh sách đơn hàng</li>
        </ol>
</div><!--/.row-->
<h3><span id="message"></span></h3>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-info">
		<div class=" table-responsive" style="padding-left:20px; padding-bottom:20px">
				<a href="<?php echo base_url('user/donhang/'.$user->id); ?>" class="btn btn-success" > Tất cả</a>
				<a href="<?php echo base_url('user/donhang/'.$user->id . '/?status=0'); ?>" class="btn btn-success" style="margin-left:10px"> Chờ xác nhận</a>
				<a href="<?php echo base_url('user/donhang/'.$user->id . '/?status=1'); ?>" class="btn btn-success" style="margin-left:10px"> Đã xác nhận</a>
                <a href="<?php echo base_url('user/donhang/'.$user->id . '/?status=2'); ?>" class="btn btn-success" style="margin-left:10px"> Đang giao hàng</a>
                <a href="<?php echo base_url('user/donhang/'.$user->id . '/?status=3'); ?>" class="btn btn-success" style="margin-left:10px"> Giao hàng thành công</a>
				<a href="<?php echo base_url('user/donhang/'.$user->id . '/?status=4'); ?>" class="btn btn-success" style="margin-left:10px"> Đã hủy</a>
				<a href="<?php echo base_url('user/donhang/'.$user->id . '/?status=5'); ?>" class="btn btn-success" style="margin-left:10px"> Trả hàng</a>
			</div>
			<div class="panel-body">
				<div class="table-responsive" style="overflow-y: auto;height:378px">
					<table class="table table-hover">
						<thead style="background-color: #5A9DA1;color:white">
							<tr >										
								<th class="text-center">ID</th>
								<th>Tên khách hàng</th>
								<th>Ngày đặt</th>
								<th>Số ĐT</th>
								<th>Giá tiền</th>
								<th>Trạng thái</th>		
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody>
							<?php if (empty($order)): ?>
                            	<tr>
                                	<td colspan="7" class="text-center"><strong>Rất tiếc không tìm thấy đơn hàng nào phù hợp</strong></td>
            					</tr>
                            <?php else: ?>	
							<?php 
								
							foreach ($order as $value) { 
								
								?>
								<tr>
									<td style="vertical-align: middle;text-align: center;"><strong><?php echo $value->id; ?></strong></td>
									<td><strong><?php echo $value->user_name; ?></strong></td>
									<td><strong><?php echo $value->date; ?></strong></td>
									<td><strong><?php echo $value->user_phone; ?></strong></td>
									<td><strong><?php echo number_format($value->amount); ?></strong> VNĐ</td>
									<td>
									<?php
                                        if ($value->status==0) {
                                                echo "<span style='color:red'>Đang chờ </span>";
                                        }elseif($value->status==1){        
                                                echo "<span style='color:green'>Đã xác nhận</span>";
                                        }elseif($value->status==2){    
                                                echo "<span style='color:green'>Đang giao hàng</span>";
                                        }elseif($value->status==3){     
                                                echo "<span style='color:green'>Giao hàng thành công</span>";
                                        }elseif($value->status==4){     
                                            echo "<span style='color:red'>Đã hủy</span>";
                                        }
										elseif($value->status==5){     
                                            echo "<span style='color:#FF6600'>Trả hàng</span>";
                                        }
                                        ?>
									</td>
									<td class="list_td aligncenter">
							            <a href="<?php echo base_url('user/detail/'.$value->id); ?>" title="Chi tiết"><span class="glyphicon glyphicon-list-alt"></span></a>&nbsp;&nbsp;&nbsp;
							            
								    </td>    
				                </tr>
							<?php } ?>
							<?php endif; ?>
			    		</tbody>

					</table>

					
					
				</div>
			</div>
		</div>
	</div>
</div><!--/.row-->

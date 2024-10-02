<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Đơn đặt hàng</li>
	</ol>
</div><!--/.row-->
<h3><span id="message"></span></h3>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			<div class="col-md-8">Danh sách đơn hàng của <?php echo $user->name; ?></div>
			</div>
			<?php
			if(!empty($order)) {
				?>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr class="info">										
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
							            <a href="<?php echo admin_url('user/detail/'.$value->id); ?>" title="Chi tiết"><span class="glyphicon glyphicon-list-alt"></span></a>&nbsp;&nbsp;&nbsp;
							            
								    </td>    
				                </tr>
							<?php } ?>

			    		</tbody>

					</table>

					
					
				</div>
			</div>
			<?php } else { ?>
            <div class="panel panel-info " style="margin-bottom: 15px">
                
                <div class="panel-body">
                    <div class="text-center">
                        <img src="<?php echo base_url('upload/cart-empty.png') ?>" alt="">
                        <h4 style="color:red">Danh sách đơn hàng của khách hàng hiện đang trống</h4>
                    </div>

                </div>
            </div>

        <?php }
        ?>
		</div>
	</div>
</div><!--/.row-->

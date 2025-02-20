<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Quản trị viên</li>
	</ol>
</div><!--/.row-->
<h3><span id="message"></span></h3>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			<div class="col-md-8">Danh sách quản trị viên</div>
			
			<div class="col-md-4 text-right">
				<a href="<?php echo admin_url('admin/add'); ?>" class='btn btn-info'><svg class="glyph stroked plus sign"><use xlink:href="#stroked-plus-sign"/></svg> Thêm mới</a></div>
			</div>
			
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr class="info">										
								<th>ID</th>										
								<th>Họ tên</th>
								<th>Email</th>
								<th>Chức vụ</th>	
								<th>Trạng thái</th>									
								<th>Hành động</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							</tr>
							<?php foreach ($admin as $value) { ?>
								<tr>
									<td><strong><?php echo $value->id; ?></strong></td>
									<td><strong ><?php echo $value->name; ?></strong></td>
									<td><strong ><?php echo $value->email; ?></strong></td>
									<td><strong ><?php
									switch ($value->level) {
										case '0':
											echo 'ADMIN';
											break;
										case '1':
											echo 'NHÂN VIÊN';
											break;
										
										default:
											echo 'USER';
											break;
									}
									?></strong></td>
									<td>
                                        <?php
                                        if ($value->status==0) {
											echo "<span style='color:green'>Còn làm</span>";
                                        }else{        
                                                
											echo "<span style='color:red'>Đã Nghỉ </span>";
                                        }
                                        ?>
                                    </td>
									<td class="list_td aligncenter">
							            <a href="../admin/admin/edit/<?php echo $value->id; ?>" title="Sửa"><span class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;&nbsp;
							            
							            
								    </td>    
				                </tr>
							<?php } ?>
			    		</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div><!--/.row-->

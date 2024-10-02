<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 clearpaddingr"style="display: contents;">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding"style="padding-left: 200px;padding-right: 200px;">
		<ol class="breadcrumb">
		  <li><a href="<?php echo base_url(); ?>#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a></li>
		  <li class="active">Thông tin tài khoản</li>
		</ol>
		<div class="col-md-12 clearpadding" style="height:483px">
		<div class="panel panel-info">
		  <div class="panel-heading" style="">
			<div class="col-md-8" ><h3 style="margin-top: 30px;">Thông tin tài khoản</h3></div>
			<div class="col-md-4"><a style="margin-right: 10px;margin-top: 25px " href="./user/edit/<?php echo $user->id; ?>" type="button" class='btn btn-info pull-right'> Sửa</a></div>
		  </div>
		  <div class="panel-body" style="padding-top: 60px;">
		  	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding" >
		  		
		  		<table class="table table-bordered">
				  <tbody>
				  	<tr>
				  		<td style="width: 150px">Họ và tên</td>
				  		<td><?php echo $user->name; ?></td>
				  	</tr>
				  	<tr>
				  		<td>Email</td>
				  		<td><?php echo $user->email; ?></td>
				  	</tr>
					  
				  	<tr>
				  		<td>Số điện thoại</td>
				  		<td><?php echo $user->phone; ?></td>
				  	</tr>
				  	<tr>
				  		<td>Địa chỉ</td>
				  		<td><?php echo $user->address; ?></td>
				  	</tr>
				  </tbody>
				</table></div>	
		  	</div>
		  </div>
		</div>
		
	</div>
</div>
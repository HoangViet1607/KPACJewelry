<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Nhân Viên</li>
	</ol>
</div><!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			Sửa thông tin thành viên
			</div>
			<div class="panel-body">
				<form class="form-horizontal" name="" method="post">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">Họ tên</label>
				    <div class="col-sm-5">
				      <input type="text" name='name' class="form-control" id="inputEmail3" placeholder="" value="<?php echo $admin->name; ?>">
				    </div>
				    <div class="col-sm-4">
				    	<?php echo form_error('name'); ?>
					</div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
				    <div class="col-sm-5" class="col-sm-5" style="pointer-events:none;opacity: 0.7;">
				      <input type="email" name='email' class="form-control" id="inputEmail3" placeholder="" value="<?php echo $admin->email; ?>">
				    </div>
				    
				  </div>
				  <div class="form-group">
                                      <p style="padding-left: 30px;font-size: 15px;color: red">Nếu thay đổi mật khẩu thì mới nhập</p>
				    <label for="inputEmail3" class="col-sm-2 control-label">Mật khẩu</label>
				    <div class="col-sm-5">
				      <input type="password" name='password' class="form-control" id="inputEmail3" placeholder="">
				    </div>
				    <div class="col-sm-4">
				    	<?php echo form_error('password'); ?>
					</div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">Nhập lại mật khẩu</label>
				    <div class="col-sm-5">
				      <input type="password" name='re_password' class="form-control" id="inputEmail3" placeholder="">
				    </div>
				    <div class="col-sm-4">
				    	<?php echo form_error('re_password'); ?>
					</div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">Chức vụ</label>
				    <div class="col-sm-5">
					<select class="form-control" name="level" >
				        	<option>--- CHỌN ---</option>
				        	<option value="0" <?php echo ($admin->level == 0) ? 'selected' : ''; ?>>ADMIN</option>
				        	<option value="1" <?php echo ($admin->level == 1) ? 'selected' : ''; ?>>NHÂN VIÊN</option>
						</select>
				    </div>
				     <div class="col-sm-4">
				    	<?php echo form_error('level'); ?>
					</div>
				  </div>
				  <div class="form-group">
				  		<label for="inputEmail3" class="col-sm-2 control-label">Trạng thái</label>
				  		<div class="col-sm-5">
							<select class="form-control" name="status">
								<option>--- CHỌN ---</option>
								<option value="0" <?php echo ($admin->status == 0) ? 'selected' : ''; ?>>Còn làm</option>
								<option value="1" <?php echo ($admin->status == 1) ? 'selected' : ''; ?>>Đã nghỉ</option>
				        	</select>
						</div>
						<div class="col-sm-4">
				    		<?php echo form_error('status'); ?>
						</div>
					</div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-5">
				      <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
				    </div>
				  </div>
				</form>
			</div>
		</div>
	</div>
</div><!--/.row-->

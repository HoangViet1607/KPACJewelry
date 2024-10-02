<!DOCTYPE html>
<html lang="en">
<head>
	<?php $this->load->view('site/head',$this->data); ?>
	<script type="text/javascript">
    $(document).ready(function () {
        $.ajax({
            url: 'https://online-gateway.ghn.vn/shiip/public-api/master-data/province',
            type: 'POST',
            dataType: 'json',
            headers: {
                'token': '464ef410-6fc8-11ec-9054-0a1729325323'
            },
            contentType: 'application/json; charset=utf-8',
            success: function (result) {
                // CallBack(result);
                $.each(result, function (key, value) {
                    if (key.includes("data"))
                    {
                        $.each(value, function (key2, value2) {
                            $('<option>').val(value2.ProvinceID).text(value2.ProvinceName).appendTo('#province');
                        })
                    }
                })
            },
            error: function (error) {
            }
        });
    });
</script>
<script type="text/javascript">
    function formatNumber(num) {
        return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,")
    }
</script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#province').change(function (envent) {
            var province = $('#province').val();
            province = parseInt(province);

            $('#district')
                    .empty()
                    .append('<option value>--Chọn Quận,Huyện--</option>');
            $('#ward')
                    .empty()
                    .append('<option value>--Chọn Phường,Xã--</option>');
            $.ajax({
                url: 'https://online-gateway.ghn.vn/shiip/public-api/master-data/district',
                type: 'GET',
                dataType: 'json',
                headers: {
                    'token': '464ef410-6fc8-11ec-9054-0a1729325323',
                },
                data: {province_id: province},
                contentType: 'application/json; charset=utf-8',
                success: function (result) {
                    // CallBack(result);
                    $.each(result, function (key, value) {
                        if (key.includes("data"))
                        {
                            $.each(value, function (key2, value2) {
                                $('<option>').val(value2.DistrictID).text(value2.DistrictName).appendTo('#district');
                            })
                        }
                    })
                },
                error: function (error) {
                }
            });
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $('#district').change(function (envent) {
            var district = $('#district').val();
            district = parseInt(district);
            $('#ward')
                    .empty()
                    .append('<option value>--Chọn Phường,Xã--</option>');
            
            $.ajax({
                url: 'https://online-gateway.ghn.vn/shiip/public-api/master-data/ward',
                type: 'GET',
                dataType: 'json',
                headers: {
                    'token': '464ef410-6fc8-11ec-9054-0a1729325323',
                },
                data: {district_id: district},
                contentType: 'application/json; charset=utf-8',
                success: function (result) {
                    // CallBack(result);

                    $.each(result, function (key, value) {

                        if (key.includes("data"))
                        {
                            $.each(value, function (key2, value2) {
                                $('<option>').val(value2.WardCode).text(value2.WardName).appendTo('#ward');
                            })
                        }
                    })
                },
                error: function (error) {
                }
            });
        });
    });

</script>
<script type="text/javascript">
    $(document).ready(function () {

        $('#ward').change(function (envent) {
            var district = $('#district').val();
            district = parseInt(district);
            var a = $("#province option:selected").text();
            var b = $("#district option:selected").text();
            var c = $("#ward option:selected").text();
            var str = c + ", " + b + ", " + a;
            $('#adress').val(str);
        });
    });
</script>
</head>
<body>
	<div class="container">
		<?php $this->load->view('site/header',$this->data); ?>

		<div class="row" >
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding" style="margin-top: 15px;">
				<ol class="breadcrumb">
				  <li><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Home</a></li>
				  <li class="active">Đăng kí</li>
				</ol>
				<div class="panel panel-info ">

						<?php if (isset($message_success) && !empty($message_success)) { ?>
							<h4 style="color:green;text-align: center;margin-top: 30px"><?php echo $message_success; ?></h4>
							
						<?php } ?>
						<?php if (isset($message_fail) && !empty($message_fail)) { ?>
							<h4 style="color:red;text-align: center;margin-top: 30px"><?php echo $message_fail; ?></h4>
						<?php } ?>
				  	<div class="panel-body">
						<div><h3 style="text-align: center; font-weight: bold">ĐĂNG KÝ</h3><br></div> 
				  	<form class="form-horizontal" method="post" action="<?php echo base_url('user/register'); ?>">
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-offset-2 col-sm-2 control-label">Họ tên</label>
					    <div class="col-sm-4">
					      <input type="text" class="form-control" id="inputEmail3" placeholder="" name="name" value="<?php echo set_value('name'); ?>">
					    </div>
					    <div class="col-sm-3">
				    	<?php echo form_error('name'); ?>
					</div>
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class=" col-sm-offset-2 col-sm-2 control-label">Email</label>
					    <div class="col-sm-4">
					      <input type="email" class="form-control" id="inputEmail3" placeholder="" name="email" value="<?php echo set_value('email'); ?>">
					    </div>
					    <div class="col-sm-3">
				    	<?php echo form_error('email'); ?>
					</div>
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-offset-2 col-sm-2 control-label">Mật khẩu</label>
					    <div class="col-sm-4">
					      <input type="password" class="form-control" id="inputEmail3" placeholder="" name="password">
					    </div>
					    <div class="col-sm-3">
				    	<?php echo form_error('password'); ?>
					</div>
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class=" col-sm-offset-2 col-sm-2 control-label">Nhập lại mật khẩu</label>
					    <div class="col-sm-4">
					      <input type="password" class="form-control" id="inputEmail3" placeholder="" name="re_password">
					    </div>
					    <div class="col-sm-3">
				    	<?php echo form_error('re_password'); ?>
					</div>
					  </div>
					  <div class="form-group">
				    			<label for="inputEmail3" class=" col-sm-offset-2 col-sm-2 control-label">Số điện thoại</label>
				    			<div class="col-sm-4">
				      				<input type="text" name='phone' class="form-control" id="inputEmail3" value="<?php echo set_value('phone'); ?>" >
				    			</div>
				    			<div class="col-sm-3">
				    				<?php echo form_error('phone'); ?>
								</div>
							</div>
							<div class="form-group" >
				    			<label for="inputEmail3" class="col-sm-offset-2 col-sm-2 control-label" >Tỉnh, Thành Phố</label>
				    			<div class="col-sm-4">
                                    <select class="form-control" name="province" id="province">
                                        <option value>--Chọn Tỉnh, Thành phố--</option>
                                    </select>
				    			</div>
				    			<div class="col-sm-3">
                                    <?php echo form_error('province'); ?>
								</div>
							</div>
                            <div class="form-group" >
				    			<label for="inputEmail3" class="col-sm-offset-2 col-sm-2 control-label" >Quận, Huyện</label>
				    			<div class="col-sm-4">
                                    <select class="form-control" name="district" id="district">
                                        <option value>--Chọn Quận, Huyện--</option>
                                    </select>
				    			</div>
				    			<div class="col-sm-3">
                                    <?php echo form_error('district'); ?>
								</div>
							</div>
                            <div class="form-group" >
				    			<label for="inputEmail3" class="col-sm-offset-2 col-sm-2 control-label" >Phường, Xã</label>
				    			<div class="col-sm-4">
                                    <select class="form-control" name="ward" id="ward">
                                        <option value>--Chọn Phường,Xã--</option>
                                    </select>
				    			</div>
				    			<div class="col-sm-3">
                                    <?php echo form_error('ward'); ?>
								</div>
							</div>           
                            
							<div class="form-group" >
				    			<label for="inputEmail3" class="col-sm-offset-2 col-sm-2 control-label" >Địa chỉ cụ thể</label>
				    			<div class="col-sm-4">
                                    <input class="form-control" class="form-control" name="area" type="text" value=""><?php echo form_error('address'); ?>
                                    <input class="form-control" id="adress" name="adress" type="hidden">    
				    			</div>
							</div>  
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-2">
					      <button type="submit" class="btn btn-success">Đăng Ký</button>
					    </div>
					    <div class="col-sm-offset-1 col-sm-2">
					      <a href="<?php echo base_url('dang-nhap'); ?>">Đăng nhập</a>
					    </div>
					  </div>
					</form>				  	
				  </div>

					</div>
			</div>
		</div>
		
	</div>
    
    <script src="<?php echo public_url('site/'); ?>bootstrap/js/bootstrap.min.js"></script>
</body>
<?php $this->load->view('site/footer',$this->data); ?>
</html>
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

<script type="text/javascript">
    $(document).ready(function() {
        // Function to handle address display based on the content of #address
        function updateAddressFields() {
            var addressField = $('#address').val().trim(); // Trim whitespace and get the value
            
            if (addressField === '') {
                // If #address is empty, show new address fields and check the checkbox
                $('#use_different_address').prop('checked', true).change();
            } else {
                // If #address has content, manage visibility based on checkbox status
                if ($('#use_different_address').is(':checked')) {
                    $('#specific_address_row').hide();
                    $('#new_province_row, #new_district_row, #new_ward_row, #new_address_row').show();
                } else {
                    $('#specific_address_row').show();
                    $('#new_province_row, #new_district_row, #new_ward_row, #new_address_row').hide();
                }
            }
        }

        // Handle checkbox change
        $('#use_different_address').change(function() {
            if ($(this).is(':checked')) {
                // Hide "Địa chỉ cụ thể" and show "Địa chỉ cụ thể mới"
                $('#specific_address_row').hide();
                $('#new_province_row, #new_district_row, #new_ward_row, #new_address_row').show();
                $('#adress').val(''); // Clear the hidden address input if needed
            } else {
                // Show "Địa chỉ cụ thể" and hide "Địa chỉ cụ thể mới"
                $('#specific_address_row').show();
                $('#new_province_row, #new_district_row, #new_ward_row, #new_address_row').hide();
            }
        });

        // Initialize address fields based on the content of #address
        updateAddressFields();
    });
</script>

<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 clearpaddingr"style="display: contents;">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding"style="padding-left: 200px;padding-right: 200px;">
		<ol class="breadcrumb">
		  	<li><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a></li>
		  	<li class="active">Sửa thông tin tài khoản</li>
		</ol>
        	<div class="col-md-12 clearpadding">
				<div class="col-lg-12">
					<div class="panel panel-info">
						<div class="panel-body">
							<form class="form-horizontal" name="" method="post">
								<div class="form-group">
				    				<label for="inputEmail3" class="col-sm-2 control-label" style="text-align:left">Họ tên</label>
				    				<div class="col-sm-5">
				      					<input type="text" name='name' class="form-control" id="inputEmail3" placeholder="" value="<?php echo $user->name; ?>">
				    				</div>
				    				<div class="col-sm-4">
				    					<?php echo form_error('name'); ?>
									</div>
				  				</div>
				  			<div class="form-group">
				    			<label for="inputEmail3" class="col-sm-2 control-label" style="text-align:left">Email</label>
				    			<div class="col-sm-5" class="col-sm-5" style="pointer-events:none;opacity: 0.7;">
				      				<input type="email" name='email' class="form-control" id="inputEmail3" placeholder="" value="<?php echo $user->email; ?>">
				    			</div>
				  			</div>
                            <div class="form-group">
                                <p style="padding-left: 15px;padding-bottom: 15px; font-size: 15px;color: red">Nếu thay đổi mật khẩu thì mới nhập</p>
		                        <label for="inputEmail3" class="col-sm-2 control-label" style="text-align:left">Mật khẩu</label>
				                <div class="col-sm-5">
				                    <input type="password" name='password' class="form-control" id="inputEmail3" placeholder="">
				                </div>
				                <div class="col-sm-4">
				    	            <?php echo form_error('password'); ?>
					            </div>
				            </div>
				            <div class="form-group">
				                <label for="inputEmail3" class="col-sm-2 control-label"style="text-align:left">Nhập lại mật khẩu</label>
				                <div class="col-sm-5">
                                    <input type="password" name='re_password' class="form-control" id="inputEmail3" placeholder="">
                                </div>
				                <div class="col-sm-4">
				    	            <?php echo form_error('re_password'); ?>
                                </div>
				            </div>
							<div class="form-group">
				    			<label for="inputEmail3" class="col-sm-2 control-label" style="text-align:left">Số điện thoại</label>
				    			<div class="col-sm-5">
				      				<input type="text" name='phone' class="form-control" id="inputEmail3" value="<?php echo $user->phone; ?>">
				    			</div>
				    			<div class="col-sm-4">
				    				<?php echo form_error('phone'); ?>
								</div>
							</div>
                            
                            <div class="form-group" id="specific_address_row">
				    			<label for="inputEmail3" class="col-sm-2 control-label" style="text-align:left">Địa chỉ</label>
				    			<div class="col-sm-5">
				      				<input type="text" id='address' name='address' class="form-control" value="<?php echo (!empty($user)) ? $user->address : ''; ?>">
				    			</div>
				    			<div class="col-sm-4">
				    				<?php echo form_error('address'); ?>
								</div>
							</div>

                            <div>
				    			
				      				<input type="checkbox" id="use_different_address" name="use_different_address" value="1" style="width: 20px;height: 20px;">
                                      <label for="use_different_address">Thay đổi địa chỉ khác</label>
							</div>
                            <div class="form-group" id="new_province_row" style="display: none;">
				    			<label for="inputEmail3" class="col-sm-2 control-label" style="text-align:left">Tỉnh, Thành Phố</label>
				    			<div class="col-sm-5">
                                    <select class="form-control" name="province" id="province">
                                        <option value>--Chọn Tỉnh, Thành phố--</option>
                                    </select>
				    			</div>
				    			<div class="col-sm-4">
                                    <?php echo form_error('province'); ?>
								</div>
							</div>
                            <div class="form-group" id="new_district_row" style="display: none;">
				    			<label for="inputEmail3" class="col-sm-2 control-label" style="text-align:left">Quận, Huyện</label>
				    			<div class="col-sm-5">
                                    <select class="form-control" name="district" id="district">
                                        <option value>--Chọn Quận, Huyện--</option>
                                    </select>
				    			</div>
				    			<div class="col-sm-4">
                                    <?php echo form_error('district'); ?>
								</div>
							</div>
                            <div class="form-group" id="new_ward_row" style="display: none;">
				    			<label for="inputEmail3" class="col-sm-2 control-label" style="text-align:left">Phường, Xã</label>
				    			<div class="col-sm-5">
                                    <select class="form-control" name="ward" id="ward">
                                        <option value>--Chọn Phường,Xã--</option>
                                    </select>
				    			</div>
				    			<div class="col-sm-4">
                                    <?php echo form_error('ward'); ?>
								</div>
							</div>           
                            <div class="form-group" id="new_address_row" style="display: none;">
				    			<label for="inputEmail3" class="col-sm-2 control-label" style="text-align:left">Địa chỉ cụ thể</label>
				    			<div class="col-sm-5">
                                    <input class="form-control" class="form-control" name="area" type="text" value=""><?php echo form_error('address'); ?>
                                    <input class="form-control" id="adress" name="adress" type="hidden">    
				    			</div>
							</div>        
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-5" style="padding-top: 15px;" >
				      <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
				    </div>
				  </div>
				</form>
			</div>
		</div>
	</div>
		</div>
		
		
	</div>
</div>
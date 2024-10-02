<script type="text/javascript">
    $(document).ready(function () {
        // Load provinces on page load
        $.ajax({
            url: 'https://online-gateway.ghn.vn/shiip/public-api/master-data/province',
            type: 'POST',
            dataType: 'json',
            headers: {
                'token': '464ef410-6fc8-11ec-9054-0a1729325323'
            },
            contentType: 'application/json; charset=utf-8',
            success: function (result) {
                $.each(result, function (key, value) {
                    if (key.includes("data")) {
                        $.each(value, function (key2, value2) {
                            $('<option>').val(value2.ProvinceID).text(value2.ProvinceName).appendTo('#province');
                        });
                    }
                });
            },
            error: function (error) { }
        });

        // Format numbers with commas
        function formatNumber(num) {
            return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1,");
        }

        // Load districts based on selected province
        $('#province').change(function () {
            var province = $('#province').val();
            province = parseInt(province);
            $('#district').empty().append('<option value>--Chọn Quận, Huyện--</option>');
            $('#ward').empty().append('<option value>--Chọn Phường, Xã--</option>');
            // $('#ship').empty().append('<option value>--Chọn Dịch Vụ--</option>');
            $('#ship_money').val('0');
            $('#ship_label').html('0');
            var total_count = <?php echo $total_amount ?>;
            $('#total_amount').html(formatNumber(total_count));

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
                    $.each(result, function (key, value) {
                        if (key.includes("data")) {
                            $.each(value, function (key2, value2) {
                                $('<option>').val(value2.DistrictID).text(value2.DistrictName).appendTo('#district');
                            });
                        }
                    });
                },
                error: function (error) { }
            });
        });

        // Load wards based on selected district
        $('#district').change(function () {
            var district = $('#district').val();
            district = parseInt(district);
            $('#ward').empty().append('<option value>--Chọn Phường, Xã--</option>');
            // $('#ship').empty().append('<option value>--Chọn Dịch Vụ--</option>');
            $('#ship_money').val('0');
            $('#ship_label').html('0');
            var total_count = <?php echo $total_amount ?>;
            $('#total_amount').html(formatNumber(total_count));

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
                    $.each(result, function (key, value) {
                        if (key.includes("data")) {
                            $.each(value, function (key2, value2) {
                                $('<option>').val(value2.WardCode).text(value2.WardName).appendTo('#ward');
                            });
                        }
                    });
                },
                error: function (error) { }
            });

            // Update services when district changes
            loadServices(district);
        });

        // Load services based on selected district and ward
        function loadServices(district, ward) {
            var dis = <?php echo $shipping[0]->id_district ?>;
            $.ajax({
                url: 'https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/available-services',
                type: 'GET',
                dataType: 'json',
                headers: {
                    'token': '464ef410-6fc8-11ec-9054-0a1729325323',
                },
                data: {
                    "shop_id": 2413002,
                    "from_district": dis,
                    "to_district": district || dis // If no district is selected, use the default district
                },
                contentType: 'application/json; charset=utf-8',
                success: function (result) {
                    // $('#ship').empty().append('<option value>--Chọn Dịch Vụ--</option>');
                    // $.each(result, function (key, value) {
                    //     if (key.includes("data")) {
                    //         $.each(value, function (key2, value2) {
                    //             $('<option>').val(value2.service_id).text("GHN_Đường bộ").appendTo('#ship');
                    //         });
                    //     }
                    // });
                },
                error: function (error) {
                    alert("Không thể lấy danh sách dịch vụ vận chuyển!");
                }
            });
        }

        // Load services on page load
        loadServices();

        // Handle ward change
        $('#ward').change(function () {
            // $('#ship').empty().append('<option value>--Chọn Dịch Vụ Vận Chuyển--</option>');
            $('#ship_money').val('24000');
            $('#ship_label').html('24000');
            var total_count = <?php echo $total_amount ?>;
            $('#total_amount').html(formatNumber(total_count));
            var district = $('#district').val();
            district = parseInt(district);

            var a = $("#province option:selected").text();
            var b = $("#district option:selected").text();
            var c = $("#ward option:selected").text();
            var str = c + ", " + b + ", " + a;
            $('#adress').val(str);

            // Update services when ward changes
            loadServices(district);
        });

        // Update shipping details when service changes
        $('#ship').change(function () {
            $('#ship_money').val('0');
            $('#ship_label').html('0');
            var total_count = <?php echo $total_amount ?>;
            $('#total_amount').html(formatNumber(total_count));
            var ship = $('#ship').val();
            ship = parseInt(ship);
            var district = $('#district').val();
            district = parseInt(district);
            var ward = $('#ward').val();
            ward = parseInt(ward);
            var money = $('.money');
            var money_total = money.text();
            money_total = parseFloat(money_total) * 100;
            $.ajax({
                url: 'https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee',
                type: 'GET',
                dataType: 'json',
                headers: {
                    'token': '464ef410-6fc8-11ec-9054-0a1729325323',
                },
                data: {
                    "service_id": ship,
                    "insurance_value": money_total,
                    "coupon": null,
                    "from_district_id": <?php echo $shipping[0]->id_district ?>,
                    "to_district_id": district,
                    "to_ward_code": ward,
                    "height": 15,
                    "length": 15,
                    "weight": 1000,
                    "width": 15
                },
                contentType: 'application/json; charset=utf-8',
                success: function (result) {
                    $.each(result, function (key, value) {
                        if (key.includes("data")) {
                            $.each(value, function (key2, value2) {
                                if (key2.includes("total")) {
                                    $('#ship_money').val(parseFloat(value2));
                                    $('#ship_label').html(formatNumber(value2));
                                    var total_count = <?php echo $total_amount ?> + value2;
                                    $('#total_amount').html(formatNumber(total_count));
                                }
                            });
                        }
                    });
                },
                error: function (error) { }
            });
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function() {
        // Handle checkbox change
        $('#use_different_address').change(function() {
            if ($(this).is(':checked')) {
                // Hide "Địa chỉ cụ thể" and show "Địa chỉ cụ thể mới"
                $('#specific_address_row').hide();
                $('#new_province_row,#new_district_row,#new_ward_row,#new_address_row').show();
                $('#adress').val(''); // Clear the hidden address input if needed
            } else {
                // Show "Địa chỉ cụ thể" and hide "Địa chỉ cụ thể mới"
                $('#specific_address_row').show();
                $('#new_province_row,#new_district_row,#new_ward_row,#new_address_row').hide();
            }
        });

        // Optionally handle the initial state if the checkbox is pre-checked
        if ($('#use_different_address').is(':checked')) {
            $('#specific_address_row').hide();
            $('#new_address_row').show();
        }
    });
</script>




<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 clearpaddingr">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url(); ?>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a></li>
            <li class="active">Thanh toán</li>
        </ol>
        <?php if (isset($message) && !empty($message)) { ?>
            <h4 style="color:green;text-align: center;margin-top: 30px"><?php echo $message; ?></h4>
        <?php } ?>
        <div class="col-md-12 clearpadding">
            <div class="panel panel-info" >
                <div class="panel-heading cus-color">
                    <h3 class="panel-title">Thông tin thanh toán</h3>
                </div>
                <div class="panel-body">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding">

                        <form enctype="multipart/form-data" method="post" >
                            <table class="table" id="order_info">
                                <tbody>
                                    <tr>
                                        <td style="width: 200px">Họ và tên:</td>
                                        <td><input style="width: 350px;margin-left: 20px;" class="form-control" type="text" value="<?php echo (!empty($user)) ? $user->name : ''; ?>" name="name"><?php echo form_error('name'); ?></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Số điện thoại:</td>
                                        <td><input style="width: 350px;margin-left: 20px;" class="form-control" name="phone" type="text" value="<?php echo (!empty($user)) ? $user->phone : ''; ?>"><?php echo form_error('phone'); ?></td>
                                        <td></td>
                                    </tr>
                                    <tr id="specific_address_row">
                                        <td>Địa chỉ:</td>
                                        <td><input style="width: 350px;margin-left: 20px;" class="form-control" name="address" type="text" value="<?php echo (!empty($user)) ? $user->address : ''; ?>">
                                        <?php echo form_error('address'); ?></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td><input  type="checkbox" id="use_different_address" name="use_different_address" value="1">
                                            <label for="use_different_address">Sử dụng địa chỉ khác</label>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr id="new_province_row" style="display: none;">
                                        <td>Tỉnh, Thành Phố:</td>
                                        <td><select  class="form-control" name="province" id="province" style="width: 350px;padding: 5px;margin-left: 20px;">
                                                <option value>--Chọn Tỉnh, Thành phố--</option>

                                            </select>
                                            
                                                <?php echo form_error('province'); ?>
                                            
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr id="new_district_row" style="display: none;">
                                        <td>Quận, Huyện:</td>
                                        <td><select class="form-control" name="district" id="district" style="width: 350px;padding: 5px;margin-left: 20px;">
                                                <option value>--Chọn Quận, Huyện--</option>
                                            </select>
                                            
                                                <?php echo form_error('district'); ?>
                                            
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr id="new_ward_row" style="display: none;">
                                        <td>Phường, Xã:</td>
                                        <td><select class="form-control" name="ward" id="ward" style="padding: 5px;width: 350px;margin-left: 20px;">
                                                <option value>--Chọn Phường,Xã--</option>
                                            </select>
                                           
                                                <?php echo form_error('ward'); ?>
                                            
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr id="new_address_row" style="display: none;">
                                        <td>Địa chỉ:</td>
                                        <td><input style="width: 350px;margin-left: 20px;" class="form-control" name="area" type="text" value="">
                                        <?php echo form_error('address'); ?></td>
                                        <td><input style="max-width: 200px" id="adress" name="adress" type="hidden"></td>
                                    </tr>
                                    <tr>
                                        <td>Dịch vụ vận chuyển:</td>
                                        <td><select  class="form-control" name="ship" id="ship" style="width: 350px;padding: 5px;margin-left: 20px;">
                                                <option value>--Chọn Dịch Vụ--</option>
                                                <option value>GHN_Đường bộ</option>

                                            </select>
                                            
                                                <?php echo form_error('ship_money'); ?>
                                            
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>Hình thức thanh toán:</td>
                                        <td><select  class="form-control" name="payment" style="width: 350px;padding: 5px;margin-left: 20px;">
                                                <option value>--Chọn Dịch Vụ--</option>
                                                <option >Thanh toán khi nhận hàng</option>
                                                <!-- <option >VNPAY</option> -->

                                            </select>
                                            
                                                <?php echo form_error('payment'); ?>
                                           
                                        </td>
                                        <td></td>
                                    </tr>

                                    <tr>
                                        <td >Tổng tiền:</td>
                                        <td>
                                            <span class="amount" style="margin-left: 20px" ><?php echo number_format($total_amount); ?></span>
                                        </td>
                                        <td style = "text-align: right">VNĐ</td>
                                    </tr>

                                    <tr>
                                        <td>Phí ship:</td>
                                        <td>
                                            <span id="ship_label" style=";margin-left: 20px">0</span>

                                        </td>
                                        <td style = "text-align: right"><input style="max-width: 100px" type="hidden" name="ship_money" id="ship_money" value="" >VNĐ</td>
                                    </tr>

                                    <tr>
                                        <td>Thành tiền</td>
                                        <td style="color: red;max-width: 50px">
                                            <span id="total_amount" style=";margin-left: 20px" ><?php echo number_format($total_amount); ?></span>
                                        </td>
                                        <td style = "text-align: right">VNĐ</td>
                                    </tr>

                                    <tr>
                                        <td></td>
                                        <td >

                                        </td>
                                        <td></td>

                                    </tr>

                                </tbody>
                            </table>
                            <div class="col-lg-8">
                                <div class="col-lg-5"><image style="width: 100%; height: 100%" src="<?php echo base_url(); ?>upload/van_chuyen.png" /></div>
                                <div class="col-lg-5">Đơn vị vận chuyển<p>GHN - Giao hàng nhanh toàn quốc</p></div>
                            </div>
                            <button style="min-width: 100px;float: right;margin-top: 50px" type="submit" class="btn btn-success">Xác nhận</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>	
    </div>
</div>
<script>
    function validateNumber(input) {
    // Lấy giá trị hiện tại của ô nhập
    const value = input.value;

    // Thay thế tất cả các ký tự không phải số bằng chuỗi rỗng
    input.value = value.replace(/[^0-9]/g, '');

}

function handleBlur(inputElement, cartid) {
    const oldQty = inputElement.getAttribute('data-old-qty');
    const currentQty = inputElement.value;

    // Nếu giá trị hiện tại là trống hoặc không hợp lệ, khôi phục giá trị cũ
    if (currentQty === '' || isNaN(currentQty) || currentQty <= 0) {
        inputElement.value = oldQty;
    } else {
        // Gửi yêu cầu cập nhật số lượng đến server nếu giá trị hợp lệ
        updateQuantity(cartid);
    }
}

function updateQuantity(cartid) {
    const inputElement = document.getElementById(`qty_${cartid}`);
    const qty = inputElement.value;
    
    if (qty && !isNaN(qty) && qty > 0) {
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "<?php echo base_url('cart/update/') ?>" + cartid + "/set", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Reload page or update the cart view
                location.reload(); // Hoặc bạn có thể làm gì đó khác để cập nhật giao diện
            }
        };
        xhr.send("qty=" + encodeURIComponent(qty));
    }
}

function allowOnlyNumbers(event) {
    // Cho phép chỉ các ký tự số
    if (!((event.keyCode >= 48 && event.keyCode <= 57) || event.keyCode === 8 || event.keyCode === 46)) {
        event.preventDefault();
    }
}

// Khi trang tải, gán số lượng cũ vào thuộc tính data-old-qty cho tất cả các ô input
document.addEventListener('DOMContentLoaded', (event) => {
    document.querySelectorAll('input[name="qty"]').forEach(input => {
        input.setAttribute('data-old-qty', input.value);
    });
});

</script>

<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 clearpaddingr" style="display: contents;">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearpadding " style="padding-left: 80px;padding-right: 80px;">
        <ol class="breadcrumb">
            <li><a href="<?php echo base_url(); ?>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Trang chủ</a></li>
            <li class="active">Chi tiết giỏ hàng</li>
        </ol>
        <?php if (isset($message) && !empty($message)) { ?>
            <h5 style="color:#ffffff;margin-top: 10px;background-color: #8FD9C4;padding: 15px;"><?php echo $message; ?></h5>
            <?php
        }
        if ($total_items > 0) {
            ?>
            <div class="panel panel-info " style="margin-top: 20px;margin-bottom: 15px;background-color: #ffffff;">
                <div class="panel-heading">
                    <h3 class="panel-title">GIỎ HÀNG ( <?php echo $total_items; ?> sản phẩm )</h3>
                </div>
                <div class="panel-body gio-hang" style="background-color: #ffffff;overflow-y: auto;height: 417px;">
                   
                    <table class="table table-hover" >
                        <thead style="background-color: #5A9DA1;color: #fff;font-size: 14px">
                        <th>STT</th>
                        <th style="text-align: center">Tên sản phẩm</th>
                        <th style="text-align: center">Hình ảnh</th>
                        <th style="text-align: center">Số lượng</th>
                        <th style = "text-align: center">Size</th>
                        <!-- <th style="text-align: center">Thêm size mới</th> -->
                        <th>Thành tiền</th>
                        <th style="text-align: center">Xóa</th>
                        </thead>
                        <tbody>
                            <?php
                            $i = 0;
                            $total_price = 0;
                            foreach ($carts as $items) {
                                $total_price = $total_price + $items['subtotal'];
                                ?>
                                <tr>
                                    <td style = "text-align: center"><?php echo $i = $i + 1 ?></td>
                                    <td><?php echo $items['name']; ?></td>
                                    <td style = "text-align: center"><img src="<?php echo base_url('upload/product/' . $items['image_link']); ?>" class="img-thumbnail" alt="" style="width: 50px;"></td>
                                    <td style="min-width: 150px; text-align: center">
                                        <?php if ($items['qty'] > 1): ?>
                                            <a class="cart-sumsub" href="<?php echo base_url('cart/update/' . $items['cartid'] . '/sub'); ?>">-</a>
                                        <?php else: ?>
                                            <span style="width: 30px; display: inline-block;"></span>
                                        <?php endif; ?>
                                        <input  type="text" 
                                                id="qty_<?php echo $items['cartid']; ?>" 
                                                name="qty" 
                                                value="<?php echo $items['qty']; ?>" 
                                                style="width: 30px; text-align: center;" 
                                                data-old-qty="<?php echo $items['qty']; ?>" 
                                                oninput="updateQuantity(<?php echo $items['cartid']; ?>)" 
                                                onkeydown="allowOnlyNumbers(event)" 
                                                onblur="handleBlur(this, <?php echo $items['cartid']; ?>)">
                                        <a class="cart-sumsub" href="<?php echo base_url('cart/update/' . $items['cartid'] . '/sum'); ?>">+</a>
                                    </td>
                                    <td style="min-width: 150px;text-align: center">
                                        <?php
                                        // Determine if there's a smaller size available
                                        $input_smaller = array();
                                        $input_smaller['where'] = array('product_id' => $items['id'], 'size_id <' => $items['size']);
                                        $input_smaller['order'] = array('size_id', 'DESC');
                                        $input_smaller['limit'] = array('1', '0');
                                        $size_smaller = $this->sizedetail_model->get_list($input_smaller);

                                        // Determine if there's a larger size available
                                        $input_larger = array();
                                        $input_larger['where'] = array('product_id' => $items['id'], 'size_id >' => $items['size']);
                                        $input_larger['order'] = array('size_id', 'ASC');
                                        $input_larger['limit'] = array('1', '0');
                                        $size_larger = $this->sizedetail_model->get_list($input_larger);
                                        ?>

                                        <!-- "-" Button: Only show if a smaller size exists -->
                                        <?php if (!empty($size_smaller)) { ?>
                                            <a class="cart-sumsub" href="<?php echo base_url('cart/subsize/' . $items['cartid'] . '/' . $items['id']); ?>">-</a>
                                        <?php } ?>

                                        <input type="hidden" value="<?php echo $items['size']; ?>" style="width: 30px;text-align: center;">
                                        <input type="text" disabled="disabled" value="<?php
                                        $re = $this->size_model->get_info($items['size']);
                                        echo $re->name;
                                        ?>" style="width: 60px;text-align: center;">

                                        <!-- "+" Button: Only show if a larger size exists -->
                                        <?php if (!empty($size_larger)) { ?>
                                            <a class="cart-sumsub" href="<?php echo base_url('cart/sumsize/' . $items['cartid'] . '/' . $items['id']); ?>">+</a>
                                        <?php } ?>
                                    </td>
                                    
                                    <!-- <td style="text-align: center"><a style="color: #00FF00" href="<?php echo base_url('cart/newsize/' . $items['id']); ?>"><span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span></a></td> -->
                                    <td><?php echo number_format($items['subtotal']); ?> VNĐ</td>
                                    <td style = "text-align: center"><a href="<?php echo base_url('cart/del/' . $items['cartid']); ?>"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a></td>

                                </tr>
                            <?php }
                            ?>
                            <tr>
                                <td colspan="5">Tổng tiền</td>
                                <td style="font-weight: bold;color:#2F4858"><?php echo number_format($total_price); ?> VNĐ</td>
                                <td><a style="font-weight: bold;color: #2F4858" href="<?php echo base_url('cart/del'); ?>">Xóa toàn bộ</a></td>

                            </tr>
                            <tr style="border: none">
                                <td colspan="8">
                                    <?php if ($this->session->userdata('user')) { ?>
                                        <a style="float: right; border: none" href="<?php echo base_url('order'); ?>" class="btn btn-success">Đặt mua</a>
                                    <?php } else { ?>
                                        <a style="float: right; border: none" href="<?php echo base_url('user/login'); ?>" class="btn btn-warning">Vui lòng đăng nhập để mua hàng</a>
                                    <?php } ?>
                                </td>
                            </tr>

                        </tbody>
                    </table>
                    
                </div>
            </div>
        <?php } else { ?>
            <div class="panel panel-info " style="margin-bottom: 15px">
                <div class="panel-heading">
                    <h3 class="panel-title">GIỎ HÀNG ( 0 sản phẩm )</h3>
                </div>
                <div class="panel-body">
                    <div class="text-center" style="height:342px">
                        <img src="<?php echo base_url('upload/cart-empty.png') ?>" alt="">
                        <h4 style="color: black">Không có sản phẩm trong giỏ hàng</h4>
                        <a href="<?php echo base_url('product/hot'); ?>" class="btn btn-info">Mua sắm</a>
                    </div>

                </div>
            </div>

        <?php }
        ?>



    </div>
    
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('.remove').click(function () {
            var container = $(this).parent().parent();
            var id = $(this).attr('id');
            var string = 'id=' + id;
            $.ajax({
                url: '<?php echo admin_url('product/del'); ?>',
                type: 'post',
                data: string,
                success: function (success) {
                    container.slideUp('slow', function () {
                        
                    })
                }
            });
        });
    });
</script>

<div class="row">
    <ol class="breadcrumb">
        <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
        <li class="active">Đơn đặt hàng</li>
    </ol>
</div><!--/.row-->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="col-md-4">Quản lý đơn đặt hàng</div>
                <div class="col-md-1"></div>
                <div class="col-md-6"  style="float:right;margin-top: 5px">
                    <form role="search" action='<?php echo admin_url('transaction/search'); ?>' method="post">
                        <div class="form-group">
                            <input name="search" type="text" class="form-control" placeholder="Nhập tên khách hang">
                        </div>
                        <button class="btn text-right" style="position: absolute;right: 16px;top: 2px;float:right; padding: 4px 8px 4px 8px;" type="submit"><img src="<?php echo base_url(); ?>/upload/ic_search.png" /></button>
                    </form>
                </div>
            </div>
            <div class=" table-responsive" style="padding-top:20px;padding-left:20px">
				<a href="<?php echo admin_url('transaction'); ?>" class="btn btn-success" > Tất cả</a>
				<a href="<?php echo admin_url('transaction/index?status=0'); ?>" class="btn btn-success" style="margin-left:10px"> Chờ xác nhận</a>
				<a href="<?php echo admin_url('transaction/index?status=1'); ?>" class="btn btn-success" style="margin-left:10px"> Đã xác nhận</a>
                <a href="<?php echo admin_url('transaction/index?status=2'); ?>" class="btn btn-success" style="margin-left:10px"> Đang giao hàng</a>
                <a href="<?php echo admin_url('transaction/index?status=3'); ?>" class="btn btn-success" style="margin-left:10px"> Giao hàng thành công</a>
				<a href="<?php echo admin_url('transaction/index?status=4'); ?>" class="btn btn-success" style="margin-left:10px"> Đã hủy</a>
				<a href="<?php echo admin_url('transaction/index?status=5'); ?>" class="btn btn-success" style="margin-left:10px"> Trả hàng</a>
			</div>
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
                        <?php if (empty($transaction)): ?>
                            <tr> 
                                <td colspan="7" class="text-center"><strong>Rất tiếc không tìm thấy đơn hàng nào phù hợp</strong></td>
                            </tr>
                                <?php else: ?>
                            <?php
                            
                            foreach ($transaction as $value) {
                                
                                // $timestamp = strtotime($value->date);
                                // $formatted_date = date('H:i:s d/m/Y', $timestamp);
                                ?>
                                <tr>
                                    <td style="vertical-align: middle;text-align: center;"><strong><?php echo $value->id; ?></strong></td>
                                    <td><strong><?php echo $value->user_name; ?></strong></td>
                                    <!-- <td><strong><?php echo $formatted_date; ?></strong></td> -->
                                    <td><strong><?php echo $value->date ?></strong></td>
                                    <td><strong><?php echo $value->user_phone; ?></strong></td>
                                    <td><strong><?php echo number_format($value->amount); ?></strong> VNĐ</td>
                                    <td>
                                        <?php
                                        if ($value->status==0) {
                                                echo "<span style='color:red'>Chờ xác nhận </span>";
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

                                        <a href="<?php echo admin_url('transaction/detail/' . $value->id); ?>" title="Chi tiết"><span class="glyphicon glyphicon-list-alt"></span></a>&nbsp;&nbsp;&nbsp; 
                                        

                                       
                                    </td>    
                                </tr>
                            <?php } ?>
                            <?php endif; ?>
                        </tbody>

                    </table>

                    <div style="text-align: right;">
                                <?php echo $this->pagination->create_links(); ?>
                                </div>    


                </div>
            </div>
        </div>
    </div>
</div><!--/.row-->

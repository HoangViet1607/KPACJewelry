
<div class="row" style="margin-top: 10px">
    <nav class="navbar navbar-info re-navbar" >
        <div class="container-fluid re-container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse re-navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">

                    <li><a href="<?php echo base_url(); ?>"><img src="<?php echo base_url(); ?>upload/logo2.png" alt="" class="img-responsive"></a></li>
                    <li class="active"><a href="<?php echo base_url(); ?>"><span class="glyphicon glyphicon-home" aria-hidden="true"></span> HOME<span class="sr-only">(current)</span></a></li>

                    <li><a href="<?php echo base_url('moi'); ?>">Mới</a></li>
                    <li><a href="<?php echo base_url('ban-chay'); ?>">Bán chạy</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Trang sức<span class="caret"></span></a>
                        <ul class="dropdown-menu" id="re-dropdown-menu">
                            <?php
                            foreach ($catalog as $value) {
                                $name = covert_vi_to_en($value->name);
                                $name = strtolower($name);
                                ?>
                                <li><a style="padding: 10px 20px;" href="<?php echo base_url($name . '-c' . $value->id); ?>"><?php echo $value->name; ?></a></li>
                            <?php } ?>
                        </ul>
                    </li>
                    <li><a href="<?php echo base_url('khuyen-mai'); ?>">Khuyến mại</a></li>
                    <li style="padding-top: 7px;margin-left: 10px">
                        <form method="post" action="<?php echo base_url('product/search_name'); ?>">
                            <button class="btn-search_info" type="submit"><i class="fa fa-search"></i></button>
                            <input id="seach_info" type="text" name="search" placeholder="Tìm kiếm..">
                        </form>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <?php $this->load->view('site/cart/cart_sh'); ?>

                    <?php if (!isset($user)) { ?>
                        <li><a href="<?php echo base_url('dang-nhap'); ?>">Đăng nhập</a></li>
                    <?php } else { ?>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><?php echo $user->name; ?><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="<?php echo base_url('user'); ?>">Tài khoản</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="<?php echo base_url('user/donhang/'. $user->id); ?>">Theo dõi đơn hàng</a></li>
                                <li role="separator" class="divider"></li>
                                
                                <li><a href="<?php echo base_url('user/logout'); ?>">Đăng xuất</a></li>
                            </ul>
                        </li>
                    <?php } ?>
                </ul>
            </div><!-- /.navbar-collapse -->

        </div><!-- /.container-fluid -->
    </nav>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        var y = <?php echo $year_post ?>;
        $("#year").val(y);
        var data = <?php echo json_encode($data_sale) ?>;
        var a = JSON.parse(JSON.stringify(data));

        var data2 = <?php echo json_encode($data_mounth) ?>;
        var m = JSON.parse(JSON.stringify(data2));

        var lineChartData = {
            labels: m,
            datasets: [
                {
                    label: "dataset",
                    fillColor: "rgba(48, 164, 255, 0.2)",
                    strokeColor: "rgba(48, 164, 255, 1)",
                    pointColor: "rgba(48, 164, 255, 1)",
                    pointStrokeColor: "#fff",
                    pointHighlightFill: "#fff",
                    pointHighlightStroke: "rgba(48, 164, 255, 1)",
                    data: a
                }
            ]

        }
        var chart1 = document.getElementById("line-chart").getContext("2d");
        window.myLine = new Chart(chart1).Line(lineChartData, {
            responsive: true
        });
    });
</script>
<script type="text/javascript">
    $('select').on('change', function () {
        $(this).closest('form').submit();
    });
</script>


<div class="row">
    <ol class="breadcrumb">
        <li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
        <li class="active">Quản trị</li>
    </ol>
</div><!--/.row-->






<div class="row">
    <div class="col-xs-12 col-md-6 col-lg-3">
        <div class="panel panel-blue panel-widget ">
            <div class="row no-padding">
                <div class="col-sm-3 col-lg-5 widget-left">
                    <svg class="glyph stroked bag"><use xlink:href="#stroked-bag"></use></svg>
                </div>
                <div class="col-sm-9 col-lg-7 widget-right">
                    <div class="large"><?php echo $total_order; ?></div>
                    <div class="text-muted">Đơn hàng </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-12 col-md-6 col-lg-3">
        <div class="panel panel-orange panel-widget">
            <div class="row no-padding">
                <div class="col-sm-3 col-lg-5 widget-left">
                    <svg class="glyph stroked empty-message"><use xlink:href="#stroked-empty-message"></use></svg>
                </div>
                <div class="col-sm-9 col-lg-7 widget-right">
                    <div class="large"><?php echo $total_comment; ?></div>
                    <div class="text-muted">Bình luận</div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-12 col-md-6 col-lg-3">
        <div class="panel panel-teal panel-widget">
            <div class="row no-padding">
                <div class="col-sm-3 col-lg-5 widget-left">
                    <svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg>
                </div>
                <div class="col-sm-9 col-lg-7 widget-right">
                    <div class="large"><?php echo $total_user; ?></div>
                    <div class="text-muted">Khách hàng</div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-12 col-md-6 col-lg-3">
        <div class="panel panel-red panel-widget">
            <div class="row no-padding">
                <div class="col-sm-3 col-lg-5 widget-left">
                    <svg class="glyph stroked app-window-with-content"><use xlink:href="#stroked-app-window-with-content"></use></svg>
                </div>
                <div class="col-sm-9 col-lg-7 widget-right">
                    <div class="large"><?php echo $total_mod; ?></div>
                    <div class="text-muted">Nhân Viên</div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-body easypiechart-panel">
                <h4>Đơn hàng đã giao thành công</h4>
                <div class="easypiechart" id="easypiechart-blue" data-percent="<?php echo $data_tran; ?>" ><span class="percent"><?php echo $data_tran; ?>%</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-body easypiechart-panel">
                <h4>Sản phẩm đã bán</h4>
                <div class="easypiechart" id="easypiechart-orange" data-percent="<?php echo $data_pro; ?>" ><span class="percent"><?php echo $data_pro; ?>%</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-body easypiechart-panel">
                <h4>Sản phẩm đang giảm giá</h4>
                <div class="easypiechart" id="easypiechart-teal" data-percent="<?php echo $data_dis; ?>" ><span class="percent"><?php echo $data_dis; ?>%</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xs-6 col-md-3">
        <div class="panel panel-default">
            <div class="panel-body easypiechart-panel">
                <h4>Sản phẩm được bình luận</h4>
                <div class="easypiechart" id="easypiechart-red" data-percent="<?php echo $data_comment_per; ?>" ><span class="percent"><?php echo $data_comment_per; ?>%</span>
                </div>
            </div>
        </div>
    </div>
</div>




<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">Thống kê doanh thu</div>
            <div class="panel-body">
                <div class="col-lg-12" style="margin-bottom: 30px;font-size:17px">
                <form method="post" id="dateRangeForm" action='<?php echo admin_url('home/index'); ?>'>
                        
                        <label>Thống kê theo năm: </label>
                        <select onchange="handleYearChange()" class="form-control" name="year" id="year" style="display: inline-block; max-width: 200px; padding: 5px; font-size:16px">
                            <option value='0'>--Chọn năm--</option>
                            <?php foreach ($year as $y) { ?>
                                <option value ='<?php echo $y->Nam; ?>'><?php echo $y->Nam; ?></option>
                            <?php } ?>
                        </select>
                    

                        <label style="margin-left: 150px;">Thống kê theo khoảng thời gian: </label>
                        <input type="date" name="start_date" class="form-control" style="display: inline-block; max-width: 200px; padding: 5px;font-size:16px""
                        value="<?php echo isset($selected_start_date) ? htmlspecialchars($selected_start_date) : ''; ?>" required>
                        <span style="margin-left: 10px; margin-right: 10px;">đến</span>
                        <input type="date" name="end_date" class="form-control" style="display: inline-block; max-width: 200px; padding: 5px;font-size:16px""
                        value="<?php echo isset($selected_end_date) ? htmlspecialchars($selected_end_date) : ''; ?>" required>
                        <!-- <button type="submit" class="btn btn-primary" style="margin-left: 20px;">Xem thống kê</button> -->
                    <br>
                    <label style="padding-top:20px">Tổng doanh thu: </label>
                    <span> <?php echo number_format($sale); ?> VNĐ</span>
                </form>

                </div>
                <div class="canvas-wrapper">
                    <canvas class="main-chart" id="line-chart" height="200" width="600"></canvas>
                </div>
            </div>
        </div>
    </div>
</div><!--/.row-->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const today = new Date().toISOString().split('T')[0];

        // Set max value for end_date and start_date
        const startDateInput = document.querySelector('input[name="start_date"]');
        const endDateInput = document.querySelector('input[name="end_date"]');

        endDateInput.setAttribute('max', today);
        startDateInput.setAttribute('max', today);

        // Optionally, initialize the year selector if necessary
        // document.getElementById('year').selectedIndex = 0;
    });

    function handleYearChange() {
        // Reset date fields when year is selected
        document.querySelector('input[name="start_date"]').value = '';
        document.querySelector('input[name="end_date"]').value = '';

        // Submit the form
        document.getElementById('dateRangeForm').submit();
    }

    document.querySelector('input[name="start_date"]').addEventListener('change', function() {
        document.getElementById('year').selectedIndex = 0; // Reset year to default
    });
    
    document.querySelector('input[name="end_date"]').addEventListener('change', function() {
        document.getElementById('year').selectedIndex = 0;
        if (document.querySelector('input[name="start_date"]').value !== '') {
            document.getElementById('dateRangeForm').submit();
        }
    });
</script>





<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Order extends MY_Controller {

    public function __construct() {
        parent::__construct();

        $this->load->model('size_model');
        $this->load->model('province_model');
        $this->load->model('district_model');
        $this->load->model('product_model');
        $this->load->model('sizedetail_model');
        $this->load->model('ward_model');
        $this->load->model('shipping_model');
        $this->load->library('form_validation');
        $this->load->helper('form');
    }

    public function index() {
        if (!$this->session->userdata('user')) {
            $this->session->set_flashdata('message', 'Bạn phải đăng nhập để đặt mua sản phẩm');
            redirect(base_url('dang-nhap')); // Redirect to login page
            return;
        }
    
        $this->form_validation->set_error_delimiters('<div class="alert alert-danger" role="alert" style="padding:5px;border-bottom:0px;">', '</div>');
    
        $carts = $this->cart->contents();
        $total_amount = 0;
        foreach ($carts as $value) {
            $total_amount += $value['subtotal'];
        }
        $this->data['total_amount'] = $total_amount;
        $user_id = $this->session->userdata('user')->id;
    
        $input = array();
        $input['shipping'] = array('id', 'ASC');
        $shipping = $this->shipping_model->get_list($input);
        $this->data['shipping'] = $shipping;
    
        if ($this->input->post()) {
            $this->form_validation->set_rules('name', 'Họ tên', 'required');
            $this->form_validation->set_rules('phone', 'Điện thoại', 'required');
            $this->form_validation->set_rules('payment', 'Hình thức thanh toán', 'required');
            $this->form_validation->set_rules('ship_money', 'Dịch vụ vận chuyển', 'required');
    
            $use_different_address = $this->input->post('use_different_address');
    
            if ($use_different_address) {
                $this->form_validation->set_rules('province', 'Tỉnh,thành phố', 'required');
                $this->form_validation->set_rules('district', 'Quận,Huyện', 'required');
                $this->form_validation->set_rules('ward', 'Xã,Phường', 'required');
                $this->form_validation->set_rules('adress', 'Địa chỉ cụ thể', 'required');
            }
    
            if ($this->form_validation->run()) {
                $this->db->trans_begin(); // Bắt đầu transaction chính
    
                try {
                    $ship = $this->input->post('ship_money');
                    $mess2 = 'Phí Ship:' . ' ' . strval(number_format($ship)) . 'VNĐ';
    
                    $adress_str = $use_different_address
                        ? $this->input->post('area') . ' - ' . $this->input->post('adress')
                        : $this->input->post('address');
    
                    $data = array(
                        'user_id' => $user_id,
                        'user_name' => $this->input->post('name'),
                        'user_address' => $adress_str,
                        'user_phone' => $this->input->post('phone'),
                        'message' => $this->input->post('message') . " " . $mess2,
                        'payment' => $this->input->post('payment'),
                        'amount' => $total_amount + $ship,
                        'created' => now()
                    );
                    $this->load->model('transaction_model');
                    $this->transaction_model->create($data);
                    $transaction_id = $this->db->insert_id();
    
                    $this->load->model('order_model');
                    foreach ($carts as $items) {
                        $this->db->trans_start(); // Bắt đầu transaction con
    
                        // Lock the row for update
                        $this->db->query('START TRANSACTION');
    
                        // Lock the row
                        $this->db->query('SELECT quantity FROM sizedetail WHERE product_id = ? AND size_id = ? FOR UPDATE', array($items['id'], '0' . intval($items['size'])));
                        $size_detail = $this->db->query('SELECT * FROM sizedetail WHERE product_id = ? AND size_id = ?', array($items['id'], '0' . intval($items['size'])))->row();
    
                        if ($size_detail) {
                            $current_quantity = $size_detail->quantity;
                            if ($current_quantity >= $items['qty']) {
                                // Update size_detail
                                $new_quantity = $current_quantity - $items['qty'];
                                $data2 = array(
                                    'quantity' => $new_quantity,
                                );
                                if ($new_quantity > 0) {
                                    $this->sizedetail_model->update($size_detail->id, $data2);
                                } else {
                                    $this->sizedetail_model->delete($size_detail->id);
                                }
    
                                // Create order
                                $data = array(
                                    'transaction_id' => $transaction_id,
                                    'product_id' => $items['id'],
                                    'qty' => $items['qty'],
                                    'amount' => $items['subtotal'],
                                    'size_id' => '0' . intval($items['size'])
                                );
                                $this->order_model->create($data);
    
                                // Update product buyed
                                $product = $this->product_model->get_info($items['id']);
                                $data4 = array(
                                    'buyed' => $product->buyed + intval($items['qty']),
                                );
                                $this->product_model->update($product->id, $data4);
    
                                // Commit transaction
                                $this->db->query('COMMIT');
                            } else {
                                // Rollback transaction nếu số lượng không đủ
                                $this->db->query('ROLLBACK');
                                $this->session->set_flashdata('message', 'Sản phẩm ' . $items['name'] . ' không còn đủ số lượng để đặt hàng.');
                                redirect(base_url('cart'));
                                return;
                            }
                        } else {
                            // Rollback transaction nếu không tìm thấy size_detail
                            $this->db->query('ROLLBACK');
                            $this->session->set_flashdata('message', 'Sản phẩm ' . $items['name'] . ' không còn trong kho.');
                            redirect(base_url('cart'));
                            return;
                        }
                    }
    
                    $this->cart->destroy();
                    $this->session->set_flashdata('message', "Đặt hàng thành công, chúng tôi sẽ liên hệ với bạn để giao hàng");
                    $this->db->trans_commit(); // Commit transaction chính
                    redirect(base_url('cart'));
                } catch (Exception $e) {
                    $this->db->trans_rollback(); // Rollback transaction nếu có lỗi
                    $this->session->set_flashdata('message', "Đã xảy ra lỗi trong quá trình đặt hàng. Vui lòng thử lại.");
                    redirect(base_url('cart'));
                }
            }
        }
    
        $this->data['temp'] = 'site/order/index';
        $this->data['show_sidebar'] = true;
        $this->load->view('site/layoutsub', $this->data);
    }
    

}

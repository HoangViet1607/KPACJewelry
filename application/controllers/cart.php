<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Cart extends MY_Controller {

    public function __construct() {
        parent::__construct();

        if (!$this->session->userdata('user')) {
            redirect('dang-nhap'); 
        }

        $this->load->library('cart');
        $this->load->model('product_model');
        $this->load->model('catalog_model');
        $this->load->model('size_model');
        $this->load->model('sizedetail_model');
        $this->load->library('form_validation');
        $this->load->helper('form');
    }

    public function index() {

        if (!$this->session->userdata('user')) {
            redirect('dang-nhap'); 
        }

        $message = $this->session->flashdata('message');
        $this->data['message'] = $message;

        $carts = $this->cart->contents();
        $this->data['carts'] = $carts;

        $total_items = $this->cart->total_items();
        $this->data['total_items'] = $total_items;
        $this->data['show_sidebar'] = false;
        $this->data['temp'] = 'site/cart/index';
        $this->load->view('site/layoutsub', $this->data);
    }

    public function add() {

        if (!$this->session->userdata('user')) {
            redirect('dang-nhap'); // Đưa người dùng đến trang đăng nhập nếu chưa đăng nhập
        }

        $id = $this->uri->rsegment(3);
        $id = intval($id);
        $product = $this->product_model->get_info($id);
        $carts = $this->cart->contents();
        if (empty($carts)) {
            $data = array();
            $qty = 1;

            $input = array();
            $input['where'] = array('product_id' => $id);
            $input['order'] = array('size_id', 'ASC');
            $input['limit'] = array('1', '0');
            $size_min = $this->sizedetail_model->get_list($input);
            $size_id = $size_min[0]->size_id;



            $price = $product->price;

            if ($product->discount > 0) {
                $price = $product->price - $product->discount;
            }

            $data['cartid'] = 1;
            $data['id'] = $id;
            $data['qty'] = $qty;
            $data['price'] = $price;
            $data['name'] = $product->name;
            $data['image_link'] = $product->image_link;
            $data['size'] = $size_id;
            $this->cart->insert($data);
            redirect(base_url('cart'));
        } else {
            foreach ($carts as $key => $value) {
                if ($value['id'] == $id && $value['qty'] >0) {
                    $this->session->set_flashdata('message', 'Sản phẩm đã tồn tại');
                    redirect(base_url('cart'));
                } else {
                    $data = array();
                    $qty = 1;
                    $size_id = 1;
                    $price = $product->price;

                    if ($product->discount > 0) {
                        $price = $product->price - $product->discount;
                    }

                    $data['cartid'] = $this->cart->total_items() + 1;
                    $data['id'] = $id;
                    $data['qty'] = $qty;
                    $data['price'] = $price;
                    $data['name'] = $product->name;
                    $data['image_link'] = $product->image_link;
                    $data['size'] = $size_id;
                    $this->cart->insert($data);
                    redirect(base_url('cart'));
                }
            }
        }
    }

    public function update() {
        $carts = $this->cart->contents();
        $id = (int) $this->uri->segment(3);
        $action = $this->uri->segment(4);
    
        $message = '';
        $should_redirect = false; // Biến kiểm tra xem có cần redirect không
    
        foreach ($carts as $key => $value) {
            if ($value['cartid'] == $id) {
                $input = array('product_id' => $value['id'], 'size_id' => $value['size']);
                $size_row = $this->sizedetail_model->get_info_rule($input, 'quantity');
                $count = $size_row->quantity;
    
                switch ($action) {
                    case 'set':
                        $new_qty = (int) $this->input->post('qty');
                        if ($new_qty > $count) {
                            $new_qty = $count;
                            $message = 'Số lượng đã đạt tối đa';
                        }
                        $this->cart->update(array('rowid' => $key, 'qty' => $new_qty));
                        break;
    
                    case 'sum':
                        if ($value['qty'] + 1 > $count) {
                            $message = 'Số lượng đã đạt tối đa';
                        } else {
                            $this->cart->update(array('rowid' => $key, 'qty' => $value['qty'] + 1));
                        }
                        $should_redirect = true; // Đánh dấu cần redirect
                        break;
    
                    case 'sub':
                        if ($value['qty'] > 1) {
                            $this->cart->update(array('rowid' => $key, 'qty' => $value['qty'] - 1));
                        }
                        $should_redirect = true; // Đánh dấu cần redirect
                        break;
    
                    default:
                        $message = 'Hành động không hợp lệ';
                        break;
                }
                break; // Exit loop once the matching item is found and updated
            }
        }
    
        if ($message) {
            $this->session->set_flashdata('message', $message);
        }
    
        if ($should_redirect) {
            redirect(base_url('cart'));
        }
    }

    public function del() {
        $carts = $this->cart->contents();
        $id = $this->uri->segment(3);
        $id = intval($id);
        if ($id > 0) {
            foreach ($carts as $key => $value) {
                if ($value['cartid'] == $id) {
                    $data = array();
                    $data['rowid'] = $key;
                    $data['qty'] = 0;
                    $this->cart->update($data);
                    $this->session->set_flashdata('message', 'Xóa sản phẩm thành công');
                    redirect(base_url('cart'));
                }
            }
        } else {
            $this->cart->destroy();
            $this->session->set_flashdata('message', 'Xóa sản phẩm thành công');
            redirect(base_url('cart'));
        }
    }


    public function sumsize() {
        $carts = $this->cart->contents();
        $cardid = $this->uri->segment(3);
        $id = $this->uri->segment(4);
        $product = $this->product_model->get_info($id);
    
        $current_size = null;
        foreach ($carts as $key => $value) {
            if ($value['id'] == $id && $value['cartid'] == $cardid) {
                $current_size = $value['size'];
                break;
            }
        }
    
        $get_size = 'SELECT size_id FROM sizedetail WHERE product_id = ' . $id . ' AND size_id > ' . $current_size . ' ORDER BY size_id ASC LIMIT 1';
        $result = $this->sizedetail_model->query2($get_size);
        
        if (!empty($result)) {
            $size_sum = $result->size_id;
            if ($size_sum) {
                foreach ($carts as $key => $value) {
                    if ($value['cartid'] == $cardid) {
                        $input = array('product_id' => $value['id'], 'size_id' => $size_sum);
                        $size_row = $this->sizedetail_model->get_info_rule($input, 'quantity');
                        $count = $size_row->quantity;
                        if ($value['qty'] > $count) {
                            $data = array('rowid' => $key, 'qty' => $count, 'size' => $size_sum);
                        } else {
                            $data = array('rowid' => $key, 'size' => $size_sum);
                        }
                        $this->cart->update($data);
                    }
                }
                redirect(base_url('cart'));
            }
        } else {
            $this->session->set_flashdata('message', 'Đã hết loại size');
            redirect(base_url('cart'));
        }
    }
    
    public function subsize() {
        $carts = $this->cart->contents();
        $cardid = $this->uri->segment(3);
        $id = $this->uri->segment(4);
        $product = $this->product_model->get_info($id);
    
        $current_size = null;
        foreach ($carts as $key => $value) {
            if ($value['id'] == $id && $value['cartid'] == $cardid) {
                $current_size = $value['size'];
                break;
            }
        }
    
        $get_size = 'SELECT size_id FROM sizedetail WHERE product_id = ' . $id . ' AND size_id < ' . $current_size . ' ORDER BY size_id DESC LIMIT 1';
        $result = $this->sizedetail_model->query2($get_size);
    
        if (!empty($result)) {
            $size_sub = $result->size_id;
            if ($size_sub) {
                foreach ($carts as $key => $value) {
                    if ($value['cartid'] == $cardid) {
                        $input = array('product_id' => $value['id'], 'size_id' => $size_sub);
                        $size_row = $this->sizedetail_model->get_info_rule($input, 'quantity');
                        $count = $size_row->quantity;
                        if ($value['qty'] > $count) {
                            $data = array('rowid' => $key, 'qty' => $count, 'size' => $size_sub);
                        } else {
                            $data = array('rowid' => $key, 'size' => $size_sub);
                        }
                        $this->cart->update($data);
                    }
                }
                redirect(base_url('cart'));
            }
        } else {
            $this->session->set_flashdata('message', 'Đã hết loại size');
            redirect(base_url('cart'));
        }
    }
}

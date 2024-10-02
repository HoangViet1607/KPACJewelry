<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Transaction extends MY_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('transaction_model');
        $this->load->model('order_model');
        $this->load->model('product_model');
        $this->load->model('sizedetail_model');
        $this->load->model('size_model');
    }

    public function index() {
        // Retrieve flash messages
        $message_success = $this->session->flashdata('message_success');
        $this->data['message_success'] = $message_success;
    
        $message_fail = $this->session->flashdata('message_fail');
        $this->data['message_fail'] = $message_fail;
    
        // Get the status from query parameters
        $status = $this->input->get('status');
        $this->data['status'] = $status;  // Pass the status to the view for filtering
    
        // Get the total number of transactions for the given status
        $total = $this->transaction_model->get_total($status);
        $this->data['total'] = $total;
    
        // Initialize pagination
        $this->load->library('pagination');
        $config = array();
    
        // Base URL with status filter included
        $base_url = admin_url('transaction/index');
        if ($status !== null) {
            $base_url .= '?status=' . urlencode($status);
        }
    
        // Pagination configuration
        $per_page = 10; // Number of items per page
        $config['base_url'] = $base_url;
        $config['total_rows'] = $total; // Total records count
        $config['per_page'] = $per_page;
        $config['uri_segment'] = 4; // Segment for pagination
        $config['page_query_string'] = TRUE;
        $config['query_string_segment'] = 'per_page';
    
        // Pagination styling (CSS)
        $config['full_tag_open'] = '<ul class="pagination">';
        $config['full_tag_close'] = '</ul>';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="active"><span>';
        $config['cur_tag_close'] = '</span></li>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
    
        // Initialize pagination with config
        $this->pagination->initialize($config);
    
        // Get the current page from query string
        $page = $this->input->get('per_page');
        $page = $page ? intval($page) : 0;
    
        // Define query parameters
        $input['limit'] = array($config['per_page'], $page);
        $input['order'] = array('created', 'DESC');
    
        // Apply filter if status is set
        if ($status !== null) {
            $input['where'] = array('status' => $status);
        }
    
        // Fetch the transaction data
        $transaction = $this->transaction_model->get_list($input);
        $this->data['transaction'] = $transaction;
    
        // Set the view to be used
        $this->data['temp'] = 'admin/transaction/index';
        $this->load->view('admin/main', $this->data);
    }


    public function detail() {
        $id = $this->uri->segment(4);
        $transaction = $this->transaction_model->get_info($id);
        $this->data['transaction'] = $transaction;

        $input = array();
        $input['where'] = array('transaction_id' => $transaction->id);
        $info = $this->order_model->get_list($input);

        $list_product = array();
        foreach ($info as $key => $value) {
            $this->db->select('`order`.`id` as `order_id`,`product`.`id` as `id`, `product`.`name` as `name`, `image_link`, `order`.`qty` as `qty`, `order`.`amount` as `price`, `sizes`.`name` as `size_name` ');
            $this->db->join('product', 'order.product_id = product.id');
            $this->db->join('sizes', 'order.size_id = sizes.id');
            $where = array();
            $where = array('order.id' => $value->id);
            $list_product[] = $this->order_model->get_info_rule($where);
        }
        $this->data['list_product'] = $list_product;
        $this->data['temp'] = 'admin/transaction/detail';
        $this->load->view('admin/main', $this->data);
    }


    public function update_status($status, $id) {
        // Validate the status value
        $valid_statuses = array(1, 2, 3, 4, 5);
        if (!in_array($status, $valid_statuses)) {
            show_error('Invalid status value');
            return;
        }
    
        $data = array('status' => $status);
        $this->transaction_model->update($id, $data);
    
        // Set flash message based on status
        $messages = array(
            1 => 'Xác nhận đơn đặt hàng thành công',
            2 => 'Xác nhận đang giao hàng',
            3 => 'Xác nhận giao hàng thành công',
            4 => 'Đã Hủy',
            5 => 'Trả hàng'
        );
        $this->session->set_flashdata('message_success', $messages[$status]);
    
        redirect(admin_url('transaction'));
    }
    
    public function accept() {
        $id = $this->uri->segment(4);
        $data = array('status' => $status);
        $data['status'] = '4';
        $this->transaction_model->update($id, $data);
        $this->session->set_flashdata('message_success', 'Đã Hủy');
        redirect(base_url(''));
    }
    
    public function search() {
        if ($this->input->post('search') != null) {
            $input = array();
            $str = $this->input->post('search');
            $this->db->select('transaction.id as id,status,amount,user.name as user_name,date,user.phone as user_phone');
            $this->db->join('user', 'user.id = transaction.user_id');
            $this->db->where('user_name LIKE "%' . $str . '%" or transaction.id like "%' .$str . '%"  ');
            $transaction = $this->transaction_model->get_list($input);
            $this->data['transaction'] = $transaction;
            if (sizeof($transaction) == 0) {
                $this->session->set_flashdata('message_fail', 'Không tìm thấy');
                redirect(admin_url('transaction'));
            }
            $total = sizeof($transaction);
            $this->data['total'] = $total;
            $this->load->library('pagination');
            $config = array();
            $base_url = admin_url('transaction/search');
            $per = 10;
            $uri = 4;
            $config = pagination($base_url, $total, $per, $uri);
            $this->pagination->initialize($config);

            $segment = isset($this->uri->segments['4']) ? $this->uri->segments['4'] : NULL;
            $segment = intval($segment);

            $input['limit'] = array($config['per_page'], $segment);

            $this->data['temp'] = 'admin/transaction/search';
            $this->load->view('admin/main', $this->data);
        } else {
            redirect(admin_url('transaction'));
        }
    }

    
}

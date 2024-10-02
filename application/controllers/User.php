<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends MY_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('user_model');
		$this->load->library('form_validation');
		$this->load->helper('form');
        $this->load->model('size_model');
		$this->load->model('transaction_model');
		$this->load->model('order_model');
		$this->load->model('product_model');
	}

	public function index()
	{
		$this->data['temp']='site/user/index.php';
		$this->data['show_sidebar'] = false;
		$this->load->view('site/layoutsub',$this->data);
	}
	public function register()
	{
		$message_success = $this->session->flashdata('message_success');
		$this->data['message_success'] = $message_success;

		$message_fail = $this->session->flashdata('message_fail');
		$this->data['message_fail'] = $message_fail;

		$this->form_validation->set_error_delimiters('<div class="alert alert-danger" role="alert" style="padding:5px;border-bottom:0px;">', '</div>');
		if ($this->input->post()) {
			$this->form_validation->set_rules('name','Họ tên','required');
			// $this->form_validation->set_rules('email', 'Email đăng nhập', 'required|valid_email|regex_match[/^[^\s@]+@[^\s@]+\.[^\s@]+$/]');
			$this->form_validation->set_rules('email', 'Email', 'required|valid_email|regex_match[/^[^\s@]+@gmail\.com$/]|callback_check_email');
			$this->form_validation->set_rules('password','Mật khẩu','required');
			$this->form_validation->set_rules('re_password','Mật khẩu nhập lại','matches[password]');
			$this->form_validation->set_rules('phone','Số điện thoại','required|regex_match[/^0\d{9}$/]');
			// $this->form_validation->set_rules('address','Địa chỉ cụ thể','required');
			$this->form_validation->set_rules('province', 'Tỉnh,thành phố', 'required');
            $this->form_validation->set_rules('district', 'Quận,Huyện', 'required');
            $this->form_validation->set_rules('ward', 'Xã,Phường', 'required');
		
			if ($this->form_validation->run()) {
				$adress_str = $this->input->post('area') . ' - ' . $this->input->post('adress');
				$password = $this->input->post('password');
				$data = array();
				$data = array(
					'name' => $this->input->post('name'),
					'email' => $this->input->post('email'),
					'password' => md5($password),
					'phone' => $this->input->post('phone'),
					'address' => $adress_str,
					'created' => date('Y-m-d H:i:s')
					);
				if ($this->user_model->create($data)) {
					$this->session->set_flashdata('message_success', 'Đăng ký thành công');
				}else{
					$this->session->set_flashdata('message_fail', 'Đăng ký thất bại');
				}
				redirect(base_url('user/register'));
			}
		}
		$this->load->view('site/user/register',$this->data);
	}
	function check_email()
	{
		$email = $this->input->post('email');
		$where = array('email'=> $email);
		if ($this->user_model->check_exists($where))
		{
			$this->form_validation->set_message(__FUNCTION__,'Tên đăng nhập đã tồn tại');
			return FALSE;
		}
		return TRUE;
	}
	public function login()
	{
		$this->form_validation->set_error_delimiters('<p class="text-center" style="padding:5px;border-bottom:0px;">', '</p>');
		$user = $this->session->userdata('user');
		if(isset($user)) {
			redirect(base_url());
		}
		$message_success = $this->session->flashdata('message_success');
		$this->data['message_success'] = $message_success;

		$message_fail = $this->session->flashdata('message_fail');
		$this->data['message_fail'] = $message_fail;
		if ($this->input->post()) {
			$this->form_validation->set_rules('email', 'Email đăng nhập', 'required|valid_email');
			$this->form_validation->set_rules('password', 'Mật khẩu', 'required');
			$this->form_validation->set_rules('login', 'login', 'callback_check_login');
			if ($this->form_validation->run())
			{
				$user = $this->get_info_user();
				$this->session->set_userdata('user', $user);
				redirect(base_url('user/login'));
			}
		}
		$this->load->view('site/user/login',$this->data);
	}
	public function donhang() {

		$id = $this->uri->segment(3);

		$status = $this->input->get('status');

        $input['where'] = array('user_id' => $id);

		if ($status !== null) {
			$input['where']['status'] = $status;
		}

        $order = $this->transaction_model->get_list($input);
        $this->data['order'] = $order;

        $user = $this->user_model->get_info($id);
        $this->data['user'] = $user;
        
		$this->data['temp']='site/user/donhang';
		$this->data['show_sidebar'] = false;
		$this->load->view('site/layoutsub',$this->data);
		
    }
	public function detail() {
        $id = $this->uri->segment(3);
        $transaction = $this->transaction_model->get_info($id);
        $this->data['transaction'] = $transaction;

        $input = array();
        $input['where'] = array('transaction_id' => $transaction->id);
        $info = $this->order_model->get_list($input);

        $list_product = array();
        foreach ($info as $key => $value) {
            $this->db->select('order.id as order_id,product.id as id,product.name as name,image_link, order.qty as qty, order.amount as price,`sizes`.`name` as `size_name` ');
            $this->db->join('order', 'order.product_id = product.id');
            $this->db->join('sizes', 'order.size_id = sizes.id');
            $where = array();
            $where = array('product.id' => $value->product_id);
            $list_product[] = $this->product_model->get_info_rule($where);
        }
        $this->data['list_product'] = $list_product;
        $this->data['temp']='site/user/detail';
		$this->data['show_sidebar'] = false;
		$this->load->view('site/layoutsub',$this->data);
    }
	public function check_login()
	{
		$user = $this->get_info_user();
		if($user) {
			return true;
		}
		$this->form_validation->set_message(__FUNCTION__,'Sai email hoặc mật khẩu');
		return false;
	}
	public function get_info_user()
	{
		$user = array();
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		$where = array ('email' => $email, 'password' => md5($password));
		$user = $this->user_model->get_info_rule($where);
		return $user;
	}
	public function logout()
	{
		if ($this->session->userdata('user')) {
			$this->session->unset_userdata('user');
		}
		redirect(base_url());
	}
	public function edit()
	{
		$id = $this->uri->segment(3);
 		$user = $this->user_model->get_info($id);
		if ($this->input->post()) {
			$this->form_validation->set_rules('name','Họ tên','required');
			$this->form_validation->set_rules('email','Tên đăng nhập','valid_email|required');
			$this->form_validation->set_rules('phone','Số điện thoại','required|regex_match[/^0\d{9}$/]');
			// $this->form_validation->set_rules('province', 'Tỉnh,thành phố', 'required');
            // $this->form_validation->set_rules('district', 'Quận,Huyện', 'required');
            // $this->form_validation->set_rules('ward', 'Xã,Phường', 'required');
			
			$password = $this->input->post('password');
			if ($password!='') {
				$this->form_validation->set_rules('password','Mật khẩu','required');
				// Kiểm tra re_password chỉ khi nó không rỗng
				if ($this->input->post('re_password') != '') {
					$this->form_validation->set_rules('re_password','Mật khẩu nhập lại','required|matches[password]');
				}
			}		
			if ($this->form_validation->run()) {	

				$use_different_address = $this->input->post('use_different_address');

                if ($use_different_address) {
                    // Concatenate new address fields if "use different address" is selected
                    $adress_str = $this->input->post('area') . ' - ' . $this->input->post('adress');
                    $user_address = $adress_str;
                } else {
                    // Use the original address field
                    $user_address = $this->input->post('address');
                }

				$data = array();
				$data = array(
					'name' => $this->input->post('name'),
					'email' => $this->input->post('email'),
					'phone' => $this->input->post('phone'),
					'address' => $user_address,
					);
					if ($password!='') {
						$data['password'] = md5($password);
					}
				if ($this->user_model->update($id,$data)) {
					
					$user = $this->user_model->get_info($id);

    				$this->session->set_userdata('user', $user);
					
					$this->session->set_flashdata('message_success', 'Thay đổi thông tin thành công');
				}else{
					$this->session->set_flashdata('message_fail', 'Thay đổi thông tin thất bại');
				}
				redirect(base_url('user'));
			}
		}
		$this->data['user'] = $user;
		$this->data['temp']='site/user/edit';
		$this->data['show_sidebar'] = false;
		$this->load->view('site/layoutsub',$this->data);
	}
}

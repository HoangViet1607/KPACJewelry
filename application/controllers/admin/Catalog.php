<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Catalog extends MY_Controller {

	function __construct()
	{
		parent::__construct();
		$this->load->model('catalog_model');
		$this->load->library('form_validation');
		$this->load->helper('form');
	}
	public function index()
	{
		$message_success = $this->session->flashdata('message_success');
		$this->data['message_success'] = $message_success;

		$message_fail = $this->session->flashdata('message_fail');
		$this->data['message_fail'] = $message_fail;

		$input = array();
		$input['order'] = array('parent_id' , 'ASC');
		$list = $this->catalog_model->get_list($input);
		$this->data['list']= $list;

		$this->data['temp']='admin/catalog/index.php';
		$this->load->view('admin/main',$this->data);
	}
	public function add()
	{
		$input = array();
		$input['where'] = array('parent_id <' => '2');
		$list = $this->catalog_model->get_list($input);
		$this->data['list']= $list;

		$this->form_validation->set_error_delimiters('<div class="alert alert-danger" role="alert" style="padding:5px;border-bottom:0px;">', '</div>');

		if ($this->input->post()) {
			$this->form_validation->set_rules('name','Tên danh mục','required');
			if ($this->form_validation->run()) {
				$data = array();
				$data = array(
					'name' => $this->input->post('name'),
					'description' => $this->input->post('description'),
					'parent_id' => $this->input->post('parent_id'),
					'sort_order' => $this->input->post('sort_order'),
					'created' => now()
					);
				if ($this->catalog_model->create($data)) {
					$this->session->set_flashdata('message_success', 'Thêm danh mục thành công');
				}else{
					$this->session->set_flashdata('message_fail', 'Thêm danh mục thất bại');
				}
				redirect(admin_url('catalog'));
			}
		}

		$this->data['temp']='admin/catalog/add';
		$this->load->view('admin/main',$this->data);
	}
	public function edit()
	{
		$id = $this->uri->segment(4);
		$catalog = $this->catalog_model->get_info($id);
		if (empty($catalog)) {
			$this->session->set_flashdata('message_fail', 'Danh mục không tồn tại');
			redirect(admin_url('catalog'));
		}
		$this->data['catalog'] = $catalog;
		if ($this->input->post()) {
			$this->form_validation->set_rules('name','Tên danh mục','required');
			if ($this->form_validation->run()) {
				$data = array();
				$data = array(
					'name' => $this->input->post('name'),
					'description' => $this->input->post('description'),
					'parent_id' => $this->input->post('parent_id'),
					'sort_order' => $this->input->post('sort_order')
					);
				if ($this->catalog_model->update($id,$data)) {
					$this->session->set_flashdata('message_success', 'Thay đổi danh mục thành công');
				}else{
					$this->session->set_flashdata('message_fail', 'Thay đổi danh mục thất bại');
				}
				redirect(admin_url('catalog'));
			}
		}

		$input = array();
		$input['where'] = array('parent_id <' => '2');
		$list = $this->catalog_model->get_list($input);
		$this->data['list']= $list;

		
		$this->data['temp']='admin/catalog/edit';
		$this->load->view('admin/main',$this->data);
	}
	public function del()
	{
		$id = $this->uri->segment(4);
	
		// Kiểm tra xem danh mục có tồn tại không
		$this->db->from('catalog'); // Thay 'catalog' bằng tên bảng danh mục của bạn
		$this->db->where('id', $id);
		$exists = $this->db->count_all_results() > 0;
	
		if (!$exists) {
			$this->session->set_flashdata('message_fail', 'Danh mục không tồn tại');
			redirect(admin_url('catalog'));
		}
	
		// Kiểm tra xem danh mục có sản phẩm không
		$this->db->from('product'); // Thay 'products' bằng tên bảng chứa sản phẩm của bạn
		$this->db->where('catalog_id', $id); // Thay 'category_id' bằng tên cột liên kết danh mục
		$has_products = $this->db->count_all_results() > 0;
	
		if ($has_products) {
			$this->session->set_flashdata('message_fail', 'Danh mục này có sản phẩm, không thể xóa');
			redirect(admin_url('catalog'));
		}
	
		// Thực hiện xóa danh mục
		$this->db->where('id', $id);
		if ($this->db->delete('catalog')) { // Thay 'catalog' bằng tên bảng danh mục của bạn
			$this->session->set_flashdata('message_success', 'Xóa danh mục thành công');
		} else {
			$this->session->set_flashdata('message_fail', 'Xóa danh mục thất bại');
		}
	
		redirect(admin_url('catalog'));
	}
}

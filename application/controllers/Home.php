<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('home_model', 'home');
	}

	public function index()
	{
		$data['title'] 	= 'Home';
		$data['cakes']		= $this->home->getAllCake();
		$data['page']		= 'pages/home/index';
		$this->load->view('layouts/app', $data);
	}

	public function detail($id)
	{
		$data['title'] = 'Detail Cake';
		$data['cake']	= $this->home->getCakeById($id);
		$data['page']	= 'pages/home/detail';
		$this->load->view('layouts/app', $data);
	}
}

/* End of file Home.php */

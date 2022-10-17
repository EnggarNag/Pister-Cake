<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home_model extends CI_Model
{

	public function getAllCake()
	{
		return $this->db->get('products')->result_array();
	}

	public function getCakeById($id)
	{
		return $this->db->get_where('products', ['id' => $id])->row_array();
	}
}

/* End of file Home_model.php */

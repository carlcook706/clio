<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Inbox extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model('crud_model');
		if($this->session->userdata('logged_in') !== TRUE) {
			redirect('Login');
		}
	}

	function index() {
	
			$data['result'] = $this->crud_model->getInboxData();
			$this->load->view('inbox_view', $data);
		
	}

	function takeAction($rciID) {
			$this->crud_model->updateInboxData($rciID);
			redirect("Inbox");
		}
	}


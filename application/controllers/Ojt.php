<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ojt extends CI_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->model('crud_model');
		if($this->session->userdata('logged_in') !== TRUE) {
			redirect('Login');
			
		}
	}

	function index() {
		
			$data['addressbook'] = $this->crud_model->getOjt();
			$data['section'] = $this->crud_model->getSection();
			$data['batch'] = $this->crud_model->getBatch();
			$data['row'] = $this->crud_model->getAll();
			$this->load->view('companyInfo_view', $data);
		
	}

	function weeklyReport() {
		
		$data['addressbook'] = $this->crud_model->getOjt();
		$data['section'] = $this->crud_model->getSection();
		$data['batch'] = $this->crud_model->getBatch();
		$data['row'] = $this->crud_model->getAll();
		$this->load->view('ojt_view', $data);
	
}

	function studentTime() {

			$data['addressbook'] = $this->crud_model->getOjt();
			$data['row'] = $this->crud_model->getAll();
			$data['section'] = $this->crud_model->getSection();
			$data['batch'] = $this->crud_model->getBatch();
			$this->load->view('studentTime', $data);
		
	}
	function studentEval() {
	
			$data['addressbook'] = $this->crud_model->getOjt();
			$data['section'] = $this->crud_model->getSection();
			$data['batch'] = $this->crud_model->getBatch();
			$data['row'] = $this->crud_model->getAll();
			$this->load->view('studentEval', $data);
		
	}

	function sectionPick($batchID,$sectionID) {
		$data['addressbook'] = $this->crud_model->getOjtS($batchID,$sectionID);
		$data['section'] = $this->crud_model->getSection();
		$data['batch'] = $this->crud_model->getBatch();
		$data['row'] = $this->crud_model->getAllS($batchID,$sectionID);
		$this->load->view('companyInfo_view', $data);
	}
	function batchPick($batchID,$sectionID) {
		$data['addressbook'] = $this->crud_model->getOjtB($batchID,$sectionID);
		$data['section'] = $this->crud_model->getSection();
		$data['batch'] = $this->crud_model->getBatch();
		$data['row'] = $this->crud_model->getAllB($batchID,$sectionID);
		$this->load->view('companyInfo_view', $data);
	}
	
}
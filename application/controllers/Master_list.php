<?php
 
class Master_list extends CI_Controller {
 
    function __construct() {
        parent::__construct();
        $this->load->model('crud_model');
        $this->load->library('csvimport');
    }
 
    function index() {
        $data['addressbook'] = $this->crud_model->get_addressbook();
        $data['section'] = $this->crud_model->getSection();
        $data['batch'] = $this->crud_model->getBatch();
        $data['row'] = $this->crud_model->getAll();
        $this->load->view('master_list_view', $data);
    }
 
    function importcsv() {

        $data['addressbook'] = $this->crud_model->get_addressbook();
        $data['error'] = '';    //initialize image upload error array to empty
 
        $config['upload_path'] = './uploads/';
        $config['allowed_types'] = 'csv';
        $config['max_size'] = '1000';
 
        $this->upload->initialize($config);
 
 
        // If upload failed, display error
        if (!$this->upload->do_upload()) {
            $data['error'] = $this->upload->display_errors();
            $this->load->view('master_list_view', $data);
        } else {
            $file_data = $this->upload->data();
            $file_path =  './uploads/'.$file_data['file_name'];
 
            if ($this->csvimport->get_array($file_path)) {
                $csv_array = $this->csvimport->get_array($file_path);
                foreach ($csv_array as $row) {
                    $data = array(
                        'password'=> md5($row['studentnumber']),
                        'username'=> $row['firstname'].$row['lastname'],
                        'userTypeID'=> 3
                    );
                    $insert_number = array(
                        'contactnumber'=>$row['contactnumber'],
                    );
                    $insert_data = array(
                        'studentNumber'=>$row['studentnumber'],
                        'username'=>$row['firstname'].$row['lastname'],
                        'firstName'=>$row['firstname'],
                        'middleName'=>$row['middlename'],
                        'lastName'=>$row['lastname'],
                        'suffix'=>$row['suffix'],
                        'sectionID'=>$row['sectionid'],
                        'batchID'=>$row['batchid'],
                        'contactnumber'=>$row['contactnumber'],
                    );
                    $this->crud_model->insert_user($data);
                    $this->crud_model->insert_usern($insert_number);
                    
                    $this->crud_model->insert_csv($insert_data);
                }
                $this->session->set_flashdata('success', 'Student Data Imported Succesfully');
                redirect('Master_list');
                //echo "<pre>"; print_r($insert_data);
            } else 
                $data['error'] = "Error occured";
                $this->load->view('master_list_view', $data);
            }
 
        } 

        function sectionPick($batchID,$sectionID) {
            $data['addressbook'] = $this->crud_model->getMasterListSection($batchID,$sectionID);
            $data['section'] = $this->crud_model->getSection();
            $data['batch'] = $this->crud_model->getBatch();
            $data['row'] = $this->crud_model->getAllS($batchID,$sectionID);
            $this->load->view('master_list_view', $data);
        }
        function batchPick($batchID,$sectionID) {
            $data['addressbook'] = $this->crud_model->getMasterListBatch($batchID,$sectionID);
            $data['section'] = $this->crud_model->getSection();
            $data['batch'] = $this->crud_model->getBatch();
            $data['row'] = $this->crud_model->getAllB($batchID,$sectionID);
            $this->load->view('master_list_view', $data);
        }

        
 
}
/*END OF FILE*/
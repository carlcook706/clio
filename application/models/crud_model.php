<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class crud_model extends CI_Model {

    public function __construct()
	{
	    parent::__construct();		
		$this->load->library('upload');
	}

	function check_user($username, $password) {
		$this->db->select('*'); //select all
		$this->db->from('tbl_users'); // table name
		$this->db->where('username', $username); // where username is equal to $username
		$this->db->where('password', md5($password)); // and password is equal to  $password (md5 format)
		$query = $this->db->get(); //get data from DB
		return $query;
	}

	function getProfileData($username) {

		$this->db->select('*');
		$this->db->from('tbl_admin');
		$this->db->join('tbl_users', 'tbl_admin.username = tbl_users.username');
        $this->db->join('tbl_contactnumber', 'tbl_contactnumber.contactNumber = tbl_admin.contactNumber');
		$this->db->where('tbl_admin.username', $username);
		$query = $this->db->get();
        
        return $query->row();
    }

    function getProfileData2($username) {

		$this->db->select('*');
		$this->db->from('tbl_advisers');
		$this->db->join('tbl_users', 'tbl_advisers.username = tbl_users.username');
        $this->db->join('tbl_contactnumber', 'tbl_contactnumber.contactNumber = tbl_advisers.contactNumber');
		$this->db->where('tbl_advisers.username', $username);
		$query = $this->db->get();
        
        return $query->row();
    }

	function getCalendarData() {
        $query = $this->db->query('SELECT * FROM tbl_calendar JOIN tbl_batch ON tbl_calendar.batchID = tbl_batch.batchID WHERE tbl_calendar.batchID = 1 ');
        return $query->result();
    }


	function getInboxData() {
        $query = $this->db->query('SELECT * FROM tbl_rci JOIN tbl_student ON tbl_rci.username = tbl_student.username JOIN tbl_users ON tbl_users.username = tbl_student.username JOIN tbl_contactnumber ON tbl_student.contactNumber = tbl_contactnumber.contactNumber JOIN tbl_usertype ON tbl_users.userTypeID = tbl_usertype.userTypeID JOIN tbl_section ON tbl_section.sectionID = tbl_student.sectionID WHERE tbl_rci.isDone = 0 ');
        return $query->result();
    }

	function getAnnouncementData() {
        $query = $this->db->query('SELECT * FROM tbl_announcement JOIN tbl_section ON tbl_announcement.sectionID = tbl_section.sectionID WHERE tbl_announcement.sectionID = 1');
        return $query->result();
    }
	
	function getBatch() {
        $query = $this->db->query('SELECT * FROM tbl_batch');
        return $query->result();
    }

	function getData($batchID) {
        $query = $this->db->query('SELECT * FROM tbl_calendar JOIN tbl_batch ON tbl_calendar.batchID = tbl_batch.batchID WHERE tbl_calendar.batchID =' .$batchID);
        return $query->result();
    }
    function getDataRow($batchID) {
        $query = $this->db->query('SELECT * FROM tbl_calendar JOIN tbl_batch ON tbl_calendar.batchID = tbl_batch.batchID WHERE tbl_calendar.batchID =' .$batchID);
        return $query->row();
    }

	function getSection() {
        $query = $this->db->query('SELECT * FROM tbl_section');
        return $query->result();
    }
	function getSectionData($sectionID) {
        $query = $this->db->query('SELECT * FROM tbl_announcement JOIN tbl_section ON tbl_announcement.sectionID = tbl_section.sectionID WHERE tbl_section.sectionID =' .$sectionID);
        return $query->result();
    }
    function getSectionDataRow($sectionID) {
        $query = $this->db->query('SELECT * FROM tbl_announcement JOIN tbl_section ON tbl_announcement.sectionID = tbl_section.sectionID WHERE tbl_section.sectionID =' .$sectionID);
        return $query->row();
    }
    function updateInboxData($rciID) {
        $data = array (
            'isDone' => '1'
        );
        $this->db->where('rciID', $rciID);
        $this->db->update('tbl_rci', $data);
    }
    function createAnnouncement() {
        $data = array (
            'announcementFeature' => $this->input->post('feature'),
            'announcement' => $this->input->post('announcement'),
            'announcementTopic' => $this->input->post('topic'),
            'sectionID' => $this->input->post('section'),
            'announcementDateTime' => date("Y-m-d\TH:i:s") 
        );
        $this->db->insert('tbl_announcement', $data);
    }
    function createCalendar() {
        $data = array (
            'activity' => $this->input->post('activity'),
            'expectation' => $this->input->post('expectedOutput'),
            'batchID' => $this->input->post('batch'),
            'calendarDateTime' => $this->input->post('date')
        );
        $this->db->insert('tbl_calendar', $data);
    }
    function getDataCalendar($calendarID) {
        $query = $this->db->query('SELECT * FROM tbl_calendar WHERE `calendarID` =' .$calendarID);
        return $query->row();
    }
    function calendarUpdate($calendarID) {
        $data = array (
            'activity' => $this->input->post('activity'),
            'expectation' => $this->input->post('expectation'),
            'batchID' => $this->input->post('batch'),
            'calendarDateTime' => $this->input->post('date')
        );
        $this->db->where('calendarID', $calendarID);
        $this->db->update('tbl_calendar', $data);
    }
    function deleteCalendar($calendarID) {
        $this->db->where('calendarID', $calendarID);
        $this->db->delete('tbl_calendar');
    }

    function getAnnouncement($announcementID) {
        $query = $this->db->query('SELECT * FROM tbl_announcement JOIN tbl_section ON tbl_announcement.sectionID = tbl_section.sectionID WHERE `announcementID` =' .$announcementID);
        return $query->row();
    }
    function announcementUpdate($announcementID) {
        $data = array (
            'announcementFeature' => $this->input->post('feature'),
            'announcementTopic' => $this->input->post('topic'),
            'announcement' => $this->input->post('announcement'),
            'sectionID' => $this->input->post('section'),
        );
        $this->db->where('announcementID', $announcementID);
        $this->db->update('tbl_announcement', $data);
    }
    function deleteAnnouncement($announcementID) {
        $this->db->where('announcementID', $announcementID);
        $this->db->delete('tbl_announcement');
    }
    function profileUpdate($username,$contactNumber,$fileName) {
        
            $data = array (
                'id' => $this->input->post('id'),
                'firstName' => $this->input->post('firstName'),
                'middleName' => $this->input->post('middleName'),
                'lastName' => $this->input->post('lastName'),
                'email' => $this->input->post('email'),
                'suffix' => $this->input->post('suffix'),
                'password' => $this->input->post('password'),
                'contactNumber' => $this->input->post('contactNumber'),
                'image' => $fileName,
            );

            $this->db->set('a.id', $data['id']);
            $this->db->set('a.firstName', $data['firstName']);
            $this->db->set('a.middleName', $data['middleName']);
            $this->db->set('a.lastName', $data['lastName']);
            $this->db->set('a.email',  $data['email']);
            $this->db->set('a.suffix',  $data['suffix']);
            $this->db->set('a.image',  $data['image']);
            $this->db->where('a.username',  $username);
            $this->db->update('tbl_admin as a');

            if(empty($data['password'])){
            
            }elseif(!empty($data['password'])){
                $this->db->set('u.password', md5($data['password']));
                $this->db->where('u.username',  $username);
                $this->db->update('tbl_users as u');
            }
            

            $this->db->set('c.contactNumber',$data['contactNumber']);
            $this->db->where('c.contactNumber', $contactNumber );
            $this->db->update('tbl_contactnumber as c');
        
    }
    function profileUpdate2($username,$contactNumber,$fileName) {
        
        $data = array (
            'id' => $this->input->post('id'),
            'firstName' => $this->input->post('firstName'),
            'middleName' => $this->input->post('middleName'),
            'lastName' => $this->input->post('lastName'),
            'email' => $this->input->post('email'),
            'suffix' => $this->input->post('suffix'),
            'password' => $this->input->post('password'),
            'contactNumber' => $this->input->post('contactNumber'),
            'image' => $fileName,
        );

        $this->db->set('a.id', $data['id']);
        $this->db->set('a.firstName', $data['firstName']);
        $this->db->set('a.middleName', $data['middleName']);
        $this->db->set('a.lastName', $data['lastName']);
        $this->db->set('a.email',  $data['email']);
        $this->db->set('a.suffix',  $data['suffix']);
        $this->db->set('a.image',  $data['image']);
        $this->db->where('a.username',  $username);
        $this->db->update('tbl_advisers as a');

        if(empty($data['password'])){
            
        }elseif(!empty($data['password'])){
            $this->db->set('u.password', md5($data['password']));
            $this->db->where('u.username',  $username);
            $this->db->update('tbl_users as u');
        }
        

        $this->db->set('c.contactNumber',$data['contactNumber']);
        $this->db->where('c.contactNumber', $contactNumber );
        $this->db->update('tbl_contactnumber as c');
    
}
    function get_addressbook() {     

        $this->db->select('*');
        $this->db->from('tbl_student');
        $this->db->join('tbl_section', 'tbl_section.sectionID = tbl_student.sectionID');
        $this->db->join('tbl_batch', 'tbl_student.batchID = tbl_batch.batchID');
        $this->db->where('tbl_batch.batchID',1);
        $this->db->where('tbl_section.sectionID', 1);

        $query = $this->db->get();

        return $query->result();
    }
 
    function insert_csv($data) {
        $this->db->insert('tbl_student', $data);
    }

    function insert_user($data) {
        $this->db->insert('tbl_users', $data);
    }
    function insert_usern($data) {
        $this->db->insert('tbl_contactnumber', $data);
    }
    function getAll() {
        $this->db->select('*');
        $this->db->from('tbl_advisers');
        $this->db->join('tbl_section', 'tbl_section.sectionID = tbl_advisers.sectionID');
        $this->db->join('tbl_batch', 'tbl_advisers.batchID = tbl_batch.batchID');
        $this->db->where('tbl_batch.batchID', 1);
        $this->db->where('tbl_section.sectionID', 1);

        $query = $this->db->get();

        return $query->row();
    }
    function getAllS($batchID,$sectionID) {

        $this->db->select('*');
        $this->db->from('tbl_advisers');
        $this->db->join('tbl_section', 'tbl_section.sectionID = tbl_advisers.sectionID');
        $this->db->join('tbl_batch', 'tbl_advisers.batchID = tbl_batch.batchID');
        $this->db->where('tbl_batch.batchID', $batchID);
        $this->db->where('tbl_section.sectionID', $sectionID);

        $query = $this->db->get();

        return $query->row();
    }
    function getMasterListSection($batchID,$sectionID) {

        $this->db->select('*');
        $this->db->from('tbl_student');
        $this->db->join('tbl_section', 'tbl_section.sectionID = tbl_student.sectionID');
        $this->db->join('tbl_batch', 'tbl_student.batchID = tbl_batch.batchID');
        $this->db->where('tbl_batch.batchID',$batchID);
        $this->db->where('tbl_section.sectionID', $sectionID);

    
        $query = $this->db->get();

        return $query->result();
    }
    function getMasterListBatch($batchID,$sectionID) {
        
        $this->db->select('*');
        $this->db->from('tbl_student');
        $this->db->join('tbl_section', 'tbl_section.sectionID = tbl_student.sectionID');
        $this->db->join('tbl_batch', 'tbl_student.batchID = tbl_batch.batchID');
        $this->db->where('tbl_batch.batchID',$batchID);
        $this->db->where('tbl_section.sectionID', $sectionID);

    
        $query = $this->db->get();

        return $query->result();
    }
    function getAllB($batchID,$sectionID) {

        $this->db->select('*');
        $this->db->from('tbl_advisers');
        $this->db->join('tbl_section', 'tbl_section.sectionID = tbl_advisers.sectionID');
        $this->db->join('tbl_batch', 'tbl_advisers.batchID = tbl_batch.batchID');
        $this->db->where('tbl_batch.batchID', $batchID);
        $this->db->where('tbl_section.sectionID', $sectionID);

        $query = $this->db->get();

        return $query->row();
    }
    function getGrading() {
        $query = $this->db->query('SELECT * FROM tbl_gradingsystem ');
        if ($query->num_rows() > 0) {
            return $query->result_array();
        } else {
            return FALSE;
        }
    }

    function insert_grading($data) {
        $this->db->insert('tbl_gradingsystem', $data);
    }

    function getOjt() {     
        $query = $this->db->query('SELECT * FROM tbl_student INNER JOIN tbl_supervisor ON tbl_student.studentNumber = tbl_supervisor.studentNumber INNER JOIN tbl_company ON tbl_supervisor.companyID = tbl_company.id  INNER JOIN tbl_address ON tbl_address.id = tbl_company.addressID INNER JOIN tbl_section ON tbl_student.sectionID = tbl_section.sectionID INNER JOIN tbl_batch ON tbl_student.batchID = tbl_batch.batchID  INNER JOIN tbl_weeklyreport ON tbl_student.studentNumber = tbl_weeklyreport.studentNumber INNER JOIN tbl_dtr ON tbl_dtr.studentNumber = tbl_student.studentNumber WHERE tbl_section.sectionID AND tbl_batch.batchID = 1 ');
        return $query->result();
    }

    

    function getOjtS($batchID, $sectionID ) {     
        

        $this->db->select('*');
        $this->db->from('tbl_student');
        $this->db->join('tbl_supervisor', 'tbl_student.studentNumber = tbl_supervisor.studentNumber');
        $this->db->join('tbl_company', 'tbl_supervisor.companyID = tbl_company.id');
        $this->db->join('tbl_address', 'tbl_address.id = tbl_company.addressID');
        $this->db->join('tbl_section', 'tbl_student.sectionID = tbl_section.sectionID');
        $this->db->join('tbl_batch', 'tbl_student.batchID = tbl_batch.batchID');
        $this->db->join('tbl_weeklyreport', 'tbl_student.studentNumber = tbl_weeklyreport.studentNumber');
        $this->db->join('tbl_dtr', 'tbl_dtr.studentNumber = tbl_student.studentNumber');
        $this->db->where('tbl_batch.batchID', $batchID);
        $this->db->where('tbl_section.sectionID', $sectionID);

        $query = $this->db->get();

        return $query->result();
    }
    function getOjtB($batchID, $sectionID ) {     
        
        $this->db->select('*');
        $this->db->from('tbl_student');
        $this->db->join('tbl_supervisor', 'tbl_student.studentNumber = tbl_supervisor.studentNumber');
        $this->db->join('tbl_company', 'tbl_supervisor.companyID = tbl_company.id');
        $this->db->join('tbl_address', 'tbl_address.id = tbl_company.addressID');
        $this->db->join('tbl_section', 'tbl_student.sectionID = tbl_section.sectionID');
        $this->db->join('tbl_batch', 'tbl_student.batchID = tbl_batch.batchID');
        $this->db->join('tbl_weeklyreport', 'tbl_student.studentNumber = tbl_weeklyreport.studentNumber');
        $this->db->join('tbl_dtr', 'tbl_dtr.studentNumber = tbl_student.studentNumber');
        $this->db->where('tbl_batch.batchID', $batchID);
        $this->db->where('tbl_section.sectionID', $sectionID);

        $query = $this->db->get();

        return $query->result();
    }

    
    
}

    


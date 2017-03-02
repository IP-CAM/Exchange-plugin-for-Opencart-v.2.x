<?php
class ControllerModuleExchangeWmd extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('module/exchange_wmd');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');
        $this->load->model('module/exchange_wmd');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('exchange_wmd', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('module/exchange_wmd', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_attribute'] = $this->language->get('text_attribute');
        $data['text_attributes'] = $this->language->get('text_attributes');
        $data['text_update_settings'] = $this->language->get('text_update_settings');
        $data['text_hour'] = $this->language->get('text_hour');
        $data['text_any'] = $this->language->get('text_any');
        $data['text_help_stock_status'] = $this->language->get('text_help_stock_status');
        $data['text_module_name'] = $this->language->get('text_module_name');
        $data['text_module_version'] = $this->language->get('text_module_version');
        $data['text_support'] = $this->language->get('text_support');
        $data['text_docs_link'] = $this->language->get('text_docs_link');
        $data['text_contact_description'] = $this->language->get('text_contact_description');
        $data['text_get_api_key'] = $this->language->get('text_get_api_key');
        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_markup_size'] = $this->language->get('entry_markup_size');
        $data['entry_id_user'] = $this->language->get('entry_id_user');
        $data['entry_email'] = $this->language->get('entry_email');
        $data['entry_api_key'] = $this->language->get('entry_api_key');
        $data['entry_parent_category'] = $this->language->get('entry_parent_category');
        $data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
        $data['entry_product_size'] = $this->language->get('entry_product_size');
        $data['entry_product_class'] = $this->language->get('entry_product_class');
        $data['entry_warranty'] = $this->language->get('entry_warranty');
        $data['entry_untis'] = $this->language->get('entry_untis');
        $data['entry_country_name'] = $this->language->get('entry_country_name');
        $data['entry_features'] = $this->language->get('entry_features');
        $data['entry_send_status'] = $this->language->get('entry_send_status');
        $data['entry_status_wait'] = $this->language->get('entry_status_wait');
        $data['entry_status_checking'] = $this->language->get('entry_status_checking');
        $data['entry_status_processing'] = $this->language->get('entry_status_processing');
        $data['entry_status_pay'] = $this->language->get('entry_status_pay');
        $data['entry_status_sent'] = $this->language->get('entry_status_sent');
        $data['entry_status_packing'] = $this->language->get('entry_status_packing');
        $data['entry_status_moving'] = $this->language->get('entry_status_moving');
        $data['entry_status_ready_for_delivering'] = $this->language->get('entry_status_ready_for_delivering');
        $data['entry_status_delivering'] = $this->language->get('entry_status_delivering');
        $data['entry_status_ready_for_pick_up'] = $this->language->get('entry_status_ready_for_pick_up');
        $data['entry_status_complete'] = $this->language->get('entry_status_complete');
        $data['entry_status_cancel'] = $this->language->get('entry_status_cancel');
        $data['entry_cron_link'] = $this->language->get('entry_cron_link');
        $data['entry_update_time'] = $this->language->get('entry_update_time');
        $data['entry_quantity_update_time'] = $this->language->get('entry_quantity_update_time');
        $data['entry_order_update_time'] = $this->language->get('entry_order_update_time');
        $data['entry_stock_status'] = $this->language->get('entry_stock_status');
        $data['entry_weight_class'] = $this->language->get('entry_weight_class');
        $data['entry_length_class'] = $this->language->get('entry_length_class');
        $data['entry_notify_order'] = $this->language->get('entry_notify_order');
        
        $data['tab_general'] = $this->language->get('tab_general');
        $data['tab_contacts'] = $this->language->get('tab_contacts');
        $data['tab_product_data'] = $this->language->get('tab_product_data');
        $data['tab_order_statuses'] = $this->language->get('tab_order_statuses');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
        
        if (isset($this->error['id_user'])) {
            $data['error_id_user'] = $this->error['id_user'];
        } else {
            $data['error_id_user'] = '';
        }
        
        if (isset($this->error['email'])) {
            $data['error_email'] = $this->error['email'];
        } else {
            $data['error_email'] = '';
        }
        
        if (isset($this->error['api_key'])) {
            $data['error_api_key'] = $this->error['api_key'];
        } else {
            $data['error_api_key'] = '';
        }
        
        if (isset($this->error['update_time'])) {
            $data['error_update_time'] = $this->error['update_time'];
        } else {
            $data['error_update_time'] = '';
        }
        
        if (isset($this->error['quantity_update_time'])) {
            $data['error_quantity_update_time'] = $this->error['quantity_update_time'];
        } else {
            $data['error_quantity_update_time'] = '';
        }
        
        if (isset($this->error['order_update_time'])) {
            $data['error_order_update_time'] = $this->error['order_update_time'];
        } else {
            $data['error_order_update_time'] = '';
        }
        
        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/exchange_wmd', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['action'] = $this->url->link('module/exchange_wmd', 'token=' . $this->session->data['token'], 'SSL');
        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->post['exchange_wmd_status'])) {
            $data['exchange_wmd_status'] = $this->request->post['exchange_wmd_status'];
        } else {
            $data['exchange_wmd_status'] = $this->config->get('exchange_wmd_status');
        }
        
        if (isset($this->request->post['exchange_wmd_id_user'])) {
            $data['exchange_wmd_id_user'] = $this->request->post['exchange_wmd_id_user'];
        } else {
            $data['exchange_wmd_id_user'] = $this->config->get('exchange_wmd_id_user');
        }
        
        if (isset($this->request->post['exchange_wmd_email'])) {
            $data['exchange_wmd_email'] = $this->request->post['exchange_wmd_email'];
        } else {
            $data['exchange_wmd_email'] = $this->config->get('exchange_wmd_email');
        }
        
        if (isset($this->request->post['exchange_wmd_api_key'])) {
            $data['exchange_wmd_api_key'] = $this->request->post['exchange_wmd_api_key'];
        } else {
            $data['exchange_wmd_api_key'] = $this->config->get('exchange_wmd_api_key');
        }
        
        if (isset($this->request->post['exchange_wmd_update_time'])) {
            $data['exchange_wmd_update_time'] = $this->request->post['exchange_wmd_update_time'];
        } elseif((int)$this->config->get('exchange_wmd_update_time')) {
            $data['exchange_wmd_update_time'] = $this->config->get('exchange_wmd_update_time');
        } else {
            $data['exchange_wmd_update_time'] = 24;
        }
        
        if (isset($this->request->post['exchange_wmd_quantity_update_time'])) {
            $data['exchange_wmd_quantity_update_time'] = $this->request->post['exchange_wmd_quantity_update_time'];
        } elseif((int)$this->config->get('exchange_wmd_quantity_update_time')) {
            $data['exchange_wmd_quantity_update_time'] = $this->config->get('exchange_wmd_quantity_update_time');
        } else {
            $data['exchange_wmd_quantity_update_time'] = 1;
        }
        
        if (isset($this->request->post['exchange_wmd_order_update_time'])) {
            $data['exchange_wmd_order_update_time'] = $this->request->post['exchange_wmd_order_update_time'];
        } elseif((int)$this->config->get('exchange_wmd_order_update_time')) {
            $data['exchange_wmd_order_update_time'] = $this->config->get('exchange_wmd_order_update_time');
        } else {
            $data['exchange_wmd_order_update_time'] = 1;
        }
        
        if (isset($this->request->post['exchange_wmd_parent_category'])) {
            $data['exchange_wmd_parent_category'] = $this->request->post['exchange_wmd_parent_category'];
        } else {
            $data['exchange_wmd_parent_category'] = $this->config->get('exchange_wmd_parent_category');
        }

        if (isset($this->request->post['exchange_wmd_manufacturer'])) {
            $data['exchange_wmd_manufacturer'] = $this->request->post['exchange_wmd_manufacturer'];
        } else {
            $data['exchange_wmd_manufacturer'] = $this->config->get('exchange_wmd_manufacturer');
        }

        if (isset($this->request->post['exchange_wmd_markup_size'])) {
            $data['exchange_wmd_markup_size'] = $this->request->post['exchange_wmd_markup_size'];
        } else {
            $data['exchange_wmd_markup_size'] = $this->config->get('exchange_wmd_markup_size');
        }
        
        if (isset($this->request->post['exchange_wmd_product_size'])) {
            $data['exchange_wmd_product_size'] = $this->request->post['exchange_wmd_product_size'];
        } else {
            $data['exchange_wmd_product_size'] = $this->config->get('exchange_wmd_product_size');
        }
        
        if (isset($this->request->post['exchange_wmd_product_class'])) {
            $data['exchange_wmd_product_class'] = $this->request->post['exchange_wmd_product_class'];
        } else {
            $data['exchange_wmd_product_class'] = $this->config->get('exchange_wmd_product_class');
        }
        
        if (isset($this->request->post['exchange_wmd_warranty'])) {
            $data['exchange_wmd_warranty'] = $this->request->post['exchange_wmd_warranty'];
        } else {
            $data['exchange_wmd_warranty'] = $this->config->get('exchange_wmd_warranty');
        }
        
        if (isset($this->request->post['exchange_wmd_untis'])) {
            $data['exchange_wmd_untis'] = $this->request->post['exchange_wmd_untis'];
        } else {
            $data['exchange_wmd_untis'] = $this->config->get('exchange_wmd_untis');
        }
        
        if (isset($this->request->post['exchange_wmd_country_name'])) {
            $data['exchange_wmd_country_name'] = $this->request->post['exchange_wmd_country_name'];
        } else {
            $data['exchange_wmd_country_name'] = $this->config->get('exchange_wmd_country_name');
        }
        
        if (isset($this->request->post['exchange_wmd_features'])) {
            $data['exchange_wmd_features'] = $this->request->post['exchange_wmd_features'];
        } else {
            $data['exchange_wmd_features'] = $this->config->get('exchange_wmd_features');
        }
        
        if (isset($this->request->post['exchange_wmd_order_status'])) {
            $data['exchange_wmd_order_status'] = $this->request->post['exchange_wmd_order_status'];
        } else {
            $data['exchange_wmd_order_status'] = $this->config->get('exchange_wmd_order_status');
        }
        
        if (isset($this->request->post['exchange_wmd_last_update'])) {
            $data['exchange_wmd_last_update'] = $this->request->post['exchange_wmd_last_update'];
        } else {
            $data['exchange_wmd_last_update'] = $this->config->get('exchange_wmd_last_update');
        }
              
        if (isset($this->request->post['exchange_wmd_last_quantity_update'])) {
            $data['exchange_wmd_last_quantity_update'] = $this->request->post['exchange_wmd_last_quantity_update'];
        } else {
            $data['exchange_wmd_last_quantity_update'] = $this->config->get('exchange_wmd_last_quantity_update');
        }
              
        if (isset($this->request->post['exchange_wmd_last_order_update'])) {
            $data['exchange_wmd_last_order_update'] = $this->request->post['exchange_wmd_last_order_update'];
        } else {
            $data['exchange_wmd_last_order_update'] = $this->config->get('exchange_wmd_last_order_update');
        }
              
        if (isset($this->request->post['exchange_wmd_update_categories'])) {
            $data['exchange_wmd_update_categories'] = $this->request->post['exchange_wmd_update_categories'];
        } else {
            $data['exchange_wmd_update_categories'] = $this->config->get('exchange_wmd_update_categories');
        }
              
        if (isset($this->request->post['exchange_wmd_product_offset'])) {
            $data['exchange_wmd_product_offset'] = $this->request->post['exchange_wmd_product_offset'];
        } else {
            $data['exchange_wmd_product_offset'] = $this->config->get('exchange_wmd_product_offset');
        }
              
        if (isset($this->request->post['exchange_wmd_quantity_offset'])) {
            $data['exchange_wmd_quantity_offset'] = $this->request->post['exchange_wmd_quantity_offset'];
        } else {
            $data['exchange_wmd_quantity_offset'] = $this->config->get('exchange_wmd_quantity_offset');
        }
              
        if (isset($this->request->post['exchange_wmd_order_offset'])) {
            $data['exchange_wmd_order_offset'] = $this->request->post['exchange_wmd_order_offset'];
        } else {
            $data['exchange_wmd_order_offset'] = $this->config->get('exchange_wmd_order_offset');
        }
              
        if (isset($this->request->post['exchange_wmd_notify_order_status'])) {
            $data['exchange_wmd_notify_order_status'] = $this->request->post['exchange_wmd_notify_order_status'];
        } else {
            $data['exchange_wmd_notify_order_status'] = $this->config->get('exchange_wmd_notify_order_status');
        }
              
        $data['stock_statuses'] = $this->model_module_exchange_wmd->getStockStatuses();
        
        if (isset($this->request->post['exchange_wmd_stock_status_id'])) {
            $data['exchange_wmd_stock_status_id'] = $this->request->post['exchange_wmd_stock_status_id'];
        } else {
            $data['exchange_wmd_stock_status_id'] = $this->config->get('exchange_wmd_stock_status_id');
        }

        if (isset($this->request->post['exchange_wmd_send_status'])) {
            $data['exchange_wmd_send_status'] = $this->request->post['exchange_wmd_send_status'];
        } else {
            $data['exchange_wmd_send_status'] = $this->config->get('exchange_wmd_send_status');
        }
              
        $data['weight_classes'] = $this->model_module_exchange_wmd->getWeightClasses();
        
        if (isset($this->request->post['exchange_wmd_weight_class_id'])) {
            $data['exchange_wmd_weight_class_id'] = $this->request->post['exchange_wmd_weight_class_id'];
        } elseif($this->config->get('exchange_wmd_weight_class_id')) {
            $data['exchange_wmd_weight_class_id'] = $this->config->get('exchange_wmd_weight_class_id');
        }else{
            $data['exchange_wmd_weight_class_id'] = $this->config->get('config_weight_class_id');
        }
              
        $data['length_classes'] = $this->model_module_exchange_wmd->getLengthClasses();
        
        if (isset($this->request->post['exchange_wmd_length_class_id'])) {
            $data['exchange_wmd_length_class_id'] = $this->request->post['exchange_wmd_length_class_id'];
        } elseif($this->config->get('exchange_wmd_length_class_id')) {
            $data['exchange_wmd_length_class_id'] = $this->config->get('exchange_wmd_length_class_id');
        }else{
            $data['exchange_wmd_weight_class_id'] = $this->config->get('config_weight_class_id');
        }
        
        if (isset($this->request->post['exchange_wmd_manufacturer_description'])) {
            $data['exchange_wmd_manufacturer_description'] = $this->request->post['exchange_wmd_manufacturer_description'];
        } elseif($this->config->get('exchange_wmd_manufacturer_description') != "") {
            $data['exchange_wmd_manufacturer_description'] = $this->config->get('exchange_wmd_manufacturer_description');
        }else{
            $data['exchange_wmd_manufacturer_description'] = $this->model_module_exchange_wmd->check_db_manufacturer_description();
        }


        $data['order_statuses'] = $this->model_module_exchange_wmd->getOrderStatuses();
        $data['cron_link'] = HTTP_CATALOG . "index.php?route=module/exchange_wmd";

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/exchange_wmd.tpl', $data));
    }

    public function install(){
        $this->load->model('module/exchange_wmd');
        $this->model_module_exchange_wmd->createDB();
        $this->response->redirect($this->url->link('module/exchange_wmd', 'token=' . $this->session->data['token'], 'SSL'));
    }
    
    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/exchange_wmd')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        
        if((int)$this->request->post['exchange_wmd_id_user'] <= 0){
            $this->error['id_user'] = $this->language->get('error_id_user');
        }
        
        if(!trim($this->request->post['exchange_wmd_email'])){
            $this->error['email'] = $this->language->get('error_email');
        }
        
        if(!trim($this->request->post['exchange_wmd_api_key'])){
            $this->error['api_key'] = $this->language->get('error_api_key');
        }
        
        if((int)$this->request->post['exchange_wmd_update_time'] <= 0){
            $this->error['update_time'] = $this->language->get('error_time');
        }
        
        if((int)$this->request->post['exchange_wmd_quantity_update_time'] <= 0){
            $this->error['quantity_update_time'] = $this->language->get('error_time');
        }
        
        if((int)$this->request->post['exchange_wmd_order_update_time'] <= 0){
            $this->error['order_update_time'] = $this->language->get('error_time');
        }
        
        if($this->error && !isset($this->error['warning'])){
            $this->error['warning'] = $this->language->get('error_warning');
        }

        return !$this->error;
    }
}
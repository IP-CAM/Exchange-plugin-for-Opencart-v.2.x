<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-category" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-category" class="form-horizontal">
          <input type="hidden" name="exchange_wmd_last_update" value="<?php echo $exchange_wmd_last_update; ?>">
          <input type="hidden" name="exchange_wmd_last_quantity_update" value="<?php echo $exchange_wmd_last_quantity_update; ?>">
          <input type="hidden" name="exchange_wmd_last_order_update" value="<?php echo $exchange_wmd_last_order_update; ?>">
          <input type="hidden" name="exchange_wmd_update_categories" value="<?php echo $exchange_wmd_update_categories; ?>">
          <input type="hidden" name="exchange_wmd_product_offset" value="<?php echo $exchange_wmd_product_offset; ?>">
          <input type="hidden" name="exchange_wmd_quantity_offset" value="<?php echo $exchange_wmd_quantity_offset; ?>">
          <input type="hidden" name="exchange_wmd_order_offset" value="<?php echo $exchange_wmd_order_offset; ?>">
          <input type="hidden" name="exchange_wmd_manufacturer_description" value="<?php echo $exchange_wmd_manufacturer_description; ?>">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_product_data; ?></a></li>
            <li><a href="#tab-statuses" data-toggle="tab"><?php echo $tab_order_statuses; ?></a></li>
            <li><a href="#tab-contacts" data-toggle="tab"><?php echo $tab_contacts; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_status" id="input-status" class="form-control">
                    <?php if ($exchange_wmd_status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-id_user"><?php echo $entry_id_user; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="exchange_wmd_id_user" value="<?php echo $exchange_wmd_id_user; ?>" id="input-id_user" class="form-control" />
                  <?php if ($error_id_user) { ?>
                  <div class="text-danger"><?php echo $error_id_user; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="exchange_wmd_email" value="<?php echo $exchange_wmd_email; ?>" id="input-email" class="form-control" />
                  <?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-api_key"><?php echo $entry_api_key; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="exchange_wmd_api_key" value="<?php echo $exchange_wmd_api_key; ?>" id="input-api_key" class="form-control" />
                  <?php if ($error_api_key) { ?>
                  <div class="text-danger"><?php echo $error_api_key; ?></div>
                  <?php } ?>
                  <span><a
                        target="_blank"
                        href="https://www.wmd.ru/registration.html"><?php echo $text_get_api_key; ?></a></span>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-notify_order"><?php echo $entry_notify_order; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_notify_order_status" id="input-notify_order" class="form-control">
                    <?php if ($exchange_wmd_notify_order_status) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-send_status"><?php echo $entry_send_status; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_send_status" id="input-send_status" class="form-control">
                    <option value="0"><?php echo $text_any; ?></option>
                    <?php foreach ($order_statuses as $status): ?>
                        <option
                            <?php echo ($status['order_status_id'] == $exchange_wmd_send_status) ? 'selected="selected"' : '' ?>
                            value="<?php echo $status['order_status_id'] ?>"><?php echo $status['name'] ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2" style="text-align: right;"><?php echo $entry_cron_link; ?></label>
                <div class="col-sm-10">
                    <div class="input-group col-sm-10"><?php echo $cron_link; ?></div>
                </div>
              </div>
              <fieldset>
                <legend><?php echo $text_update_settings; ?></legend>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-update_time"><?php echo $entry_update_time; ?></label>
                    <div class="col-sm-10">
                        <div class="input-group col-sm-2">
                          <div class="input-group-addon"><i class="fa fa-clock-o"></i></div>
                          <input type="text" class="form-control" name="exchange_wmd_update_time" id="input-update_time" value="<?php echo $exchange_wmd_update_time; ?>">
                          <div class="input-group-addon"><?php echo $text_hour; ?></div>
                        </div>
                        <?php if($error_update_time){ ?>
                        <div class="text-danger"><?php echo $error_update_time; ?></div>
                        <?php } ?>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-quantity_update_time"><?php echo $entry_quantity_update_time; ?></label>
                    <div class="col-sm-10">
                        <div class="input-group col-sm-2">
                          <div class="input-group-addon"><i class="fa fa-clock-o"></i></div>
                          <input type="text" class="form-control" name="exchange_wmd_quantity_update_time" id="input-quantity_update_time" value="<?php echo $exchange_wmd_quantity_update_time; ?>">
                          <div class="input-group-addon"><?php echo $text_hour; ?></div>
                        </div>
                        <?php if($error_quantity_update_time){ ?>
                        <div class="text-danger"><?php echo $error_quantity_update_time; ?></div>
                        <?php } ?>
                    </div>
                  </div>
                  <div class="form-group required">
                    <label class="col-sm-2 control-label" for="input-order_update_time"><?php echo $entry_order_update_time; ?></label>
                    <div class="col-sm-10">
                        <div class="input-group col-sm-2">
                          <div class="input-group-addon"><i class="fa fa-clock-o"></i></div>
                          <input type="text" class="form-control" name="exchange_wmd_order_update_time" id="input-order_update_time" value="<?php echo $exchange_wmd_order_update_time; ?>">
                          <div class="input-group-addon"><?php echo $text_hour; ?></div>
                        </div>
                        <?php if($error_order_update_time){ ?>
                        <div class="text-danger"><?php echo $error_order_update_time; ?></div>
                        <?php } ?>
                    </div>
                  </div>
              </fieldset>
            </div>
            <div class="tab-pane" id="tab-data">
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_parent_category; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($exchange_wmd_parent_category) { ?>
                    <input type="radio" name="exchange_wmd_parent_category" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="exchange_wmd_parent_category" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$exchange_wmd_parent_category) { ?>
                    <input type="radio" name="exchange_wmd_parent_category" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="exchange_wmd_parent_category" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-stock-status"><span data-toggle="tooltip" title="<?php echo $text_help_stock_status; ?>"><?php echo $entry_stock_status; ?></span></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_stock_status_id" id="input-stock-status" class="form-control">
                    <?php foreach ($stock_statuses as $stock_status) { ?>
                    <?php if ($stock_status['stock_status_id'] == $exchange_wmd_stock_status_id) { ?>
                    <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-weight-class"><?php echo $entry_weight_class; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_weight_class_id" id="input-weight-class" class="form-control">
                    <?php foreach ($weight_classes as $weight_class) { ?>
                    <?php if ($weight_class['weight_class_id'] == $exchange_wmd_weight_class_id) { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-length-class"><?php echo $entry_length_class; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_length_class_id" id="input-length-class" class="form-control">
                    <?php foreach ($length_classes as $length_class) { ?>
                    <?php if ($length_class['length_class_id'] == $exchange_wmd_length_class_id) { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-manufacturer"><?php echo $entry_manufacturer; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_manufacturer" id="input-manufacturer" class="form-control">
                    <option value="0"><?php echo $text_no; ?></option>
                    <option value="1" <?php if ($exchange_wmd_manufacturer == 1) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>
                    <option value="2" <?php if ($exchange_wmd_manufacturer == 2) { ?> selected="selected"<?php } ?>><?php echo $text_attribute; ?></option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-product_size"><?php echo $entry_product_size; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_product_size" id="input-product_size" class="form-control">
                    <option value="0"><?php echo $text_no; ?></option>
                    <option value="1" <?php if ($exchange_wmd_product_size == 1) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>
                    <option value="2" <?php if ($exchange_wmd_product_size == 2) { ?> selected="selected"<?php } ?>><?php echo $text_attribute; ?></option>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-markup_size"><?php echo $entry_markup_size; ?></label>
                <div class="col-sm-10">
                  <input class="form-control" name="exchange_wmd_markup_size" value="<?php echo $exchange_wmd_markup_size; ?>">
                </div>
              </div>
              <fieldset>
                <legend><?php echo $text_attributes; ?></legend>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $entry_product_class; ?></label>
                    <div class="col-sm-10">
                      <label class="radio-inline">
                        <?php if ($exchange_wmd_product_class) { ?>
                        <input type="radio" name="exchange_wmd_product_class" value="1" checked="checked" />
                        <?php echo $text_yes; ?>
                        <?php } else { ?>
                        <input type="radio" name="exchange_wmd_product_class" value="1" />
                        <?php echo $text_yes; ?>
                        <?php } ?>
                      </label>
                      <label class="radio-inline">
                        <?php if (!$exchange_wmd_product_class) { ?>
                        <input type="radio" name="exchange_wmd_product_class" value="0" checked="checked" />
                        <?php echo $text_no; ?>
                        <?php } else { ?>
                        <input type="radio" name="exchange_wmd_product_class" value="0" />
                        <?php echo $text_no; ?>
                        <?php } ?>
                      </label>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $entry_warranty; ?></label>
                    <div class="col-sm-10">
                      <label class="radio-inline">
                        <?php if ($exchange_wmd_warranty) { ?>
                        <input type="radio" name="exchange_wmd_warranty" value="1" checked="checked" />
                        <?php echo $text_yes; ?>
                        <?php } else { ?>
                        <input type="radio" name="exchange_wmd_warranty" value="1" />
                        <?php echo $text_yes; ?>
                        <?php } ?>
                      </label>
                      <label class="radio-inline">
                        <?php if (!$exchange_wmd_warranty) { ?>
                        <input type="radio" name="exchange_wmd_warranty" value="0" checked="checked" />
                        <?php echo $text_no; ?>
                        <?php } else { ?>
                        <input type="radio" name="exchange_wmd_warranty" value="0" />
                        <?php echo $text_no; ?>
                        <?php } ?>
                      </label>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $entry_untis; ?></label>
                    <div class="col-sm-10">
                      <label class="radio-inline">
                        <?php if ($exchange_wmd_untis) { ?>
                        <input type="radio" name="exchange_wmd_untis" value="1" checked="checked" />
                        <?php echo $text_yes; ?>
                        <?php } else { ?>
                        <input type="radio" name="exchange_wmd_untis" value="1" />
                        <?php echo $text_yes; ?>
                        <?php } ?>
                      </label>
                      <label class="radio-inline">
                        <?php if (!$exchange_wmd_untis) { ?>
                        <input type="radio" name="exchange_wmd_untis" value="0" checked="checked" />
                        <?php echo $text_no; ?>
                        <?php } else { ?>
                        <input type="radio" name="exchange_wmd_untis" value="0" />
                        <?php echo $text_no; ?>
                        <?php } ?>
                      </label>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $entry_country_name; ?></label>
                    <div class="col-sm-10">
                      <label class="radio-inline">
                        <?php if ($exchange_wmd_country_name) { ?>
                        <input type="radio" name="exchange_wmd_country_name" value="1" checked="checked" />
                        <?php echo $text_yes; ?>
                        <?php } else { ?>
                        <input type="radio" name="exchange_wmd_country_name" value="1" />
                        <?php echo $text_yes; ?>
                        <?php } ?>
                      </label>
                      <label class="radio-inline">
                        <?php if (!$exchange_wmd_country_name) { ?>
                        <input type="radio" name="exchange_wmd_country_name" value="0" checked="checked" />
                        <?php echo $text_no; ?>
                        <?php } else { ?>
                        <input type="radio" name="exchange_wmd_country_name" value="0" />
                        <?php echo $text_no; ?>
                        <?php } ?>
                      </label>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"><?php echo $entry_features; ?></label>
                    <div class="col-sm-10">
                      <label class="radio-inline">
                        <?php if ($exchange_wmd_features) { ?>
                        <input type="radio" name="exchange_wmd_features" value="1" checked="checked" />
                        <?php echo $text_yes; ?>
                        <?php } else { ?>
                        <input type="radio" name="exchange_wmd_features" value="1" />
                        <?php echo $text_yes; ?>
                        <?php } ?>
                      </label>
                      <label class="radio-inline">
                        <?php if (!$exchange_wmd_features) { ?>
                        <input type="radio" name="exchange_wmd_features" value="0" checked="checked" />
                        <?php echo $text_no; ?>
                        <?php } else { ?>
                        <input type="radio" name="exchange_wmd_features" value="0" />
                        <?php echo $text_no; ?>
                        <?php } ?>
                      </label>
                    </div>
                  </div>
              </fieldset>
            </div>
            <div class="tab-pane" id="tab-statuses">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status_wait"><?php echo $entry_status_wait; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_order_status[wait]" id="input-status_wait" class="form-control">
                    <?php foreach($order_statuses as $order_status){ ?>
                      <?php if(isset($exchange_wmd_order_status['wait']) && $exchange_wmd_order_status['wait'] == $order_status['order_status_id']){ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php }else{ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status_checking"><?php echo $entry_status_checking; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_order_status[checking]" id="input-status_checking" class="form-control">
                    <?php foreach($order_statuses as $order_status){ ?>
                      <?php if(isset($exchange_wmd_order_status['checking']) && $exchange_wmd_order_status['checking'] == $order_status['order_status_id']){ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php }else{ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status_processing"><?php echo $entry_status_processing; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_order_status[processing]" id="input-status_processing" class="form-control">
                    <?php foreach($order_statuses as $order_status){ ?>
                      <?php if(isset($exchange_wmd_order_status['processing']) && $exchange_wmd_order_status['processing'] == $order_status['order_status_id']){ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php }else{ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status_pay"><?php echo $entry_status_pay; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_order_status[pay]" id="input-status_pay" class="form-control">
                    <?php foreach($order_statuses as $order_status){ ?>
                      <?php if(isset($exchange_wmd_order_status['pay']) && $exchange_wmd_order_status['pay'] == $order_status['order_status_id']){ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php }else{ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status_sent"><?php echo $entry_status_sent; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_order_status[sent]" id="input-status_sent" class="form-control">
                    <?php foreach($order_statuses as $order_status){ ?>
                      <?php if(isset($exchange_wmd_order_status['sent']) && $exchange_wmd_order_status['sent'] == $order_status['order_status_id']){ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php }else{ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status_packing"><?php echo $entry_status_packing; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_order_status[packing]" id="input-status_packing" class="form-control">
                    <?php foreach($order_statuses as $order_status){ ?>
                      <?php if(isset($exchange_wmd_order_status['packing']) && $exchange_wmd_order_status['packing'] == $order_status['order_status_id']){ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php }else{ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status_moving"><?php echo $entry_status_moving; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_order_status[moving]" id="input-status_moving" class="form-control">
                    <?php foreach($order_statuses as $order_status){ ?>
                      <?php if(isset($exchange_wmd_order_status['moving']) && $exchange_wmd_order_status['moving'] == $order_status['order_status_id']){ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php }else{ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status_ready_for_delivering"><?php echo $entry_status_ready_for_delivering; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_order_status[ready_for_delivering]" id="input-status_ready_for_delivering" class="form-control">
                    <?php foreach($order_statuses as $order_status){ ?>
                      <?php if(isset($exchange_wmd_order_status['ready_for_delivering']) && $exchange_wmd_order_status['ready_for_delivering'] == $order_status['order_status_id']){ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php }else{ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status_delivering"><?php echo $entry_status_delivering; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_order_status[delivering]" id="input-status_delivering" class="form-control">
                    <?php foreach($order_statuses as $order_status){ ?>
                      <?php if(isset($exchange_wmd_order_status['delivering']) && $exchange_wmd_order_status['delivering'] == $order_status['order_status_id']){ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php }else{ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status_ready_for_pick_up"><?php echo $entry_status_ready_for_pick_up; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_order_status[ready_for_pick_up]" id="input-status_ready_for_pick_up" class="form-control">
                    <?php foreach($order_statuses as $order_status){ ?>
                      <?php if(isset($exchange_wmd_order_status['ready_for_pick_up']) && $exchange_wmd_order_status['ready_for_pick_up'] == $order_status['order_status_id']){ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php }else{ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status_complete"><?php echo $entry_status_complete; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_order_status[complete]" id="input-status_complete" class="form-control">
                    <?php foreach($order_statuses as $order_status){ ?>
                      <?php if(isset($exchange_wmd_order_status['complete']) && $exchange_wmd_order_status['complete'] == $order_status['order_status_id']){ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php }else{ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-status_cancel"><?php echo $entry_status_cancel; ?></label>
                <div class="col-sm-10">
                  <select name="exchange_wmd_order_status[cancel]" id="input-status_cancel" class="form-control">
                    <?php foreach($order_statuses as $order_status){ ?>
                      <?php if(isset($exchange_wmd_order_status['cancel']) && $exchange_wmd_order_status['cancel'] == $order_status['order_status_id']){ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php }else{ ?>
                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              </div>
              <div class="tab-pane" id="tab-contacts">
                <div class="col-sm-10">
                    <p>
                    <div><?php echo $text_module_version; ?>: 1.0</div>
                    <div><?php echo $text_support; ?>:
                        <a href="mailto:sale@wmd.ru">sale@wmd.ru</a>,
                        <a href="mailto:payment@wmd.ru">payment@wmd.ru</a></div>
                    <div><?php echo $text_docs_link; ?>: <a href="http://www.wmd.ru/affiliates.html">www.wmd.ru/affiliates.html</a></div>
                    </p>
                    <?php echo $text_contact_description; ?>
                </div>
              </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
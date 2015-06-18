<?php
/**
 * @version     1.0.0
 * @package     com_product
 * @copyright   toanktv.it@gmail.com
 * @license     toanktv.it@gmail.com
 * @author      toanle <gep2a76@gmail.com> - http://
 */

// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.controllerform');

/**
 * Product controller class.
 */
class ProductControllerProduct extends JControllerForm
{

    function __construct() {
        $this->view_list = 'products';
        parent::__construct();
    }

}
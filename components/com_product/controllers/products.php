<?php
/**
 * @version     1.0.0
 * @package     com_product
 * @copyright   toanktv.it@gmail.com
 * @license     toanktv.it@gmail.com
 * @author      toanle <gep2a76@gmail.com> - http://
 */

// No direct access.
defined('_JEXEC') or die;

require_once JPATH_COMPONENT.'/controller.php';

/**
 * Products list controller class.
 */
class ProductControllerProducts extends ProductController
{
	/**
	 * Proxy for getModel.
	 * @since	1.6
	 */
	public function &getModel($name = 'Products', $prefix = 'ProductModel', $config = array())
	{
		$model = parent::getModel($name, $prefix, array('ignore_request' => true));
		return $model;
	}
}
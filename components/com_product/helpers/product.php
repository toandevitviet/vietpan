<?php

/**
 * @version     1.0.0
 * @package     com_product
 * @copyright   toanktv.it@gmail.com
 * @license     toanktv.it@gmail.com
 * @author      toanle <gep2a76@gmail.com> - http://
 */
defined('_JEXEC') or die;

class ProductFrontendHelper {
    
	/**
	* Get category name using category ID
	* @param integer $category_id Category ID
	* @return mixed category name if the category was found, null otherwise
	*/
	public static function getCategoryNameByCategoryId($category_id) {
		$db = JFactory::getDbo();
		$query = $db->getQuery(true);

		$query
			->select('title')
			->from('#__categories')
			->where('id = ' . intval($category_id));

		$db->setQuery($query);
		return $db->loadResult();
	}
}

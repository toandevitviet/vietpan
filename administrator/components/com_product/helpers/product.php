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

/**
 * Product helper.
 */
class ProductHelper {

    /**
     * Configure the Linkbar.
     */
    public static function addSubmenu($vName = '') {
        		JHtmlSidebar::addEntry(
			JText::_('COM_PRODUCT_TITLE_PRODUCTS'),
			'index.php?option=com_product&view=products',
			$vName == 'products'
		);
		JHtmlSidebar::addEntry(
			JText::_('JCATEGORIES') . ' (' . JText::_('COM_PRODUCT_TITLE_PRODUCTS') . ')',
			"index.php?option=com_categories&extension=com_product",
			$vName == 'categories'
		);
		if ($vName=='categories') {
			JToolBarHelper::title('Product: JCATEGORIES (COM_PRODUCT_TITLE_PRODUCTS)');
		}

    }

    /**
     * Gets a list of the actions that can be performed.
     *
     * @return	JObject
     * @since	1.6
     */
    public static function getActions() {
        $user = JFactory::getUser();
        $result = new JObject;

        $assetName = 'com_product';

        $actions = array(
            'core.admin', 'core.manage', 'core.create', 'core.edit', 'core.edit.own', 'core.edit.state', 'core.delete'
        );

        foreach ($actions as $action) {
            $result->set($action, $user->authorise($action, $assetName));
        }

        return $result;
    }


}

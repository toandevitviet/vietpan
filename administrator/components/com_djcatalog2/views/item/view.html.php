<?php
/**
 * @version $Id: view.html.php 209 2013-11-18 17:18:01Z michal $
 * @package DJ-Catalog2
 * @copyright Copyright (C) 2012 DJ-Extensions.com LTD, All rights reserved.
 * @license http://www.gnu.org/licenses GNU/GPL
 * @author url: http://dj-extensions.com
 * @author email contact@dj-extensions.com
 * @developer Michal Olczyk - michal.olczyk@design-joomla.eu
 *
 * DJ-Catalog2 is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * DJ-Catalog2 is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with DJ-Catalog2. If not, see <http://www.gnu.org/licenses/>.
 *
 */

defined('_JEXEC') or die;

jimport('joomla.application.component.view');

class Djcatalog2ViewItem extends JViewLegacy {
	protected $state;
	protected $item;
	protected $form;
	
	public function display($tpl = null)
	{
		$this->state	= $this->get('State');
		$this->item		= $this->get('Item');
		$this->form		= $this->get('Form');

		// Check for errors.
		if (count($errors = $this->get('Errors'))) {
			JError::raiseError(500, implode("\n", $errors));
			return false;
		}
		$document = JFactory::getDocument();
		JHTML::_('behavior.framework');
		JHTML::_('behavior.calendar');
        $document->addScript(JURI::root() . "administrator/components/com_djcatalog2/views/item/item.js");
		$document->addScript(JURI::root() . "components/com_djcatalog2/assets/nicEdit/nicEdit.js");
		
		/*
		$params = new JRegistry();
		
		$settings = array();
		$settings['max_file_size'] = $params->get('upload_max_size','10240').'kb';
		$settings['chunk_size'] = $params->get('upload_chunk_size','1024').'kb';
		$settings['resize'] = true;
		$settings['width'] = $params->get('upload_width','1600');
		$settings['height'] = $params->get('upload_height','1200');
		$settings['quality'] = $params->get('upload_quality','90');
		$settings['filter'] = 'jpg,png,gif';
		$settings['onUploadedEvent'] = 'injectUploaded';
		$settings['onAddedEvent'] = 'startUpload';
		$settings['debug'] = true;
		
		$this->uploader = DJCatalog2UploadHelper::getUploader('multiuploader_item', $settings);
		*/
		
		$version = new JVersion;
		if (version_compare($version->getShortVersion(), '3.0.0', '<')) {
			$tpl = 'legacy';
		}
        
		$this->addToolbar();
		parent::display($tpl);
	}
	
	protected function addToolbar()
	{
		JFactory::getApplication()->input->set('hidemainmenu', true);

		$user		= JFactory::getUser();
		$isNew		= ($this->item->id == 0);

		$text = $isNew ? JText::_( 'COM_DJCATALOG2_NEW' ) : JText::_( 'COM_DJCATALOG2_EDIT' );
		JToolBarHelper::title(   JText::_( 'COM_DJCATALOG2_ITEM' ).': <small><small>[ ' . $text.' ]</small></small>', 'generic.png' );
		
		JToolBarHelper::apply('item.apply', 'JTOOLBAR_APPLY');
		JToolBarHelper::save('item.save', 'JTOOLBAR_SAVE');
		JToolBarHelper::custom('item.save2new', 'save-new.png', 'save-new_f2.png', 'JTOOLBAR_SAVE_AND_NEW', false);
		JToolBarHelper::custom('item.save2copy', 'save-copy.png', 'save-copy_f2.png', 'JTOOLBAR_SAVE_AS_COPY', false);
		if (empty($this->item->id)) {
			JToolBarHelper::cancel('item.cancel', 'JTOOLBAR_CANCEL');
		}
		else {
			JToolBarHelper::cancel('item.cancel', 'JTOOLBAR_CLOSE');
		}
	}
}
?>
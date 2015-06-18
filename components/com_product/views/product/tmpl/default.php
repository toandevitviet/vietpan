<?php
/**
 * @version     1.0.0
 * @package     com_product
 * @copyright   toanktv.it@gmail.com
 * @license     toanktv.it@gmail.com
 * @author      toanle <gep2a76@gmail.com> - http://
 */
// no direct access
defined('_JEXEC') or die;

$canEdit = JFactory::getUser()->authorise('core.edit', 'com_product.' . $this->item->id);
if (!$canEdit && JFactory::getUser()->authorise('core.edit.own', 'com_product' . $this->item->id)) {
	$canEdit = JFactory::getUser()->id == $this->item->created_by;
}
?>
<?php if ($this->item) : ?>

    <div class="item_fields">
        <table class="table">
            <tr>
			<th><?php echo JText::_('COM_PRODUCT_FORM_LBL_PRODUCT_ID'); ?></th>
			<td><?php echo $this->item->id; ?></td>
</tr>
<tr>
			<th><?php echo JText::_('COM_PRODUCT_FORM_LBL_PRODUCT_STATE'); ?></th>
			<td>
			<i class="icon-<?php echo ($this->item->state == 1) ? 'publish' : 'unpublish'; ?>"></i></td>
</tr>
<tr>
			<th><?php echo JText::_('COM_PRODUCT_FORM_LBL_PRODUCT_CREATED_BY'); ?></th>
			<td><?php echo $this->item->created_by_name; ?></td>
</tr>
<tr>
			<th><?php echo JText::_('COM_PRODUCT_FORM_LBL_PRODUCT_NAME'); ?></th>
			<td><?php echo $this->item->name; ?></td>
</tr>
<tr>
			<th><?php echo JText::_('COM_PRODUCT_FORM_LBL_PRODUCT_IMAGE'); ?></th>
			<td><?php echo $this->item->image; ?></td>
</tr>
<tr>
			<th><?php echo JText::_('COM_PRODUCT_FORM_LBL_PRODUCT_PRICE'); ?></th>
			<td><?php echo $this->item->price; ?></td>
</tr>
<tr>
			<th><?php echo JText::_('COM_PRODUCT_FORM_LBL_PRODUCT_SHORT_DESCRIPTION'); ?></th>
			<td><?php echo $this->item->short_description; ?></td>
</tr>
<tr>
			<th><?php echo JText::_('COM_PRODUCT_FORM_LBL_PRODUCT_DESCRIPTION'); ?></th>
			<td><?php echo $this->item->description; ?></td>
</tr>
<tr>
			<th><?php echo JText::_('COM_PRODUCT_FORM_LBL_PRODUCT_CATEGORY_ID'); ?></th>
			<td><?php echo $this->item->category_id_title; ?></td>
</tr>

        </table>
    </div>
    <?php if($canEdit && $this->item->checked_out == 0): ?>
		<a class="btn" href="<?php echo JRoute::_('index.php?option=com_product&task=product.edit&id='.$this->item->id); ?>"><?php echo JText::_("COM_PRODUCT_EDIT_ITEM"); ?></a>
	<?php endif; ?>
								<?php if(JFactory::getUser()->authorise('core.delete','com_product.product.'.$this->item->id)):?>
									<a class="btn" href="<?php echo JRoute::_('index.php?option=com_product&task=product.remove&id=' . $this->item->id, false, 2); ?>"><?php echo JText::_("COM_PRODUCT_DELETE_ITEM"); ?></a>
								<?php endif; ?>
    <?php
else:
    echo JText::_('COM_PRODUCT_ITEM_NOT_LOADED');
endif;
?>

<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2005 - 2015 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::_('bootstrap.tooltip');

$lang	= JFactory::getLanguage();
$class = ' class="first"';
?>

<?php if (count($this->children[$this->category->id]) > 0) : ?>
	<?php 
		$i = 0;
		foreach ($this->children[$this->category->id] as $id => $child) : $i++;
	?>
		<?php
		if ($this->params->get('show_empty_categories') || $child->getNumItems(true) || count($child->getChildren())) :
			if (!isset($this->children[$this->category->id][$id + 1])) :
				$class = ' class="last"';
			endif;
		?>

		<div<?php echo $class; ?>>
			<?php $class = ''; ?>
			<?php if ($lang->isRTL()) : ?>
			<h3 class="page-header item-title">
				<?php if ( $this->params->get('show_cat_num_articles', 1)) : ?>
					<span class="badge badge-info tip hasTooltip" title="<?php echo JHtml::tooltipText('COM_CONTENT_NUM_ITEMS'); ?>">
						<?php echo $child->getNumItems(true); ?>
					</span>
				<?php endif; ?>
				<a href="<?php echo JRoute::_(ContentHelperRoute::getCategoryRoute($child->id));?>">
				<?php echo $this->escape($child->title); ?></a>

				<?php if (count($child->getChildren()) > 0 && $this->maxLevel > 1) : ?>
					<a href="#category-<?php echo $child->id;?>" data-toggle="collapse" data-toggle="button" class="btn btn-mini pull-right"><span class="icon-plus"></span></a>
				<?php endif;?>
			</h3>
			<?php else : ?>

			<!-- Xử lý danh sách danh mục sản phẩm -->
				
			<h3 class="page-header item-title">
				<a class="number" href="<?php echo JRoute::_(ContentHelperRoute::getCategoryRoute($child->id));?>">
					<div class="count-category">
						<?php echo $i; ?>
					</div>
				</a>
				<a href="<?php echo JRoute::_(ContentHelperRoute::getCategoryRoute($child->id));?>">
					<div class="title-cagegory">
						<?php echo substr($this->escape($child->title), 0, 90); ?>
					</div>
				</a>
			<?php endif;?>
			</h3>

			<!-- kết thúc xử lý danh mục sản phẩm -->	


			<?php if ($this->params->get('show_subcat_desc') == 1) :?>
				<?php if ($child->description) : ?>
					<div class="category-desc">
						<?php echo JHtml::_('content.prepare', $child->description, '', 'com_content.category'); ?>
					</div>
				<?php endif; ?>
			<?php endif; ?>

			<?php if (count($child->getChildren()) > 0 && $this->maxLevel > 1) :?>
			<div class="collapse fade" id="category-<?php echo $child->id;?>">
				<?php
				$this->children[$child->id] = $child->getChildren();
				$this->category = $child;
				$this->maxLevel--;
				echo $this->loadTemplate('children');
				$this->category = $child->getParent();
				$this->maxLevel++;
				?>
			</div>
			<?php endif; ?>

		</div>
		<?php endif; ?>
	<?php endforeach; ?>
<?php endif; ?>

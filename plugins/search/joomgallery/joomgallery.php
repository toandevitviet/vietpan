<?php
// $HeadURL: https://joomgallery.org/svn/joomgallery/JG-3/Plugins/JoomSearch/trunk/joomgallery.php $
// $Id: joomgallery.php 4311 2013-06-24 22:57:25Z erftralle $
/**
* JoomGallery Search Plugin
* by JoomGallery::Project Team
* @package JoomGallery
* @copyright JoomGallery::Project Team
* @license http://www.gnu.org/copyleft/gpl.html GNU/GPL
*
* This program is free software; you can redistribute it and/or modify it under
* the terms of the GNU General Public License as published by the Free Software
* Foundation, either version 2 of the License, or (at your option) any later
* version.
*
* This program is distributed in the hope that it will be useful, but WITHOUT
* ANY WARRANTY, without even the implied warranty of MERCHANTABILITY or FITNESS
* FOR A PARTICULAR PURPOSE.
* See the GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License along with
* this program; if not, write to the Free Software Foundation, Inc.,
* 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
*/

// No direct access
defined('_JEXEC') or die('Restricted access');

jimport('joomla.plugin.plugin');

// Uncomment to enable debug output with FirePHP (you MUST have installed it)
// define('_JG_SEARCH_DEBUG', 1);

if(defined('_JG_SEARCH_DEBUG'))
{
  jimport('joomla.error.profiler');
  // FirePHP
  require_once JPATH_ROOT.'/libraries/FirePHPCore/FirePHP.class.php';
}

// Include JoomGallery's interface class
require_once JPATH_ROOT.'/components/com_joomgallery/interface.php';

/**
 * This plugin extends the standard Joomla! search.
 *
 * The plugin copes with two different search modes:
 * 1. Search in resp. for image titles, descriptions, comments, image authors
 *    and image owners
 * 2. Search in resp. for category titles, descriptions and category owners
 *
 * It is also possible to display the search result with a thumbnail by applying
 * a template overwrite. Therefore you have to copy the file default_results.php
 * , which is included in the installation zip, manually into the folder
 * templates/YourTemplateName/html/com_search/search/ . You certainly have
 * to replace YourTemplateName with the name of your template.
 *
 * The display of the search results is according to the JoomGallery configuration
 * settings. An interface for the module JoomSearch is integrated.
 */
class plgSearchJoomGallery extends JPlugin
{
  /**
  * Holds the backend configuration parameter for searching in
  * image description
  *
  * @var     int
  */
  private $_search_img_description;
  /**
  * Holds the backend configuration parameter for searching in
  * image comments
  *
  * @var     int
  */
  private $_search_img_comment;
  /**
  * Holds the backend configuration parameter for searching for
  * image authors
  *
  * @var     int
  */
  private $_search_img_author;
  /**
  * Holds the backend configuration parameter for searching for
  * image owners
  *
  * @var     int
  */
  private $_search_img_owner;
  /**
  * Holds the backend configuration parameter for searching in
  * category descriptions
  *
  * @var     int
  */
  private $_search_cat_description;
  /**
  * Holds the backend configuration parameter for searching for
  * category owners
  *
  * @var     int
  */
  private $_search_cat_owner;
  /**
  * Holds the backend configuration parameter to limit the search result
  *
  * @var     int
  */
  private $_search_limit;
  /**
  * Instance of JoomGallery's interface class
  *
  * @var     object
  */
  private $_jg_interface;
  /**
  * Holds the backend configuration parameter for the search mode
  *
  * @var     int
  */
  private $_search_mode;
  /**
  * Holds the backend configuration parameter for allowing the search in hidden
  * gallery content (categories and images)
  *
  * @var     int
  */
  private $_search_hidden;
  /**
  * Holds the backend configuration parameter for the template overwrite
  *
  * @var     int
  */
  private $_search_tmpl_overwrite;
  /**
  * Holds the internal state for searching in
  * image titles
  *
  * @var     int
  */
  private $_search_img_title;
  /**
  * Holds the internal state for searching in
  * category titles
  *
  * @var     int
  */
  private $_search_cat_title;
  /**
  * Holds the backend configuration parameter for the Itemid
  *
  * @var     int
  */
  private $_search_itemid;
  /**
  * Holds an array of categories the search should be restricted to
  *
  * @var     array
  */
  private $_search_categories = null;
  /**
  * Holds all JoomGallery category id's and their parent category id's
  *
  * @var     object array
  */
  private $_all_categories = null;
  /**
  * Constructor
  *
  * @param    object    $subject    The object to observe
  * @param    array     $config     An array that holds the plugin configuration
  */
  public function __construct(&$subject, $config)
  {
    parent::__construct($subject, $config);

    // Load language file of plugin
    $this->loadLanguage();

    if(defined('_JG_SEARCH_DEBUG'))
    {
      // FirePHP
      ob_start();
      $this->firephp = FirePHP::getInstance(true);
      // JProfiler
      $this->p = JProfiler::getInstance('JoomGallerySearch');
      $this->p->mark('SCRIPT-START');
    }

    // Create an instance of JoomGallery's interface class
    $this->_jg_interface = new JoomInterface();

    // Get the backend parameters
    $this->_search_img_description  = $this->params->get('search_img_description', 1);
    $this->_search_img_comment      = $this->params->get('search_img_comment', 0);
    $this->_search_cat_title        = $this->params->get('search_cat_title', 0);
    $this->_search_cat_description  = $this->params->get('search_cat_description', 0);
    $this->_search_limit            = $this->params->get('search_limit', 0);
    $this->_search_mode             = $this->params->get('search_mode', 0);
    $this->_search_hidden           = $this->params->get('search_hidden', 0);
    $this->_search_tmpl_overwrite   = $this->params->get('search_tmpl_overwrite', 0);
    $this->_search_img_author       = $this->params->get('search_img_author', 0);
    $this->_search_itemid           = intval($this->params->get('search_itemid', 0));
    if($this->_search_itemid > 0)
    {
      $this->_jg_interface->addConfig('Itemid', $this->_search_itemid);
    }
    $this->_search_img_owner        = $this->params->get('search_img_owner', 0);
    $this->_search_cat_owner        = $this->params->get('search_cat_owner', 0);

    // Get overwrite parameters from request (e.g. JoomGallery search module)
    $overwrite = false;
    $search_mode_req                = JRequest::getInt('joomsearchcatorimg', null);
    $search_limit_req               = JRequest::getInt('joomsearchlimit', null);
    $search_img_description_req     = JRequest::getInt('joomsearchimgdescr', null);
    $search_img_comment_req         = JRequest::getInt('joomsearchcomments', null);
    $search_img_author_req          = JRequest::getInt('joomsearchauthors', null);
    $search_cat_description_req     = JRequest::getInt('joomsearchcatdescr', null);
    $search_categories_req          = JRequest::getString('joomsearchcatid', null);
    $search_subcats_req             = JRequest::getInt('joomsearchsubcats', null);
    $search_img_owner_req           = JRequest::getInt('joomsearchimgowners', null);
    $search_cat_owner_req           = JRequest::getInt('joomsearchcatowners', null);

    if(defined('_JG_SEARCH_DEBUG'))
    {
      $this->firephp->log($search_mode_req, '$search_mode_req');
      $this->firephp->log($search_limit_req, '$search_limit_req');
      $this->firephp->log($search_img_description_req, '$search_img_description_req');
      $this->firephp->log($search_img_comment_req, '$search_img_comment_req');
      $this->firephp->log($search_img_author_req, '$search_img_author_req');
      $this->firephp->log($search_cat_description_req, '$search_cat_description_req');
      $this->firephp->log($search_categories_req, '$search_categories_req');
      $this->firephp->log($search_subcats_req, '$search_subcats_req');
      $this->firephp->log($search_img_owner_req, '$search_img_owner_req');
      $this->firephp->log($search_cat_owner_req, '$search_cat_owner_req');
    }

    if(isset($search_mode_req))
    {
      switch($search_mode_req)
      {
        // Mode images
        case 1:
        default:
          if(    isset($search_img_description_req)
              && isset($search_img_comment_req)
              && isset($search_img_author_req)
            )
          {
            $this->_search_img_description  = $search_img_description_req;
            $this->_search_img_comment      = $search_img_comment_req;
            $this->_search_img_author       = $search_img_author_req;
            if(isset($search_img_owner_req))
            {
              $this->_search_img_owner      = $search_img_owner_req;
            }
            else
            {
              $this->_search_img_owner      = $search_img_author_req;
            }
            $this->_search_mode = 0;
            $overwrite = true;
          }
          break;
        // Mode categories
        case 0:
          if(isset($search_cat_description_req))
          {
            $this->_search_cat_description  = $search_cat_description_req;
            $this->_search_mode             = 1;
            if(isset($search_cat_owner_req))
            {
              $this->_search_cat_owner      = $search_cat_owner_req;
            }
            $overwrite = true;
          }
          break;
      }

      if($overwrite)
      {
        // Is there a search limit defined in the request
        if(isset($search_limit_req))
        {
          $this->_search_limit = $search_limit_req;
        }
        // Should the search be restricted to certain categories ?
        if(isset($search_categories_req) && isset($search_subcats_req))
        {
          $search_categories_req = $this->cleanCSV($search_categories_req);
          if($search_categories_req != '')
          {
            $cats = explode(',', $search_categories_req);
            // Delete double values
            $cats = array_unique($cats);

            if($search_subcats_req == 1)
            {
              // Add all subcategories to the given category list
              $this->_search_categories = array();
              foreach($cats as $cat)
              {
                if(!in_array($cat, $this->_search_categories ))
                {
                  $this->_search_categories = array_merge($this->_search_categories, JoomHelper::getAllSubCategories($cat, true, true, false, false));
                }
              }
            }
            else
            {
              $this->_search_categories = $cats;
            }
          }
          if(defined('_JG_SEARCH_DEBUG'))
          {
            $this->firephp->log($this->_search_categories, '$this->_search_categories');
          }
        }
      }
    }

    if(defined('_JG_SEARCH_DEBUG'))
    {
      $this->firephp->log($overwrite, '$overwrite');
    }

    // Internal parameters
    $this->_search_img_title = 0;
    $this->_search_cat_title = 0;

    // Patch parameters regarding to search mode
    switch($this->_search_mode)
    {
      case 0:
      default:
        // Mode images
        $this->_search_img_title        = 1;
        $this->_search_cat_title        = 0;
        $this->_search_cat_description  = 0;
        $this->_search_cat_owner        = 0;
        break;
      case 1:
        // Mode categories
        $this->_jg_interface->addConfig('catlink', 1);
        $this->_search_cat_title        = 1;
        $this->_search_img_description  = 0;
        $this->_search_img_comment      = 0;
        $this->_search_img_author       = 0;
        $this->_search_img_owner        = 0;
        break;
    }
  }
  /**
  * Function to clean strings from smilies and bbCode.
  *
  * @param    string    $text
  * @return   string    $text   cleaned text
  */
  private function cleantext($text)
  {
    // Remove whitespace at start and end of the text
    $text   = trim($text);
    $smiley = JoomHelper::getSmileys();

    // Removing smilies
    foreach($smiley as $i => $sm)
    {
      $text = str_replace($i, '', $text);
    }

    // Remove BBCode
    $BBCodes  = array( '[url]', '[/url]', '[email]', '[/email]', '[b]', '[i]', '[u]', '[/b]', '[/i]', '[/u]',
                       '[URL]', '[/URL]', '[EMAIL]', '[/EMAIL]', '[B]', '[I]', '[U]', '[/B]', '[/I]', '[/U]'
                     );
    foreach($BBCodes as $replace)
    {
      $text = str_replace($replace, '', $text);
    }

    // Getting rid of further html code is done by the search component
    return $text;
  }
  /**
  * Function to clean CSV lists.
  *
  * @param    string    $csv_list
  * @return   string    $csv_list   cleaned CSV list
  */
  private function cleanCSV($csv_list)
  {
    $search[0]  = '/[^0-9,]/m';
    $search[1]  = '/,{2,}/m';
    $search[2]  = '/,+$/m';
    $search[3]  = '/^,+/m';
    $replace[0] = ',';
    $replace[1] = ',';
    $replace[2] = '';
    $replace[3] = '';
    $csv_list   = preg_replace($search, $replace, trim( $csv_list));

    if(defined('_JG_SEARCH_DEBUG'))
    {
      $this->firephp->log($csv_list, '$csv_list');
    }

    return $csv_list;
  }
  /**
  * Function to build the database clause for result filtering.
  *
  * @param    string    $text     Search pattern
  * @param    string    $phrase   Additional search criteria (exact, any, all)
  * @param    boolean   $phrase   Build clause for comment search only
  * @param    string    $type     Type the clause is built for, either 'images' or 'categories'
  * @return   string    $clause   Database WHERE clause
  */
  private function getWhereClause($text, $phrase, $comment_clause_only = false, $type = 'images')
  {
    $where  = '';
    $db     = JFactory::getDBO();

    switch($phrase)
    {
      case 'exact':
        $text     = $db->Quote('%'.$db->escape($text, true).'%', false);
        $wheres2  = array();
        if($this->_search_img_title == 1 && !$comment_clause_only)
        {
          $wheres2[] = 'LOWER(imgtitle) LIKE '.$text;
        }
        if($this->_search_img_description == 1 && !$comment_clause_only)
        {
          $wheres2[] = 'LOWER(imgtext) LIKE '.$text;
        }
        if($this->_search_img_comment == 1 && $comment_clause_only)
        {
          $wheres2[] = 'LOWER(cmttext) LIKE '.$text;
        }
        if($this->_search_img_author == 1 && !$comment_clause_only)
        {
          $wheres2[] = 'LOWER(imgauthor) LIKE '.$text;
        }
        if($this->_search_img_owner == 1 && !$comment_clause_only)
        {
          if($this->_jg_interface->getJConfig('jg_realname'))
          {
            $wheres2[] = 'LOWER(u.name) LIKE '.$text;
          }
          else
          {
            $wheres2[] = 'LOWER(u.username) LIKE '.$text;
          }
        }
        if($this->_search_cat_title == 1 && !$comment_clause_only)
        {
          $wheres2[] = 'LOWER(jgc.name) LIKE '.$text;
        }
        if($this->_search_cat_description == 1 && !$comment_clause_only)
        {
          $wheres2[] = 'LOWER(description) LIKE '.$text;
        }
        if($this->_search_cat_owner == 1 && !$comment_clause_only)
        {
          if($this->_jg_interface->getJConfig('jg_realname'))
          {
            $wheres2[] = 'LOWER(u.name) LIKE '.$text;
          }
          else
          {
            $wheres2[] = 'LOWER(u.username) LIKE '.$text;
          }
        }
        if(!$comment_clause_only)
        {
          foreach($this->plugins as $plugin)
          {
            if(isset($plugin[$type.'.where.or']))
            {
              $wheres2[] = $plugin[$type.'.where.or'];
            }
          }
        }
        $where = '('.implode( ') OR (', $wheres2 ).')';
        break;
      case 'all':
      case 'any':
      default:
        $words  = explode(' ', $text);
        $wheres = array();
        foreach($words as $word)
        {
          $text     = $db->Quote('%'.$db->escape($word, true).'%', false);
          $wheres2  = array();
          if($this->_search_img_title == 1 && !$comment_clause_only)
          {
            $wheres2[] = 'LOWER(imgtitle) LIKE '.$text;
          }
          if($this->_search_img_description == 1 && !$comment_clause_only)
          {
            $wheres2[] = 'LOWER(imgtext) LIKE '.$text;
          }
          if($this->_search_img_comment == 1 && $comment_clause_only)
          {
            $wheres2[] = 'LOWER(cmttext) LIKE '.$text;
          }
          if($this->_search_img_author == 1 && !$comment_clause_only)
          {
            $wheres2[] = 'LOWER(imgauthor) LIKE '.$text;
          }
          if($this->_search_img_owner == 1 && !$comment_clause_only)
          {
            if($this->_jg_interface->getJConfig('jg_realname'))
            {
              $wheres2[] = 'LOWER(u.name) LIKE '.$text;
            }
            else
            {
              $wheres2[] = 'LOWER(u.username) LIKE '.$text;
            }
          }
          if($this->_search_cat_title == 1 && !$comment_clause_only)
          {
            $wheres2[] = 'LOWER(jgc.name) LIKE '.$text;
          }
          if($this->_search_cat_description == 1 && !$comment_clause_only)
          {
            $wheres2[] = 'LOWER(description) LIKE '.$text;
          }
          if($this->_search_cat_owner == 1 && !$comment_clause_only)
          {
            if($this->_jg_interface->getJConfig('jg_realname'))
            {
              $wheres2[] = 'LOWER(u.name) LIKE '.$text;
            }
            else
            {
              $wheres2[] = 'LOWER(u.username) LIKE '.$text;
            }
          }
          if(!$comment_clause_only)
          {
            foreach($this->plugins as $plugin)
            {
              if(isset($plugin[$type.'.where.or']))
              {
                $wheres2[] = $plugin[$type.'.where.or'];
              }
            }
          }
          $wheres[] = '('.implode( ') OR (', $wheres2 ).')';
        }
        $where = '('.implode(($phrase == 'all' ? ') AND (' : ') OR ('), $wheres).')';
        break;
    }

    return $where;
  }
  /**
  * Function to build the database clause for result ordering.
  *
  * @param    string    $ordering     Additional search criteria for sorting results
  * @param    int       $search_mode  Search mode (images or categories) for sorting results
  * @return   string    $clause       Database ORDER BY clause
  */
  private function getOrderByClause($ordering, $search_mode = NULL)
  {
    $clause = '';
    if($search_mode === NULL)
    {
      $search_mode = $this->_search_mode;
    }
    switch($ordering)
    {
      case 'newest':
      default:
        if($search_mode == 0)
        {
          $clause = 'created DESC';
        }
        else
        {
          $clause = 'cid DESC';
        }
        break;
      case 'oldest':
        if($search_mode == 0)
        {
          $clause = 'created ASC';
        }
        else
        {
          $clause = 'cid ASC';
        }
        break;
      case 'popular':
        if($search_mode == 0)
        {
          $clause = 'hits DESC';
        }
        else
        {
          // Not possible yet for categories
          $clause = 'jgc.name ASC';
        }
        break;
      case 'alpha':
        if($search_mode == 0)
        {
          $clause = 'imgtitle ASC';
        }
        else
        {
          $clause = 'jgc.name ASC';
        }
        break;
      case 'category':
        $clause = 'name ASC';
        break;
    }

    return $clause;
  }
  /**
  * Called by the framework to add search areas.
  *
  * @return   array   $areas    An array of search areas
  */
  public function onContentSearchAreas()
  {
    static $areas = array('joomgallery' => 'COM_JOOMGALLERY_COMMON_GALLERY');
    return $areas;
  }
  /**
  * Called by the framework to get search results.
  *
  * @param    string    $text     Search pattern
  * @param    string    $phrase   Additional search criteria (exact, any, all)
  * @param    string    $ordering Additional search criteria for sorting results
  * @param    array     $areas    Areas to search in
  * @return   array     $rows     An array of search results
  */
  public function onContentSearch($text, $phrase = '', $ordering = '', $areas = null)
  {
    $db   = JFactory::getDBO();
    $user = JFactory::getUser();

    // Check, if search string is not empty
    $text = trim($text);
    if($text == '')
    {
      return array();
    }

    // Check, if JoomGallery is within the selected search areas
    if(is_array($areas))
    {
      if(!array_intersect($areas, array_keys($this->onContentSearchAreas())))
      {
        return array();
      }
    }

    if(defined('_JG_SEARCH_DEBUG'))
    {
      $this->p->mark('SQL-Start');
    }

    // We need all allowed categories for this user to check category inheritance
    $allowed_cids = implode(',', array_keys($this->_jg_interface->getAmbit()->getCategoryStructure()));

    // Get allowed viewlevels for this user
    $authorisedViewLevels = implode(',', $user->getAuthorisedViewLevels());

    if(defined('_JG_SEARCH_DEBUG'))
    {
      $this->firephp->log($allowed_cids, 'allowed_cids');
    }

    if(empty($allowed_cids) || empty($authorisedViewLevels))
    {
      return array();
    }

    $aliases = array('images' => 'jg', 'categories' => 'jgc');
    $this->plugins = JDispatcher::getInstance()->trigger('onJoomSearch', array($text, $aliases));

    switch($this->_search_mode)
    {
      // Search mode is 'images'
      case 0:
      default:
        $imgquery = $db->getQuery(true)
                 ->select('jg.id, jg.catid, jg.imgtitle, jg.imgauthor, jg.imgtext, jg.hits')
                 ->select('jg.imgfilename, jg.imgthumbname, jg.owner AS imgowner')
                 ->select('jg.imgdate AS created, @is_comment:=0 AS iscomment')
                 ->select('jgc.cid, jgc.name, jgc.description, jgc.thumbnail, jgc.catpath')
                 ->select('@cmtid as cmtid, @cmtpic as cmtpic, @cmttext as cmttext')
                 ->select('u.name AS uname, u.username AS uusername')
                 ->from(_JOOM_TABLE_IMAGES.' AS jg')
                 ->leftJoin(_JOOM_TABLE_CATEGORIES.' AS jgc ON jg.catid = jgc.cid')
                 ->leftJoin('#__users AS u ON jg.owner = u.id');
        foreach($this->plugins as $plugin)
        {
          if(isset($plugin['images.leftjoin']))
          {
            $imgquery->leftJoin($plugin['images.leftjoin']);
          }
        }
        $imgquery->where('('.$this->getWhereClause($text, $phrase).')')
                 ->where('jg.published = 1')
                 ->where('jg.approved = 1')
                 ->where('jg.access IN ('.$authorisedViewLevels.')')
                 ->where('jgc.published = 1')
                 ->where('jgc.exclude_search = 0')
                 ->where('jgc.cid IN ('.$allowed_cids.')')
                 ->where('jgc.access IN ('.$authorisedViewLevels.')');
        if(!$this->_search_hidden)
        {
          $imgquery->where('jgc.hidden = 0')
                   ->where('jgc.in_hidden = 0')
                   ->where('jg.hidden = 0');
        }
        if(isset($this->_search_categories))
        {
          $imgquery->where('jgc.cid IN ('.implode(',', $this->_search_categories).')');
        }
        foreach($this->plugins as $plugin)
        {
          if(isset($plugin['images.where']))
          {
            $imgquery->where($plugin['images.where']);
          }
        }
        $imgquery->group('jg.id');

        if($this->_search_img_comment == 1)
        {
          $cmtquery = $db->getQuery(true)
                   ->select('jg.id, jg.catid, jg.imgtitle, jg.imgauthor, jg.imgtext, jg.hits')
                   ->select('jg.imgfilename, jg.imgthumbname, jg.owner AS imgowner')
                   ->select('jg.imgdate AS created, @is_comment:=1 AS iscomment')
                   ->select('jgc.cid, jgc.name, jgc.description, jgc.thumbnail, jgc.catpath')
                   ->select('@cmtid as cmtid, @cmtpic as cmtpic, @cmttext as cmttext')
                   ->select('u.name AS uname, u.username AS uusername')
                   ->from(_JOOM_TABLE_COMMENTS.' AS jgco')
                   ->leftJoin(_JOOM_TABLE_IMAGES.' AS jg ON jgco.cmtpic = jg.id')
                   ->leftJoin(_JOOM_TABLE_CATEGORIES.' AS jgc ON jg.catid = jgc.cid')
                   ->leftJoin('#__users AS u ON jg.owner = u.id')
                   ->where('('.$this->getWhereClause($text, $phrase, true).')')
                   ->where('jg.published = 1')
                   ->where('jg.approved = 1')
                   ->where('jg.access IN ('.$authorisedViewLevels.')')
                   ->where('jgc.published = 1')
                   ->where('jgc.exclude_search = 0')
                   ->where('jgc.cid IN ('.$allowed_cids.')')
                   ->where('jgc.access IN ('.$authorisedViewLevels.')')
                   ->where('jgco.published = 1')
                   ->where('jgco.approved  = 1');
          if(!$this->_search_hidden)
          {
            $cmtquery->where('jgc.hidden = 0')
                     ->where('jgc.in_hidden = 0')
                     ->where('jg.hidden = 0');
          }
          if(isset($this->_search_categories))
          {
            $cmtquery->where('jgc.cid IN (' . implode(',', $this->_search_categories) . ')');
          }
          // Comment following line to get all comments for a single image containing the search pattern
          $cmtquery->group('jg.id');

          // Combine images and comments query
          // Not working yet, unionAll() seems to be still buggy
          /*
          $query = $db->getQuery(true)
                ->unionAll($imgquery)
                ->unionAll($cmtquery)
                ->order($this->getOrderByClause($ordering));
          */

          $query = '('.$imgquery->__toString().')'.' UNION ALL ('.$cmtquery->__toString().') ORDER BY '.$this->getOrderByClause($ordering);
        }
        else
        {
          $imgquery->order($this->getOrderByClause($ordering));
          $query = $imgquery;
        }
        break;
      // Search mode is 'categories'
      case 1:
        $query = $db->getQuery(true)
              ->select('jgc.cid, jgc.name, jgc.description, jgc.thumbnail, jgc.catpath')
              ->select('jgc.owner AS catowner, jgc.level, jg.id, jg.catid, jg.imgtitle')
              ->select('jg.imgauthor, jg.imgtext, jg.hits, jg.imgfilename, jg.imgthumbname')
              ->select('u.name AS uname, u.username AS uusername')
              ->from(_JOOM_TABLE_CATEGORIES.' AS jgc')
              ->leftJoin(_JOOM_TABLE_IMAGES.' AS jg ON jgc.thumbnail = jg.id')
              ->leftJoin('#__users AS u ON jgc.owner = u.id');
        foreach($this->plugins as $plugin)
        {
          if(isset($plugin['categories.leftjoin']))
          {
            $query->leftJoin($plugin['categories.leftjoin']);
          }
        }
        $query->where('('.$this->getWhereClause($text, $phrase, false, 'categories').')')
              ->where('(jg.published = 1 OR ISNULL(jg.published))')
              ->where('(jg.approved = 1 OR ISNULL(jg.approved))')
              ->where('(jg.access IN ('.$authorisedViewLevels.') OR ISNULL(jg.access))')
              ->where('jgc.published = 1')
              ->where('jgc.exclude_search = 0')
              ->where('jgc.cid IN ('.$allowed_cids.')')
              ->where('jgc.access IN ('.$authorisedViewLevels.')');
        if(!$this->_search_hidden)
        {
          $query->where('jgc.hidden = 0')
                ->where('jgc.in_hidden = 0');
        }
        if(isset($this->_search_categories))
        {
          $query->where('jgc.cid IN ('.implode(',', $this->_search_categories).')');
        }
        foreach($this->plugins as $plugin)
        {
          if(isset($plugin['categories.where']))
          {
            $query->where($plugin['categories.where']);
          }
        }
        $query->group('jgc.cid')
              ->order($this->getOrderByClause($ordering));
        break;
    }

    if(defined('_JG_SEARCH_DEBUG'))
    {
      if($query instanceof JDatabaseQuery)
      {
        $this->firephp->log($query->__toString(), 'Query');
      }
      else
      {
        $this->firephp->log($query, 'Query');
      }
    }

    // Limit the result list
    if($this->_search_limit > 0)
    {
      $db->setQuery($query, 0, $this->_search_limit);
    }
    else
    {
      $db->setQuery($query);
    }

    // Get the result list from database
    if(is_null($rows = $db->loadObjectList()))
    {
      return array();
    }

    if(defined('_JG_SEARCH_DEBUG'))
    {
      $this->p->mark('SQL-End');
    }

    // Load JoomGallery's styles
    $this->_jg_interface->getPageHeader();

    $initThumbQuery = true;
    foreach($rows as $key => $row)
    {
      $rows[$key]->text = '';
      switch($this->_search_mode)
      {
        // Search mode is images
        case 0:
        default:
          $rows[$key]->title = $row->imgtitle;
          $rows[$key]->href  = $this->_jg_interface->getImageLink($row);
          if($this->_search_tmpl_overwrite == 1)
          {
            $rows[$key]->joomgallerypicture = $this->_jg_interface->displayThumb($row, true, null, null, null, false);
            $rows[$key]->joomgallerypicture = str_replace(' class="jg_catelem_photo"', '', $rows[$key]->joomgallerypicture);
          }
          break;
        // Search mode is categories
        case 1:
          $rows[$key]->title    = $row->name;
          $rows[$key]->href     = JRoute::_('index.php?option=com_joomgallery&view=category&catid=' . $row->cid.$this->_jg_interface->getJoomId());
          $rows[$key]->created  = 0;

          if(   $this->_search_tmpl_overwrite == 1
             && (
                    ($this->_jg_interface->getJConfig('jg_showcatthumb') > 0 && $row->level == 1)
                 || ($this->_jg_interface->getJConfig('jg_showsubthumbs') > 0 && $row->level > 1)
                )
            )
          {
            // A thumb should be shown
            if(    $row->thumbnail
                && $row->id
                && (
                       (($this->_jg_interface->getJConfig('jg_showcatthumb') == 2 || $this->_jg_interface->getJConfig('jg_showcatthumb') == 3) && $row->level == 1)
                    || (($this->_jg_interface->getJConfig('jg_showsubthumbs') == 1 || $this->_jg_interface->getJConfig('jg_showsubthumbs') == 3) && $row->level > 1)
                   )
              )
            {
              // Manual setting of category thumb
              $rows[$key]->joomgallerypicture = $this->_jg_interface->displayThumb($row, true, null, null, null, false);
            }
            else
            {
              if(defined('_JG_SEARCH_DEBUG'))
              {
                $this->p->mark('SubCats Start');
              }

              $allsubcats = JoomHelper::getAllSubCategories($row->cid, true, true, false, !$this->_search_hidden);
              if(!empty($allsubcats))
              {
                if(defined('_JG_SEARCH_DEBUG'))
                {
                  $this->p->mark('GetPic Start');
                }

                if($initThumbQuery)
                {
                  if($query instanceof JDatabaseQuery)
                  {
                    $query->clear();
                  }
                  else
                  {
                    $query = $db->getQuery(true);
                  }
                  $query->select('jg.id, jg.catid, jg.imgtitle, jg.imgauthor, jg.imgtext, jg.hits, jg.imgfilename')
                        ->select('jg.imgthumbname, jg.imgdate AS created, jgc.cid, jgc.catpath')
                        ->from(_JOOM_TABLE_IMAGES.' AS jg')
                        ->leftJoin(_JOOM_TABLE_CATEGORIES.' AS jgc ON jg.catid = jgc.cid')
                        ->order($this->getOrderByClause($ordering, 0));

                  $initThumbQuery = false;
                }
                $query->clear('where')
                      ->where('jg.catid IN ('.implode(',', $allsubcats).')')
                      ->where('jg.published = 1')
                      ->where('jg.approved = 1')
                      ->where('jg.access IN ('.$authorisedViewLevels.')');
                if(!$this->_search_hidden)
                {
                  $query->where('jgc.hidden = 0')
                        ->where('jgc.in_hidden = 0')
                        ->where('jg.hidden = 0');
                }

                $db->setQuery($query, 0, 1);
                $image_row = $db->loadObject();

                if(defined('_JG_SEARCH_DEBUG'))
                {
                  $this->p->mark('GetPic End');
                }

                if(isset($image_row))
                {
                  $rows[$key]->joomgallerypicture = $this->_jg_interface->displayThumb($image_row, true, null, null, null, false);
                }
              }
            }
            if(isset($rows[$key]->joomgallerypicture))
            {
              $rows[$key]->joomgallerypicture = str_replace(' class="jg_catelem_photo"', '', $rows[ $key ]->joomgallerypicture);
            }
          }
          break;
      }
      $rows[$key]->section = JText::_('COM_JOOMGALLERY_COMMON_GALLERY').' / '.$row->name;
      if($this->_search_img_author == 1 && !empty($row->imgauthor))
      {
        $rows[$key]->text .= JText::sprintf('COM_JOOMGALLERY_COMMON_AUTHOR_VAR', $row->imgauthor);
      }
      if($this->_search_img_owner == 1 && !empty($row->imgowner))
      {
        $rows[$key]->text .= !empty($rows[$key]->text) ? ' - ' : '';
        $rows[$key]->text .= JText::sprintf('PLG_SEARCH_JOOMGALLERY_OWNER_VAR',
                                             $this->_jg_interface->getJConfig('jg_realname') ? $row->uname : $row->uusername);
      }
      if($this->_search_img_description == 1 && !empty($row->imgtext) && $row->iscomment == 0)
      {
        $rows[$key]->text .= !empty($rows[$key]->text) ? ' - ' : '';
        $rows[$key]->text .= JText::sprintf('COM_JOOMGALLERY_COMMON_DESCRIPTION_VAR', $row->imgtext);
      }
      if($this->_search_img_comment == 1 && !empty($row->cmttext) && ($row->iscomment == 1))
      {
        $rows[$key]->text .= !empty($rows[$key]->text) ? ' - ' : '';
        $rows[$key]->text .= JText::sprintf('COM_JOOMGALLERY_COMMON_COMMENTS_VAR', $this->cleantext($row->cmttext));
      }
      if($this->_search_cat_owner == 1 && !empty($row->catowner))
      {
        $rows[$key]->text .= !empty($rows[$key]->text) ? ' - ' : '';
        $rows[$key]->text .= JText::sprintf('PLG_SEARCH_JOOMGALLERY_OWNER_VAR',
                                            $this->_jg_interface->getJConfig('jg_realname') ? $row->uname : $row->uusername);
      }
      if($this->_search_cat_description == 1 && !empty($row->description))
      {
        $rows[$key]->text .= !empty($rows[$key]->text) ? ' - ' : '';
        $rows[$key]->text .= JText::sprintf('COM_JOOMGALLERY_COMMON_DESCRIPTION_VAR', $row->description);
      }
      $rows[$key]->browsernav = 2;
    }

    if(defined('_JG_SEARCH_DEBUG'))
    {
      $this->p->mark('SCRIPT-END');
      $this->firephp->log($this->p->getBuffer(), 'Profiler');
    }

    return $rows;
  }
}
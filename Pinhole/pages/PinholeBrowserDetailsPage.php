<?php

require_once 'Swat/SwatHtmlTag.php';
require_once 'Swat/SwatDetailsStore.php';
require_once 'Swat/SwatDetailsViewField.php';
require_once 'Swat/SwatTextCellRenderer.php';
require_once 'Swat/SwatLinkCellRenderer.php';
require_once 'Swat/SwatDate.php';
require_once 'Swat/SwatString.php';
require_once 'Pinhole/Pinhole.php';
require_once 'Pinhole/pages/PinholeBrowserPage.php';
require_once 'Pinhole/dataobjects/PinholePhoto.php';

/**
 * @package   Pinhole
 * @copyright 2007 silverorange
 * @license   http://www.gnu.org/copyleft/lesser.html LGPL License 2.1
 */
class PinholeBrowserDetailsPage extends PinholeBrowserPage
{
	// {{{ protected properties

	/**
	 * @var PinholePhoto
	 */
	protected $photo;

	/**
	 * @var string
	 */
	protected $default_dimension = 'large';

	/**
	 * @var PinholeImageDimension
	 */
	protected $dimension;

	/**
	 * @var ImageDimensionWrapper
	 */
	protected $selectable_dimensions;

	// }}}
	// {{{ public function __construct()

	public function __construct(SiteApplication $app, SiteLayout $layout,
		$photo_id = null, $dimension_shortname = null, $tags = '')
	{
		parent::__construct($app, $layout, $tags);
		$this->ui_xml = 'Pinhole/pages/browser-details.xml';

		$this->createPhoto($photo_id);
		$this->dimension = $this->initDimension($dimension_shortname);
	}

	// }}}
	// {{{ protected function createPhoto()

	protected function createPhoto($photo_id)
	{
		$photo_id = intval($photo_id);
		$photo_class = SwatDBClassMap::get('PinholePhoto');
		$this->photo = new $photo_class();
		$this->photo->setDatabase($this->app->db);
		if ($this->photo->load($photo_id)) {
			// ensure we are loading a photo in the current site instance
			$current_instance_id = $this->app->getInstanceId();

			if ($current_instance_id === null)
				$photo_instance_id = $this->photo->image_set->instance;
			else
				$photo_instance_id = $this->photo->image_set->instance->id;

			if ($photo_instance_id != $current_instance_id) {
				// TODO: make exception nicer when instance is null
				throw new SiteNotFoundException(sprintf(
					'Photo does not belong to the current instance: %s.',
					$this->app->getInstance()->shortname));
			}
		} else {
			// photo was not found
			throw new SiteNotFoundException(sprintf(
				'No photo with the id %d exists.', $photo_id));
		}
	}

	// }}}
	// {{{ protected function initDimension()

	protected function initDimension($shortname = null)
	{
		if ($shortname === null) {
			if (isset($this->app->cookie->display_dimension))
				$shortname = $this->app->cookie->display_dimension;
			else
				$shortname = $this->default_dimension;
		}

		$class_name = SwatDBClassMap::get('PinholeImageDimension');
		$display_dimension = new $class_name();
		$display_dimension->setDatabase($this->app->db);
		$display_dimension->loadByShortname('photos', $shortname);

		if ($display_dimension === null || !$display_dimension->selectable)
			throw new SiteNotFoundException(sprintf('Dimension “%s” is not '.
				'a selectable photo dimension', $shortname));

		$this->app->cookie->setCookie('display_dimension',
			$shortname, strtotime('+1 year'), '/',
			$this->app->getBaseHref());

		return $this->photo->getClosestSelectableDimensionTo($shortname);
	}

	// }}}

	// build phase
	// {{{ protected function buildInternal()

	protected function buildInternal()
	{
		parent::buildInternal();

		$view = $this->ui->getWidget('photo_details_view');
		$view->data = $this->getPhotoDetailsStore();

		$this->buildMetaData();
		$this->buildLayout();
		$this->buildPhotoNextPrev();

		$description = $this->ui->getWidget('description');

		// Set to text/xml for now pending review in ticket #1159.
		$description->content_type = 'text/xml';
		$description->content = $this->photo->description;
	}

	// }}}
	// {{{ protected function buildLayout()

	protected function buildLayout()
	{
		$title = $this->photo->getTitle();

		if (isset($this->layout->navbar)) {
			if ($title == '')
				$this->layout->navbar->createEntry(Pinhole::_('Photo'));
			else
				$this->layout->navbar->createEntry($title);
		}

		// Set YUI Grid CSS class for one full-width column on details page.
		$this->layout->data->yui_grid_class = 'yui-t7';

		// Set photo title.
		if ($title != '')
			$this->layout->data->title = SwatString::minimizeEntities($title);

		if ($this->photo->description != '')
			$this->layout->data->meta_description.=
				(($this->layout->data->meta_description == '') ? '' : ' ').
				$this->photo->description;

		if (count($this->photo->tags) != 0) {
			$tags = array();
			foreach ($this->photo->tags as $tag)
				$tags[] = $tag->title;

			$this->layout->data->meta_keywords.=
				(($this->layout->data->meta_keywords == '') ? '' : ' ').
				implode(', ', $tags);
		}
	}

	// }}}
	// {{{ protected function buildMetaData()

	protected function buildMetaData()
	{
		$view = $this->ui->getWidget('photo_details_view');

		foreach ($this->photo->meta_data as $meta_data) {
			$field = new SwatDetailsViewField();
			$field->title = $meta_data->title;

			if ($meta_data->machine_tag) {
				$renderer = new SwatLinkCellRenderer();
				$renderer->link = sprintf('%stag?%s',
					$this->app->config->pinhole->path,
					$meta_data->getURI());
			} else {
				$renderer = new SwatTextCellRenderer();
			}

			$renderer->text = $meta_data->value;

			$view->appendField($field);
			$field->addRenderer($renderer);
		}

	}

	// }}}
	// {{{ protected function buildPhotoNextPrev()

	protected function buildPhotoNextPrev()
	{
		$photo_next_prev = $this->ui->getWidget('photo_next_prev');
		$photo_next_prev->setPhoto($this->photo);
		$photo_next_prev->setTagList($this->tag_list);
		$photo_next_prev->base = $this->app->config->pinhole->path;
	}

	// }}}
	// {{{ protected function getPhotoDetailsStore()

	protected function getPhotoDetailsStore()
	{
		return new SwatDetailsStore($this->photo);
	}

	// }}}
	// {{{ protected function buildTagListView()

	protected function buildTagListView()
	{
		if (!$this->ui->hasWidget('tag_list_view'))
			return;

		parent::buildTagListView();

		$tag_list_view = $this->ui->getWidget('tag_list_view');
		$tag_list_view->rss_dimension_shortname =
			$this->dimension->shortname;
	}

	// }}}
	// {{{ protected function getSubTagList()

	protected function getSubTagList()
	{
		return parent::getSubTagList()->intersect($this->photo->tags);
	}

	// }}}
	// {{{ protected function displayPhoto()

	protected function displayPhoto()
	{
		$original_width = $this->photo->getWidth('original');
		$large_width = $this->photo->getWidth('large');
		$link_to_original = ($original_width > $large_width * 1.1);

		if ($link_to_original) {
			$a_tag = new SwatHtmlTag('a');
			$a_tag->href = $this->photo->getUri('original');
			$a_tag->title = Pinhole::_('View full-size image');
			$a_tag->open();
		}

		$img_tag = $this->photo->getImgTag(
			$this->dimension->shortname);

		$img_tag->class = 'pinhole-photo pinhole-photo-primary';
		$img_tag->display();

		if ($link_to_original)
			$a_tag->close();
	}

	// }}}
	// {{{ protected function displayContent()

	protected function displayContent()
	{
		$this->displayPhoto();
		$this->displayDimensions();
		parent::displayContent();
	}

	// }}}
	// {{{ protected function displayDimensions()

	protected function displayDimensions()
	{
		$dimensions = clone $this->photo->getSelectableDimensions();

		if (count($dimensions) <= 1)
			return;

		$div_tag = new SwatHtmlTag('div');
		$div_tag->class = 'pinhole-photo-dimensions';
		$div_tag->open();

		echo Pinhole::_('Dimensions: ');

		$list = array();

		foreach ($dimensions as $dimension) {
			ob_start();

			if ($dimension->id == $this->dimension->id) {
				$span_tag = new SwatHtmlTag('span');
				$span_tag->setContent($dimension->title);
				$span_tag->display();
			} else {
				$a_tag = new SwatHtmlTag('a');

				if ($dimension->shortname == 'original')
					$a_tag->href = $this->photo->getUri('original');
				else
					$a_tag->href = 'photo/'.$this->photo->id.'/'.
						$dimension->shortname;

				if (count($this->tag_list) > 0)
					$a_tag->href.= '?'.$this->tag_list->__toString();

				$a_tag->setContent($dimension->title);
				$a_tag->display();
			}

			$list[] = ob_get_clean();
		}

		echo implode(', ', $list);

		$div_tag->close();
	}

	// }}}

	// finalize phase
	// {{{ public function finalize()

	public function finalize()
	{
		parent::finalize();
		$this->layout->addHtmlHeadEntrySet(
			$this->ui->getRoot()->getHtmlHeadEntrySet());
	}

	// }}}
}

?>

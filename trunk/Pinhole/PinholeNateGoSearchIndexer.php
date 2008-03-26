<?php

require_once 'Site/SiteNateGoSearchIndexer.php';
require_once 'Pinhole/Pinhole.php';
require_once 'Pinhole/pages/PinholeSearchPage.php';

/**
 * Pinhole search indexer application for NateGoSearch
 *
 * This indexer indexed photos, tags and articles by default.
 * Subclasses may change how and what gets indexed.
 *
 * @package   Pinhole
 * @copyright 2006-2007 silverorange
 * @license   http://www.gnu.org/copyleft/lesser.html LGPL License 2.1
 */
abstract class PinholeNateGoSearchIndexer extends SiteNateGoSearchIndexer
{
	// {{{ public function queue()
	
	/**
	 * Repopulates the entire search queue
	 */
	public function queue()
	{
		$this->queueTags();
		$this->queuePhotos();
	}

	// }}}
	// {{{ protected function index()

	/**
	 * Indexes documents
	 *
	 * Subclasses should override this method to add or remove additional
	 * indexed tables.
	 */
	protected function index()
	{
		$this->indexTags();
		$this->indexPhotos();
	}

	// }}}
	// {{{ protected function queueTags()

	/**
	 * Repopulates the tags queue
	 */
	protected function queueTags()
	{
		$this->output(Pinhole::_('Repopulating tag search queue ... '),
			self::VERBOSITY_ALL);

		// clear queue 
		$sql = sprintf('delete from NateGoSearchQueue
			where document_type = %s',
			$this->db->quote($this->getDocumentType(
				PinholeSearchPage::TYPE_TAGS), 'integer'));

		SwatDB::exec($this->db, $sql);

		// fill queue
		$sql = sprintf('insert into NateGoSearchQueue
			(document_type, document_id) select %s, id from PinholeTag',
			$this->db->quote($this->getDocumentType(
				PinholeSearchPage::TYPE_TAGS), 'integer'));

		SwatDB::exec($this->db, $sql);

		$this->output(Pinhole::_('done')."\n", self::VERBOSITY_ALL);
	}

	// }}}
	// {{{ protected function queuePhotos()

	/**
	 * Repopulates the photos queue
	 */
	protected function queuePhotos()
	{
		$this->output(Pinhole::_('Repopulating photo search queue ... '),
			self::VERBOSITY_ALL);

		// clear queue 
		$sql = sprintf('delete from NateGoSearchQueue
			where document_type = %s',
			$this->db->quote($this->getDocumentType(
				PinholeSearchPage::TYPE_PHOTOS), 'integer'));

		SwatDB::exec($this->db, $sql);

		// fill queue 
		$sql = sprintf('insert into NateGoSearchQueue
			(document_type, document_id) select %s, id from PinholePhoto',
			$this->db->quote($this->getDocumentType(
				PinholeSearchPage::TYPE_PHOTOS), 'integer'));

		SwatDB::exec($this->db, $sql);

		$this->output(Pinhole::_('done')."\n", self::VERBOSITY_ALL);
	}

	// }}}
	// {{{ protected function indexTags()

	/**
	 * Indexes tags
	 */
	protected function indexTags()
	{
		$indexer = new NateGoSearchIndexer(
			$this->getDocumentType(PinholeSearchPage::TYPE_TAGS),
				$this->db);

		$indexer->addTerm(new NateGoSearchTerm('title'));
		$indexer->setMaximumWordLength(32);
		$indexer->addUnindexedWords(
			NateGoSearchIndexer::getDefaultUnindexedWords());

		$sql = sprintf('select PinholeTag.id, PinholeTag.title,
				PinholeTag.name
			from PinholeTag
			inner join NateGoSearchQueue
				on PinholeTag.id = NateGoSearchQueue.document_id
				and NateGoSearchQueue.document_type = %s',
			$this->db->quote($this->getDocumentType(
				PinholeSearchPage::TYPE_TAGS), 'integer'));

		$this->output(Pinhole::_('Indexing tags ... ').'   ',
			self::VERBOSITY_ALL);

		$tags = SwatDB::query($this->db, $sql);
		$total = count($tags);
		$count = 0;
		foreach ($tags as $tag) {

			if ($count % 10 == 0) {
				$indexer->commit();
				$this->output(str_repeat(chr(8), 3), self::VERBOSITY_ALL);
				$this->output(sprintf('%2d%%', ($count / $total) * 100),
					self::VERBOSITY_ALL);
			}

			$document = new NateGoSearchDocument($tag, 'id');
			$indexer->index($document);

			$count++;
		}

		$this->output(str_repeat(chr(8), 3).Pinhole::_('done')."\n",
			self::VERBOSITY_ALL);

		$indexer->commit();
		unset($indexer);

		$sql = sprintf('delete from NateGoSearchQueue where document_type = %s',
			$this->db->quote($this->getDocumentType(
				PinholeSearchPage::TYPE_TAGS), 'integer'));

		SwatDB::exec($this->db, $sql);
	}

	// }}}
	// {{{ protected function indexPhotos()

	protected function indexPhotos()
	{
		$photo_indexer = new NateGoSearchIndexer(
			$this->getDocumentType(PinholeSearchPage::TYPE_PHOTOS),
				$this->db);

		$photo_indexer->addTerm(new NateGoSearchTerm('title', 5));
		$photo_indexer->addTerm(new NateGoSearchTerm('description'));
		$photo_indexer->setMaximumWordLength(32);
		$photo_indexer->addUnindexedWords(
			NateGoSearchIndexer::getDefaultUnindexedWords());

		// the item indexer appends, it gets called after the photo indexer
		$tag_indexer = new NateGoSearchIndexer(
			$this->getDocumentType(PinholeSearchPage::TYPE_PHOTOS),
				$this->db, false, true);

		$tag_indexer->addTerm(new NateGoSearchTerm('tag_title', 3));
		$tag_indexer->addTerm(new NateGoSearchTerm('tag_name'));
		$tag_indexer->addUnindexedWords(
			NateGoSearchIndexer::getDefaultUnindexedWords());

		$sql = sprintf('select PinholePhoto.id, PinholePhoto.title,
				PinholePhoto.description,
				PinholeTag.title as tag_title,
				PinholeTag.name as tag_name
			from PinholePhoto
				left outer join PinholePhotoTagBinding on
					PinholePhotoTagBinding.photo = PinholePhoto.id
				left outer join PinholeTag on
					PinholeTag.id = PinholePhotoTagBinding.tag
				inner join NateGoSearchQueue
					on PinholePhoto.id = NateGoSearchQueue.document_id
					and NateGoSearchQueue.document_type = %s
			order by PinholePhoto.id',
			$this->db->quote($this->getDocumentType(
				PinholeSearchPage::TYPE_PHOTOS), 'integer'));

		$this->output(Pinhole::_('Indexing photos ... ').'   ',
			self::VERBOSITY_ALL);

		$photos = SwatDB::query($this->db, $sql);
		$total = count($photos);
		$count = 0;
		$current_photo_id = null;
		foreach ($photos as $photo) {

			if ($count % 10 == 0) {
				$photo_indexer->commit();
				$tag_indexer->commit();
				$this->output(str_repeat(chr(8), 3), self::VERBOSITY_ALL);
				$this->output(sprintf('%2d%%', ($count / $total) * 100),
					self::VERBOSITY_ALL);
			}

			$document = new NateGoSearchDocument($photo, 'id');

			// only index photo fields once
			if ($photo->id !== $current_photo_id) {
				$photo_indexer->index($document);
				$current_photo_id = $photo->id;
			}

			$tag_indexer->index($document);

			$count++;
		}

		$this->output(str_repeat(chr(8), 3).Pinhole::_('done')."\n",
			self::VERBOSITY_ALL);

		$photo_indexer->commit();
		$tag_indexer->commit();
		unset($photo_indexer);
		unset($tag_indexer);

		$sql = sprintf('delete from NateGoSearchQueue where document_type = %s',
			$this->db->quote($this->getDocumentType(
				PinholeSearchPage::TYPE_PHOTOS), 'integer'));

		SwatDB::exec($this->db, $sql);
	}

	// }}}
	// {{{ abstract protected function getDocumentType()

	/**
	 * Gets the NateGo document type based on a content search type
	 *
	 * @param string $search_type the type of content to search. One of the
	 *                             PinholeSearchPage::TYPE_* constants.
	 *
	 * @return integer the NateGo document type that corresponds to the content
	 *                  search type or null if no document type exists.
	 */
	abstract protected function getDocumentType($search_type);

	// }}}
}

?>
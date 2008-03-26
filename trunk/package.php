<?php

require_once 'PEAR/PackageFileManager2.php';

$version = '1.0.11';
$notes = <<<EOT
see ChangeLog
EOT;

$description =<<<EOT
A package for building gallery sites.
EOT;

$package = new PEAR_PackageFileManager2();
PEAR::setErrorHandling(PEAR_ERROR_DIE);

$result = $package->setOptions(
	array(
		'filelistgenerator' => 'svn',
		'simpleoutput'      => true,
		'baseinstalldir'    => '/',
		'packagedirectory'  => './',
		'dir_roles'         => array(
			'www' => 'data',
			'demo' => 'data',
			'sql' => 'data',
		),
	)
);

$package->setPackage('Pinhole');
$package->setSummary('Framework for building gallery sites');
$package->setDescription($description);
$package->setChannel('pear.silverorange.com');
$package->setPackageType('php');
$package->setLicense('LGPL', 'http://www.gnu.org/copyleft/lesser.html');

$package->setReleaseVersion($version);
$package->setReleaseStability('stable');
$package->setAPIVersion('0.0.1');
$package->setAPIStability('stable');
$package->setNotes($notes);

$package->addIgnore('package.php');
$package->addIgnore('packages/');

$package->addMaintainer('lead', 'nrf', 'Nathan Fredrickson', 'nathan@silverorange.com');
$package->addMaintainer('lead', 'gauthierm', 'Mike Gauthier', 'mike@silverorange.com');

$package->addReplacement('Pinhole/Pinhole.php', 'pear-config', '@DATA-DIR@', 'data_dir');

$package->setPhpDep('5.1.5');
$package->setPearinstallerDep('1.4.0');
$package->addPackageDepWithChannel('required', 'Swat', 'pear.silverorange.com', '1.0.13');
$package->addPackageDepWithChannel('required', 'Site', 'pear.silverorange.com', '1.0.0');
$package->addPackageDepWithChannel('required', 'Date', 'pear.silverorange.com', '1.4.7so1');
$package->addPackageDepWithChannel('required', 'MDB2', 'pear.php.net', '2.2.2');
$package->addPackageDepWithChannel('required', 'Mail', 'pear.php.net', '1.1.10');
$package->addPackageDepWithChannel('required', 'Mail_mime', 'pear.silverorange.com', '1.3.0so1');
$package->addPackageDepWithChannel('required', 'XML_RPC2', 'pear.silverorange.com', '0.0.7so2');
$package->generateContents();

if (isset($_GET['make']) || (isset($_SERVER['argv']) && @$_SERVER['argv'][1] == 'make')) {
	$package->writePackageFile();
} else {
	$package->debugPackageFile();
}

?>
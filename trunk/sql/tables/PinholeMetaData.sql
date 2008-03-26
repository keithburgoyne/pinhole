create table PinholeMetaData (
	id serial,
	instance integer not null references PinholeInstance(id),
	shortname varchar(255),
	title varchar(255),
	show boolean default false,
	machine_tag boolean default false,
	displayorder integer not null default 0,
	primary key (id)
);

CREATE INDEX PinholeMetaData_shortname_index ON PinholeMetaData(shortname);
CREATE INDEX PinholeMetaData_instance_index ON PinholeMetaData(instance);

insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('exiftoolversion', 'ExifTool Version Number', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('filename', 'File Name', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('directory', 'Directory', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('filesize', 'File Size', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('filemodifydate', 'File Modification Date/Time', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('filetype', 'File Type', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('mimetype', 'MIME Type', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('make', 'Make', true, true, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('model', 'Camera Model Name', true, true, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('orientation', 'Orientation', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('xresolution', 'X Resolution', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('yresolution', 'Y Resolution', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('resolutionunit', 'Resolution Unit', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('modifydate', 'Modify Date', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('ycbcrpositioning', 'Y Cb Cr Positioning', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('exposuretime', 'Exposure Time', true, true, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('fnumber', 'F Number', true, true, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('exposureprogram', 'Exposure Program', true, true, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('iso', 'ISO', true, true, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('exifversion', 'Exif Version', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('datetimeoriginal', 'Date/Time Original', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('createdate', 'Create Date', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('componentsconfiguration', 'Components Configuration', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('shutterspeedvalue', 'Shutter Speed Value', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('aperturevalue', 'Aperture Value', true, true, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('flash', 'Flash', true, true, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focallength', 'Focal Length', true, true, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('macromode', 'Macro Mode', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('self-timer', 'Self-timer', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('quality', 'Quality', true, true, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('canonflashmode', 'Canon Flash Mode', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('continuousdrive', 'Continuous Drive', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focusmode', 'Focus Mode', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('recordmode', 'Record Mode', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('canonimagesize', 'Canon Image Size', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('easymode', 'Easy Mode', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('digitalzoom', 'Digital Zoom', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('contrast', 'Contrast', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('sharpness', 'Sharpness', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('meteringmode', 'Metering Mode', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focusrange', 'Focus Range', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('canonexposuremode', 'Canon Exposure Mode', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('lenstype', 'Lens Type', true, true, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('longfocal', 'Long Focal', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('shortfocal', 'Short Focal', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focalunits', 'Focal Units', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('flashactivity', 'Flash Activity', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('flashbits', 'Flash Bits', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focuscontinuous', 'Focus Continuous', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('zoomsourcewidth', 'Zoom Source Width', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('zoomtargetwidth', 'Zoom Target Width', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('photoeffect', 'Photo Effect', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focaltype', 'Focal Type', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focalplanexsize', 'Focal Plane X Size', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focalplaneysize', 'Focal Plane Y Size', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('autoiso', 'Auto ISO', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('baseiso', 'Base ISO', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('measuredev', 'Measured EV', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('targetaperture', 'Target Aperture', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('targetexposuretime', 'Target Exposure Time', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('exposurecompensation', 'Exposure Compensation', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('whitebalance', 'White Balance', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('slowshutter', 'Slow Shutter', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('sequencenumber', 'Shot Number In Continuous Burst', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('opticalzoomcode', 'Optical Zoom Code', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('flashguidenumber', 'Flash Guide Number', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('flashexposurecomp', 'Flash Exposure Compensation', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('autoexposurebracketing', 'Auto Exposure Bracketing', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('aebbracketvalue', 'AEB Bracket Value', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focusdistanceupper', 'Focus Distance Upper', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focusdistancelower', 'Focus Distance Lower', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('bulbduration', 'Bulb Duration', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('cameratype', 'Camera Type', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('autorotate', 'Auto Rotate', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('ndfilter', 'ND Filter', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('self-timer2', 'Self-timer 2', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('canonimagetype', 'Canon Image Type', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('canonfirmwareversion', 'Canon Firmware Version', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('ownername', 'Owner Name', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('serialnumber', 'Camera Body No.', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('setbuttoncrosskeysfunc', 'Set Button Cross Keys Func', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('longexposurenoisereduction', 'Long Exposure Noise Reduction', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('flashsyncspeedav', 'Flash Sync Speed Av', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('shutter-aelock', 'Shutter-AE Lock', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('afassistbeam', 'AF Assist Beam', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('exposurelevelincrements', 'Exposure Level Increments', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('mirrorlockup', 'Mirror Lockup', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('ettlii', 'E-TTL II', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('shuttercurtainsync', 'Shutter Curtain Sync', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('canonmodelid', 'Canon Model ID', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('numafpoints', 'Num AF Points', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('canonimagewidth', 'Canon Image Width', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('canonimageheight', 'Canon Image Height', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('canonimagewidthasshot', 'Canon Image Width As Shot', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('canonimageheightasshot', 'Canon Image Height As Shot', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('afpointsused', 'AF Points Used', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('serialnumberformat', 'Serial Number Format', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('originaldecisiondata', 'Original Decision Data', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('filenumber', 'File Number', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('bracketmode', 'Bracket Mode', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('bracketvalue', 'Bracket Value', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('bracketshotnumber', 'Bracket Shot Number', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('noisereduction', 'Noise Reduction', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wbbracketmode', 'WB Bracket Mode', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wbbracketvalueab', 'WB Bracket Value AB', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wbbracketvaluegm', 'WB Bracket Value GM', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('filtereffect', 'Filter Effect', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('toningeffect', 'Toning Effect', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('tonecurve', 'Tone Curve', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('sharpnessfrequency', 'Sharpness Frequency', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('sensorredlevel', 'Sensor Red Level', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('sensorbluelevel', 'Sensor Blue Level', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('whitebalancered', 'White Balance Red', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('whitebalanceblue', 'White Balance Blue', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colortemperature', 'Color Temperature', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('picturestyle', 'Picture Style', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('digitalgain', 'Digital Gain', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wbshiftab', 'WB Shift AB', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wbshiftgm', 'WB Shift GM', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('sensorwidth', 'Sensor Width', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('sensorheight', 'Sensor Height', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('sensorleftborder', 'Sensor Left Border', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('sensortopborder', 'Sensor Top Border', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('sensorrightborder', 'Sensor Right Border', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('sensorbottomborder', 'Sensor Bottom Border', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wb_rggblevelsasshot', 'WB RGGB Levels As Shot', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colortempasshot', 'Color Temp As Shot', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wb_rggblevelsauto', 'WB RGGB Levels Auto', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colortempauto', 'Color Temp Auto', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wb_rggblevelsdaylight', 'WB RGGB Levels Daylight', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colortempdaylight', 'Color Temp Daylight', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wb_rggblevelsshade', 'WB RGGB Levels Shade', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colortempshade', 'Color Temp Shade', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wb_rggblevelscloudy', 'WB RGGB Levels Cloudy', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colortempcloudy', 'Color Temp Cloudy', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wb_rggblevelstungsten', 'WB RGGB Levels Tungsten', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colortemptungsten', 'Color Temp Tungsten', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wb_rggblevelsfluorescent', 'WB RGGB Levels Fluorescent', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colortempfluorescent', 'Color Temp Fluorescent', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wb_rggblevelsflash', 'WB RGGB Levels Flash', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colortempflash', 'Color Temp Flash', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wb_rggblevelscustom1', 'WB RGGB Levels Custom 1', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colortempcustom1', 'Color Temp Custom 1', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wb_rggblevelscustom2', 'WB RGGB Levels Custom 2', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colortempcustom2', 'Color Temp Custom 2', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colorhue', 'Color Hue', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('usercomment', 'User Comment', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('flashpixversion', 'Flashpix Version', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colorspace', 'Color Space', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('exifimagewidth', 'Exif Image Width', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('exifimagelength', 'Exif Image Length', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('interopindex', 'Interoperability Index', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('interopversion', 'Interoperability Version', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focalplanexresolution', 'Focal Plane X Resolution', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focalplaneyresolution', 'Focal Plane Y Resolution', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focalplaneresolutionunit', 'Focal Plane Resolution Unit', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('customrendered', 'Custom Rendered', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('exposuremode', 'Exposure Mode', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('scenecapturetype', 'Scene Capture Type', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('compression', 'Compression', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('thumbnailoffset', 'Thumbnail Offset', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('thumbnaillength', 'Thumbnail Length', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('profilecmmtype', 'Profile CMM Type', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('profileversion', 'Profile Version', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('profileclass', 'Profile Class', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('colorspacedata', 'Color Space Data', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('profileconnectionspace', 'Profile Connection Space', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('profiledatetime', 'Profile Date Time', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('profilefilesignature', 'Profile File Signature', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('primaryplatform', 'Primary Platform', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('cmmflags', 'CMM Flags', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('devicemanufacturer', 'Device Manufacturer', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('devicemodel', 'Device Model', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('deviceattributes', 'Device Attributes', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('renderingintent', 'Rendering Intent', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('connectionspaceilluminant', 'Connection Space Illuminant', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('profilecreator', 'Profile Creator', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('profileid', 'Profile ID', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('redmatrixcolumn', 'Red Matrix Column', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('greenmatrixcolumn', 'Green Matrix Column', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('bluematrixcolumn', 'Blue Matrix Column', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('mediawhitepoint', 'Media White Point', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('chromaticadaptation', 'Chromatic Adaptation', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('redtrc', 'Red Tone Reproduction Curve', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('greentrc', 'Green Tone Reproduction Curve', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('bluetrc', 'Blue Tone Reproduction Curve', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('profiledescription', 'Profile Description', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('profilecopyright', 'Profile Copyright', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('profiledescriptionml', 'Profile Description ML', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('imagewidth', 'Image Width', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('imageheight', 'Image Height', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('aperture', 'Aperture', true, true, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('drivemode', 'Drive Mode', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('flashon', 'Flash', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('imagesize', 'Image Size', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('lens', 'Lens', true, true, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('scalefactor35efl', 'Scale Factor To 35mm Equivalent', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('shootingmode', 'Shooting Mode', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('shutterspeed', 'Shutter Speed', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('thumbnailimage', 'Thumbnail Image', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('wb_rggblevels', 'WB RGGB Levels', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('bluebalance', 'Blue Balance', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('circleofconfusion', 'Circle Of Confusion', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('focallength35efl', 'Focal Length', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('hyperfocaldistance', 'Hyperfocal Distance', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('lens35efl', 'Lens', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('lightvalue', 'Light Value', false, false, 1);
insert into PinholeMetaData (shortname, title, show, machine_tag, instance) values ('redbalance', 'Red Balance', false, false, 1);
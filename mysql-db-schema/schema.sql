/* Creating the datbase*/
CREATE DATABASE IF NOT EXISTS `dating_with_node`;

USE `dating_with_node`;

/* User data is stored here. Authentication would occur against this here.*/
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(40) COLLATE utf8_unicode_ci NOT NULL,	/* random string created during registration. */
  `is_active` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_user_name` (`user_name`),
  UNIQUE KEY `UNIQ_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* User photos are stored here..*/
DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,		/* References the user table*/
  `phototype_id` smallint(6) NOT NULL,		/* References the phototype table*/
  `filelocation` varchar(256) NOT NULL, 	/* Where this picture is stored on the server. */
  `caption` varchar(60) NOT NULL,		/* Something about the photo... */
  `is_primary` tinyint(1) NOT NULL,		
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* User location is stored here..*/
DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (  
  `user_id` int(11) DEFAULT NULL,		/* References the user table*/
  `zipcode` int(5) DEFAULT NULL,		/* If in the US, this will NOT be NULL*/
  `country_id` int(11) DEFAULT NULL,		/* References the country table*/
  `city` varchar(256) NOT NULL, 		/* The city of the user. */
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`user_id`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* User details are stored here..*/
DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (  
  `user_id` int(11) DEFAULT NULL, 		/* References the user table*/
  `location_id` int(11) DEFAULT NULL, 		/* References the location table*/
  `height` decimal(2,1) DEFAULT NULL,		/* in centimeters cm */  
  `bodytype_id` int(11) DEFAULT NULL,		/* References the body type table*/
  `diet_id` int(11) DEFAULT NULL,		/* References the diet type table*/
  `smoke_id` int(11) DEFAULT NULL,		/* References the smoke table*/
  `drug_id` int(11) DEFAULT NULL,		/* References the drug table*/
  `drink_id` int(11) DEFAULT NULL,		/* References the drink table*/
  `education_id` int(11) DEFAULT NULL,		/* References the education table*/    
  `children_id` int(11) DEFAULT NULL,		/* References the children table*/    
  `gender` char(1) 	NOT NULL,    		/* M/F */
  `orientation` char(1) NOT NULL,    		/* S(Straight)/G(Gay)/B(Bisexual) */
  `birth_day` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`user_id`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* Look up tables here..*/
/* Look up table for phototype referenced in the profile table ..*/
DROP TABLE IF EXISTS `phototype`;
CREATE TABLE IF NOT EXISTS `phototype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `phototype` (`description`, `date_created`, `date_updated`) values ('Original', NOW(), NOW());
INSERT INTO `phototype` (`description`, `date_created`, `date_updated`) values ('Thumnail_160X160', NOW(), NOW());

/* Look up table for bodytype referenced in the profile table ..*/
DROP TABLE IF EXISTS `bodytype`;
CREATE TABLE IF NOT EXISTS `bodytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `bodytype` (`description`, `date_created`, `date_updated`) values ('Rather not say', NOW(), NOW());
INSERT INTO `bodytype` (`description`, `date_created`, `date_updated`) values ('Thin', NOW(), NOW());
INSERT INTO `bodytype` (`description`, `date_created`, `date_updated`) values ('Overweight', NOW(), NOW());
INSERT INTO `bodytype` (`description`, `date_created`, `date_updated`) values ('Skinny', NOW(), NOW());
INSERT INTO `bodytype` (`description`, `date_created`, `date_updated`) values ('Average', NOW(), NOW());
INSERT INTO `bodytype` (`description`, `date_created`, `date_updated`) values ('Fit', NOW(), NOW());
INSERT INTO `bodytype` (`description`, `date_created`, `date_updated`) values ('Athletic', NOW(), NOW());
INSERT INTO `bodytype` (`description`, `date_created`, `date_updated`) values ('A little extra', NOW(), NOW());
INSERT INTO `bodytype` (`description`, `date_created`, `date_updated`) values ('Curvy', NOW(), NOW());
INSERT INTO `bodytype` (`description`, `date_created`, `date_updated`) values ('Full figured', NOW(), NOW());

/* Look up table for diet referenced in the profile table ..*/
DROP TABLE IF EXISTS `diet`;
CREATE TABLE IF NOT EXISTS `diet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `diet` (`description`, `date_created`, `date_updated`) values ('Anything', NOW(), NOW());
INSERT INTO `diet` (`description`, `date_created`, `date_updated`) values ('Vegetarian', NOW(), NOW());
INSERT INTO `diet` (`description`, `date_created`, `date_updated`) values ('Vegan', NOW(), NOW());
INSERT INTO `diet` (`description`, `date_created`, `date_updated`) values ('Kosher', NOW(), NOW());
INSERT INTO `diet` (`description`, `date_created`, `date_updated`) values ('Halal', NOW(), NOW());
INSERT INTO `diet` (`description`, `date_created`, `date_updated`) values ('Other', NOW(), NOW());

/* Look up table for smoke referenced in the profile table ..*/
DROP TABLE IF EXISTS `smoke`;
CREATE TABLE IF NOT EXISTS `smoke` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `smoke` (`description`, `date_created`, `date_updated`) values ('Yes', NOW(), NOW());
INSERT INTO `smoke` (`description`, `date_created`, `date_updated`) values ('Sometimes', NOW(), NOW());
INSERT INTO `smoke` (`description`, `date_created`, `date_updated`) values ('When drinking', NOW(), NOW());
INSERT INTO `smoke` (`description`, `date_created`, `date_updated`) values ('Trying to quit', NOW(), NOW());
INSERT INTO `smoke` (`description`, `date_created`, `date_updated`) values ('No', NOW(), NOW());

/* Look up table for drug referenced in the profile table ..*/
DROP TABLE IF EXISTS `drug`;
CREATE TABLE IF NOT EXISTS `drug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `drug` (`description`, `date_created`, `date_updated`) values ('Never', NOW(), NOW());
INSERT INTO `drug` (`description`, `date_created`, `date_updated`) values ('Sometimes', NOW(), NOW());
INSERT INTO `drug` (`description`, `date_created`, `date_updated`) values ('Often', NOW(), NOW());

/* Look up table for drink referenced in the profile table ..*/
DROP TABLE IF EXISTS `drink`;
CREATE TABLE IF NOT EXISTS `drink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `drink` (`description`, `date_created`, `date_updated`) values ('Very often', NOW(), NOW());
INSERT INTO `drink` (`description`, `date_created`, `date_updated`) values ('Often', NOW(), NOW());
INSERT INTO `drink` (`description`, `date_created`, `date_updated`) values ('Socially', NOW(), NOW());
INSERT INTO `drink` (`description`, `date_created`, `date_updated`) values ('Rarely', NOW(), NOW());
INSERT INTO `drink` (`description`, `date_created`, `date_updated`) values ('Not at all', NOW(), NOW());

/* Look up table for education referenced in the profile table ..*/
DROP TABLE IF EXISTS `education`;
CREATE TABLE IF NOT EXISTS `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `education` (`description`, `date_created`, `date_updated`) values ('High school', NOW(), NOW());
INSERT INTO `education` (`description`, `date_created`, `date_updated`) values ('Two-year college', NOW(), NOW());
INSERT INTO `education` (`description`, `date_created`, `date_updated`) values ('College/University', NOW(), NOW());
INSERT INTO `education` (`description`, `date_created`, `date_updated`) values ('Masters', NOW(), NOW());
INSERT INTO `education` (`description`, `date_created`, `date_updated`) values ('Law School', NOW(), NOW());
INSERT INTO `education` (`description`, `date_created`, `date_updated`) values ('Med School', NOW(), NOW());
INSERT INTO `education` (`description`, `date_created`, `date_updated`) values ('Ph.D Program', NOW(), NOW());

/* Look up table for children referenced in the profile table ..*/
DROP TABLE IF EXISTS `children`;
CREATE TABLE IF NOT EXISTS `children` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `children` (`description`, `date_created`, `date_updated`) values ('Might want kids', NOW(), NOW());
INSERT INTO `children` (`description`, `date_created`, `date_updated`) values ('Wants kids', NOW(), NOW());
INSERT INTO `children` (`description`, `date_created`, `date_updated`) values ('Doesn’t want kids', NOW(), NOW());

/* Look up table for country referenced in the profile table ..*/
DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('United States',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('United Kingdom',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Canada',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Australia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Singapore',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Ireland',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('New Zealand',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Philippines',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Sweden',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Finland',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Afghanistan',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Albania',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Algeria',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Andorra',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Angola',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Anguilla',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Antigua and Barbuda',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Argentina',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Armenia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Aruba',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Ashmore and Cartier Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Australia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Austria',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Azerbaijan',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Bahamas',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Bahrain',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Bangladesh',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Barbados',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Belarus',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Belgium',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Belize',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Benin',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Bermuda',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Bhutan',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Bolivia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Bosnia and Herzegovina',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Botswana',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Brazil',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('British Virgin Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Brunei',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Bulgaria',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Burkina Faso',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Burma',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Burundi',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Cambodia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Cameroon',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Canada',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Cape Verde',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Cayman Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Central African Republic',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Chad',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Chile',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('China',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Christmas Island',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Colombia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Comoros',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Congo',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Cook Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Coral Sea Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Costa Rica',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Cote d\'Ivoire',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Croatia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Cuba',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Cyprus',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Czech Republic',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Democratic Republic of the Congo',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Denmark',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Djibouti',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Dominica',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Dominican Republic',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('East Timor',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Ecuador',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Egypt',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('El Salvador',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Equatorial Guinea',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Eritrea',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Estonia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Ethiopia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Europa Island',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Falkland Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Faroe Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Fiji',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Finland',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('France',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('French Guiana',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('French Polynesia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('French Southern and Antarctic Lands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Gabon',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Gambia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Gaza Strip',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Georgia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Germany',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Ghana',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Gibraltar',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Glorioso Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Greece',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Greenland',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Grenada',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Guadeloupe',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Guatemala',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Guernsey',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Guinea',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Guinea-Bissau',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Guyana',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Haiti',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Heard Island and McDonald Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Honduras',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Hong Kong',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Hungary',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Iceland',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('India',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Indonesia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Iran',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Iraq',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Ireland',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Isle of Man',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Israel',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Italy',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Jamaica',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Jan Mayen',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Japan',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Jersey',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Jordan',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Juan de Nova Island',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Kazakhstan',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Kenya',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Kiribati',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Kuwait',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Kyrgyzstan',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Laos',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Latvia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Lebanon',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Lesotho',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Liberia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Libya',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Liechtenstein',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Lithuania',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Luxembourg',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Macau',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Macedonia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Madagascar',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Malawi',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Malaysia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Maldives',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Mali',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Malta',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Marshall Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Martinique',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Mauritania',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Mauritius',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Mayotte',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Mexico',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Micronesia Federal States',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Moldova',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Monaco',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Mongolia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Montenegro',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Montserrat',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Morocco',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Mozambique',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Namibia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Nauru',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Nepal',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Netherlands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Netherlands Antilles',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('New Caledonia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('New Zealand',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Nicaragua',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Niger',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Nigeria',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Niue',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('No Man\'s Land',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Norfolk Island',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('North Korea',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Norway',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Oceans',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Oman',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Pakistan',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Palau',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Panama',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Papua New Guinea',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Paraguay',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Peru',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Philippines',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Pitcairn Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Poland',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Portugal',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Qatar',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Reunion',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Romania',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Russia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Rwanda',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Saint Helena',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Saint Kitts and Nevis',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Saint Lucia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Saint Pierre and Miquelon',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Saint Vincent and the Grenadines',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Samoa',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('San Marino',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Sao Tome and Principe',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Saudi Arabia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Senegal',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Serbia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Seychelles',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Sierra Leone',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Singapore',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Slovakia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Slovenia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Solomon Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Somalia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('South Africa',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('South Georgia and the South Sandwich Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('South Korea',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Spain',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Spratly Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Sri Lanka',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Sudan',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Suriname',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Svalbard',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Swaziland',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Sweden',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Switzerland',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Syria',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Taiwan',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Tajikistan',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Tanzania',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Thailand',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Togo',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Tokelau',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Tonga',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Trinidad and Tobago',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Tunisia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Turkey',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Turkmenistan',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Turks and Caicos Islands',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Tuvalu',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Uganda',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Ukraine',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('United Arab Emirates',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('United Kingdom',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('United States',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Uruguay',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Uzbekistan',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Vanuatu',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Venezuela',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Vietnam',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Wallis and Futuna',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('West Bank',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Western Sahara',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Yemen',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Zambia',NOW(),NOW());
INSERT INTO `country` (`description`, `date_created`, `date_updated`) values ('Zimbabwe',NOW(),NOW());


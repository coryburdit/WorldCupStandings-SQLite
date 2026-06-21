PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE groups(
    id INTEGER PRIMARY KEY,
    TeamName TEXT NOT NULL,
    TeamCode TEXT NOT NULL UNIQUE, -- Added UNIQUE constraint here
    GroupLetter TEXT NOT NULL
);
INSERT INTO "groups" VALUES(1,'Mexico national football team','MEX','A');
INSERT INTO "groups" VALUES(2,'South Korea national football team','KOR','A');
INSERT INTO "groups" VALUES(3,'South Africa national soccer team','RSA','A');
INSERT INTO "groups" VALUES(4,'Czech Republic national football team','CZE','A');
INSERT INTO "groups" VALUES(5,'Canada men''s national soccer team','CAN','B');
INSERT INTO "groups" VALUES(6,'Bosnia and Herzegovina national football team','BIH','B');
INSERT INTO "groups" VALUES(7,'Qatar national football team','QAT','B');
INSERT INTO "groups" VALUES(8,'Switzerland national football team','SUI','B');
INSERT INTO "groups" VALUES(9,'Brazil national football team','BRA','C');
INSERT INTO "groups" VALUES(10,'Morocco national football team','MAR','C');
INSERT INTO "groups" VALUES(11,'Haiti national football team','HAI','C');
INSERT INTO "groups" VALUES(12,'Scotland national football team','SCO','C');
INSERT INTO "groups" VALUES(13,'United States men''s national soccer team','USA','D');
INSERT INTO "groups" VALUES(14,'Paraguay national football team','PAR','D');
INSERT INTO "groups" VALUES(15,'Australia national football team','AUS','D');
INSERT INTO "groups" VALUES(16,'Türkiye national football team','TUR','D');
INSERT INTO "groups" VALUES(17,'Germany national football team','GER','E');
INSERT INTO "groups" VALUES(18,'Côte d''Ivoire national football team','CIV','E');
INSERT INTO "groups" VALUES(19,'Ecuador national football team','ECU','E');
INSERT INTO "groups" VALUES(20,'Curaçao national football team','CUW','E');
INSERT INTO "groups" VALUES(21,'Netherlands national football team','NED','F');
INSERT INTO "groups" VALUES(22,'Japan national football team','JPN','F');
INSERT INTO "groups" VALUES(23,'Sweden men''s national football team','SWE','F');
INSERT INTO "groups" VALUES(24,'Tunisia national football team','TUN','F');
INSERT INTO "groups" VALUES(25,'Belgium national football team','BEL','G');
INSERT INTO "groups" VALUES(26,'Egypt national football team','EGY','G');
INSERT INTO "groups" VALUES(27,'Iran national football team','IRN','G');
INSERT INTO "groups" VALUES(28,'New Zealand national football team','NZL','G');
INSERT INTO "groups" VALUES(29,'Spain national football team','ESP','H');
INSERT INTO "groups" VALUES(30,'Uruguay national football team','URU','H');
INSERT INTO "groups" VALUES(31,'Saudi Arabia national football team','KSA','H');
INSERT INTO "groups" VALUES(32,'Cabo Verde national football team','CPV','H');
INSERT INTO "groups" VALUES(33,'France national football team','FRA','I');
INSERT INTO "groups" VALUES(34,'Senegal national football team','SEN','I');
INSERT INTO "groups" VALUES(35,'Norway national football team','NOR','I');
INSERT INTO "groups" VALUES(36,'Iraq national football team','IRQ','I');
INSERT INTO "groups" VALUES(37,'Argentina national football team','ARG','J');
INSERT INTO "groups" VALUES(38,'Algeria national football team','ALG','J');
INSERT INTO "groups" VALUES(39,'Austria national football team','AUT','J');
INSERT INTO "groups" VALUES(40,'Jordan national football team','JOR','J');
INSERT INTO "groups" VALUES(41,'Portugal national football team','POR','K');
INSERT INTO "groups" VALUES(42,'Colombia national football team','COL','K');
INSERT INTO "groups" VALUES(43,'Uzbekistan national football team','UZB','K');
INSERT INTO "groups" VALUES(44,'DR Congo national football team','COD','K');
INSERT INTO "groups" VALUES(45,'England national football team','ENG','L');
INSERT INTO "groups" VALUES(46,'Croatia national football team','CRO','L');
INSERT INTO "groups" VALUES(47,'Ghana national football team','GHA','L');
INSERT INTO "groups" VALUES(48,'Panama national football team','PAN','L');
INSERT INTO "groups" VALUES(49,'2A','2A','A');
INSERT INTO "groups" VALUES(50,'2B','2B','A');
INSERT INTO "groups" VALUES(51,'1C','1C','C');
INSERT INTO "groups" VALUES(52,'2F','2F','F');
INSERT INTO "groups" VALUES(53,'1E','1E','E');
INSERT INTO "groups" VALUES(54,'3rd','3rd','3rd');
INSERT INTO "groups" VALUES(55,'1F','1F','F');
INSERT INTO "groups" VALUES(56,'2C','2C','C');
INSERT INTO "groups" VALUES(57,'2E','2E','E');
INSERT INTO "groups" VALUES(58,'2I','2I','I');
INSERT INTO "groups" VALUES(59,'1I','1I','I');
INSERT INTO "groups" VALUES(60,'1L','1L','L');
INSERT INTO "groups" VALUES(61,'1G','1G','G');
INSERT INTO "groups" VALUES(62,'1D','1D','D');
INSERT INTO "groups" VALUES(63,'1H','1H','H');
INSERT INTO "groups" VALUES(64,'2J','2J','J');
INSERT INTO "groups" VALUES(65,'2K','2K','K');
INSERT INTO "groups" VALUES(66,'2L','2L','L');
INSERT INTO "groups" VALUES(67,'1B','1B','B');
INSERT INTO "groups" VALUES(68,'2D','2D','D');
INSERT INTO "groups" VALUES(69,'2G','2G','G');
INSERT INTO "groups" VALUES(70,'1J','1J','J');
INSERT INTO "groups" VALUES(71,'2H','2H','H');
INSERT INTO "groups" VALUES(72,'1K','1K','K');
INSERT INTO "groups" VALUES(73,'RD32','RD32','RD32');
INSERT INTO "groups" VALUES(74,'RD16 W1','RD16 W1','RD16');
INSERT INTO "groups" VALUES(75,'RD16 W2','RD16 W2','RD16');
INSERT INTO "groups" VALUES(76,'RD16 W5','RD16 W5','RD16');
INSERT INTO "groups" VALUES(77,'RD16 W6','RD16 W6','RD16');
INSERT INTO "groups" VALUES(78,'RD16 W3','RD16 W3','RD16');
INSERT INTO "groups" VALUES(79,'RD16 W4','RD16 W4','RD16');
INSERT INTO "groups" VALUES(80,'RD16 W7','RD16 W7','RD16');
INSERT INTO "groups" VALUES(81,'RD16 W8','RD16 W8','RD16');
INSERT INTO "groups" VALUES(82,'3rd Place Teams','3RD','3rd');
CREATE TABLE matchresults(
    match_id INTEGER PRIMARY KEY,
    HomeTeamName TEXT NOT NULL,
    HomeTeamCode TEXT NOT NULL,
    status TEXT NOT NULL,
    Home_goals_scored INTEGER NOT NULL DEFAULT 0,
    AwayTeamName TEXT NOT NULL,
    AwayTeamCode TEXT NOT NULL,
    Away_goals_scored INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY (HomeTeamCode) REFERENCES groups(TeamCode), -- Simplified
    FOREIGN KEY (AwayTeamCode) REFERENCES groups(TeamCode)  -- Simplified
);
INSERT INTO matchresults VALUES(760414,'South Korea national football team','KOR','FT',2,'Czech Republic national football team','CZE',1);
INSERT INTO matchresults VALUES(760415,'Mexico national football team','MEX','FT',2,'South Africa national soccer team','RSA',0);
INSERT INTO matchresults VALUES(760416,'Canada men''s national soccer team','CAN','FT',1,'Bosnia and Herzegovina national football team','BIH',1);
INSERT INTO matchresults VALUES(760417,'United States men''s national soccer team','USA','FT',4,'Paraguay national football team','PAR',1);
INSERT INTO matchresults VALUES(760418,'Haiti national football team','HAI','FT',0,'Scotland national football team','SCO',1);
INSERT INTO matchresults VALUES(760419,'Brazil national football team','BRA','FT',1,'Morocco national football team','MAR',1);
INSERT INTO matchresults VALUES(760420,'Qatar national football team','QAT','FT',1,'Switzerland national football team','SUI',1);
INSERT INTO matchresults VALUES(760421,'Australia national football team','AUS','FT',2,'Türkiye national football team','TUR',0);
INSERT INTO matchresults VALUES(760422,'Germany national football team','GER','FT',7,'Curaçao national football team','CUW',1);
INSERT INTO matchresults VALUES(760423,'Côte d''Ivoire national football team','CIV','FT',1,'Ecuador national football team','ECU',0);
INSERT INTO matchresults VALUES(760424,'Sweden men''s national football team','SWE','FT',5,'Tunisia national football team','TUN',1);
INSERT INTO matchresults VALUES(760425,'Netherlands national football team','NED','FT',2,'Japan national football team','JPN',2);
INSERT INTO matchresults VALUES(760426,'Belgium national football team','BEL','FT',1,'Egypt national football team','EGY',1);
INSERT INTO matchresults VALUES(760427,'Iran national football team','IRN','FT',2,'New Zealand national football team','NZL',2);
INSERT INTO matchresults VALUES(760428,'Spain national football team','ESP','FT',0,'Cabo Verde national football team','CPV',0);
INSERT INTO matchresults VALUES(760429,'Saudi Arabia national football team','KSA','FT',1,'Uruguay national football team','URU',1);
INSERT INTO matchresults VALUES(760430,'Iraq national football team','IRQ','FT',1,'Norway national football team','NOR',4);
INSERT INTO matchresults VALUES(760431,'Austria national football team','AUT','FT',3,'Jordan national football team','JOR',1);
INSERT INTO matchresults VALUES(760432,'France national football team','FRA','FT',3,'Senegal national football team','SEN',1);
INSERT INTO matchresults VALUES(760433,'Argentina national football team','ARG','FT',3,'Algeria national football team','ALG',0);
INSERT INTO matchresults VALUES(760434,'Ghana national football team','GHA','FT',1,'Panama national football team','PAN',0);
INSERT INTO matchresults VALUES(760435,'Portugal national football team','POR','FT',1,'DR Congo national football team','COD',1);
INSERT INTO matchresults VALUES(760436,'Uzbekistan national football team','UZB','FT',1,'Colombia national football team','COL',3);
INSERT INTO matchresults VALUES(760437,'England national football team','ENG','FT',4,'Croatia national football team','CRO',2);
INSERT INTO matchresults VALUES(760438,'Czech Republic national football team','CZE','FT',1,'South Africa national soccer team','RSA',1);
INSERT INTO matchresults VALUES(760439,'Switzerland national football team','SUI','FT',4,'Bosnia and Herzegovina national football team','BIH',1);
INSERT INTO matchresults VALUES(760440,'Canada men''s national soccer team','CAN','FT',6,'Qatar national football team','QAT',0);
INSERT INTO matchresults VALUES(760441,'Mexico national football team','MEX','FT',1,'South Korea national football team','KOR',0);
INSERT INTO matchresults VALUES(760442,'United States men''s national soccer team','USA','FT',2,'Australia national football team','AUS',0);
INSERT INTO matchresults VALUES(760443,'Türkiye national football team','TUR','FT',0,'Paraguay national football team','PAR',1);
INSERT INTO matchresults VALUES(760444,'Brazil national football team','BRA','FT',3,'Haiti national football team','HAI',0);
INSERT INTO matchresults VALUES(760445,'Scotland national football team','SCO','FT',0,'Morocco national football team','MAR',1);
INSERT INTO matchresults VALUES(760446,'Ecuador national football team','ECU','FT',0,'Curaçao national football team','CUW',0);
INSERT INTO matchresults VALUES(760447,'Netherlands national football team','NED','FT',5,'Sweden men''s national football team','SWE',1);
INSERT INTO matchresults VALUES(760448,'Germany national football team','GER','FT',2,'Côte d''Ivoire national football team','CIV',1);
INSERT INTO matchresults VALUES(760449,'Tunisia national football team','TUN','Sun, June 20th at 12:00 AM EDT',0,'Japan national football team','JPN',0);
INSERT INTO matchresults VALUES(760450,'Uruguay national football team','URU','Sun, June 21st at 6:00 PM EDT',0,'Cabo Verde national football team','CPV',0);
INSERT INTO matchresults VALUES(760451,'Belgium national football team','BEL','Sun, June 21st at 3:00 PM EDT',0,'Iran national football team','IRN',0);
INSERT INTO matchresults VALUES(760452,'New Zealand national football team','NZL','Sun, June 21st at 9:00 PM EDT',0,'Egypt national football team','EGY',0);
INSERT INTO matchresults VALUES(760453,'Spain national football team','ESP','Sun, June 21st at 12:00 PM EDT',0,'Saudi Arabia national football team','KSA',0);
INSERT INTO matchresults VALUES(760454,'Norway national football team','NOR','Mon, June 22nd at 8:00 PM EDT',0,'Senegal national football team','SEN',0);
INSERT INTO matchresults VALUES(760455,'Jordan national football team','JOR','Mon, June 22nd at 11:00 PM EDT',0,'Algeria national football team','ALG',0);
INSERT INTO matchresults VALUES(760456,'Argentina national football team','ARG','Mon, June 22nd at 1:00 PM EDT',0,'Austria national football team','AUT',0);
INSERT INTO matchresults VALUES(760457,'France national football team','FRA','Mon, June 22nd at 5:00 PM EDT',0,'Iraq national football team','IRQ',0);
INSERT INTO matchresults VALUES(760458,'England national football team','ENG','Tue, June 23rd at 4:00 PM EDT',0,'Ghana national football team','GHA',0);
INSERT INTO matchresults VALUES(760459,'Colombia national football team','COL','Tue, June 23rd at 10:00 PM EDT',0,'DR Congo national football team','COD',0);
INSERT INTO matchresults VALUES(760460,'Panama national football team','PAN','Tue, June 23rd at 7:00 PM EDT',0,'Croatia national football team','CRO',0);
INSERT INTO matchresults VALUES(760461,'Portugal national football team','POR','Tue, June 23rd at 1:00 PM EDT',0,'Uzbekistan national football team','UZB',0);
INSERT INTO matchresults VALUES(760462,'Bosnia and Herzegovina national football team','BIH','Wed, June 24th at 3:00 PM EDT',0,'Qatar national football team','QAT',0);
INSERT INTO matchresults VALUES(760463,'Switzerland national football team','SUI','Wed, June 24th at 3:00 PM EDT',0,'Canada men''s national soccer team','CAN',0);
INSERT INTO matchresults VALUES(760464,'Morocco national football team','MAR','Wed, June 24th at 6:00 PM EDT',0,'Haiti national football team','HAI',0);
INSERT INTO matchresults VALUES(760465,'Scotland national football team','SCO','Wed, June 24th at 6:00 PM EDT',0,'Brazil national football team','BRA',0);
INSERT INTO matchresults VALUES(760466,'South Africa national soccer team','RSA','Wed, June 24th at 9:00 PM EDT',0,'South Korea national football team','KOR',0);
INSERT INTO matchresults VALUES(760467,'Czech Republic national football team','CZE','Wed, June 24th at 9:00 PM EDT',0,'Mexico national football team','MEX',0);
INSERT INTO matchresults VALUES(760468,'Ecuador national football team','ECU','Thu, June 25th at 4:00 PM EDT',0,'Germany national football team','GER',0);
INSERT INTO matchresults VALUES(760469,'Paraguay national football team','PAR','Thu, June 25th at 10:00 PM EDT',0,'Australia national football team','AUS',0);
INSERT INTO matchresults VALUES(760470,'Türkiye national football team','TUR','Thu, June 25th at 10:00 PM EDT',0,'United States men''s national soccer team','USA',0);
INSERT INTO matchresults VALUES(760471,'Japan national football team','JPN','Thu, June 25th at 7:00 PM EDT',0,'Sweden men''s national football team','SWE',0);
INSERT INTO matchresults VALUES(760472,'Tunisia national football team','TUN','Thu, June 25th at 7:00 PM EDT',0,'Netherlands national football team','NED',0);
INSERT INTO matchresults VALUES(760473,'Curaçao national football team','CUW','Thu, June 25th at 4:00 PM EDT',0,'Côte d''Ivoire national football team','CIV',0);
INSERT INTO matchresults VALUES(760474,'Senegal national football team','SEN','Fri, June 26th at 3:00 PM EDT',0,'Iraq national football team','IRQ',0);
INSERT INTO matchresults VALUES(760475,'Norway national football team','NOR','Fri, June 26th at 3:00 PM EDT',0,'France national football team','FRA',0);
INSERT INTO matchresults VALUES(760476,'Egypt national football team','EGY','Fri, June 26th at 11:00 PM EDT',0,'Iran national football team','IRN',0);
INSERT INTO matchresults VALUES(760477,'New Zealand national football team','NZL','Fri, June 26th at 11:00 PM EDT',0,'Belgium national football team','BEL',0);
INSERT INTO matchresults VALUES(760478,'Cabo Verde national football team','CPV','Fri, June 26th at 8:00 PM EDT',0,'Saudi Arabia national football team','KSA',0);
INSERT INTO matchresults VALUES(760479,'Uruguay national football team','URU','Fri, June 26th at 8:00 PM EDT',0,'Spain national football team','ESP',0);
INSERT INTO matchresults VALUES(760480,'Croatia national football team','CRO','Sat, June 27th at 5:00 PM EDT',0,'Ghana national football team','GHA',0);
INSERT INTO matchresults VALUES(760481,'Colombia national football team','COL','Sat, June 27th at 7:30 PM EDT',0,'Portugal national football team','POR',0);
INSERT INTO matchresults VALUES(760482,'DR Congo national football team','COD','Sat, June 27th at 7:30 PM EDT',0,'Uzbekistan national football team','UZB',0);
INSERT INTO matchresults VALUES(760483,'Jordan national football team','JOR','Sat, June 27th at 10:00 PM EDT',0,'Argentina national football team','ARG',0);
INSERT INTO matchresults VALUES(760484,'Algeria national football team','ALG','Sat, June 27th at 10:00 PM EDT',0,'Austria national football team','AUT',0);
INSERT INTO matchresults VALUES(760485,'Panama national football team','PAN','Sat, June 27th at 5:00 PM EDT',0,'England national football team','ENG',0);
INSERT INTO matchresults VALUES(760486,'2A','2A','Sun, June 28th at 3:00 PM EDT',0,'2B','2B',0);
INSERT INTO matchresults VALUES(760487,'1C','1C','Mon, June 29th at 1:00 PM EDT',0,'2F','2F',0);
INSERT INTO matchresults VALUES(760488,'1F','1F','Mon, June 29th at 9:00 PM EDT',0,'2C','2C',0);
INSERT INTO matchresults VALUES(760489,'1E','1E','Mon, June 29th at 4:30 PM EDT',0,'3rd Place Teams','3RD',0);
INSERT INTO matchresults VALUES(760490,'2E','2E','Tue, June 30th at 1:00 PM EDT',0,'2I','2I',0);
INSERT INTO matchresults VALUES(760491,'Mexico national football team','MEX','Tue, June 30th at 9:00 PM EDT',0,'3rd Place Teams','3RD',0);
INSERT INTO matchresults VALUES(760492,'1I','1I','Tue, June 30th at 5:00 PM EDT',0,'3rd Place Teams','3RD',0);
INSERT INTO matchresults VALUES(760493,'1G','1G','Wed, July 1st at 4:00 PM EDT',0,'3rd Place Teams','3RD',0);
INSERT INTO matchresults VALUES(760494,'United States men''s national soccer team','USA','Wed, July 1st at 8:00 PM EDT',0,'3rd Place Teams','3RD',0);
INSERT INTO matchresults VALUES(760495,'1L','1L','Wed, July 1st at 12:00 PM EDT',0,'3rd Place Teams','3RD',0);
INSERT INTO matchresults VALUES(760496,'2K','2K','Thu, July 2nd at 7:00 PM EDT',0,'2L','2L',0);
INSERT INTO matchresults VALUES(760497,'1H','1H','Thu, July 2nd at 3:00 PM EDT',0,'2J','2J',0);
INSERT INTO matchresults VALUES(760498,'1B','1B','Thu, July 2nd at 11:00 PM EDT',0,'3rd Place Teams','3RD',0);
INSERT INTO matchresults VALUES(760499,'2D','2D','Fri, July 3rd at 2:00 PM EDT',0,'2G','2G',0);
INSERT INTO matchresults VALUES(760500,'1J','1J','Fri, July 3rd at 6:00 PM EDT',0,'2H','2H',0);
INSERT INTO matchresults VALUES(760501,'1K','1K','Fri, July 3rd at 9:30 PM EDT',0,'3rd Place Teams','3RD',0);
INSERT INTO matchresults VALUES(760502,'RD32','RD32','Sat, July 4th at 1:00 PM EDT',0,'RD32','RD32',0);
INSERT INTO matchresults VALUES(760503,'RD32','RD32','Sat, July 4th at 5:00 PM EDT',0,'RD32','RD32',0);
INSERT INTO matchresults VALUES(760504,'RD32','RD32','Sun, July 5th at 4:00 PM EDT',0,'RD32','RD32',0);
INSERT INTO matchresults VALUES(760505,'RD32','RD32','Sun, July 5th at 8:00 PM EDT',0,'RD32','RD32',0);
INSERT INTO matchresults VALUES(760506,'RD32','RD32','Mon, July 6th at 3:00 PM EDT',0,'RD32','RD32',0);
INSERT INTO matchresults VALUES(760507,'RD32','RD32','Mon, July 6th at 8:00 PM EDT',0,'RD32','RD32',0);
INSERT INTO matchresults VALUES(760508,'RD32','RD32','Tue, July 7th at 4:00 PM EDT',0,'RD32','RD32',0);
INSERT INTO matchresults VALUES(760509,'RD32','RD32','Tue, July 7th at 12:00 PM EDT',0,'RD32','RD32',0);
INSERT INTO matchresults VALUES(760510,'RD16 W1','RD16 W1','Thu, July 9th at 4:00 PM EDT',0,'RD16 W2','RD16 W2',0);
INSERT INTO matchresults VALUES(760511,'RD16 W5','RD16 W5','Fri, July 10th at 3:00 PM EDT',0,'RD16 W6','RD16 W6',0);
INSERT INTO matchresults VALUES(760512,'RD16 W3','RD16 W3','Sat, July 11th at 5:00 PM EDT',0,'RD16 W4','RD16 W4',0);
INSERT INTO matchresults VALUES(760513,'RD16 W7','RD16 W7','Sat, July 11th at 9:00 PM EDT',0,'RD16 W8','RD16 W8',0);
CREATE TABLE matcheventlogs (
    event_id INTEGER PRIMARY KEY AUTOINCREMENT,
    match_id INTEGER NOT NULL,
    TeamName TEXT NOT NULL,
    TeamCode TEXT NOT NULL,
    event_type TEXT NOT NULL,
    event_time TEXT NOT NULL,
    player_name TEXT NOT NULL, 
    GroupLetter TEXT,
    FOREIGN KEY (match_id) REFERENCES matchresults(match_id),
    FOREIGN KEY (TeamCode) REFERENCES groups(TeamCode)       -- Simplified
);
INSERT INTO matcheventlogs VALUES(1363,760415,'Mexico national football team','MEX','Goal','9''','Julián Quiñones','A');
INSERT INTO matcheventlogs VALUES(1364,760415,'South Africa national soccer team','RSA','Yellow Card','17''','Teboho Mokoena','A');
INSERT INTO matcheventlogs VALUES(1365,760415,'Mexico national football team','MEX','Yellow Card','23''','Brian Gutiérrez','A');
INSERT INTO matcheventlogs VALUES(1366,760415,'South Africa national soccer team','RSA','Red Card','49''','Sphephelo Sithole','A');
INSERT INTO matcheventlogs VALUES(1367,760415,'Mexico national football team','MEX','Goal','67''','Raúl Jiménez','A');
INSERT INTO matcheventlogs VALUES(1368,760415,'South Africa national soccer team','RSA','Yellow Card','74''','Nkosinathi Sibisi','A');
INSERT INTO matcheventlogs VALUES(1369,760415,'South Africa national soccer team','RSA','Red Card','84''','Themba Zwane','A');
INSERT INTO matcheventlogs VALUES(1370,760415,'Mexico national football team','MEX','Red Card','90''+2''','César Montes','A');
INSERT INTO matcheventlogs VALUES(1371,760414,'Czech Republic national football team','CZE','Goal','59''','Ladislav Krejcí','A');
INSERT INTO matcheventlogs VALUES(1372,760414,'South Korea national football team','KOR','Goal','67''','Hwang In-Beom','A');
INSERT INTO matcheventlogs VALUES(1373,760414,'South Korea national football team','KOR','Goal','80''','Oh Hyeon-Gyu','A');
INSERT INTO matcheventlogs VALUES(1374,760414,'South Korea national football team','KOR','Yellow Card','90''+6''','Lee Gi-Hyuk','A');
INSERT INTO matcheventlogs VALUES(1375,760416,'Canada men''s national soccer team','CAN','Yellow Card','11''','Alistair Johnston','B');
INSERT INTO matcheventlogs VALUES(1376,760416,'Bosnia and Herzegovina national football team','BIH','Goal','21''','Jovo Lukic','B');
INSERT INTO matcheventlogs VALUES(1377,760416,'Bosnia and Herzegovina national football team','BIH','Yellow Card','45''','Ermedin Demirovic','B');
INSERT INTO matcheventlogs VALUES(1378,760416,'Bosnia and Herzegovina national football team','BIH','Yellow Card','45''+1''','Jovo Lukic','B');
INSERT INTO matcheventlogs VALUES(1379,760416,'Canada men''s national soccer team','CAN','Yellow Card','53''','Luc de Fougerolles','B');
INSERT INTO matcheventlogs VALUES(1380,760416,'Canada men''s national soccer team','CAN','Goal','78''','Cyle Larin','B');
INSERT INTO matcheventlogs VALUES(1381,760416,'Bosnia and Herzegovina national football team','BIH','Yellow Card','90''+3''','Nikola Katic','B');
INSERT INTO matcheventlogs VALUES(1382,760417,'United States men''s national soccer team','USA','Goal','7''','Damián Bobadilla','D');
INSERT INTO matcheventlogs VALUES(1383,760417,'Paraguay national football team','PAR','Yellow Card','10''','Juan Jose Cáceres','D');
INSERT INTO matcheventlogs VALUES(1384,760417,'United States men''s national soccer team','USA','Goal','31''','Folarin Balogun','D');
INSERT INTO matcheventlogs VALUES(1385,760417,'United States men''s national soccer team','USA','Goal','45''+5''','Folarin Balogun','D');
INSERT INTO matcheventlogs VALUES(1386,760417,'Paraguay national football team','PAR','Yellow Card','53''','Miguel Almirón','D');
INSERT INTO matcheventlogs VALUES(1387,760417,'United States men''s national soccer team','USA','Yellow Card','59''','Tyler Adams','D');
INSERT INTO matcheventlogs VALUES(1388,760417,'Paraguay national football team','PAR','Goal','73''','Maurício','D');
INSERT INTO matcheventlogs VALUES(1389,760417,'Paraguay national football team','PAR','Yellow Card','79''','Diego Gómez','D');
INSERT INTO matcheventlogs VALUES(1390,760417,'Paraguay national football team','PAR','Yellow Card','88''','Alex Arce','D');
INSERT INTO matcheventlogs VALUES(1391,760417,'Paraguay national football team','PAR','Yellow Card','90''+3''','Júnior Alonso','D');
INSERT INTO matcheventlogs VALUES(1392,760417,'United States men''s national soccer team','USA','Goal','90''+8''','Giovanni Reyna','D');
INSERT INTO matcheventlogs VALUES(1393,760420,'Qatar national football team','QAT','Yellow Card','16''','Mahmoud Abunada','B');
INSERT INTO matcheventlogs VALUES(1394,760420,'Qatar national football team','QAT','Yellow Card','23''','Jassem Gaber','B');
INSERT INTO matcheventlogs VALUES(1395,760420,'Switzerland national football team','SUI','Yellow Card','42''','Denis Zakaria','B');
INSERT INTO matcheventlogs VALUES(1396,760420,'Qatar national football team','QAT','Goal','90''+4''','Miro Muheim','B');
INSERT INTO matcheventlogs VALUES(1397,760419,'Morocco national football team','MAR','Goal','21''','Ismael Saibari','C');
INSERT INTO matcheventlogs VALUES(1398,760419,'Brazil national football team','BRA','Goal','32''','Vinícius Júnior','C');
INSERT INTO matcheventlogs VALUES(1399,760419,'Brazil national football team','BRA','Yellow Card','37''','Casemiro','C');
INSERT INTO matcheventlogs VALUES(1400,760419,'Brazil national football team','BRA','Yellow Card','43''','Roger Ibañez','C');
INSERT INTO matcheventlogs VALUES(1401,760418,'Scotland national football team','SCO','Goal','28''','John McGinn','C');
INSERT INTO matcheventlogs VALUES(1402,760418,'Haiti national football team','HAI','Yellow Card','39''','Jean-Ricner Bellegarde','C');
INSERT INTO matcheventlogs VALUES(1403,760418,'Scotland national football team','SCO','Yellow Card','46''','Aaron Hickey','C');
INSERT INTO matcheventlogs VALUES(1404,760418,'Scotland national football team','SCO','Yellow Card','90''+1''','Findlay Curtis','C');
INSERT INTO matcheventlogs VALUES(1405,760418,'Scotland national football team','SCO','Yellow Card','90''+5''','Kenny McLean','C');
INSERT INTO matcheventlogs VALUES(1406,760421,'Australia national football team','AUS','Goal','27''','Nestory Irankunda','D');
INSERT INTO matcheventlogs VALUES(1407,760421,'Australia national football team','AUS','Goal','75''','Connor Metcalfe','D');
INSERT INTO matcheventlogs VALUES(1408,760421,'Türkiye national football team','TUR','Yellow Card','86''','Yunus Akgün','D');
INSERT INTO matcheventlogs VALUES(1409,760422,'Germany national football team','GER','Goal','6''','Felix Nmecha','E');
INSERT INTO matcheventlogs VALUES(1410,760422,'Curaçao national football team','CUW','Goal','21''','Livano Comenencia','E');
INSERT INTO matcheventlogs VALUES(1411,760422,'Germany national football team','GER','Goal','38''','Nico Schlotterbeck','E');
INSERT INTO matcheventlogs VALUES(1412,760422,'Germany national football team','GER','Goal','47''','Jamal Musiala','E');
INSERT INTO matcheventlogs VALUES(1413,760422,'Germany national football team','GER','Goal','68''','Nathaniel Brown','E');
INSERT INTO matcheventlogs VALUES(1414,760422,'Germany national football team','GER','Goal','78''','Deniz Undav','E');
INSERT INTO matcheventlogs VALUES(1415,760422,'Germany national football team','GER','Goal','88''','Kai Havertz','E');
INSERT INTO matcheventlogs VALUES(1416,760425,'Netherlands national football team','NED','Goal','51''','Virgil van Dijk','F');
INSERT INTO matcheventlogs VALUES(1417,760425,'Japan national football team','JPN','Goal','57''','Keito Nakamura','F');
INSERT INTO matcheventlogs VALUES(1418,760425,'Netherlands national football team','NED','Yellow Card','61''','Crysencio Summerville','F');
INSERT INTO matcheventlogs VALUES(1419,760425,'Netherlands national football team','NED','Goal','64''','Crysencio Summerville','F');
INSERT INTO matcheventlogs VALUES(1420,760425,'Netherlands national football team','NED','Yellow Card','83''','Memphis Depay','F');
INSERT INTO matcheventlogs VALUES(1421,760425,'Japan national football team','JPN','Goal','89''','Daichi Kamada','F');
INSERT INTO matcheventlogs VALUES(1422,760425,'Netherlands national football team','NED','Yellow Card','90''+1''','Micky van de Ven','F');
INSERT INTO matcheventlogs VALUES(1423,760423,'Côte d''Ivoire national football team','CIV','Yellow Card','28''','Seko Fofana','E');
INSERT INTO matcheventlogs VALUES(1424,760423,'Côte d''Ivoire national football team','CIV','Yellow Card','38''','Franck Kessié','E');
INSERT INTO matcheventlogs VALUES(1425,760423,'Côte d''Ivoire national football team','CIV','Yellow Card','40''','Guela Doué','E');
INSERT INTO matcheventlogs VALUES(1426,760423,'Ecuador national football team','ECU','Yellow Card','73''','Jackson Porozo','E');
INSERT INTO matcheventlogs VALUES(1427,760423,'Côte d''Ivoire national football team','CIV','Goal','90''','Amad Diallo','E');
INSERT INTO matcheventlogs VALUES(1428,760424,'Sweden men''s national football team','SWE','Goal','7''','Yasin Ayari','F');
INSERT INTO matcheventlogs VALUES(1429,760424,'Sweden men''s national football team','SWE','Goal','30''','Alexander Isak','F');
INSERT INTO matcheventlogs VALUES(1430,760424,'Tunisia national football team','TUN','Goal','43''','Omar Rekik','F');
INSERT INTO matcheventlogs VALUES(1431,760424,'Tunisia national football team','TUN','Yellow Card','54''','Rani Khedira','F');
INSERT INTO matcheventlogs VALUES(1432,760424,'Sweden men''s national football team','SWE','Goal','59''','Viktor Gyökeres','F');
INSERT INTO matcheventlogs VALUES(1433,760424,'Sweden men''s national football team','SWE','Goal','84''','Mattias Svanberg','F');
INSERT INTO matcheventlogs VALUES(1434,760424,'Sweden men''s national football team','SWE','Goal','90''+6''','Yasin Ayari','F');
INSERT INTO matcheventlogs VALUES(1435,760428,'Cabo Verde national football team','CPV','Yellow Card','16''','Sidny Lopes Cabral','H');
INSERT INTO matcheventlogs VALUES(1436,760428,'Spain national football team','ESP','Yellow Card','90''+3''','Pedri ','H');
INSERT INTO matcheventlogs VALUES(1437,760426,'Egypt national football team','EGY','Yellow Card','13''','Marawan Attia','G');
INSERT INTO matcheventlogs VALUES(1438,760426,'Belgium national football team','BEL','Yellow Card','14''','Timothy Castagne','G');
INSERT INTO matcheventlogs VALUES(1439,760426,'Egypt national football team','EGY','Goal','20''','Emam Ashour','G');
INSERT INTO matcheventlogs VALUES(1440,760426,'Egypt national football team','EGY','Yellow Card','34''','Ahmed Fatouh','G');
INSERT INTO matcheventlogs VALUES(1441,760426,'Belgium national football team','BEL','Goal','66''','Mohamed Hany','G');
INSERT INTO matcheventlogs VALUES(1442,760426,'Belgium national football team','BEL','Yellow Card','75''','Maxim De Cuyper','G');
INSERT INTO matcheventlogs VALUES(1443,760429,'Saudi Arabia national football team','KSA','Goal','41''','Abdulelah Al-Amri','H');
INSERT INTO matcheventlogs VALUES(1444,760429,'Saudi Arabia national football team','KSA','Yellow Card','44''','Abdulelah Al-Amri','H');
INSERT INTO matcheventlogs VALUES(1445,760429,'Uruguay national football team','URU','Goal','80''','Maxi Araújo','H');
INSERT INTO matcheventlogs VALUES(1446,760427,'New Zealand national football team','NZL','Goal','7''','Elijah Just','G');
INSERT INTO matcheventlogs VALUES(1447,760427,'Iran national football team','IRN','Goal','32''','Ramin Rezaeian','G');
INSERT INTO matcheventlogs VALUES(1448,760427,'New Zealand national football team','NZL','Goal','54''','Elijah Just','G');
INSERT INTO matcheventlogs VALUES(1449,760427,'Iran national football team','IRN','Goal','64''','Mohammad Mohebbi','G');
INSERT INTO matcheventlogs VALUES(1450,760427,'Iran national football team','IRN','Yellow Card','89''','Ehsan Hajsafi','G');
INSERT INTO matcheventlogs VALUES(1451,760432,'France national football team','FRA','Goal','66''','Kylian Mbappé','I');
INSERT INTO matcheventlogs VALUES(1452,760432,'France national football team','FRA','Goal','82''','Bradley Barcola','I');
INSERT INTO matcheventlogs VALUES(1453,760432,'Senegal national football team','SEN','Goal','90''+5''','Ibrahim Mbaye','I');
INSERT INTO matcheventlogs VALUES(1454,760432,'France national football team','FRA','Goal','90''+6''','Kylian Mbappé','I');
INSERT INTO matcheventlogs VALUES(1455,760430,'Norway national football team','NOR','Goal','29''','Erling Haaland','I');
INSERT INTO matcheventlogs VALUES(1456,760430,'Iraq national football team','IRQ','Goal','39''','Aymen Hussein','I');
INSERT INTO matcheventlogs VALUES(1457,760430,'Norway national football team','NOR','Goal','43''','Erling Haaland','I');
INSERT INTO matcheventlogs VALUES(1458,760430,'Norway national football team','NOR','Goal','76''','Leo Østigard','I');
INSERT INTO matcheventlogs VALUES(1459,760430,'Iraq national football team','IRQ','Yellow Card','86''','Zaid Tahseen','I');
INSERT INTO matcheventlogs VALUES(1460,760430,'Norway national football team','NOR','Goal','90''+6''','Aymen Hussein','I');
INSERT INTO matcheventlogs VALUES(1461,760433,'Argentina national football team','ARG','Goal','17''','Lionel Messi','J');
INSERT INTO matcheventlogs VALUES(1462,760433,'Argentina national football team','ARG','Goal','60''','Lionel Messi','J');
INSERT INTO matcheventlogs VALUES(1463,760433,'Argentina national football team','ARG','Goal','76''','Lionel Messi','J');
INSERT INTO matcheventlogs VALUES(1464,760431,'Austria national football team','AUT','Goal','21''','Romano Schmid','J');
INSERT INTO matcheventlogs VALUES(1465,760431,'Jordan national football team','JOR','Goal','50''','Ali Olwan','J');
INSERT INTO matcheventlogs VALUES(1466,760431,'Austria national football team','AUT','Goal','76''','Yazan Al-Arab','J');
INSERT INTO matcheventlogs VALUES(1467,760431,'Austria national football team','AUT','Yellow Card','77''','Marcel Sabitzer','J');
INSERT INTO matcheventlogs VALUES(1468,760435,'Portugal national football team','POR','Goal','6''','João Neves','K');
INSERT INTO matcheventlogs VALUES(1469,760435,'Portugal national football team','POR','Yellow Card','13''','Bernardo Silva','K');
INSERT INTO matcheventlogs VALUES(1470,760435,'DR Congo national football team','COD','Yellow Card','32''','Chancel Mbemba','K');
INSERT INTO matcheventlogs VALUES(1471,760435,'DR Congo national football team','COD','Goal','45''+5''','Yoane Wissa','K');
INSERT INTO matcheventlogs VALUES(1472,760435,'Portugal national football team','POR','Yellow Card','88''','Nélson Semedo','K');
INSERT INTO matcheventlogs VALUES(1473,760435,'Portugal national football team','POR','Yellow Card','90''+2''','Tomás Araújo','K');
INSERT INTO matcheventlogs VALUES(1474,760437,'Croatia national football team','CRO','Goal','36''','Martin Baturina','L');
INSERT INTO matcheventlogs VALUES(1475,760437,'England national football team','ENG','Goal','42''','Harry Kane','L');
INSERT INTO matcheventlogs VALUES(1476,760437,'Croatia national football team','CRO','Goal','45''+5''','Petar Musa','L');
INSERT INTO matcheventlogs VALUES(1477,760437,'England national football team','ENG','Goal','47''','Jude Bellingham','L');
INSERT INTO matcheventlogs VALUES(1478,760437,'England national football team','ENG','Goal','85''','Marcus Rashford','L');
INSERT INTO matcheventlogs VALUES(1479,760434,'Ghana national football team','GHA','Yellow Card','16''','Caleb Yirenkyi','L');
INSERT INTO matcheventlogs VALUES(1480,760434,'Panama national football team','PAN','Yellow Card','72''','César Blackman','L');
INSERT INTO matcheventlogs VALUES(1481,760434,'Ghana national football team','GHA','Goal','90''+5''','Caleb Yirenkyi','L');
INSERT INTO matcheventlogs VALUES(1482,760434,'Panama national football team','PAN','Yellow Card','90''+9''','Carlos Harvey','L');
INSERT INTO matcheventlogs VALUES(1483,760436,'Colombia national football team','COL','Yellow Card','7''','Johan Mojica','K');
INSERT INTO matcheventlogs VALUES(1484,760436,'Uzbekistan national football team','UZB','Yellow Card','34''','Abdukodir Khusanov','K');
INSERT INTO matcheventlogs VALUES(1485,760436,'Colombia national football team','COL','Goal','40''','Daniel Muñoz','K');
INSERT INTO matcheventlogs VALUES(1486,760436,'Uzbekistan national football team','UZB','Goal','60''','Abbosbek Fayzullaev','K');
INSERT INTO matcheventlogs VALUES(1487,760436,'Colombia national football team','COL','Goal','65''','Luis Díaz','K');
INSERT INTO matcheventlogs VALUES(1488,760436,'Colombia national football team','COL','Goal','90''+9''','Jáminton Campaz','K');
INSERT INTO matcheventlogs VALUES(1489,760438,'Czech Republic national football team','CZE','Goal','6''','Michal Sadílek','A');
INSERT INTO matcheventlogs VALUES(1490,760438,'South Africa national soccer team','RSA','Yellow Card','33''','Teboho Mokoena','A');
INSERT INTO matcheventlogs VALUES(1491,760438,'South Africa national soccer team','RSA','Yellow Card','40''','Thalente Mbatha','A');
INSERT INTO matcheventlogs VALUES(1492,760438,'Czech Republic national football team','CZE','Yellow Card','75''','Ladislav Krejcí','A');
INSERT INTO matcheventlogs VALUES(1493,760439,'Bosnia and Herzegovina national football team','BIH','Yellow Card','59''','Amar Dedic','B');
INSERT INTO matcheventlogs VALUES(1494,760439,'Bosnia and Herzegovina national football team','BIH','Yellow Card','61''','Edin Dzeko','B');
INSERT INTO matcheventlogs VALUES(1495,760439,'Switzerland national football team','SUI','Yellow Card','65''','Nico Elvedi','B');
INSERT INTO matcheventlogs VALUES(1496,760439,'Switzerland national football team','SUI','Goal','74''','Johan Manzambi','B');
INSERT INTO matcheventlogs VALUES(1497,760439,'Bosnia and Herzegovina national football team','BIH','Red Card','80''','Tarik Muharemovic','B');
INSERT INTO matcheventlogs VALUES(1498,760439,'Switzerland national football team','SUI','Goal','84''','Rubén Vargas','B');
INSERT INTO matcheventlogs VALUES(1499,760439,'Switzerland national football team','SUI','Goal','90''','Johan Manzambi','B');
INSERT INTO matcheventlogs VALUES(1500,760439,'Bosnia and Herzegovina national football team','BIH','Goal','90''+3''','Ermin Mahmic','B');
INSERT INTO matcheventlogs VALUES(1501,760440,'Canada men''s national soccer team','CAN','Yellow Card','9''','Derek Cornelius','B');
INSERT INTO matcheventlogs VALUES(1502,760440,'Canada men''s national soccer team','CAN','Goal','16''','Cyle Larin','B');
INSERT INTO matcheventlogs VALUES(1503,760440,'Canada men''s national soccer team','CAN','Goal','29''','Jonathan David','B');
INSERT INTO matcheventlogs VALUES(1504,760440,'Qatar national football team','QAT','Red Card','33''','Homam Ahmed','B');
INSERT INTO matcheventlogs VALUES(1505,760440,'Canada men''s national soccer team','CAN','Goal','45''+3''','Jonathan David','B');
INSERT INTO matcheventlogs VALUES(1506,760440,'Qatar national football team','QAT','Red Card','53''','Assim Madibo','B');
INSERT INTO matcheventlogs VALUES(1507,760440,'Qatar national football team','QAT','Yellow Card','62''','Ahmed Fathy','B');
INSERT INTO matcheventlogs VALUES(1508,760440,'Canada men''s national soccer team','CAN','Goal','64''','Nathan Saliba','B');
INSERT INTO matcheventlogs VALUES(1509,760440,'Canada men''s national soccer team','CAN','Goal','75''','Mohamed Manai','B');
INSERT INTO matcheventlogs VALUES(1510,760440,'Canada men''s national soccer team','CAN','Goal','90''+2''','Jonathan David','B');
INSERT INTO matcheventlogs VALUES(1511,760441,'South Korea national football team','KOR','Yellow Card','4''','Lee Kang-In','A');
INSERT INTO matcheventlogs VALUES(1512,760441,'Mexico national football team','MEX','Goal','50''','Luis Romo','A');
INSERT INTO matcheventlogs VALUES(1513,760441,'South Korea national football team','KOR','Yellow Card','58''','Paik Seung-Ho','A');
INSERT INTO matcheventlogs VALUES(1514,760442,'United States men''s national soccer team','USA','Goal','11''','Cameron Burgess','D');
INSERT INTO matcheventlogs VALUES(1515,760442,'Australia national football team','AUS','Yellow Card','16''','Jordan Bos','D');
INSERT INTO matcheventlogs VALUES(1516,760442,'Australia national football team','AUS','Yellow Card','32''','Alessandro Circati','D');
INSERT INTO matcheventlogs VALUES(1517,760442,'United States men''s national soccer team','USA','Goal','43''','Alex Freeman','D');
INSERT INTO matcheventlogs VALUES(1518,760442,'United States men''s national soccer team','USA','Yellow Card','56''','Antonee Robinson','D');
INSERT INTO matcheventlogs VALUES(1519,760442,'Australia national football team','AUS','Yellow Card','88''','Harry Souttar','D');
INSERT INTO matcheventlogs VALUES(1520,760442,'United States men''s national soccer team','USA','Yellow Card','89''','Folarin Balogun','D');
INSERT INTO matcheventlogs VALUES(1521,760442,'Australia national football team','AUS','Yellow Card','89''','Jacob Italiano','D');
INSERT INTO matcheventlogs VALUES(1522,760442,'United States men''s national soccer team','USA','Yellow Card','90''+3''','Chris Richards','D');
INSERT INTO matcheventlogs VALUES(1523,760445,'Morocco national football team','MAR','Goal','2''','Ismael Saibari','C');
INSERT INTO matcheventlogs VALUES(1524,760445,'Morocco national football team','MAR','Yellow Card','23''','Issa Diop','C');
INSERT INTO matcheventlogs VALUES(1525,760445,'Scotland national football team','SCO','Yellow Card','65''','Andy Robertson','C');
INSERT INTO matcheventlogs VALUES(1526,760444,'Haiti national football team','HAI','Yellow Card','4''','Carlens Arcus','C');
INSERT INTO matcheventlogs VALUES(1527,760444,'Brazil national football team','BRA','Goal','23''','Matheus Cunha','C');
INSERT INTO matcheventlogs VALUES(1528,760444,'Brazil national football team','BRA','Goal','36''','Matheus Cunha','C');
INSERT INTO matcheventlogs VALUES(1529,760444,'Brazil national football team','BRA','Goal','45''+3''','Vinícius Júnior','C');
INSERT INTO matcheventlogs VALUES(1530,760444,'Haiti national football team','HAI','Yellow Card','45''+4''','Frantzdy Pierrot','C');
INSERT INTO matcheventlogs VALUES(1531,760444,'Brazil national football team','BRA','Yellow Card','65''','Douglas Santos','C');
INSERT INTO matcheventlogs VALUES(1532,760444,'Haiti national football team','HAI','Yellow Card','72''','Danley Jean Jacques','C');
INSERT INTO matcheventlogs VALUES(1533,760443,'Paraguay national football team','PAR','Goal','2''','Matías Galarza','D');
INSERT INTO matcheventlogs VALUES(1534,760443,'Paraguay national football team','PAR','Yellow Card','4''','Matías Galarza','D');
INSERT INTO matcheventlogs VALUES(1535,760443,'Paraguay national football team','PAR','Red Card','45''+3''','Miguel Almirón','D');
INSERT INTO matcheventlogs VALUES(1536,760443,'Türkiye national football team','TUR','Yellow Card','71''','Eren Elmali','D');
INSERT INTO matcheventlogs VALUES(1537,760447,'Netherlands national football team','NED','Goal','5''','Brian Brobbey','F');
INSERT INTO matcheventlogs VALUES(1538,760447,'Netherlands national football team','NED','Goal','17''','Brian Brobbey','F');
INSERT INTO matcheventlogs VALUES(1539,760447,'Netherlands national football team','NED','Goal','47''','Cody Gakpo','F');
INSERT INTO matcheventlogs VALUES(1540,760447,'Sweden men''s national football team','SWE','Yellow Card','53''','Gabriel Gudmundsson','F');
INSERT INTO matcheventlogs VALUES(1541,760447,'Netherlands national football team','NED','Goal','54''','Cody Gakpo','F');
INSERT INTO matcheventlogs VALUES(1542,760447,'Sweden men''s national football team','SWE','Goal','59''','Anthony Elanga','F');
INSERT INTO matcheventlogs VALUES(1543,760447,'Sweden men''s national football team','SWE','Yellow Card','75''','Yasin Ayari','F');
INSERT INTO matcheventlogs VALUES(1544,760447,'Sweden men''s national football team','SWE','Yellow Card','80''','Lucas Bergvall','F');
INSERT INTO matcheventlogs VALUES(1545,760447,'Netherlands national football team','NED','Goal','89''','Crysencio Summerville','F');
INSERT INTO matcheventlogs VALUES(1546,760448,'Côte d''Ivoire national football team','CIV','Goal','30''','Franck Kessié','E');
INSERT INTO matcheventlogs VALUES(1547,760448,'Germany national football team','GER','Goal','68''','Deniz Undav','E');
INSERT INTO matcheventlogs VALUES(1548,760448,'Germany national football team','GER','Goal','90''+4''','Deniz Undav','E');
INSERT INTO matcheventlogs VALUES(1549,760446,'Ecuador national football team','ECU','Yellow Card','38''','Jordy Alcívar','E');
INSERT INTO matcheventlogs VALUES(1550,760446,'Curaçao national football team','CUW','Yellow Card','39''','Leandro Bacuna','E');
INSERT INTO matcheventlogs VALUES(1551,760446,'Curaçao national football team','CUW','Yellow Card','53''','Juninho Bacuna','E');
INSERT INTO matcheventlogs VALUES(1552,760446,'Curaçao national football team','CUW','Yellow Card','56''','Livano Comenencia','E');
INSERT INTO matcheventlogs VALUES(1553,760446,'Curaçao national football team','CUW','Yellow Card','75''','Juriën Gaari','E');
INSERT INTO matcheventlogs VALUES(1554,760446,'Curaçao national football team','CUW','Yellow Card','90''+1''','Gervane Kastaneer','E');
INSERT INTO sqlite_sequence VALUES('matcheventlogs',1554);
CREATE VIEW v_fair_play_points_standings AS
SELECT
    TeamCode,
    TeamName,
    COUNT(CASE WHEN event_type = 'Yellow Card' THEN 1 END) AS "Total Yellows",
    COUNT(CASE WHEN event_type = 'Red Card' THEN 1 END) AS "Total Reds",
    COUNT(CASE WHEN event_type = 'Second Yellow Card' THEN 1 END) AS "Total Second Yellows", 
    (
        (COUNT(CASE WHEN event_type = 'Yellow Card' THEN 1 END) * -1) +
        (COUNT(CASE WHEN event_type = 'Second Yellow Card' THEN 1 END) * -3) + 
        (COUNT(CASE WHEN event_type = 'Red Card' THEN 1 END) * -4)             
    ) AS "Fair Play Points"
FROM matcheventlogs
GROUP BY TeamCode, TeamName
ORDER BY "Fair Play Points" DESC, "Total Reds" ASC, "Total Yellows" ASC;
CREATE VIEW v_match_outcomes AS
SELECT 
    match_id as "Match ID",
    HomeTeamName as "Home Team Name",
    HomeTeamCode as "Home Team Code",
    Home_goals_scored as "Home Goals Scored",
    AwayTeamName as "Away Team Name",
    AwayTeamCode as "Away Team Code",
    Away_goals_scored as "Away Goals Scored",
    status,
    CASE 
        WHEN status != 'FT' THEN 'In Progress'
        WHEN Home_goals_scored > Away_goals_scored THEN 'Home Win'
        WHEN Away_goals_scored > Home_goals_scored THEN 'Away Win'
        ELSE 'Draw'
    END AS "Match Outcome",
    CASE 
        WHEN status != 'FT' THEN 'No Points Awarded yet'
        WHEN Home_goals_scored > Away_goals_scored THEN 'Home Received 3 Points'
        WHEN Away_goals_scored > Home_goals_scored THEN 'Away Received 3 Points'
        ELSE 'Both Teams Received 1 Point'
    END AS "Match Points"
FROM matchresults;
CREATE VIEW v_worldcup_group_standings AS
WITH team_matches_normalized AS (
    SELECT 
        "Home Team Code" AS TeamCode,
        CASE WHEN status = 'FT' AND "Home Goals Scored" > "Away Goals Scored" THEN 3
             WHEN status = 'FT' AND "Home Goals Scored" = "Away Goals Scored" THEN 1
             ELSE 0 END AS "Points",
        CASE WHEN status = 'FT' THEN 1 ELSE 0 END AS "Matches Played",
        CASE WHEN status = 'FT' AND "Home Goals Scored" > "Away Goals Scored" THEN 1 ELSE 0 END AS "Wins",
        CASE WHEN status = 'FT' AND "Home Goals Scored" = "Away Goals Scored" THEN 1 ELSE 0 END AS "Draws",
        CASE WHEN status = 'FT' AND "Home Goals Scored" < "Away Goals Scored" THEN 1 ELSE 0 END AS "Losses",
        CASE WHEN status = 'FT' THEN "Home Goals Scored" ELSE 0 END AS "Goals For",
        CASE WHEN status = 'FT' THEN "Away Goals Scored" ELSE 0 END AS "Goals Against"
    FROM v_match_outcomes 
    UNION ALL
    SELECT 
        "Away Team Code" AS TeamCode,
        CASE WHEN status = 'FT' AND "Away Goals Scored" > "Home Goals Scored" THEN 3
             WHEN status = 'FT' AND "Away Goals Scored" = "Home Goals Scored" THEN 1
             ELSE 0 END AS "Points",
        CASE WHEN status = 'FT' THEN 1 ELSE 0 END AS "Matches Played",
        CASE WHEN status = 'FT' AND "Away Goals Scored" > "Home Goals Scored" THEN 1 ELSE 0 END AS "Wins",
        CASE WHEN status = 'FT' AND "Away Goals Scored" = "Home Goals Scored" THEN 1 ELSE 0 END AS "Draws",
        CASE WHEN status = 'FT' AND "Away Goals Scored" < "Home Goals Scored" THEN 1 ELSE 0 END AS "Losses",
        CASE WHEN status = 'FT' THEN "Away Goals Scored" ELSE 0 END AS "Goals For",
        CASE WHEN status = 'FT' THEN "Home Goals Scored" ELSE 0 END AS "Goals Against"
    FROM v_match_outcomes 
),
team_totals AS (
    SELECT 
        TeamCode,
        SUM("Matches Played") AS "Matches Played",
        SUM("Wins") AS "Win",
        SUM("Draws") AS "Draws",
        SUM("Losses") AS "Losses",
        SUM("Goals For") AS "Goals For",
        SUM("Goals Against") AS "Goals Against",
        (SUM("Goals For") - SUM("Goals Against")) AS "Goal Difference",
        SUM("Points") AS "Total Points"
    FROM team_matches_normalized
    GROUP BY TeamCode
),
standings_unranked AS (
    SELECT 
        g.GroupLetter,
        g.TeamCode,
        g.TeamName,
        COALESCE(tt."Matches Played", 0) AS "MP",
        COALESCE(tt."Win", 0) AS "W",
        COALESCE(tt."Draws", 0) AS "D",
        COALESCE(tt."Losses", 0) AS "L",
        COALESCE(tt."Goals For", 0) AS "GF",
        COALESCE(tt."Goals Against", 0) AS "GA",
        COALESCE(tt."Goal Difference", 0) AS "GD",
        COALESCE(tt."Total Points", 0) AS "TP",
        COALESCE(fp."Fair Play Points", 0) AS "Fair Play Points"
    FROM groups g
    LEFT JOIN team_totals tt ON g.TeamCode = tt.TeamCode
    LEFT JOIN v_fair_play_points_standings fp ON g.TeamCode = fp.TeamCode 
),
group_ranked AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY GroupLetter 
            ORDER BY "TP" DESC, "GD" DESC, "GF" DESC, "Fair Play Points" DESC
        ) AS group_rank
    FROM standings_unranked
)
SELECT 
    GroupLetter AS "Group Letter",
    group_rank as "Group Rank",
    TeamCode AS "Team Code",
    TeamName AS "Team Name",
    "MP", "W", "D", "L", "GF", "GA", "GD", "TP", -- Fixed to match actual CTE dataset aliases
    "Fair Play Points",
    CASE 
        WHEN group_rank = 3 THEN 
            ROW_NUMBER() OVER (
                PARTITION BY group_rank
                ORDER BY "TP" DESC, "GD" DESC, "GF" DESC, "Fair Play Points" DESC
            )
        ELSE 0 
    END AS "Third Place Global Rank"
FROM group_ranked
ORDER BY GroupLetter ASC, group_rank ASC
;
CREATE VIEW v_player_cards AS
SELECT 
    player_name AS "Player Name",
    TeamName AS "Team Name",
    TeamCode AS "Team Code",
    GroupLetter AS "Group Letter",
    COUNT(CASE WHEN event_type = 'Yellow Card' THEN 1 END) AS "Yellow Cards",
    COUNT(CASE WHEN event_type = 'Second Yellow Card' THEN 1 END) AS "Second Yellow Cards",
    COUNT(CASE WHEN event_type = 'Red Card' THEN 1 END) AS "Red Cards",
    (
        COUNT(CASE WHEN event_type = 'Yellow Card' THEN 1 END) + 
        COUNT(CASE WHEN event_type = 'Second Yellow Card' THEN 1 END) + 
        COUNT(CASE WHEN event_type = 'Red Card' THEN 1 END)
    ) AS "Total Cards",
    COUNT(CASE WHEN event_type = 'Goal' THEN 1 END) AS "Goals Scored"
FROM matcheventlogs
GROUP BY player_name, TeamCode, TeamName
ORDER BY "Goals Scored" DESC, "Red Cards" DESC, "Second Yellow Cards" DESC, "Yellow Cards" DESC;
CREATE VIEW v_wc_progress AS
SELECT
    vwgs.*,
    CASE
        -- 1. CONFIRMED QUALIFIED (Top 2 Teams)
        WHEN [Group Rank] <= 2 AND [TP] >= (
            SELECT MAX(target.[TP] + (3 - target.[MP]) * 3)
            FROM v_worldcup_group_standings target
            WHERE target.[Group Letter] = vwgs.[Group Letter] AND target.[Group Rank] = 3
        ) THEN 'Confirmed Qualified'

        -- 2. CONFIRMED QUALIFIED (As a Best 3rd Place Team)
        WHEN [Group Rank] = 3 AND [MP] = 3 AND [Third Place Global Rank] BETWEEN 1 AND 8 THEN 'Mathematically Qualified'

        -- 3. ELIMINATED (Bottom 2 Teams)
        WHEN [Group Rank] > 2 AND (
            ([TP] + (3 - [MP]) * 3) < (
                SELECT target.[TP]
                FROM v_worldcup_group_standings target
                WHERE target.[Group Letter] = vwgs.[Group Letter] AND target.[Group Rank] = 3
            )
            OR ([TP] + (3 - [MP]) * 3) < 3
        ) THEN 'Eliminated'

        -- 4. ELIMINATED (3rd Place Finished Team)
        WHEN [Group Rank] = 3 AND [MP] = 3 AND [Third Place Global Rank] > 8 THEN 'Eliminated'

        -- 5. LIVE QUALIFIED (Currently in Automatic Spots)
        WHEN [Group Rank] <= 2 THEN 'Mathematically Qualified'

        -- 6. LIVE QUALIFIED (In Best 3rd Place Spots)
        WHEN [Group Rank] = 3 AND [Third Place Global Rank] BETWEEN 1 AND 8 THEN 'Mathematically Qualified'

        -- 7. LIVE (Still playing, currently outside qualification, but mathematically alive)
        WHEN [MP] < 3 AND ([TP] + (3 - [MP]) * 3) >= 3 THEN 'Live They Still have a Chance.'

        -- 8. FALLBACK
        ELSE 'Live Eliminated'
    END AS [Progression Status]
FROM v_worldcup_group_standings vwgs
-- AUTOMATICALLY DITCH THE PLACEHOLDERS
WHERE LENGTH([Team Name]) >= 16
;
COMMIT;

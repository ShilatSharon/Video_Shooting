prompt PL/SQL Developer import file
prompt Created on יום שני 17 יוני 2024 by Shilat Sharon
set feedback off
set define off
prompt Creating CLIENT...
create table CLIENT
(
  client_id NUMBER(5) not null,
  fname     VARCHAR2(15) not null,
  lname     VARCHAR2(15) not null,
  address   VARCHAR2(50) not null,
  phone     NUMBER(10) not null,
  email     VARCHAR2(25) not null
)
;
alter table CLIENT
  add primary key (CLIENT_ID);
alter table CLIENT
  add constraint CHK_CLIENT_PHONE
  check (phone LIKE '5%');

prompt Creating EVENT...
create table EVENT
(
  event_id   NUMBER(5) not null,
  event_date DATE not null,
  place      VARCHAR2(20) not null
)
;
alter table EVENT
  add primary key (EVENT_ID);

prompt Creating CUSTOMERORDER...
create table CUSTOMERORDER
(
  order_id   NUMBER(5) not null,
  order_date DATE not null,
  event_id   NUMBER(5) not null,
  client_id  NUMBER(5) not null
)
;
alter table CUSTOMERORDER
  add primary key (ORDER_ID);
alter table CUSTOMERORDER
  add foreign key (EVENT_ID)
  references EVENT (EVENT_ID);
alter table CUSTOMERORDER
  add foreign key (CLIENT_ID)
  references CLIENT (CLIENT_ID);

prompt Creating PROFESSION...
create table PROFESSION
(
  prof_id   NUMBER(5) not null,
  prof_name VARCHAR2(15) not null
)
;
alter table PROFESSION
  add primary key (PROF_ID);

prompt Creating PROFESSIONAL...
create table PROFESSIONAL
(
  professional_id NUMBER(5) not null,
  fname           VARCHAR2(15) not null,
  lname           VARCHAR2(15) not null,
  phone           NUMBER(10) not null,
  email           VARCHAR2(25) not null,
  price           FLOAT not null,
  start_year      NUMBER(4) not null,
  prof_id         NUMBER(5) not null
)
;
alter table PROFESSIONAL
  add primary key (PROFESSIONAL_ID);
alter table PROFESSIONAL
  add foreign key (PROF_ID)
  references PROFESSION (PROF_ID);
alter table PROFESSIONAL
  add constraint CHK_PROFESSIONAL_PHONE
  check (phone LIKE '5%');

prompt Creating INCLUDE...
create table INCLUDE
(
  professional_id NUMBER(5) not null,
  order_id        NUMBER(5) not null
)
;
alter table INCLUDE
  add primary key (PROFESSIONAL_ID, ORDER_ID);
alter table INCLUDE
  add foreign key (PROFESSIONAL_ID)
  references PROFESSIONAL (PROFESSIONAL_ID);
alter table INCLUDE
  add foreign key (ORDER_ID)
  references CUSTOMERORDER (ORDER_ID);

prompt Creating PAYMENTMETHOD...
create table PAYMENTMETHOD
(
  pay_method_id NUMBER(5) not null,
  type          VARCHAR2(15) not null
)
;
alter table PAYMENTMETHOD
  add primary key (PAY_METHOD_ID);

prompt Creating PAYMENT...
create table PAYMENT
(
  payment_id     NUMBER(5) not null,
  payment_amount FLOAT not null,
  payment_date   DATE not null,
  pay_method_id  NUMBER(5) not null,
  order_id       NUMBER(5) not null
)
;
alter table PAYMENT
  add primary key (PAYMENT_ID);
alter table PAYMENT
  add foreign key (PAY_METHOD_ID)
  references PAYMENTMETHOD (PAY_METHOD_ID);
alter table PAYMENT
  add foreign key (ORDER_ID)
  references CUSTOMERORDER (ORDER_ID);

prompt Loading CLIENT...
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (0, 'Arnold', 'Hornsby', '69 DeVita Ave', 582229278, 'arnold.hornsby@ads.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (1, 'Bruce', 'Baranski', '76 Robert Street', 533999149, 'bruce@hencie.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (2, 'Shannon', 'Weisz', '78 Kirsten Street', 586353849, 'shannon@typhoon.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (3, 'Bryan', 'Snipes', '81 Whitford Road', 593892633, 'bryans@spinnakerexplorati');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (4, 'Rip', 'Palmer', '836 Pablo Street', 577262923, 'r.palmer@jsa.dk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (5, 'Rickie', 'Lapointe', '32 Child Blvd', 549347199, 'rickie.lapointe@vitacostc');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (6, 'Luis', 'Saucedo', '30 Dionne Road', 549629835, 'luis.saucedo@scheringplou');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (7, 'Robbie', 'Santa Rosa', '65 Maury Road', 547235857, 'robbie.santarosa@kwraf.co');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (8, 'Merle', 'Ramirez', '19 Byrd Ave', 545275812, 'merler@consultants.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (9, 'Patricia', 'Tolkan', '72nd Street', 532817583, 'patricia@egroup.br');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (10, 'Eliza', 'Reeve', '223 Herzogenrath Blvd', 512367837, 'eliza@multimedialive.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (11, 'Caroline', 'Black', '42nd Street', 562174678, 'caroline.black@employerse');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (12, 'Dave', 'Cotton', '42 Stone Street', 544399427, 'dave.c@avr.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (13, 'Cheryl', 'Gibbons', '43 Shawn Street', 588226326, 'cheryl.gibbons@techrx.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (14, 'Ruth', 'Yulin', '82 Culkin Ave', 525177419, 'ryulin@zoneperfectnutriti');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (15, 'Keanu', 'McCann', '23 Chan Road', 587724785, 'keanu.m@labradanutrition.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (16, 'Pablo', 'Hampton', '98 Vanessa Road', 565665259, 'pablo@genghisgrill.ca');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (17, 'Rosanna', 'Caldwell', '46 Pordenone Road', 512276172, 'rosanna.caldwell@enterpri');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (18, 'Kenny', 'Esposito', '71st Street', 544445252, 'kenny@typhoon.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (19, 'Breckin', 'Law', '73 Laurel Drive', 547784828, 'breckin.l@csi.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (20, 'Shannon', 'Garfunkel', '97 Edward Street', 584335144, 'shannon@lindin.it');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (21, 'Annette', 'De Niro', '40 Lachey Blvd', 523815465, 'annette.deniro@marriottin');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (22, 'Denis', 'Elizabeth', '94 Linda Road', 549858863, 'denis.elizabeth@diversite');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (23, 'Grant', 'Peebles', '66 Hackensack Drive', 542219216, 'grant.peebles@nissanmotor');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (24, 'Frances', 'Fisher', '67 Cle Elum Street', 575757952, 'frances.fisher@accucode.c');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (25, 'Vanessa', 'Watley', '66 Tyrone Drive', 579653487, 'vwatley@asapstaffing.ca');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (26, 'Bette', 'Masur', '75 Connie Blvd', 581686647, 'bmasur@apexsystems.jp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (27, 'Jeroen', 'Swinton', '12nd Street', 572322473, 'jswinton@multimedialive.i');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (28, 'Elvis', 'Heston', '43 Uma Ave', 581871788, 'elvis@lynksystems.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (29, 'Corey', 'Reed', '76 O''fallon Street', 599813271, 'corey.reed@diamondtechnol');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (30, 'Max', 'Alston', '97 Daryle Blvd', 529452677, 'm.alston@kramontrealty.co');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (31, 'Seann', 'De Almeida', '622 Cross Road', 571363834, 'seann.d@iss.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (32, 'Isabella', 'Parker', '52 Biggs Drive', 558745787, 'isabella.p@gdatechnologie');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (33, 'Sharon', 'Hewett', '72 Stallone Drive', 525261898, 'sharon@fnb.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (34, 'Mili', 'Sample', '50 Laura Street', 548647346, 'mili@doraldentalusa.jp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (35, 'Nina', 'DeLuise', '18 Swank', 559847712, 'ninad@unitedasset.ee');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (36, 'Xander', 'Baker', '86 Peterson', 597141665, 'xander.baker@oss.it');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (37, 'Kate', 'Torino', '41 Ithaca Street', 556191747, 'kate@gra.ca');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (38, 'Mitchell', 'Bracco', '93 Pandrup Street', 531781152, 'm.bracco@mathis.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (39, 'Elizabeth', 'McNarland', '64 Nashua Road', 568356316, 'elizabeth@kingston.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (40, 'Seth', 'Fiennes', '94 Oszajca Road', 535544561, 'seth.fiennes@coridiantech');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (41, 'Queen', 'Unger', '36 Bush Road', 572433858, 'queen.unger@priorityexpre');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (42, 'Chrissie', 'Taylor', '34 Jean', 521774433, 'chrissie.taylor@fsffinanc');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (43, 'Darius', 'Goldberg', '13rd Street', 587426335, 'darius.goldberg@medsource');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (44, 'Natalie', 'MacPherson', '86 Natalie', 574585974, 'natalie@flavorx.tw');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (45, 'Benjamin', 'Summer', '36 Penn Road', 593783261, 'benjamin.summer@americane');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (46, 'Holly', 'Stone', '72 Bullock Blvd', 578491322, 'holly.stone@onstaff.jp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (47, 'Arnold', 'Lang', '100 Frances Drive', 568396237, 'arnold.lang@portosan.br');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (48, 'Vickie', 'Hughes', '45 Keitel Street', 597165221, 'v.hughes@adeasolutions.co');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (49, 'Alana', 'Caviezel', '72 Vondie Blvd', 565344359, 'alana.caviezel@columbiaba');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (50, 'Gwyneth', 'Crow', '87 Gaithersburg Blvd', 554854842, 'gwyneth.crow@insurmark.co');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (51, 'Cloris', 'Moffat', '47 Lynne', 598726838, 'cloris.moffat@linksys.jp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (52, 'Mitchell', 'Stanton', '84 Donald Ave', 556818898, 'mitchell.stanton@qls.jp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (53, 'Rutger', 'Haslam', '12nd Street', 565375482, 'rutger.haslam@marketbased');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (54, 'Seth', 'Cornell', '26 Brad Street', 573642672, 'seth.cornell@mqsoftware.a');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (55, 'Kenny', 'Allison', '698 Wayne Street', 541352188, 'kenny.allison@tarragonrea');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (56, 'Rufus', 'MacPherson', '80 Silver Spring Ave', 566555687, 'rufus.macpherson@y2market');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (57, 'Trini', 'Lineback', '627 Halfway house', 599211415, 'trini.lineback@morganrese');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (58, 'Lara', 'Clinton', '34 Duschel', 559286893, 'lara.clinton@officedepot.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (59, 'Lenny', 'Orbit', '2 Rippy Drive', 525913822, 'l.orbit@sears.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (60, 'Wesley', 'Sample', '55 Fonda', 568687152, 'wesley.s@harrison.it');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (61, 'Bernie', 'Peterson', '13 Kattan', 583877624, 'bernie.peterson@healthscr');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (62, 'Etta', 'Askew', '52nd Street', 518497471, 'etta.askew@loreal.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (63, 'Nicholas', 'Whitman', '387 Sobieski Ave', 516939874, 'nicholas.whitman@hitechph');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (64, 'Yolanda', 'Garfunkel', '16 Orleans Blvd', 575889828, 'yolanda.garfunkel@linersd');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (65, 'Nickel', 'Presley', '34 Mumbai Drive', 545845417, 'n.presley@base.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (66, 'Sharon', 'Browne', '66 Nunn Drive', 548265125, 'sharon.browne@mag.at');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (67, 'Pamela', 'Holy', '28 Shenzhen Drive', 523738134, 'pamela@pis.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (68, 'Rik', 'Chapman', '37 Walsh Blvd', 571836292, 'rik.chapman@digitalmotorw');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (69, 'Balthazar', 'Sledge', '25 Uggams Drive', 531125833, 'balthazar.s@isd.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (70, 'Cyndi', 'Weaver', '31 Clooney Drive', 546153431, 'c.weaver@kingland.no');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (71, 'Jim', 'Pitney', '71 Sylvester Street', 593331876, 'jim.pitney@vspan.ca');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (72, 'Ernest', 'Singh', '69 Lucca Blvd', 551633721, 'ernest.singh@monarchcasin');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (73, 'Grant', 'Esposito', '43 Cromwell Street', 582686228, 'g.esposito@spas.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (74, 'Charlie', 'Sevenfold', '34 Nikki Blvd', 555866823, 'csevenfold@philipmorris.u');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (75, 'Denzel', 'Salt', '32 Kahn Road', 511531232, 'denzel.salt@mls.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (76, 'Remy', 'Carradine', '33rd Street', 578851132, 'remy@authoria.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (77, 'Ernie', 'Thompson', '69 McPherson Blvd', 565537332, 'erniet@kellogg.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (78, 'Bo', 'Carrey', '18 Olympia Drive', 546364292, 'bcarrey@woronocobancorp.d');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (79, 'Wally', 'Crosby', '81 Pleasence Street', 558898572, 'wally.crosby@clorox.fr');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (80, 'Gloria', 'Schreiber', '20 Hall Blvd', 581837289, 'gloria.schreiber@tilsonhr');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (81, 'Woody', 'Vai', '388 Fats Drive', 577142993, 'woody.vai@wav.au');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (82, 'Sheena', 'Barrymore', '28 Ellen Street', 583279684, 'sheena@catamount.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (83, 'Russell', 'Cook', '34 Gil Road', 542779233, 'russell.cook@grayhawksyst');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (84, 'Albert', 'Derringer', '46 Tanon Ave', 569162891, 'albert.derringer@unit.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (85, 'Juliette', 'Sanchez', '62 Burmester Street', 518662975, 'juliette.sanchez@mse.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (86, 'Wendy', 'Himmelman', '515 Eder Road', 547257758, 'wendy.himmelman@lynksyste');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (87, 'Stephen', 'Fonda', '57 Tokushima Street', 525367831, 'stephen.fonda@qestrel.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (88, 'Cole', 'Herndon', '82nd Street', 598476748, 'cole.herndon@cis.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (89, 'Annie', 'Swinton', '41 McFadden Drive', 599975746, 'annie@dps.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (90, 'Emilio', 'Russo', '84 Ricardo Drive', 566513466, 'emilio.russo@portageenvir');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (91, 'Daryl', 'Hatchet', '62 Fichtner Blvd', 568812565, 'daryl@johnson.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (92, 'Rutger', 'Robbins', '236 Crystal Road', 571484179, 'rutger.r@providentbancorp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (93, 'Lizzy', 'Brolin', '55 Queen Road', 595278461, 'lizzy.brolin@wci.pk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (94, 'Alex', 'Playboys', '12 Favreau Drive', 569935384, 'alex.playboys@directdata.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (95, 'Azucar', 'Rossellini', '65 Krabbe Street', 569128583, 'azucar.r@worldcom.ca');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (96, 'Molly', 'Gyllenhaal', '88 Matthau Road', 576114722, 'molly.g@aoe.ca');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (97, 'Caroline', 'Clarkson', '67 Williamson Road', 561886926, 'caroline@usdairyproducers');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (98, 'Darius', 'Tierney', '40 Harper Drive', 552411453, 'darius.t@spinnakerexplora');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (99, 'Collective', 'Ford', '1 Nantes Blvd', 577529985, 'collectivef@alohanysystem');
commit;
prompt 100 records committed...
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (100, 'April', 'Streep', '80 Mint Road', 515847635, 'april.streep@homedepot.dk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (101, 'Chubby', 'Hawthorne', '84 Perlman Ave', 513543621, 'chubbyh@aop.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (102, 'Joshua', 'Douglas', '73rd Street', 552116178, 'joshua@abs.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (103, 'Caroline', 'Brando', '118 Schock Drive', 517233427, 'caroline.brando@saltgroup');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (104, 'Natascha', 'Yulin', '36 Brookfield Road', 568731535, 'natascha.yulin@paintedwor');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (105, 'Ming-Na', 'Collie', '4 Grand-mere Road', 563812121, 'mingna.collie@reckittbenc');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (106, 'Ben', 'Curtis', '42 Stampley Drive', 528746499, 'b.curtis@mercantilebank.c');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (107, 'Cherry', 'Roy Parnell', '757 Eiksmarka Road', 568657513, 'cherry.royparnell@blueoce');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (108, 'Desmond', 'Boyle', '86 Warden Road', 559279394, 'dboyle@actechnologies.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (109, 'Jonatha', 'Conlee', '15 Minneapolis Ave', 562419415, 'jonathac@aco.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (110, 'Gran', 'Singh', '616 Kazem Drive', 539189517, 'g.singh@outsourcegroup.co');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (111, 'Talvin', 'Connery', '238 Vertical Drive', 589499529, 't.connery@parksite.ar');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (112, 'Kid', 'Sandler', '71 Hampton Blvd', 511134766, 'kid.s@chhc.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (113, 'Vin', 'Miller', '1 Southampton Street', 564372525, 'vinm@virbac.jp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (114, 'Bridget', 'Duschel', '1 Dubai', 581271929, 'bridget.duschel@zaiqtechn');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (115, 'Orlando', 'Barnett', '380 Bob Street', 594229631, 'o.barnett@career.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (116, 'Micky', 'Spacey', '86 Reiner Blvd', 553193362, 'm.spacey@shirtfactory.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (117, 'Edwin', 'Brosnan', '20 Luedenscheid Ave', 575434698, 'edwin@kitba.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (118, 'Geggy', 'Phillippe', '76 Parsippany Road', 529231166, 'geggyp@callhenry.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (119, 'Fiona', 'Spall', '17 Horb', 564636918, 'fiona.s@qestrel.in');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (120, 'Andrae', 'Bean', '79 Agoncillo', 593935444, 'andrae.bean@eastmankodak.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (121, 'Rik', 'Penders', '62 Olivette', 575848845, 'rik.penders@doraldentalus');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (122, 'Mark', 'Guzman', '43 Hopkins Street', 559422661, 'mark@gna.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (123, 'Kristin', 'Price', '286 Lena Drive', 564456216, 'kprice@northhighland.fr');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (124, 'Chuck', 'Ferry', '659 Davis Road', 513894933, 'chuck.ferry@gulfmarkoffsh');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (125, 'Marty', 'Tanon', '658 Rooker Ave', 594722278, 'marty.tanon@gci.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (126, 'Bret', 'Jane', '136 Frakes Road', 557151988, 'bret@yashtechnologies.fr');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (127, 'Madeleine', 'Clark', '53 Kline Ave', 531429492, 'madeleine.clark@mms.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (128, 'Glen', 'Rankin', '922 Cevin Road', 517176468, 'glen.rankin@creditorsinte');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (129, 'Penelope', 'Kurtz', '36 Watley Road', 588956625, 'p.kurtz@gltg.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (130, 'Max', 'Bates', '3 Yomgok-dong Ave', 566652971, 'max.bates@ntas.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (131, 'Trini', 'Gibson', '2 Shocked Ave', 537226912, 'trini.g@fam.se');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (132, 'Morgan', 'Crudup', '35 Micky Drive', 563633884, 'morgan@hondamotor.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (133, 'Rene', 'Lynne', '302 Trento Road', 565793786, 'r.lynne@tigris.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (134, 'Rosario', 'Garr', '26 Meryl Blvd', 542581792, 'rosario.garr@novartis.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (135, 'Chris', 'Vega', '66 Englewood Street', 584863255, 'chris.vega@blueoceansoftw');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (136, 'Max', 'Watson', '551 Boulogne Street', 559626884, 'max.watson@tigris.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (137, 'Vanessa', 'Field', '42 Ifans Drive', 538543339, 'vanessa.f@sony.jp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (138, 'Alex', 'Cotton', '50 O''Connor Drive', 598435149, 'alex.cotton@sfgo.jp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (139, 'Harriet', 'Matheson', '81 Oded Street', 511122841, 'harriet.matheson@nexxtwor');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (140, 'Javon', 'Streep', '72nd Street', 515449583, 'javon.streep@ach.es');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (141, 'Sandra', 'Rickles', '830 Hampton', 575528912, 'sandra.rickles@netnumina.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (142, 'Neve', 'Garcia', '38 Elizondo Ave', 515599172, 'neve.garcia@mls.za');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (143, 'Rich', 'Moraz', '80 Taryn Street', 556414598, 'rich.moraz@mwh.ch');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (144, 'Randy', 'Caine', '5 Avon Blvd', 555299279, 'randy.caine@universalsolu');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (145, 'Larry', 'Elizondo', '24 Cartlidge Drive', 521116779, 'larry.elizondo@als.pt');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (146, 'Stockard', 'Paquin', '63 Quatro Road', 569158363, 'stockard.paquin@marlabs.c');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (147, 'Jimmie', 'Berkoff', '80 Salisbury Blvd', 553514655, 'jimmie.berkoff@gtp.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (148, 'Kenneth', 'Levine', '51 Geggy Street', 516423927, 'kenneth@swp.au');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (149, 'Sophie', 'Spacey', '39 Gilley Road', 558846415, 'sophie.s@gtp.jp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (150, 'Miki', 'Cozier', '82 Cyndi Blvd', 558677989, 'mikic@progressivemedical.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (151, 'Aidan', 'Lynne', '85 Cuba Street', 597187569, 'aidan.lynne@amerisourcefu');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (152, 'Omar', 'Strong', '3 Shalhoub Road', 548118497, 'omar.strong@prometheuslab');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (153, 'Herbie', 'Perrineau', '91 Fukuoka Road', 586441159, 'herbie.perrineau@capital.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (154, 'Domingo', 'MacPherson', '74 Nashua Road', 547589832, 'domingo.macpherson@idlabe');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (155, 'Avenged', 'Torino', '9 Berkley Blvd', 595467957, 'avenged.torino@bmm.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (156, 'Jim', 'Lavigne', '77 Longview Road', 599444459, 'jlavigne@hfg.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (157, 'Debi', 'Finney', '287 Rowlands Road', 599742614, 'd.finney@ceo.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (158, 'Laurie', 'Feliciano', '4 Vanderbijlpark Street', 586529725, 'laurie.f@pib.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (159, 'Jarvis', 'Allan', '85 Mason Drive', 591698925, 'jarvis.allan@businessplus');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (160, 'Lesley', 'Marsden', '88 Biehn Drive', 516684337, 'lesley@fmb.pt');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (161, 'Winona', 'Reeves', '825 Aniston', 549477289, 'wreeves@accurateautobody.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (162, 'Lena', 'Drive', '493 Pitt Street', 517785899, 'lena@primussoftware.ch');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (163, 'Cameron', 'Cash', '73 Antonio', 544386167, 'cameron.cash@callhenry.co');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (164, 'Edward', 'Slater', '78 Spader Blvd', 544223336, 'edwards@kimberlyclark.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (165, 'Parker', 'Salonga', '49 Loggia', 525544147, 'parker@streetglow.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (166, 'Hugh', 'Marsden', '21 Johnny Street', 515792523, 'h.marsden@parker.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (167, 'Dermot', 'Travers', '23rd Street', 554827424, 'dermot.travers@simplycert');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (168, 'Brad', 'Evanswood', '609 Gilley Ave', 576952421, 'brad.evanswood@hondamotor');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (169, 'Ethan', 'Ricci', '800 Torn', 595329768, 'ericci@tastefullysimple.c');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (170, 'Larnelle', 'Paquin', '1 Ithaca', 568383543, 'larnelle.paquin@invisionc');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (171, 'Delroy', 'Davidtz', '17 Peebles Road', 537435943, 'delroyd@esteelauder.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (172, 'Rip', 'DiFranco', '33 Hounslow Street', 524665882, 'rip.difranco@safeway.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (173, 'Ellen', 'Henstridge', '62nd Street', 527713418, 'ellen.henstridge@summiten');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (174, 'Etta', 'Maguire', '53rd Street', 576891911, 'etta.maguire@banfeproduct');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (175, 'Todd', 'Walken', '246 Flanery Road', 513629413, 'todd@lynksystems.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (176, 'Sydney', 'Fishburne', '525 Enfield Drive', 546153559, 'sydney.fishburne@max.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (177, 'Davy', 'Delta', '580 Romijn-Stamos Road', 539576993, 'davy.delta@afs.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (178, 'Wesley', 'Bailey', '9 Weisz Street', 538341784, 'wesley.b@nobrainerblindsc');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (179, 'Cary', 'urban', '65 Franklin Road', 558198257, 'caryu@providenceservice.u');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (180, 'Gino', 'Spader', '11 Lisa Road', 548915997, 'gino@qestrel.pt');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (181, 'Gene', 'Kweller', '115 Houston Ave', 587491915, 'g.kweller@taycorfinancial');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (182, 'Night', 'Levin', '7 Ritchie Street', 598193681, 'nightl@bristolmyers.mx');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (183, 'Norm', 'Ryder', '16 Hunt Valley Road', 528338346, 'norm.ryder@supplycorecom.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (184, 'Bruce', 'Renfro', '21st Street', 531739376, 'brenfro@north.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (185, 'Frankie', 'Trejo', '52 Neuwirth Road', 515674384, 'frankie.t@nike.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (186, 'Miriam', 'Peniston', '1 Kelly Street', 593796294, 'miriam.peniston@ris.is');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (187, 'Drew', 'Cassel', '38 Duchovny', 543588811, 'drew.cassel@fiberlink.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (188, 'LeVar', 'Eastwood', '7 Loggins', 533151934, 'levar@nsd.ch');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (189, 'Curt', 'Colton', '80 Giamatti Road', 565321644, 'curt.colton@dbprofessiona');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (190, 'Caroline', 'Lonsdale', '71 Aomori Drive', 534721848, 'caroline.lonsdale@jsa.ca');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (191, 'Tom', 'Rundgren', '500 Tbilisi Ave', 596952827, 'tom.rundgren@clorox.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (192, 'Nicholas', 'Boyle', '75 Novara Blvd', 546292354, 'nboyle@arkidata.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (193, 'Lili', 'Marie', '6 Lublin Ave', 557987934, 'lmarie@novartis.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (194, 'Javon', 'Ricci', '96 Owen Road', 577761592, 'javonr@cis.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (195, 'Latin', 'Browne', '6 Moody Road', 596728484, 'lbrowne@aoe.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (196, 'Jaime', 'Popper', '24 Marley', 591654543, 'jaime.popper@cmi.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (197, 'Melanie', 'Applegate', '43 Sendai Ave', 562351363, 'melanie.applegate@totalen');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (198, 'Miriam', 'Gosdin', '90 Osbourne Road', 554872876, 'miriam.g@fflcbancorp.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (199, 'Cary', 'McDowell', '21 Platt', 524267992, 'cary.mcdowell@keymark.de');
commit;
prompt 200 records committed...
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (200, 'Debby', 'Blair', '22 Blair Drive', 545236627, 'd.blair@meghasystems.br');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (201, 'Charles', 'Duschel', '39 Guzman Ave', 589178371, 'c.duschel@usainstruments.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (202, 'Vivica', 'Lachey', '79 Hudson', 515683362, 'vivica.lachey@cimalabs.hk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (203, 'Delroy', 'Blades', '97 Ledger', 596472635, 'delroy.blades@credopetrol');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (204, 'Rosanne', 'Barrymore', '90 Rhames Street', 522673876, 'rosanne@ecopy.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (205, 'Val', 'Metcalf', '61 Vassar Ave', 545736918, 'val.metcalf@ubp.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (206, 'Doug', 'Alston', '23rd Street', 524277219, 'doug.alston@benecongroup.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (207, 'Brian', 'Crow', '97 Weir Road', 511712849, 'brian.crow@quicksilverres');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (208, 'Earl', 'Close', '25 Lightfoot Drive', 518448311, 'earlc@mindiq.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (209, 'Randy', 'Wakeling', '21 Tyson', 515668425, 'randy.wakeling@mls.ch');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (210, 'Gilbert', 'Paquin', '670 Brno Street', 531455475, 'gilbert.paquin@ctg.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (211, 'Tony', 'Graham', '87 Nashua Blvd', 575263597, 'tony.graham@onstaff.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (212, 'Hope', 'Thurman', '91 Karen Street', 579911583, 'hopet@ach.nl');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (213, 'Gates', 'Koyana', '47 Marc Ave', 552826815, 'gates.koyana@worldcom.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (214, 'Neve', 'Evans', '13rd Street', 548661216, 'neve.evans@aop.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (215, 'Jake', 'Beck', '42nd Street', 518863513, 'jbeck@marlabs.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (216, 'Leelee', 'Speaks', '21 Jackman Road', 512313935, 'leelee.speaks@visionarysy');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (217, 'Albert', 'Tennison', '61 Lennix Drive', 589132679, 'albert.tennison@jewettcam');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (218, 'Udo', 'Hornsby', '804 Hubbard Street', 571233147, 'udo.hornsby@ogi.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (219, 'Wendy', 'Ribisi', '61st Street', 529841986, 'wribisi@cowlitzbancorp.co');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (220, 'Elijah', 'Gough', '76 Roberta Road', 573754889, 'elijah.gough@kitba.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (221, 'Mos', 'Loveless', '435 Hector Drive', 593131522, 'mos.loveless@larkinenterp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (222, 'Heather', 'Mellencamp', '44 Stanton Drive', 586363688, 'heather.m@doraldentalusa.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (223, 'Bridget', 'Kershaw', '121 Kattan', 529529592, 'bridget@dbprofessionals.c');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (224, 'Peter', 'Williams', '23rd Street', 585299177, 'peter.williams@shirtfacto');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (225, 'Ashley', 'Fehr', '67 Assante Drive', 516523359, 'ashley.fehr@extremepizza.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (226, 'Samuel', 'Murdock', '274 Todd Street', 574851451, 'samuel.murdock@innovateec');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (227, 'Oliver', 'Hiatt', '789 Geoff Road', 572144943, 'oliver.hiatt@granitesyste');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (228, 'Nicholas', 'Johansen', '3 Bergara Ave', 573932661, 'nicholas.johansen@baesch.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (229, 'Rick', 'Geldof', '94 Uden Road', 517984385, 'rick.geldof@americanpan.c');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (230, 'Ryan', 'Richter', '62 Bachman Street', 555785573, 'rrichter@teamstudio.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (231, 'Jackson', 'Adams', '82 Cross Ave', 525435431, 'jadams@pharmafab.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (232, 'Scott', 'Houston', '33rd Street', 548364472, 'scott.houston@stonetechpr');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (233, 'Lara', 'McKennitt', '68 Todd Street', 547598151, 'lmckennitt@base.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (234, 'Mykelti', 'Craig', '13 Nicholas Drive', 524544346, 'mykelti@chhc.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (235, 'Jean', 'Crow', '13rd Street', 524373559, 'jean.crow@isd.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (236, 'Garry', 'Redford', '1 Jim Blvd', 569646457, 'garry.r@chipssolutions.co');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (237, 'Jill', 'Ingram', '30 Hutton Road', 567527634, 'jill.i@mwp.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (238, 'Parker', 'Costa', '95 Waterloo Drive', 572481742, 'parker.costa@bestever.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (239, 'Demi', 'Clayton', '65 Maebashi Road', 577287169, 'demi.clayton@veritekinter');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (240, 'Miguel', 'Tomei', '91st Street', 593661315, 'miguel@newmedia.it');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (241, 'Tzi', 'Stamp', '61 Hanley Drive', 518761653, 'tzis@kwraf.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (242, 'Mindy', 'Foxx', '653 Smith Road', 566631588, 'mindy.foxx@hps.mx');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (243, 'Randy', 'Daniels', '23 Pfeiffer', 562878427, 'rdaniels@oneidafinancial.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (244, 'Harriet', 'Presley', '55 Dublin Street', 569217991, 'hpresley@daimlerchrysler.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (245, 'Sander', 'Dysart', '75 Flanagan Street', 543222266, 'sander.dysart@bmm.ar');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (246, 'Cliff', 'Levert', '27 Boston Road', 517641236, 'cliff.l@y2marketing.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (247, 'Jill', 'De Almeida', '39 Nanaimo Ave', 599598663, 'jdealmeida@avs.fr');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (248, 'Wayne', 'Farina', '32nd Street', 598844522, 'wayne.farina@clubone.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (249, 'Selma', 'Gambon', '59 Anderson Street', 511746852, 'selma.gambon@aquickdelive');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (250, 'Harrison', 'Reilly', '69 Astin Blvd', 596682622, 'harrison.r@yes.it');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (251, 'Jesse', 'Alda', '61 New orleans Drive', 529187481, 'jesse.alda@paintedword.se');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (252, 'Joaquin', 'Garza', '27 Sandler Street', 599169475, 'joaquin@gdi.it');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (253, 'Queen', 'Caan', '106 Rhys-Davies Blvd', 595366837, 'queen@newviewgifts.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (254, 'Christian', 'Curfman', '63 Cocker Drive', 538489961, 'christian.curfman@hondamo');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (255, 'Cheech', 'Singletary', '567 Franz Drive', 577776859, 'cheechs@circuitcitystores');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (256, 'Lupe', 'Copeland', '4 James Road', 532844588, 'lupe.copeland@spotfirehol');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (257, 'Cary', 'Arquette', '18 Loren Road', 553118869, 'c.arquette@dillards.it');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (258, 'Trey', 'Rivers', '55 Market Harborough Road', 579194757, 'trey.rivers@restaurantpar');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (259, 'Bobbi', 'Janssen', '31 Hounslow Street', 539321442, 'bjanssen@ksj.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (260, 'Isaiah', 'Haslam', '161 Maxwell Drive', 574352886, 'i.haslam@cowlitzbancorp.c');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (261, 'Ice', 'Gere', '540 Maria Street', 518177241, 'ice@hfg.fr');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (262, 'Paul', 'Vince', '71st Street', 574798457, 'paul.vince@sm.be');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (263, 'Allan', 'Hart', '81 Kreuzau Street', 566851699, 'allanh@boldtechsystems.be');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (264, 'Helen', 'Sorvino', '61st Street', 567699545, 'helen@trm.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (265, 'Gerald', 'Levert', '22nd Street', 558144989, 'gerald.levert@digitalmoto');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (266, 'Chaka', 'Diddley', '97 Trace', 582741656, 'chaka.diddley@als.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (267, 'Jean-Luc', 'Daniels', '19 Diddley Road', 531232424, 'j.daniels@alternativetech');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (268, 'Malcolm', 'Charles', '96 Kasey Road', 529385873, 'malcolm.charles@surmodics');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (269, 'Edward', 'Willis', '40 Emmerich Drive', 599955869, 'edward.willis@angieslist.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (270, 'Claude', 'Satriani', '75 Neuquen Blvd', 555788368, 'claude.satriani@bashen.co');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (271, 'Machine', 'Stiles', '66 Bello Drive', 518648277, 'machine.stiles@investment');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (272, 'Frank', 'Sylvian', '47 Tennison', 565527111, 'franks@nexxtworks.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (273, 'Patrick', 'Visnjic', '89 Changwon-si Drive', 543535775, 'patrick@trekequipment.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (274, 'Kid', 'Phillippe', '71 Lattimore Road', 584728922, 'kid.p@angieslist.it');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (275, 'Leslie', 'Tyler', '66 Nepean Blvd', 552268166, 'leslie.tyler@spas.br');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (276, 'King', 'Cooper', '89 Bonnie Street', 551238229, 'king.cooper@millersystems');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (277, 'Benicio', 'Lovitz', '33 Terrasa Ave', 598296439, 'benicio@reckittbenckiser.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (278, 'Renee', 'Brooks', '39 Roberta Blvd', 565962592, 'r.brooks@johnson.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (279, 'Mia', 'Isaacs', '973 Stuart', 592539767, 'mia.isaacs@sps.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (280, 'Marley', 'McDonald', '36 Reese Street', 575354282, 'marley@ass.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (281, 'Giovanni', 'McKean', '56 Lonnie Blvd', 518926983, 'giovanni.mckean@fpf.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (282, 'Meryl', 'McNeice', '11 Wakeling', 529773267, 'meryl.mcneice@wyeth.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (283, 'April', 'Peet', '69 Robert Drive', 558462688, 'april.peet@larkinenterpri');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (284, 'Andy', 'Griffin', '660 Julianna Street', 595471941, 'andy.griffin@logisticare.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (285, 'Rachael', 'Makowicz', '599 McGoohan Street', 522289681, 'rachael.makowicz@smi.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (286, 'Victoria', 'Foster', '371 Ellis', 563472544, 'victoria.foster@eagleone.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (287, 'Carlos', 'Lloyd', '74 Rio de janeiro Street', 593921517, 'carlos.lloyd@seiaarons.co');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (288, 'Moe', 'Cheadle', '73 Edwin Street', 548489546, 'moe.cheadle@dearbornbanco');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (289, 'Emerson', 'Williamson', '61st Street', 571131995, 'emerson.williamson@hotmai');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (290, 'Rod', 'Krabbe', '375 Warren Drive', 574168787, 'rod.krabbe@bmm.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (291, 'Giovanni', 'Arkin', '583 Buddy Street', 532119834, 'giovanni.a@yes.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (292, 'Matt', 'Peniston', '52 Rosario Ave', 559551985, 'mpeniston@innovativelight');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (293, 'Chloe', 'Michael', '754 Johnson Ave', 535358251, 'chloe.michael@diversitech');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (294, 'Garland', 'Bacon', '22 Biel Drive', 535984494, 'gbacon@grayhawksystems.es');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (295, 'Pelvic', 'Basinger', '41 Liu Road', 568485166, 'pelvic.basinger@component');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (296, 'Jeremy', 'Charles', '291 Dawson Blvd', 559113321, 'jeremy@als.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (297, 'Victor', 'Lavigne', '85 California Road', 596525644, 'victor.l@vesta.jp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (298, 'Thelma', 'Posener', '60 Starr Blvd', 591313826, 't.posener@aquickdelivery.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (299, 'Shannyn', 'Cara', '82 Cary Street', 537387629, 'shannyn.cara@hudsonriverb');
commit;
prompt 300 records committed...
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (300, 'Liquid', 'Taha', '494 First Road', 585982858, 'liquid.taha@marlabs.ar');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (301, 'Barbara', 'McCready', '37 Perez Ave', 519952985, 'barbara@trm.jp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (302, 'Franz', 'Rudd', '61 Sandoval Street', 578718618, 'franz.rudd@naturescure.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (303, 'Allison', 'Heron', '661 Hopper Drive', 564163516, 'allison@elitemedical.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (304, 'Neneh', 'Diesel', '77 Coolidge Ave', 599212727, 'neneh.diesel@coldstonecre');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (305, 'Elisabeth', 'Torn', '2 Lublin Ave', 523183733, 'elisabetht@generalmotors.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (306, 'Horace', 'Ifans', '89 Matheson Road', 555213698, 'horace.ifans@vms.ca');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (307, 'Rolando', 'O''Connor', '12nd Street', 546656249, 'r.oconnor@ungertechnologi');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (308, 'Carla', 'English', '92 Sally Road', 582981813, 'carla.english@sis.jp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (309, 'Merrill', 'Winger', '41st Street', 515685291, 'merrill.w@bluffcitysteel.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (310, 'Marc', 'Field', '74 Russell Blvd', 595371714, 'marc@emt.sg');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (311, 'Marlon', 'Postlethwaite', '91st Street', 526983265, 'marlon.postlethwaite@bigd');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (312, 'Lari', 'Lawrence', '72nd Street', 587166217, 'lari.lawrence@contract.co');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (313, 'Kyra', 'Deejay', '32nd Street', 561742133, 'kdeejay@envisiontelephony');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (314, 'Beth', 'Torres', '50 Grand Rapids Street', 539957727, 'beth.torres@aquickdeliver');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (315, 'Rhea', 'Diffie', '82 Polley Street', 533478964, 'rhea.d@keith.it');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (316, 'Merrill', 'Nicks', '340 Zipf Road', 594279383, 'merrilln@chhc.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (317, 'Melba', 'Tisdale', '32 Marx Street', 591582447, 'melba.tisdale@pioneermort');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (318, 'Tal', 'McCoy', '98 Dreieich Drive', 554447766, 'tal.m@solutionbuilders.co');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (319, 'Hazel', 'Whitaker', '10 Ferrer Street', 561677353, 'hazel.whitaker@computerso');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (320, 'Faye', 'Bright', '942 Al Road', 531444191, 'faye@globalwireless.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (321, 'Garry', 'Barkin', '7 Rupert Road', 581295181, 'garry.b@inspirationsoftwa');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (322, 'Aaron', 'Wood', '93 H׳”ssleholm Street', 548982163, 'aaron.wood@trx.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (323, 'Phoebe', 'de Lancie', '31 Warren Ave', 536867383, 'phoebe@ccb.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (324, 'Chad', 'Dolenz', '64 Costner', 527838925, 'c.dolenz@gillani.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (325, 'Kristin', 'Giamatti', '19 Young Street', 594781574, 'kristin.giamatti@air.fr');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (326, 'Ivan', 'England', '82 Arkin Road', 593287815, 'ivan.england@infovision.n');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (327, 'Eddie', 'Coverdale', '81 Thorton Blvd', 515568687, 'e.coverdale@ubp.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (328, 'Stanley', 'Broza', '49 Askew Blvd', 538699296, 'stanley.b@prometheuslabor');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (329, 'Ming-Na', 'Moffat', '57 Kay', 543442887, 'mingna.moffat@clorox.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (330, 'Lonnie', 'Scaggs', '73 Collie', 599124687, 'lonnie.scaggs@marriottint');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (331, 'Randall', 'Schwarzenegger', '42 Leto', 552834813, 'rschwarzenegger@solutionb');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (332, 'Davey', 'Sweet', '72nd Street', 544624187, 'davey.s@technica.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (333, 'Chubby', 'Hubbard', '65 Karyo Road', 596366175, 'chubbyh@infovision.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (334, 'Mia', 'Browne', '22 Leslie Street', 594775291, 'm.browne@electricalsoluti');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (335, 'Brent', 'Underwood', '62nd Street', 562499625, 'brentu@gci.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (336, 'Lorraine', 'Mazzello', '81 Ceili Drive', 544993811, 'lorraine.mazzello@onesour');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (337, 'Victoria', 'Berkley', '659 Goslar Street', 547299278, 'victoria.berkley@enterpri');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (338, 'Boz', 'Charles', '81 New hartford Drive', 584818115, 'b.charles@medamicus.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (339, 'Alana', 'Blige', '73 Orbit Road', 522658479, 'alana.blige@trusecure.py');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (340, 'Roscoe', 'Navarro', '89 Pony', 512691399, 'rnavarro@yes.br');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (341, 'Terri', 'Reed', '977 Dartmouth Road', 551594377, 'terri.reed@scriptsave.be');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (342, 'Marty', 'Cartlidge', '195 Rickie Street', 528652663, 'marty@printtech.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (343, 'Oro', 'Maxwell', '18 Dar Road', 598657398, 'o.maxwell@accesssystems.f');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (344, 'Robby', 'O''Sullivan', '17 Hatchet Street', 562698512, 'rosullivan@entelligence.f');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (345, 'Cuba', 'Tucci', '64 Stewart Road', 562659879, 'ctucci@commworks.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (346, 'Ralph', 'Weaver', '87 Crewson Road', 521986531, 'r.weaver@unilever.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (347, 'Sandra', 'Rhymes', '90 Nicholas Street', 516396955, 'sandrar@stm.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (348, 'Richard', 'Meniketti', '58 Sample Drive', 562577281, 'richard.meniketti@portage');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (349, 'Judy', 'Ripley', '36 Carrington Drive', 591581833, 'judy.ripley@sci.ht');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (350, 'Leon', 'Nightingale', '32 May Road', 552967884, 'leon.n@gha.nl');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (351, 'Heather', 'Vaughn', '47 Luke Drive', 582727145, 'heather.vaughn@investment');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (352, 'Liev', 'Hamilton', '13rd Street', 567957841, 'liev@gha.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (353, 'Laurence', 'Wheel', '15 Alannah Road', 526326325, 'laurence.wheel@columbiaba');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (354, 'Vendetta', 'Creek', '100 Salt Lake City Drive', 553692618, 'vendetta.creek@accurateau');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (355, 'Mac', 'Bright', '687 Savage Ave', 518343367, 'mac.bright@innovateecomme');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (356, 'Brent', 'Leto', '93 Leo Street', 556535476, 'brent.leto@accesssystems.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (357, 'Holly', 'Crouch', '66 Tilly Road', 512715252, 'hcrouch@kis.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (358, 'Daniel', 'Lowe', '14 Wilmington Street', 576614496, 'daniel.lowe@americanhealt');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (359, 'Penelope', 'Satriani', '54 Hughes Street', 528797518, 'penelope.satriani@virbac.');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (360, 'Greg', 'Lange', '42 Garcia Road', 544642272, 'greg.lange@freedommedical');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (361, 'Tanya', 'Gugino', '28 Feliciano Drive', 554858534, 'tanya@bestbuy.ch');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (362, 'Terry', 'Franklin', '48 Lake Bluff Street', 589974289, 'terry.franklin@dsp.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (363, 'Kirk', 'Sanchez', '73rd Street', 574251766, 'kirk.sanchez@keith.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (364, 'Mary', 'Blaine', '42 Hannover Road', 514589984, 'mary@insurmark.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (365, 'Cliff', 'Schwimmer', '27 Buffalo Drive', 587293446, 'cschwimmer@solipsys.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (366, 'Famke', 'Posener', '93rd Street', 555999615, 'famke.posener@hardwoodwho');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (367, 'Gordie', 'Beckham', '13 Tyne & Wear Street', 585925793, 'g.beckham@processplus.ee');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (368, 'Mira', 'Leary', '11 Finn Blvd', 536748533, 'miral@hotmail.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (369, 'Benjamin', 'McGregor', '51 Brothers Street', 544257223, 'benjamin@savela.za');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (370, 'Gloria', 'Moorer', '45 Ohita Street', 522548385, 'gloria.m@trafficmanagemen');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (371, 'Kasey', 'Payton', '65 Wehrheim Road', 572571772, 'kasey.p@appriss.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (372, 'Colleen', 'Griffin', '98 de Lancie Drive', 561896139, 'colleen.griffin@bedfordba');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (373, 'Daryl', 'Ermey', '92 Wong Street', 543952332, 'daryl.e@knightsbridge.de');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (374, 'Carlene', 'McAnally', '42 Doug Drive', 562386526, 'carlene@shot.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (375, 'Carole', 'Rizzo', '73 Suchet Road', 533536813, 'carole.rizzo@ubp.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (376, 'Jean-Luc', 'Watson', '94 Itu Blvd', 543178638, 'j.watson@aldensystems.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (377, 'Martha', 'Calle', '338 Gill Street', 534647795, 'martha.calle@circuitcitys');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (378, 'Holland', 'Cross', '13rd Street', 573575776, 'holland.cross@monitronics');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (379, 'Benicio', 'Kravitz', '33 Willem', 581572244, 'benicio.kravitz@genextech');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (380, 'Diane', 'Shand', '91 Haysbert Ave', 522187479, 'diane.shand@horizon.br');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (381, 'Robbie', 'Gates', '26 Ralph Drive', 521377526, 'robbie.gates@gdi.uk');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (382, 'Pierce', 'Katt', '60 Manu Ave', 581664312, 'p.katt@qls.at');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (383, 'Rhys', 'Phifer', '5 Kapanka Road', 554197445, 'rhysp@bigdoughcom.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (384, 'Sam', 'Glenn', '72 Terry Street', 519815845, 'sglenn@printingforlesscom');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (385, 'Carlos', 'Theron', '31 Dukakis Drive', 542628342, 'carlos.t@dynacqinternatio');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (386, 'Hazel', 'Meniketti', '32nd Street', 539564328, 'hmeniketti@integramedamer');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (387, 'Chant׳™', 'Osment', '33 Wilder Ave', 534689455, 'chanto@scheringplough.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (388, 'Merrill', 'Rawls', '94 Amos Road', 587184638, 'merrill.rawls@yes.jp');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (389, 'Shannon', 'DeVita', '95 Pecs Drive', 533815775, 'shannon.devita@reckittben');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (390, 'Halle', 'Rifkin', '91 Vertical Road', 564295312, 'halle.rifkin@max.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (391, 'Chazz', 'Folds', '78 Herndon Road', 562894916, 'chazz@genextechnologies.p');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (392, 'Hex', 'Hackman', '50 Johnny Street', 536762972, 'h.hackman@qas.ca');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (393, 'Michael', 'Nunn', '46 Lynn Road', 586594933, 'mnunn@sweetproductions.be');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (394, 'Lynette', 'Loggia', '46 Wade Road', 595233698, 'lynette.loggia@nhr.za');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (395, 'Ned', 'Santa Rosa', '100 Thornton Ave', 581539937, 'ned.santarosa@connected.c');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (396, 'Todd', 'Gore', '31st Street', 576495986, 't.gore@scjohnson.in');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (397, 'Brothers', 'Dawson', '63 Londrina', 542751338, 'brothers.dawson@isd.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (398, 'Sylvester', 'Snider', '804 Eschen Street', 544563754, 'ssnider@benecongroup.com');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (399, 'Ronnie', 'Hauer', '36 Mablethorpe Drive', 569836947, 'r.hauer@sprint.uk');
commit;
prompt 400 records loaded
prompt Loading EVENT...
insert into EVENT (event_id, event_date, place)
values (0, to_date('07-12-2018', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (1, to_date('21-10-2011', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (2, to_date('21-01-2020', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (3, to_date('27-01-2009', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (4, to_date('14-04-2000', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (5, to_date('26-10-2005', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (6, to_date('17-02-2012', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (7, to_date('01-05-2003', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (8, to_date('27-02-2014', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (9, to_date('05-08-2004', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (10, to_date('03-05-2006', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (11, to_date('27-04-2014', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (12, to_date('12-09-2002', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (13, to_date('30-03-2011', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (14, to_date('25-10-2018', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (15, to_date('21-11-2021', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (16, to_date('13-03-2011', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (17, to_date('23-07-2016', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (18, to_date('01-06-2004', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (19, to_date('31-08-2012', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (20, to_date('02-01-2014', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (21, to_date('11-11-2020', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (22, to_date('15-01-2013', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (23, to_date('06-11-2011', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (24, to_date('21-07-2001', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (25, to_date('23-09-2014', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (26, to_date('18-01-2000', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (27, to_date('25-08-2000', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (28, to_date('29-12-2013', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (29, to_date('23-01-2016', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (30, to_date('28-03-2022', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (31, to_date('03-02-2012', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (32, to_date('11-01-2024', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (33, to_date('21-04-2017', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (34, to_date('21-09-2014', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (35, to_date('06-12-2014', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (36, to_date('07-03-2010', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (37, to_date('19-05-2013', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (38, to_date('21-02-2002', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (39, to_date('16-04-2000', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (40, to_date('22-02-2001', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (41, to_date('22-11-2012', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (42, to_date('15-09-2012', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (43, to_date('06-10-2002', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (44, to_date('06-01-2018', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (45, to_date('27-02-2008', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (46, to_date('18-01-2012', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (47, to_date('12-03-2007', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (48, to_date('11-12-2011', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (49, to_date('24-08-2001', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (50, to_date('02-03-2003', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (51, to_date('04-06-2009', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (52, to_date('05-09-2016', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (53, to_date('25-08-2015', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (54, to_date('22-04-2024', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (55, to_date('19-06-2011', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (56, to_date('11-12-2003', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (57, to_date('11-01-2012', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (58, to_date('28-04-2020', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (59, to_date('24-04-2024', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (60, to_date('07-06-2002', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (61, to_date('30-08-2014', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (62, to_date('23-01-2002', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (63, to_date('24-03-2005', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (64, to_date('09-03-2017', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (65, to_date('18-01-2020', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (66, to_date('21-02-2006', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (67, to_date('31-01-2022', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (68, to_date('23-07-2017', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (69, to_date('27-01-2013', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (70, to_date('06-05-2001', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (71, to_date('27-10-2010', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (72, to_date('07-02-2018', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (73, to_date('14-10-2014', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (74, to_date('12-12-2009', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (75, to_date('20-10-2003', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (76, to_date('22-08-2008', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (77, to_date('04-11-2015', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (78, to_date('18-12-2004', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (79, to_date('13-01-2000', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (80, to_date('17-08-2001', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (81, to_date('26-02-2015', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (82, to_date('28-04-2022', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (83, to_date('13-09-2013', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (84, to_date('28-10-2001', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (85, to_date('12-05-2017', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (86, to_date('23-03-2000', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (87, to_date('25-05-2008', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (88, to_date('25-02-2020', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (89, to_date('12-07-2013', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (90, to_date('25-01-2004', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (91, to_date('26-08-2009', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (92, to_date('02-11-2009', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (93, to_date('03-04-2018', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (94, to_date('24-11-2007', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (95, to_date('25-08-2005', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (96, to_date('01-06-2017', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (97, to_date('11-11-2016', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (98, to_date('02-09-2012', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (99, to_date('01-11-2001', 'dd-mm-yyyy'), 'Grand Hall');
commit;
prompt 100 records committed...
insert into EVENT (event_id, event_date, place)
values (100, to_date('15-03-2012', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (101, to_date('25-09-2017', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (102, to_date('15-08-2013', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (103, to_date('12-01-2010', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (104, to_date('07-10-2003', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (105, to_date('20-09-2014', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (106, to_date('02-11-2011', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (107, to_date('01-10-2020', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (108, to_date('22-07-2008', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (109, to_date('25-12-2005', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (110, to_date('04-04-2021', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (111, to_date('13-07-2007', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (112, to_date('11-12-2011', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (113, to_date('24-05-2020', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (114, to_date('04-05-2022', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (115, to_date('18-01-2012', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (116, to_date('24-03-2023', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (117, to_date('24-04-2005', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (118, to_date('06-09-2008', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (119, to_date('20-05-2017', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (120, to_date('23-02-2004', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (121, to_date('16-07-2014', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (122, to_date('09-09-2004', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (123, to_date('26-12-2023', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (124, to_date('12-04-2012', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (125, to_date('09-10-2013', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (126, to_date('10-07-2005', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (127, to_date('01-05-2011', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (128, to_date('19-11-2022', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (129, to_date('07-09-2010', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (130, to_date('01-01-2010', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (131, to_date('28-09-2004', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (132, to_date('19-05-2014', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (133, to_date('26-11-2021', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (134, to_date('07-03-2000', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (135, to_date('10-07-2003', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (136, to_date('28-06-2000', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (137, to_date('02-04-2023', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (138, to_date('17-11-2013', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (139, to_date('31-03-2014', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (140, to_date('24-01-2009', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (141, to_date('17-02-2005', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (142, to_date('26-07-2017', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (143, to_date('06-07-2018', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (144, to_date('13-07-2007', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (145, to_date('23-02-2011', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (146, to_date('11-07-2018', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (147, to_date('26-06-2021', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (148, to_date('11-11-2018', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (149, to_date('02-09-2013', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (150, to_date('29-09-2001', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (151, to_date('28-06-2010', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (152, to_date('12-07-2013', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (153, to_date('17-06-2016', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (154, to_date('19-07-2008', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (155, to_date('21-10-2018', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (156, to_date('22-04-2016', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (157, to_date('14-08-2018', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (158, to_date('01-08-2015', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (159, to_date('18-12-2001', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (160, to_date('19-06-2013', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (161, to_date('13-07-2010', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (162, to_date('18-04-2004', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (163, to_date('19-04-2014', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (164, to_date('05-09-2001', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (165, to_date('05-11-2001', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (166, to_date('24-06-2001', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (167, to_date('25-12-2002', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (168, to_date('22-12-2007', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (169, to_date('02-04-2008', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (170, to_date('31-08-2017', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (171, to_date('04-03-2024', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (172, to_date('31-07-2007', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (173, to_date('19-07-2021', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (174, to_date('23-05-2005', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (175, to_date('12-07-2003', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (176, to_date('21-11-2007', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (177, to_date('05-09-2011', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (178, to_date('26-11-2007', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (179, to_date('14-05-2016', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (180, to_date('11-12-2005', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (181, to_date('21-07-2009', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (182, to_date('22-09-2010', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (183, to_date('26-08-2014', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (184, to_date('17-06-2014', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (185, to_date('01-06-2002', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (186, to_date('04-02-2008', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (187, to_date('21-06-2000', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (188, to_date('06-03-2010', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (189, to_date('12-07-2007', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (190, to_date('20-01-2016', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (191, to_date('05-02-2012', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (192, to_date('28-11-2023', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (193, to_date('22-02-2007', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (194, to_date('28-10-2007', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (195, to_date('07-02-2020', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (196, to_date('24-07-2006', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (197, to_date('23-01-2013', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (198, to_date('21-04-2015', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (199, to_date('25-10-2001', 'dd-mm-yyyy'), 'Event Arena');
commit;
prompt 200 records committed...
insert into EVENT (event_id, event_date, place)
values (200, to_date('13-08-2007', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (201, to_date('05-11-2016', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (202, to_date('05-07-2006', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (203, to_date('13-05-2023', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (204, to_date('04-08-2007', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (205, to_date('29-10-2020', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (206, to_date('01-05-2002', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (207, to_date('13-05-2012', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (208, to_date('27-03-2014', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (209, to_date('01-08-2003', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (210, to_date('22-12-2017', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (211, to_date('13-07-2001', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (212, to_date('14-10-2007', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (213, to_date('08-12-2014', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (214, to_date('06-04-2024', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (215, to_date('16-02-2014', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (216, to_date('03-08-2003', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (217, to_date('20-05-2010', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (218, to_date('15-11-2001', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (219, to_date('27-10-2005', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (220, to_date('20-08-2012', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (221, to_date('06-02-2010', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (222, to_date('21-05-2015', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (223, to_date('24-03-2009', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (224, to_date('21-11-2021', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (225, to_date('27-09-2021', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (226, to_date('22-07-2014', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (227, to_date('03-11-2017', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (228, to_date('23-10-2018', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (229, to_date('18-08-2019', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (230, to_date('23-02-2021', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (231, to_date('27-11-2023', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (232, to_date('18-04-2011', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (233, to_date('22-09-2004', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (234, to_date('30-07-2018', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (235, to_date('15-02-2015', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (236, to_date('13-09-2018', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (237, to_date('05-06-2023', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (238, to_date('11-09-2007', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (239, to_date('19-05-2003', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (240, to_date('30-06-2009', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (241, to_date('24-04-2023', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (242, to_date('11-03-2009', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (243, to_date('16-04-2012', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (244, to_date('09-01-2005', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (245, to_date('16-02-2009', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (246, to_date('19-09-2012', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (247, to_date('29-08-2023', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (248, to_date('11-01-2008', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (249, to_date('16-04-2011', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (250, to_date('30-11-2018', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (251, to_date('20-08-2004', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (252, to_date('18-02-2024', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (253, to_date('06-04-2013', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (254, to_date('30-09-2003', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (255, to_date('18-09-2015', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (256, to_date('02-08-2005', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (257, to_date('23-06-2008', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (258, to_date('07-03-2000', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (259, to_date('20-04-2009', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (260, to_date('01-12-2009', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (261, to_date('01-02-2016', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (262, to_date('10-08-2004', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (263, to_date('12-09-2001', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (264, to_date('10-08-2012', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (265, to_date('25-10-2006', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (266, to_date('09-08-2000', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (267, to_date('12-11-2008', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (268, to_date('02-11-2007', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (269, to_date('14-02-2007', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (270, to_date('02-07-2002', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (271, to_date('02-03-2014', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (272, to_date('28-01-2007', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (273, to_date('21-11-2015', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (274, to_date('31-03-2021', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (275, to_date('25-11-2016', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (276, to_date('13-10-2008', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (277, to_date('30-11-2001', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (278, to_date('21-04-2001', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (279, to_date('23-04-2015', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (280, to_date('27-03-2012', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (281, to_date('14-07-2006', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (282, to_date('10-03-2021', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (283, to_date('25-07-2021', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (284, to_date('12-06-2002', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (285, to_date('14-01-2010', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (286, to_date('12-10-2001', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (287, to_date('01-04-2011', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (288, to_date('22-08-2003', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (289, to_date('07-10-2000', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (290, to_date('20-08-2019', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (291, to_date('13-05-2002', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (292, to_date('01-04-2006', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (293, to_date('29-01-2003', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (294, to_date('22-02-2006', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (295, to_date('14-01-2020', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (296, to_date('02-04-2011', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (297, to_date('20-05-2015', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (298, to_date('14-12-2002', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (299, to_date('02-02-2020', 'dd-mm-yyyy'), 'Grand Hall');
commit;
prompt 300 records committed...
insert into EVENT (event_id, event_date, place)
values (300, to_date('28-02-2021', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (301, to_date('24-07-2004', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (302, to_date('21-08-2022', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (303, to_date('11-04-2015', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (304, to_date('04-02-2002', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (305, to_date('29-07-2005', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (306, to_date('25-05-2002', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (307, to_date('07-02-2014', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (308, to_date('23-11-2011', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (309, to_date('07-03-2009', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (310, to_date('01-05-2021', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (311, to_date('06-01-2016', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (312, to_date('03-10-2006', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (313, to_date('16-08-2003', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (314, to_date('23-02-2001', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (315, to_date('11-03-2014', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (316, to_date('27-12-2008', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (317, to_date('05-12-2023', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (318, to_date('05-11-2011', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (319, to_date('29-12-2005', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (320, to_date('09-01-2002', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (321, to_date('23-09-2013', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (322, to_date('10-01-2012', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (323, to_date('03-01-2011', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (324, to_date('15-11-2015', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (325, to_date('23-09-2011', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (326, to_date('16-07-2023', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (327, to_date('23-07-2023', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (328, to_date('01-01-2013', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (329, to_date('24-05-2004', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (330, to_date('04-12-2008', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (331, to_date('14-08-2021', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (332, to_date('02-06-2013', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (333, to_date('22-09-2005', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (334, to_date('20-07-2012', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (335, to_date('23-09-2007', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (336, to_date('24-02-2020', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (337, to_date('25-09-2022', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (338, to_date('11-07-2004', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (339, to_date('23-09-2008', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (340, to_date('15-04-2013', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (341, to_date('19-02-2004', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (342, to_date('04-09-2012', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (343, to_date('12-01-2010', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (344, to_date('12-08-2012', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (345, to_date('26-02-2016', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (346, to_date('08-02-2006', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (347, to_date('11-05-2019', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (348, to_date('27-09-2013', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (349, to_date('20-05-2011', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (350, to_date('04-01-2018', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (351, to_date('20-03-2016', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (352, to_date('11-03-2017', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (353, to_date('24-10-2019', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (354, to_date('07-02-2020', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (355, to_date('16-07-2006', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (356, to_date('12-03-2004', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (357, to_date('07-02-2006', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (358, to_date('27-11-2011', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (359, to_date('05-10-2011', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (360, to_date('13-05-2005', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (361, to_date('10-09-2002', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (362, to_date('07-12-2007', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (363, to_date('09-10-2016', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (364, to_date('31-07-2018', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (365, to_date('06-09-2006', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (366, to_date('26-04-2020', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (367, to_date('09-01-2023', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (368, to_date('14-10-2019', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (369, to_date('13-04-2006', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (370, to_date('20-06-2012', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (371, to_date('17-09-2011', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (372, to_date('26-12-2017', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (373, to_date('08-11-2014', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (374, to_date('05-11-2018', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (375, to_date('08-02-2012', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (376, to_date('02-03-2008', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (377, to_date('18-01-2015', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (378, to_date('27-04-2016', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (379, to_date('05-11-2006', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (380, to_date('21-02-2017', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (381, to_date('03-02-2008', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (382, to_date('10-06-2010', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (383, to_date('06-07-2015', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (384, to_date('06-12-2022', 'dd-mm-yyyy'), 'Conference Center');
insert into EVENT (event_id, event_date, place)
values (385, to_date('11-12-2021', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (386, to_date('20-07-2019', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (387, to_date('16-02-2015', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (388, to_date('10-11-2015', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (389, to_date('18-02-2005', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (390, to_date('09-08-2005', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (391, to_date('16-08-2014', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (392, to_date('25-04-2006', 'dd-mm-yyyy'), 'Grand Hall');
insert into EVENT (event_id, event_date, place)
values (393, to_date('27-10-2020', 'dd-mm-yyyy'), 'Banquet Hall');
insert into EVENT (event_id, event_date, place)
values (394, to_date('08-11-2019', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (395, to_date('13-12-2014', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (396, to_date('30-07-2003', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (397, to_date('06-08-2009', 'dd-mm-yyyy'), 'Event Arena');
insert into EVENT (event_id, event_date, place)
values (398, to_date('30-07-2002', 'dd-mm-yyyy'), 'Exhibition Hall');
insert into EVENT (event_id, event_date, place)
values (399, to_date('26-03-2001', 'dd-mm-yyyy'), 'Exhibition Hall');
commit;
prompt 400 records loaded
prompt Loading CUSTOMERORDER...
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (289, to_date('06-10-2000', 'dd-mm-yyyy'), 289, 59);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (290, to_date('19-08-2019', 'dd-mm-yyyy'), 290, 26);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (291, to_date('12-05-2002', 'dd-mm-yyyy'), 291, 220);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (292, to_date('31-03-2006', 'dd-mm-yyyy'), 292, 205);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (293, to_date('28-01-2003', 'dd-mm-yyyy'), 293, 68);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (294, to_date('21-02-2006', 'dd-mm-yyyy'), 294, 204);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (295, to_date('13-01-2020', 'dd-mm-yyyy'), 295, 351);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (296, to_date('01-04-2011', 'dd-mm-yyyy'), 296, 230);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (297, to_date('19-05-2015', 'dd-mm-yyyy'), 297, 27);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (298, to_date('13-12-2002', 'dd-mm-yyyy'), 298, 109);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (299, to_date('01-02-2020', 'dd-mm-yyyy'), 299, 105);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (300, to_date('27-02-2021', 'dd-mm-yyyy'), 300, 362);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (0, to_date('06-12-2018', 'dd-mm-yyyy'), 0, 393);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (1, to_date('20-10-2011', 'dd-mm-yyyy'), 1, 71);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (2, to_date('20-01-2020', 'dd-mm-yyyy'), 2, 343);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (3, to_date('26-01-2009', 'dd-mm-yyyy'), 3, 208);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (4, to_date('13-04-2000', 'dd-mm-yyyy'), 4, 341);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (5, to_date('25-10-2005', 'dd-mm-yyyy'), 5, 250);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (6, to_date('16-02-2012', 'dd-mm-yyyy'), 6, 278);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (7, to_date('30-04-2003', 'dd-mm-yyyy'), 7, 283);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (8, to_date('26-02-2014', 'dd-mm-yyyy'), 8, 329);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (9, to_date('04-08-2004', 'dd-mm-yyyy'), 9, 92);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (10, to_date('02-05-2006', 'dd-mm-yyyy'), 10, 29);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (11, to_date('26-04-2014', 'dd-mm-yyyy'), 11, 277);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (12, to_date('11-09-2002', 'dd-mm-yyyy'), 12, 349);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (13, to_date('29-03-2011', 'dd-mm-yyyy'), 13, 385);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (14, to_date('24-10-2018', 'dd-mm-yyyy'), 14, 379);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (15, to_date('20-11-2021', 'dd-mm-yyyy'), 15, 315);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (16, to_date('12-03-2011', 'dd-mm-yyyy'), 16, 238);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (17, to_date('22-07-2016', 'dd-mm-yyyy'), 17, 251);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (18, to_date('31-05-2004', 'dd-mm-yyyy'), 18, 13);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (19, to_date('30-08-2012', 'dd-mm-yyyy'), 19, 135);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (20, to_date('01-01-2014', 'dd-mm-yyyy'), 20, 168);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (21, to_date('10-11-2020', 'dd-mm-yyyy'), 21, 135);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (22, to_date('14-01-2013', 'dd-mm-yyyy'), 22, 386);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (23, to_date('05-11-2011', 'dd-mm-yyyy'), 23, 161);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (24, to_date('20-07-2001', 'dd-mm-yyyy'), 24, 381);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (25, to_date('22-09-2014', 'dd-mm-yyyy'), 25, 102);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (26, to_date('17-01-2000', 'dd-mm-yyyy'), 26, 333);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (27, to_date('24-08-2000', 'dd-mm-yyyy'), 27, 11);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (28, to_date('28-12-2013', 'dd-mm-yyyy'), 28, 281);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (29, to_date('22-01-2016', 'dd-mm-yyyy'), 29, 314);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (30, to_date('19-01-2020', 'dd-mm-yyyy'), 30, 166);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (31, to_date('02-02-2012', 'dd-mm-yyyy'), 31, 370);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (32, to_date('28-08-2023', 'dd-mm-yyyy'), 32, 289);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (33, to_date('20-04-2017', 'dd-mm-yyyy'), 33, 277);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (34, to_date('20-09-2014', 'dd-mm-yyyy'), 34, 330);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (35, to_date('05-12-2014', 'dd-mm-yyyy'), 35, 254);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (36, to_date('06-03-2010', 'dd-mm-yyyy'), 36, 356);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (37, to_date('18-05-2013', 'dd-mm-yyyy'), 37, 333);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (38, to_date('20-02-2002', 'dd-mm-yyyy'), 38, 167);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (39, to_date('15-04-2000', 'dd-mm-yyyy'), 39, 201);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (40, to_date('21-02-2001', 'dd-mm-yyyy'), 40, 365);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (41, to_date('21-11-2012', 'dd-mm-yyyy'), 41, 182);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (42, to_date('14-09-2012', 'dd-mm-yyyy'), 42, 44);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (43, to_date('05-10-2002', 'dd-mm-yyyy'), 43, 18);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (44, to_date('05-01-2018', 'dd-mm-yyyy'), 44, 101);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (45, to_date('26-02-2008', 'dd-mm-yyyy'), 45, 111);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (46, to_date('17-01-2012', 'dd-mm-yyyy'), 46, 196);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (47, to_date('11-03-2007', 'dd-mm-yyyy'), 47, 216);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (48, to_date('10-12-2011', 'dd-mm-yyyy'), 48, 212);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (49, to_date('23-08-2001', 'dd-mm-yyyy'), 49, 320);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (50, to_date('01-03-2003', 'dd-mm-yyyy'), 50, 154);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (51, to_date('03-06-2009', 'dd-mm-yyyy'), 51, 364);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (52, to_date('04-09-2016', 'dd-mm-yyyy'), 52, 61);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (53, to_date('24-08-2015', 'dd-mm-yyyy'), 53, 211);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (54, to_date('21-11-2023', 'dd-mm-yyyy'), 54, 305);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (55, to_date('18-06-2011', 'dd-mm-yyyy'), 55, 93);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (56, to_date('10-12-2003', 'dd-mm-yyyy'), 56, 80);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (57, to_date('10-01-2012', 'dd-mm-yyyy'), 57, 39);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (58, to_date('27-04-2020', 'dd-mm-yyyy'), 58, 33);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (59, to_date('21-04-2021', 'dd-mm-yyyy'), 59, 187);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (60, to_date('06-06-2002', 'dd-mm-yyyy'), 60, 324);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (61, to_date('29-08-2014', 'dd-mm-yyyy'), 61, 196);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (62, to_date('22-01-2002', 'dd-mm-yyyy'), 62, 219);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (63, to_date('23-03-2005', 'dd-mm-yyyy'), 63, 72);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (64, to_date('08-03-2017', 'dd-mm-yyyy'), 64, 242);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (65, to_date('17-01-2020', 'dd-mm-yyyy'), 65, 306);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (66, to_date('20-02-2006', 'dd-mm-yyyy'), 66, 328);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (67, to_date('30-01-2022', 'dd-mm-yyyy'), 67, 173);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (68, to_date('22-07-2017', 'dd-mm-yyyy'), 68, 362);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (69, to_date('26-01-2013', 'dd-mm-yyyy'), 69, 23);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (70, to_date('05-05-2001', 'dd-mm-yyyy'), 70, 72);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (71, to_date('26-10-2010', 'dd-mm-yyyy'), 71, 18);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (72, to_date('06-02-2018', 'dd-mm-yyyy'), 72, 299);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (73, to_date('13-10-2014', 'dd-mm-yyyy'), 73, 302);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (74, to_date('11-12-2009', 'dd-mm-yyyy'), 74, 68);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (75, to_date('19-10-2003', 'dd-mm-yyyy'), 75, 376);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (76, to_date('21-08-2008', 'dd-mm-yyyy'), 76, 397);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (77, to_date('03-11-2015', 'dd-mm-yyyy'), 77, 41);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (78, to_date('17-12-2004', 'dd-mm-yyyy'), 78, 84);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (79, to_date('12-01-2000', 'dd-mm-yyyy'), 79, 112);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (80, to_date('16-08-2001', 'dd-mm-yyyy'), 80, 1);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (81, to_date('25-02-2015', 'dd-mm-yyyy'), 81, 246);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (82, to_date('12-12-2021', 'dd-mm-yyyy'), 82, 297);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (83, to_date('12-09-2013', 'dd-mm-yyyy'), 83, 224);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (84, to_date('27-10-2001', 'dd-mm-yyyy'), 84, 283);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (85, to_date('11-05-2017', 'dd-mm-yyyy'), 85, 36);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (86, to_date('22-03-2000', 'dd-mm-yyyy'), 86, 350);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (87, to_date('24-05-2008', 'dd-mm-yyyy'), 87, 372);
commit;
prompt 100 records committed...
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (88, to_date('24-02-2020', 'dd-mm-yyyy'), 88, 0);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (89, to_date('11-07-2013', 'dd-mm-yyyy'), 89, 42);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (90, to_date('24-01-2004', 'dd-mm-yyyy'), 90, 231);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (91, to_date('25-08-2009', 'dd-mm-yyyy'), 91, 145);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (92, to_date('01-11-2009', 'dd-mm-yyyy'), 92, 325);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (93, to_date('02-04-2018', 'dd-mm-yyyy'), 93, 89);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (94, to_date('23-11-2007', 'dd-mm-yyyy'), 94, 363);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (95, to_date('24-08-2005', 'dd-mm-yyyy'), 95, 187);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (96, to_date('31-05-2017', 'dd-mm-yyyy'), 96, 126);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (97, to_date('10-11-2016', 'dd-mm-yyyy'), 97, 154);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (98, to_date('01-09-2012', 'dd-mm-yyyy'), 98, 338);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (99, to_date('31-10-2001', 'dd-mm-yyyy'), 99, 21);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (100, to_date('14-03-2012', 'dd-mm-yyyy'), 100, 16);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (101, to_date('24-09-2017', 'dd-mm-yyyy'), 101, 58);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (102, to_date('14-08-2013', 'dd-mm-yyyy'), 102, 258);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (103, to_date('11-01-2010', 'dd-mm-yyyy'), 103, 292);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (104, to_date('06-10-2003', 'dd-mm-yyyy'), 104, 385);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (105, to_date('19-09-2014', 'dd-mm-yyyy'), 105, 299);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (106, to_date('01-11-2011', 'dd-mm-yyyy'), 106, 348);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (107, to_date('03-07-2020', 'dd-mm-yyyy'), 107, 72);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (108, to_date('21-07-2008', 'dd-mm-yyyy'), 108, 299);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (109, to_date('24-12-2005', 'dd-mm-yyyy'), 109, 89);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (110, to_date('03-04-2021', 'dd-mm-yyyy'), 110, 179);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (111, to_date('12-07-2007', 'dd-mm-yyyy'), 111, 352);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (112, to_date('10-12-2011', 'dd-mm-yyyy'), 112, 292);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (113, to_date('23-05-2020', 'dd-mm-yyyy'), 113, 377);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (114, to_date('03-05-2022', 'dd-mm-yyyy'), 114, 182);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (115, to_date('17-01-2012', 'dd-mm-yyyy'), 115, 153);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (116, to_date('16-04-2020', 'dd-mm-yyyy'), 116, 154);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (117, to_date('23-04-2005', 'dd-mm-yyyy'), 117, 154);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (118, to_date('05-09-2008', 'dd-mm-yyyy'), 118, 177);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (119, to_date('19-05-2017', 'dd-mm-yyyy'), 119, 183);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (120, to_date('22-02-2004', 'dd-mm-yyyy'), 120, 111);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (121, to_date('15-07-2014', 'dd-mm-yyyy'), 121, 9);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (122, to_date('08-09-2004', 'dd-mm-yyyy'), 122, 211);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (123, to_date('25-11-2021', 'dd-mm-yyyy'), 123, 286);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (124, to_date('11-04-2012', 'dd-mm-yyyy'), 124, 314);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (125, to_date('08-10-2013', 'dd-mm-yyyy'), 125, 211);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (126, to_date('09-07-2005', 'dd-mm-yyyy'), 126, 227);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (127, to_date('30-04-2011', 'dd-mm-yyyy'), 127, 191);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (128, to_date('18-11-2022', 'dd-mm-yyyy'), 128, 40);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (129, to_date('06-09-2010', 'dd-mm-yyyy'), 129, 319);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (130, to_date('31-12-2009', 'dd-mm-yyyy'), 130, 39);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (131, to_date('27-09-2004', 'dd-mm-yyyy'), 131, 16);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (132, to_date('18-05-2014', 'dd-mm-yyyy'), 132, 105);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (133, to_date('14-09-2021', 'dd-mm-yyyy'), 133, 183);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (134, to_date('06-03-2000', 'dd-mm-yyyy'), 134, 373);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (135, to_date('09-07-2003', 'dd-mm-yyyy'), 135, 239);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (136, to_date('27-06-2000', 'dd-mm-yyyy'), 136, 108);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (137, to_date('30-03-2022', 'dd-mm-yyyy'), 137, 325);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (138, to_date('16-11-2013', 'dd-mm-yyyy'), 138, 208);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (139, to_date('30-03-2014', 'dd-mm-yyyy'), 139, 186);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (140, to_date('23-01-2009', 'dd-mm-yyyy'), 140, 203);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (141, to_date('16-02-2005', 'dd-mm-yyyy'), 141, 177);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (142, to_date('25-07-2017', 'dd-mm-yyyy'), 142, 200);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (143, to_date('05-07-2018', 'dd-mm-yyyy'), 143, 141);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (144, to_date('12-07-2007', 'dd-mm-yyyy'), 144, 1);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (145, to_date('22-02-2011', 'dd-mm-yyyy'), 145, 365);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (146, to_date('10-07-2018', 'dd-mm-yyyy'), 146, 28);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (147, to_date('01-03-2021', 'dd-mm-yyyy'), 147, 343);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (148, to_date('10-11-2018', 'dd-mm-yyyy'), 148, 127);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (149, to_date('01-09-2013', 'dd-mm-yyyy'), 149, 112);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (150, to_date('28-09-2001', 'dd-mm-yyyy'), 150, 24);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (151, to_date('27-06-2010', 'dd-mm-yyyy'), 151, 172);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (152, to_date('11-07-2013', 'dd-mm-yyyy'), 152, 12);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (153, to_date('16-06-2016', 'dd-mm-yyyy'), 153, 145);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (154, to_date('18-07-2008', 'dd-mm-yyyy'), 154, 340);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (155, to_date('20-10-2018', 'dd-mm-yyyy'), 155, 168);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (156, to_date('21-04-2016', 'dd-mm-yyyy'), 156, 52);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (157, to_date('13-08-2018', 'dd-mm-yyyy'), 157, 385);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (158, to_date('31-07-2015', 'dd-mm-yyyy'), 158, 216);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (159, to_date('17-12-2001', 'dd-mm-yyyy'), 159, 16);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (160, to_date('18-06-2013', 'dd-mm-yyyy'), 160, 319);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (161, to_date('12-07-2010', 'dd-mm-yyyy'), 161, 208);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (162, to_date('17-04-2004', 'dd-mm-yyyy'), 162, 394);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (163, to_date('18-04-2014', 'dd-mm-yyyy'), 163, 126);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (164, to_date('04-09-2001', 'dd-mm-yyyy'), 164, 147);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (165, to_date('04-11-2001', 'dd-mm-yyyy'), 165, 349);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (166, to_date('23-06-2001', 'dd-mm-yyyy'), 166, 244);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (167, to_date('24-12-2002', 'dd-mm-yyyy'), 167, 132);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (168, to_date('21-12-2007', 'dd-mm-yyyy'), 168, 184);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (169, to_date('01-04-2008', 'dd-mm-yyyy'), 169, 36);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (170, to_date('30-08-2017', 'dd-mm-yyyy'), 170, 55);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (171, to_date('29-12-2021', 'dd-mm-yyyy'), 171, 151);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (172, to_date('30-07-2007', 'dd-mm-yyyy'), 172, 235);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (173, to_date('18-07-2021', 'dd-mm-yyyy'), 173, 232);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (174, to_date('22-05-2005', 'dd-mm-yyyy'), 174, 243);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (175, to_date('11-07-2003', 'dd-mm-yyyy'), 175, 338);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (176, to_date('20-11-2007', 'dd-mm-yyyy'), 176, 279);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (177, to_date('04-09-2011', 'dd-mm-yyyy'), 177, 371);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (178, to_date('25-11-2007', 'dd-mm-yyyy'), 178, 139);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (179, to_date('13-05-2016', 'dd-mm-yyyy'), 179, 343);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (180, to_date('10-12-2005', 'dd-mm-yyyy'), 180, 187);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (181, to_date('20-07-2009', 'dd-mm-yyyy'), 181, 64);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (182, to_date('21-09-2010', 'dd-mm-yyyy'), 182, 310);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (183, to_date('25-08-2014', 'dd-mm-yyyy'), 183, 37);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (184, to_date('16-06-2014', 'dd-mm-yyyy'), 184, 136);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (185, to_date('31-05-2002', 'dd-mm-yyyy'), 185, 161);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (186, to_date('03-02-2008', 'dd-mm-yyyy'), 186, 66);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (187, to_date('20-06-2000', 'dd-mm-yyyy'), 187, 103);
commit;
prompt 200 records committed...
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (188, to_date('05-03-2010', 'dd-mm-yyyy'), 188, 230);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (189, to_date('11-07-2007', 'dd-mm-yyyy'), 189, 43);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (190, to_date('19-01-2016', 'dd-mm-yyyy'), 190, 321);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (191, to_date('04-02-2012', 'dd-mm-yyyy'), 191, 52);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (192, to_date('28-01-2021', 'dd-mm-yyyy'), 192, 328);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (193, to_date('21-02-2007', 'dd-mm-yyyy'), 193, 135);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (194, to_date('27-10-2007', 'dd-mm-yyyy'), 194, 45);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (195, to_date('06-02-2020', 'dd-mm-yyyy'), 195, 81);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (196, to_date('23-07-2006', 'dd-mm-yyyy'), 196, 391);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (197, to_date('22-01-2013', 'dd-mm-yyyy'), 197, 315);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (198, to_date('20-04-2015', 'dd-mm-yyyy'), 198, 282);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (199, to_date('24-10-2001', 'dd-mm-yyyy'), 199, 96);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (200, to_date('12-08-2007', 'dd-mm-yyyy'), 200, 160);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (201, to_date('04-11-2016', 'dd-mm-yyyy'), 201, 199);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (202, to_date('04-07-2006', 'dd-mm-yyyy'), 202, 179);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (203, to_date('26-03-2020', 'dd-mm-yyyy'), 203, 160);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (204, to_date('03-08-2007', 'dd-mm-yyyy'), 204, 252);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (205, to_date('28-10-2020', 'dd-mm-yyyy'), 205, 189);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (206, to_date('30-04-2002', 'dd-mm-yyyy'), 206, 390);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (207, to_date('12-05-2012', 'dd-mm-yyyy'), 207, 261);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (208, to_date('26-03-2014', 'dd-mm-yyyy'), 208, 104);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (209, to_date('31-07-2003', 'dd-mm-yyyy'), 209, 261);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (210, to_date('21-12-2017', 'dd-mm-yyyy'), 210, 99);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (211, to_date('12-07-2001', 'dd-mm-yyyy'), 211, 260);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (212, to_date('13-10-2007', 'dd-mm-yyyy'), 212, 248);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (213, to_date('07-12-2014', 'dd-mm-yyyy'), 213, 371);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (214, to_date('31-03-2021', 'dd-mm-yyyy'), 214, 34);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (215, to_date('15-02-2014', 'dd-mm-yyyy'), 215, 135);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (216, to_date('02-08-2003', 'dd-mm-yyyy'), 216, 146);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (217, to_date('19-05-2010', 'dd-mm-yyyy'), 217, 75);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (218, to_date('14-11-2001', 'dd-mm-yyyy'), 218, 318);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (219, to_date('26-10-2005', 'dd-mm-yyyy'), 219, 360);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (220, to_date('19-08-2012', 'dd-mm-yyyy'), 220, 72);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (221, to_date('05-02-2010', 'dd-mm-yyyy'), 221, 221);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (222, to_date('20-05-2015', 'dd-mm-yyyy'), 222, 112);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (223, to_date('23-03-2009', 'dd-mm-yyyy'), 223, 344);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (224, to_date('20-11-2021', 'dd-mm-yyyy'), 224, 61);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (225, to_date('28-02-2021', 'dd-mm-yyyy'), 225, 117);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (226, to_date('21-07-2014', 'dd-mm-yyyy'), 226, 117);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (227, to_date('02-11-2017', 'dd-mm-yyyy'), 227, 162);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (228, to_date('22-10-2018', 'dd-mm-yyyy'), 228, 219);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (229, to_date('17-08-2019', 'dd-mm-yyyy'), 229, 42);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (230, to_date('22-02-2021', 'dd-mm-yyyy'), 230, 276);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (231, to_date('25-05-2021', 'dd-mm-yyyy'), 231, 118);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (232, to_date('17-04-2011', 'dd-mm-yyyy'), 232, 14);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (233, to_date('21-09-2004', 'dd-mm-yyyy'), 233, 283);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (234, to_date('29-07-2018', 'dd-mm-yyyy'), 234, 349);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (235, to_date('14-02-2015', 'dd-mm-yyyy'), 235, 360);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (236, to_date('12-09-2018', 'dd-mm-yyyy'), 236, 244);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (237, to_date('04-06-2023', 'dd-mm-yyyy'), 237, 388);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (238, to_date('10-09-2007', 'dd-mm-yyyy'), 238, 301);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (239, to_date('18-05-2003', 'dd-mm-yyyy'), 239, 84);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (240, to_date('29-06-2009', 'dd-mm-yyyy'), 240, 289);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (241, to_date('24-02-2022', 'dd-mm-yyyy'), 241, 6);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (242, to_date('10-03-2009', 'dd-mm-yyyy'), 242, 372);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (243, to_date('15-04-2012', 'dd-mm-yyyy'), 243, 353);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (244, to_date('08-01-2005', 'dd-mm-yyyy'), 244, 158);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (245, to_date('15-02-2009', 'dd-mm-yyyy'), 245, 399);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (246, to_date('18-09-2012', 'dd-mm-yyyy'), 246, 379);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (247, to_date('07-12-2022', 'dd-mm-yyyy'), 247, 278);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (248, to_date('10-01-2008', 'dd-mm-yyyy'), 248, 135);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (249, to_date('15-04-2011', 'dd-mm-yyyy'), 249, 210);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (250, to_date('29-11-2018', 'dd-mm-yyyy'), 250, 306);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (251, to_date('19-08-2004', 'dd-mm-yyyy'), 251, 366);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (252, to_date('18-11-2023', 'dd-mm-yyyy'), 252, 132);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (253, to_date('05-04-2013', 'dd-mm-yyyy'), 253, 363);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (254, to_date('29-09-2003', 'dd-mm-yyyy'), 254, 341);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (255, to_date('17-09-2015', 'dd-mm-yyyy'), 255, 192);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (256, to_date('01-08-2005', 'dd-mm-yyyy'), 256, 146);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (257, to_date('22-06-2008', 'dd-mm-yyyy'), 257, 282);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (258, to_date('06-03-2000', 'dd-mm-yyyy'), 258, 215);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (259, to_date('19-04-2009', 'dd-mm-yyyy'), 259, 10);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (260, to_date('30-11-2009', 'dd-mm-yyyy'), 260, 142);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (261, to_date('31-01-2016', 'dd-mm-yyyy'), 261, 101);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (262, to_date('09-08-2004', 'dd-mm-yyyy'), 262, 199);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (263, to_date('11-09-2001', 'dd-mm-yyyy'), 263, 37);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (264, to_date('09-08-2012', 'dd-mm-yyyy'), 264, 157);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (265, to_date('24-10-2006', 'dd-mm-yyyy'), 265, 64);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (266, to_date('08-08-2000', 'dd-mm-yyyy'), 266, 215);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (267, to_date('11-11-2008', 'dd-mm-yyyy'), 267, 55);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (268, to_date('01-11-2007', 'dd-mm-yyyy'), 268, 330);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (269, to_date('13-02-2007', 'dd-mm-yyyy'), 269, 374);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (270, to_date('01-07-2002', 'dd-mm-yyyy'), 270, 17);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (271, to_date('01-03-2014', 'dd-mm-yyyy'), 271, 35);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (272, to_date('27-01-2007', 'dd-mm-yyyy'), 272, 276);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (273, to_date('20-11-2015', 'dd-mm-yyyy'), 273, 84);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (274, to_date('30-03-2021', 'dd-mm-yyyy'), 274, 304);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (275, to_date('24-11-2016', 'dd-mm-yyyy'), 275, 242);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (276, to_date('12-10-2008', 'dd-mm-yyyy'), 276, 93);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (277, to_date('29-11-2001', 'dd-mm-yyyy'), 277, 121);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (278, to_date('20-04-2001', 'dd-mm-yyyy'), 278, 306);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (279, to_date('22-04-2015', 'dd-mm-yyyy'), 279, 135);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (280, to_date('26-03-2012', 'dd-mm-yyyy'), 280, 230);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (281, to_date('13-07-2006', 'dd-mm-yyyy'), 281, 397);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (282, to_date('09-03-2021', 'dd-mm-yyyy'), 282, 321);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (283, to_date('24-07-2021', 'dd-mm-yyyy'), 283, 303);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (284, to_date('11-06-2002', 'dd-mm-yyyy'), 284, 295);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (285, to_date('13-01-2010', 'dd-mm-yyyy'), 285, 319);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (286, to_date('11-10-2001', 'dd-mm-yyyy'), 286, 139);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (287, to_date('31-03-2011', 'dd-mm-yyyy'), 287, 156);
commit;
prompt 300 records committed...
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (288, to_date('21-08-2003', 'dd-mm-yyyy'), 288, 241);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (301, to_date('23-07-2004', 'dd-mm-yyyy'), 301, 100);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (302, to_date('20-08-2022', 'dd-mm-yyyy'), 302, 364);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (303, to_date('10-04-2015', 'dd-mm-yyyy'), 303, 1);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (304, to_date('03-02-2002', 'dd-mm-yyyy'), 304, 139);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (305, to_date('28-07-2005', 'dd-mm-yyyy'), 305, 282);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (306, to_date('24-05-2002', 'dd-mm-yyyy'), 306, 123);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (307, to_date('06-02-2014', 'dd-mm-yyyy'), 307, 100);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (308, to_date('22-11-2011', 'dd-mm-yyyy'), 308, 164);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (309, to_date('06-03-2009', 'dd-mm-yyyy'), 309, 116);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (310, to_date('15-11-2020', 'dd-mm-yyyy'), 310, 159);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (311, to_date('05-01-2016', 'dd-mm-yyyy'), 311, 31);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (312, to_date('02-10-2006', 'dd-mm-yyyy'), 312, 186);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (313, to_date('15-08-2003', 'dd-mm-yyyy'), 313, 371);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (314, to_date('22-02-2001', 'dd-mm-yyyy'), 314, 136);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (315, to_date('10-03-2014', 'dd-mm-yyyy'), 315, 307);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (316, to_date('26-12-2008', 'dd-mm-yyyy'), 316, 178);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (317, to_date('22-02-2020', 'dd-mm-yyyy'), 317, 344);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (318, to_date('04-11-2011', 'dd-mm-yyyy'), 318, 222);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (319, to_date('28-12-2005', 'dd-mm-yyyy'), 319, 48);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (320, to_date('08-01-2002', 'dd-mm-yyyy'), 320, 235);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (321, to_date('22-09-2013', 'dd-mm-yyyy'), 321, 187);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (322, to_date('09-01-2012', 'dd-mm-yyyy'), 322, 118);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (323, to_date('02-01-2011', 'dd-mm-yyyy'), 323, 345);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (324, to_date('14-11-2015', 'dd-mm-yyyy'), 324, 381);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (325, to_date('22-09-2011', 'dd-mm-yyyy'), 325, 125);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (326, to_date('30-08-2021', 'dd-mm-yyyy'), 326, 225);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (327, to_date('17-05-2020', 'dd-mm-yyyy'), 327, 212);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (328, to_date('31-12-2012', 'dd-mm-yyyy'), 328, 304);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (329, to_date('23-05-2004', 'dd-mm-yyyy'), 329, 161);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (330, to_date('03-12-2008', 'dd-mm-yyyy'), 330, 246);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (331, to_date('13-08-2021', 'dd-mm-yyyy'), 331, 126);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (332, to_date('01-06-2013', 'dd-mm-yyyy'), 332, 322);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (333, to_date('21-09-2005', 'dd-mm-yyyy'), 333, 326);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (334, to_date('19-07-2012', 'dd-mm-yyyy'), 334, 145);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (335, to_date('22-09-2007', 'dd-mm-yyyy'), 335, 324);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (336, to_date('23-02-2020', 'dd-mm-yyyy'), 336, 183);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (337, to_date('30-06-2022', 'dd-mm-yyyy'), 337, 88);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (338, to_date('10-07-2004', 'dd-mm-yyyy'), 338, 137);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (339, to_date('22-09-2008', 'dd-mm-yyyy'), 339, 257);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (340, to_date('14-04-2013', 'dd-mm-yyyy'), 340, 10);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (341, to_date('18-02-2004', 'dd-mm-yyyy'), 341, 370);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (342, to_date('03-09-2012', 'dd-mm-yyyy'), 342, 64);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (343, to_date('11-01-2010', 'dd-mm-yyyy'), 343, 146);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (344, to_date('11-08-2012', 'dd-mm-yyyy'), 344, 192);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (345, to_date('25-02-2016', 'dd-mm-yyyy'), 345, 175);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (346, to_date('07-02-2006', 'dd-mm-yyyy'), 346, 205);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (347, to_date('10-05-2019', 'dd-mm-yyyy'), 347, 75);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (348, to_date('26-09-2013', 'dd-mm-yyyy'), 348, 330);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (349, to_date('19-05-2011', 'dd-mm-yyyy'), 349, 299);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (350, to_date('03-01-2018', 'dd-mm-yyyy'), 350, 85);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (351, to_date('19-03-2016', 'dd-mm-yyyy'), 351, 138);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (352, to_date('10-03-2017', 'dd-mm-yyyy'), 352, 250);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (353, to_date('23-10-2019', 'dd-mm-yyyy'), 353, 309);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (354, to_date('06-02-2020', 'dd-mm-yyyy'), 354, 340);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (355, to_date('15-07-2006', 'dd-mm-yyyy'), 355, 94);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (356, to_date('11-03-2004', 'dd-mm-yyyy'), 356, 177);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (357, to_date('06-02-2006', 'dd-mm-yyyy'), 357, 261);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (358, to_date('26-11-2011', 'dd-mm-yyyy'), 358, 378);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (359, to_date('04-10-2011', 'dd-mm-yyyy'), 359, 229);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (360, to_date('12-05-2005', 'dd-mm-yyyy'), 360, 84);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (361, to_date('09-09-2002', 'dd-mm-yyyy'), 361, 360);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (362, to_date('06-12-2007', 'dd-mm-yyyy'), 362, 319);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (363, to_date('08-10-2016', 'dd-mm-yyyy'), 363, 90);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (364, to_date('30-07-2018', 'dd-mm-yyyy'), 364, 323);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (365, to_date('05-09-2006', 'dd-mm-yyyy'), 365, 216);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (366, to_date('13-01-2020', 'dd-mm-yyyy'), 366, 146);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (367, to_date('08-01-2023', 'dd-mm-yyyy'), 367, 202);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (368, to_date('13-10-2019', 'dd-mm-yyyy'), 368, 145);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (369, to_date('12-04-2006', 'dd-mm-yyyy'), 369, 301);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (370, to_date('19-06-2012', 'dd-mm-yyyy'), 370, 337);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (371, to_date('16-09-2011', 'dd-mm-yyyy'), 371, 0);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (372, to_date('25-12-2017', 'dd-mm-yyyy'), 372, 3);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (373, to_date('07-11-2014', 'dd-mm-yyyy'), 373, 274);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (374, to_date('04-11-2018', 'dd-mm-yyyy'), 374, 327);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (375, to_date('07-02-2012', 'dd-mm-yyyy'), 375, 119);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (376, to_date('01-03-2008', 'dd-mm-yyyy'), 376, 66);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (377, to_date('17-01-2015', 'dd-mm-yyyy'), 377, 157);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (378, to_date('26-04-2016', 'dd-mm-yyyy'), 378, 63);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (379, to_date('04-11-2006', 'dd-mm-yyyy'), 379, 55);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (380, to_date('20-02-2017', 'dd-mm-yyyy'), 380, 229);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (381, to_date('02-02-2008', 'dd-mm-yyyy'), 381, 54);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (382, to_date('09-06-2010', 'dd-mm-yyyy'), 382, 4);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (383, to_date('05-07-2015', 'dd-mm-yyyy'), 383, 355);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (384, to_date('27-09-2022', 'dd-mm-yyyy'), 384, 238);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (385, to_date('27-06-2020', 'dd-mm-yyyy'), 385, 176);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (386, to_date('19-07-2019', 'dd-mm-yyyy'), 386, 222);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (387, to_date('15-02-2015', 'dd-mm-yyyy'), 387, 131);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (388, to_date('09-11-2015', 'dd-mm-yyyy'), 388, 230);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (389, to_date('17-02-2005', 'dd-mm-yyyy'), 389, 271);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (390, to_date('08-08-2005', 'dd-mm-yyyy'), 390, 159);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (391, to_date('15-08-2014', 'dd-mm-yyyy'), 391, 68);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (392, to_date('24-04-2006', 'dd-mm-yyyy'), 392, 104);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (393, to_date('26-10-2020', 'dd-mm-yyyy'), 393, 27);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (394, to_date('07-11-2019', 'dd-mm-yyyy'), 394, 304);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (395, to_date('12-12-2014', 'dd-mm-yyyy'), 395, 327);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (396, to_date('29-07-2003', 'dd-mm-yyyy'), 396, 211);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (397, to_date('05-08-2009', 'dd-mm-yyyy'), 397, 142);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (398, to_date('29-07-2002', 'dd-mm-yyyy'), 398, 335);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (399, to_date('25-03-2001', 'dd-mm-yyyy'), 399, 89);
commit;
prompt 400 records loaded
prompt Loading PROFESSION...
insert into PROFESSION (prof_id, prof_name)
values (0, 'photographer');
insert into PROFESSION (prof_id, prof_name)
values (1, 'video');
commit;
prompt 2 records loaded
prompt Loading PROFESSIONAL...
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (0, ' John', ' Smith', 5511652243, ' john.smith@gmail.com', 37700, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1, ' Paul', ' Smith', 5583118533, ' paul.smith@gmail.com', 14600, 2015, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (2, ' Paul', ' Martinez', 5511999596, ' paul.martinez@gmail.com', 7500, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (3, ' Katie', ' Miller', 5573072267, ' katie.miller@gmail.com', 41400, 2005, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (4, ' Sara', ' Hernandez', 5506837826, ' sara.hernandez@gmail.com', 25700, 2009, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (5, ' Paul', ' Williams', 5531004594, ' paul.williams@gmail.com', 19100, 2015, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (6, ' Anna', ' Garcia', 5578516792, ' anna.garcia@gmail.com', 41200, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (7, ' Alex', ' Martinez', 5514172647, ' alex.martinez@gmail.com', 16200, 2000, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (8, ' Katie', ' Smith', 5571446153, ' katie.smith@gmail.com', 12200, 2018, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (9, ' Alex', ' Williams', 5525793180, ' alex.williams@gmail.com', 33100, 2017, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (10, ' Jane', ' Brown', 5595846325, ' jane.brown@gmail.com', 1800, 2002, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (11, ' Katie', ' Miller', 5570763426, ' katie.miller@gmail.com', 11900, 2003, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (12, ' Jane', ' Hernandez', 5597242297, ' jane.hernandez@gmail.com', 15200, 2010, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (13, ' John', ' Jones', 5504885227, ' john.jones@gmail.com', 35200, 2004, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (14, ' Katie', ' Miller', 5580266039, ' katie.miller@gmail.com', 9500, 2013, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (15, ' Katie', ' Smith', 5546378315, ' katie.smith@gmail.com', 12600, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (16, ' Paul', ' Garcia', 5580465762, ' paul.garcia@gmail.com', 39600, 2022, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (17, ' Tom', ' Martinez', 5544849263, ' tom.martinez@gmail.com', 20200, 2007, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (18, ' Chris', ' Brown', 5544096377, ' chris.brown@gmail.com', 5200, 2010, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (20, ' Alex', ' Martinez', 5561173787, ' alex.martinez@gmail.com', 17200, 2018, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (21, ' Katie', ' Johnson', 5544622358, ' katie.johnson@gmail.com', 42800, 2007, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (22, ' Sara', ' Jones', 5536779069, ' sara.jones@gmail.com', 27300, 2001, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (23, ' Anna', ' Garcia', 5505771937, ' anna.garcia@gmail.com', 39500, 2007, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (24, ' Alex', ' Jones', 5507451824, ' alex.jones@gmail.com', 48100, 2017, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (25, ' Sara', ' Davis', 5512744715, ' sara.davis@gmail.com', 32300, 2023, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (26, ' Alex', ' Martinez', 5584255342, ' alex.martinez@gmail.com', 20900, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (27, ' Jane', ' Smith', 5534052519, ' jane.smith@gmail.com', 40200, 2014, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (28, ' Tom', ' Miller', 5504789135, ' tom.miller@gmail.com', 32000, 2022, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (19, ' Chris', ' Davis', 5507191431, ' chris@gmail.com', 9000, 2004, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (29, ' Paul', ' Williams', 5549834298, ' paul@gmail.com', 12000, 2009, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (30, ' Alex', ' Garcia', 5582299576, ' alex@gmail.com', 45000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (31, ' Sara', ' Williams', 5591148874, ' sara@gmail.com', 29000, 2006, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (32, ' Tom', ' Davis', 5527631319, ' tom@gmail.com', 22000, 2012, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (33, ' Sara', ' Johnson', 5568263489, ' sara@gmail.com', 44000, 2023, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (34, ' Mike', ' Brown', 5546195767, ' mike@gmail.com', 17000, 2005, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (35, ' Mike', ' Garcia', 5564252363, ' mike@gmail.com', 32000, 2020, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (36, ' John', ' Davis', 5526956442, ' john@gmail.com', 33000, 2017, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (37, ' Alex', ' Davis', 5575415414, ' alex@gmail.com', 14000, 2001, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (38, ' John', ' Brown', 5585635525, ' john@gmail.com', 3000, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (39, ' Chris', ' Garcia', 5537027089, ' chris@gmail.com', 21000, 2003, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (40, ' Chris', ' Martinez', 5556402474, ' chris@gmail.com', 41000, 2003, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (41, ' Tom', ' Williams', 5536043362, ' tom@gmail.com', 18000, 2021, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (42, ' Anna', ' Hernandez', 5515663803, ' anna@gmail.com', 48000, 2000, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (43, ' Sara', ' Miller', 5571062693, ' sara@gmail.com', 46000, 2023, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (44, ' Sara', ' Brown', 5574547407, ' sara@gmail.com', 21000, 2007, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (45, ' Tom', ' Martinez', 5544503945, ' tom@gmail.com', 36000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (46, ' Sara', ' Hernandez', 5577890221, ' sara@gmail.com', 4000, 2011, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (47, ' Jane', ' Hernandez', 5584710832, ' jane@gmail.com', 36000, 2007, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (48, ' Chris', ' Hernandez', 5507733910, ' chris@gmail.com', 47000, 2001, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (49, ' Tom', ' Davis', 5598636632, ' tom@gmail.com', 47000, 2018, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (50, ' John', ' Davis', 5593030990, ' john@gmail.com', 12000, 2006, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (51, ' Sara', ' Williams', 5581263949, ' sara@gmail.com', 7000, 2009, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (52, ' Paul', ' Williams', 5535847891, ' paul@gmail.com', 38000, 2005, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (53, ' Paul', ' Johnson', 5598048289, ' paul@gmail.com', 34000, 2000, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (54, ' Tom', ' Jones', 5554548518, ' tom@gmail.com', 13000, 2010, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (55, ' John', ' Jones', 5523201130, ' john@gmail.com', 23000, 2006, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (56, ' Paul', ' Garcia', 5565102741, ' paul@gmail.com', 14000, 2010, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (57, ' Chris', ' Hernandez', 5539496093, ' chris@gmail.com', 44000, 2018, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (58, ' Paul', ' Smith', 5569958928, ' paul@gmail.com', 25000, 2008, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (59, ' Jane', ' Miller', 5568960162, ' jane@gmail.com', 20000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (60, ' Jane', ' Brown', 5588209974, ' jane@gmail.com', 23000, 2020, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (61, ' Anna', ' Hernandez', 5504494037, ' anna@gmail.com', 37000, 2019, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (62, ' Anna', ' Smith', 5571294500, ' anna@gmail.com', 28000, 2008, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (63, ' Alex', ' Martinez', 5578069914, ' alex@gmail.com', 29000, 2005, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (64, ' Mike', ' Garcia', 5533795803, ' mike@gmail.com', 12000, 2000, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (65, ' Sara', ' Garcia', 5544791759, ' sara@gmail.com', 10000, 2007, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (66, ' John', ' Hernandez', 5540339863, ' john@gmail.com', 50000, 2018, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (67, ' Paul', ' Brown', 5509910292, ' paul@gmail.com', 33000, 2000, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (68, ' Alex', ' Williams', 5534233494, ' alex@gmail.com', 12000, 2007, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (69, ' Mike', ' Davis', 5560621413, ' mike@gmail.com', 31000, 2007, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (70, ' John', ' Williams', 5540173673, ' john@gmail.com', 29000, 2013, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (71, ' Tom', ' Jones', 5566786710, ' tom@gmail.com', 40000, 2006, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (72, ' Tom', ' Martinez', 5542491454, ' tom@gmail.com', 35000, 2001, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (73, ' Anna', ' Hernandez', 5563783706, ' anna@gmail.com', 26000, 2015, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (74, ' John', ' Johnson', 5542267404, ' john@gmail.com', 18000, 2005, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (75, ' Jane', ' Hernandez', 5507305774, ' jane@gmail.com', 31000, 2003, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (76, ' Mike', ' Williams', 5570534369, ' mike@gmail.com', 16000, 2014, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (77, ' John', ' Miller', 5546434481, ' john@gmail.com', 33000, 2004, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (78, ' Katie', ' Miller', 5580555878, ' katie@gmail.com', 28000, 2021, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (79, ' Anna', ' Martinez', 5537217393, ' anna@gmail.com', 38000, 2008, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (80, ' John', ' Miller', 5537746752, ' john@gmail.com', 22000, 2009, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (81, ' John', ' Miller', 5577549431, ' john@gmail.com', 20000, 2000, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (82, ' Paul', ' Davis', 5582430111, ' paul@gmail.com', 37000, 2016, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (83, ' Anna', ' Smith', 5560414637, ' anna@gmail.com', 43000, 2003, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (84, ' John', ' Brown', 5506218311, ' john@gmail.com', 28000, 2019, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (85, ' Jane', ' Garcia', 5568647234, ' jane@gmail.com', 41000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (86, ' Paul', ' Johnson', 5548935464, ' paul@gmail.com', 25000, 2021, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (87, ' Sara', ' Brown', 5575933403, ' sara@gmail.com', 21000, 2019, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (88, ' Paul', ' Jones', 5559135978, ' paul@gmail.com', 34000, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (89, ' Katie', ' Williams', 5506824657, ' katie@gmail.com', 24000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (90, ' Jane', ' Miller', 5542062628, ' jane@gmail.com', 50000, 2017, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (91, ' Paul', ' Smith', 5522066887, ' paul@gmail.com', 3000, 2001, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (92, ' Jane', ' Johnson', 5557585471, ' jane@gmail.com', 35000, 2011, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (93, ' Paul', ' Martinez', 5586397174, ' paul@gmail.com', 41000, 2015, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (94, ' Mike', ' Williams', 5566557622, ' mike@gmail.com', 13000, 2007, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (95, ' John', ' Miller', 5527509349, ' john@gmail.com', 28000, 2002, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (96, ' Sara', ' Johnson', 5545987416, ' sara@gmail.com', 50000, 2010, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (97, ' Katie', ' Williams', 5528220519, ' katie@gmail.com', 36000, 2000, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (98, ' Paul', ' Garcia', 5592575161, ' paul@gmail.com', 16000, 2000, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (99, ' Paul', ' Jones', 5595003825, ' paul@gmail.com', 44000, 2008, 1);
commit;
prompt 100 records committed...
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (100, ' Sara', ' Williams', 5554035931, ' sara@gmail.com', 33000, 2006, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (101, ' Anna', ' Miller', 5570405197, ' anna@gmail.com', 3000, 2014, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (102, ' Jane', ' Smith', 5586750151, ' jane@gmail.com', 4000, 2019, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (103, ' Chris', ' Hernandez', 5531311630, ' chris@gmail.com', 7000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (104, ' Anna', ' Hernandez', 5524104193, ' anna@gmail.com', 37000, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (105, ' Chris', ' Martinez', 5513678052, ' chris@gmail.com', 16000, 2002, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (106, ' Sara', ' Jones', 5514510368, ' sara@gmail.com', 6000, 2020, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (107, ' Mike', ' Johnson', 5599793118, ' mike@gmail.com', 35000, 2023, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (108, ' Sara', ' Garcia', 5510474602, ' sara@gmail.com', 50000, 2014, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (109, ' Mike', ' Davis', 5549956472, ' mike@gmail.com', 1000, 2012, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (110, ' Mike', ' Brown', 5563941169, ' mike@gmail.com', 44000, 2023, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (111, ' Sara', ' Garcia', 5535613699, ' sara@gmail.com', 36000, 2018, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (112, ' Tom', ' Smith', 5573609813, ' tom@gmail.com', 4000, 2021, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (113, ' John', ' Johnson', 5589410417, ' john@gmail.com', 43000, 2008, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (114, ' Sara', ' Garcia', 5565770857, ' sara@gmail.com', 17000, 2018, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (115, ' Paul', ' Garcia', 5548970302, ' paul@gmail.com', 1000, 2013, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (116, ' Sara', ' Williams', 5592217137, ' sara@gmail.com', 10000, 2009, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (117, ' John', ' Hernandez', 5568033506, ' john@gmail.com', 49000, 2016, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (118, ' Chris', ' Smith', 5587656471, ' chris@gmail.com', 4000, 2005, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (119, ' Katie', ' Miller', 5512983353, ' katie@gmail.com', 11000, 2006, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (120, ' Mike', ' Jones', 5552404598, ' mike@gmail.com', 45000, 2004, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (121, ' Tom', ' Martinez', 5598851255, ' tom@gmail.com', 13000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (122, ' Anna', ' Miller', 5588506600, ' anna@gmail.com', 3000, 2012, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (123, ' Jane', ' Williams', 5516819652, ' jane@gmail.com', 27000, 2020, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (124, ' Sara', ' Williams', 5543735543, ' sara@gmail.com', 50000, 2005, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (125, ' Chris', ' Martinez', 5513589487, ' chris@gmail.com', 1000, 2006, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (126, ' Katie', ' Smith', 5520112127, ' katie@gmail.com', 7000, 2017, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (127, ' Katie', ' Martinez', 5554482928, ' katie@gmail.com', 24000, 2016, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (128, ' John', ' Jones', 5515304287, ' john@gmail.com', 9000, 2020, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (129, ' John', ' Brown', 5588268621, ' john@gmail.com', 27000, 2012, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (130, ' Mike', ' Johnson', 5539711266, ' mike@gmail.com', 10000, 2012, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (131, ' Mike', ' Hernandez', 5521946106, ' mike@gmail.com', 26000, 2016, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (132, ' John', ' Williams', 5573812597, ' john@gmail.com', 21000, 2009, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (133, ' Sara', ' Williams', 5594495455, ' sara@gmail.com', 16000, 2000, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (134, ' Sara', ' Garcia', 5520275696, ' sara@gmail.com', 10000, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (135, ' John', ' Brown', 5558552167, ' john@gmail.com', 12000, 2003, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (136, ' Tom', ' Jones', 5542500146, ' tom@gmail.com', 40000, 2011, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (137, ' Mike', ' Garcia', 5538455812, ' mike@gmail.com', 21000, 2004, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (138, ' Paul', ' Hernandez', 5545310984, ' paul@gmail.com', 33000, 2006, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (139, ' Paul', ' Brown', 5518425304, ' paul@gmail.com', 16000, 2009, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (140, ' John', ' Smith', 5501514173, ' john@gmail.com', 44000, 2009, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (141, ' Tom', ' Smith', 5551056088, ' tom@gmail.com', 14000, 2002, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (142, ' Katie', ' Brown', 5542949298, ' katie@gmail.com', 41000, 2016, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (143, ' Anna', ' Davis', 5565325283, ' anna@gmail.com', 6000, 2022, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (144, ' John', ' Jones', 5588992704, ' john@gmail.com', 14000, 2021, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (145, ' Katie', ' Davis', 5515653550, ' katie@gmail.com', 15000, 2008, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (146, ' Paul', ' Miller', 5592332453, ' paul@gmail.com', 33000, 2005, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (147, ' Alex', ' Johnson', 5505603869, ' alex@gmail.com', 47000, 2021, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (148, ' Katie', ' Johnson', 5526468108, ' katie@gmail.com', 24000, 2010, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (149, ' Alex', ' Smith', 5527458133, ' alex@gmail.com', 23000, 2002, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (150, ' Jane', ' Hernandez', 5599499458, ' jane@gmail.com', 16000, 2001, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (151, ' Alex', ' Hernandez', 5567716466, ' alex@gmail.com', 4000, 2006, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (152, ' Sara', ' Brown', 5579738873, ' sara@gmail.com', 10000, 2000, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (153, ' Anna', ' Garcia', 5581970570, ' anna@gmail.com', 25000, 2003, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (154, ' Jane', ' Smith', 5515951073, ' jane@gmail.com', 16000, 2002, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (155, ' John', ' Davis', 5501407147, ' john@gmail.com', 11000, 2021, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (156, ' Alex', ' Johnson', 5566825896, ' alex@gmail.com', 44000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (157, ' Paul', ' Garcia', 5556177236, ' paul@gmail.com', 15000, 2015, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (158, ' Chris', ' Miller', 5557483879, ' chris@gmail.com', 28000, 2022, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (159, ' Alex', ' Hernandez', 5536434320, ' alex@gmail.com', 20000, 2009, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (160, ' Alex', ' Smith', 5547220245, ' alex@gmail.com', 49000, 2002, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (161, ' Mike', ' Miller', 5561097127, ' mike@gmail.com', 45000, 2014, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (162, ' Mike', ' Williams', 5548448008, ' mike@gmail.com', 22000, 2013, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (163, ' Mike', ' Martinez', 5523384385, ' mike@gmail.com', 48000, 2011, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (164, ' Anna', ' Brown', 5526509498, ' anna@gmail.com', 41000, 2003, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (165, ' Sara', ' Johnson', 5528516271, ' sara@gmail.com', 11000, 2018, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (166, ' Paul', ' Garcia', 5501040411, ' paul@gmail.com', 4000, 2015, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (167, ' Paul', ' Davis', 5573445650, ' paul@gmail.com', 11000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (168, ' Anna', ' Brown', 5591388011, ' anna@gmail.com', 42000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (169, ' Jane', ' Jones', 5565750855, ' jane@gmail.com', 9000, 2012, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (170, ' Chris', ' Hernandez', 5580702130, ' chris@gmail.com', 43000, 2003, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (171, ' Alex', ' Martinez', 5547159658, ' alex@gmail.com', 11000, 2017, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (172, ' Paul', ' Brown', 5592903855, ' paul@gmail.com', 27000, 2003, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (173, ' Jane', ' Williams', 5503600277, ' jane@gmail.com', 20000, 2008, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (174, ' Chris', ' Hernandez', 5579597193, ' chris@gmail.com', 45000, 2013, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (175, ' Paul', ' Hernandez', 5560479545, ' paul@gmail.com', 8000, 2011, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (176, ' Chris', ' Davis', 5530860558, ' chris@gmail.com', 40000, 2000, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (177, ' Anna', ' Williams', 5583797662, ' anna@gmail.com', 49000, 2013, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (178, ' Anna', ' Miller', 5556861903, ' anna@gmail.com', 2000, 2000, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (179, ' John', ' Johnson', 5579381482, ' john@gmail.com', 15000, 2010, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (180, ' John', ' Garcia', 5592077560, ' john@gmail.com', 41000, 2022, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (181, ' Anna', ' Brown', 5599201957, ' anna@gmail.com', 43000, 2011, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (182, ' Alex', ' Martinez', 5546693875, ' alex@gmail.com', 6000, 2013, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (183, ' Chris', ' Miller', 5579320543, ' chris@gmail.com', 40000, 2006, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (184, ' Mike', ' Smith', 5545365216, ' mike@gmail.com', 46000, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (185, ' Katie', ' Brown', 5531326783, ' katie@gmail.com', 29000, 2016, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (186, ' Katie', ' Davis', 5507095763, ' katie@gmail.com', 11000, 2003, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (187, ' Paul', ' Brown', 5559244476, ' paul@gmail.com', 18000, 2002, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (188, ' Mike', ' Brown', 5509505948, ' mike@gmail.com', 8000, 2007, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (189, ' Tom', ' Williams', 5502107838, ' tom@gmail.com', 13000, 2002, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (190, ' Sara', ' Davis', 5586780226, ' sara@gmail.com', 37000, 2008, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (191, ' Paul', ' Jones', 5513901424, ' paul@gmail.com', 16000, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (192, ' Paul', ' Williams', 5538793234, ' paul@gmail.com', 45000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (193, ' Katie', ' Garcia', 5588451707, ' katie@gmail.com', 6000, 2015, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (194, ' Alex', ' Brown', 5551172242, ' alex@gmail.com', 42000, 2021, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (195, ' Sara', ' Garcia', 5518135268, ' sara@gmail.com', 35000, 2017, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (196, ' Mike', ' Garcia', 5573745325, ' mike@gmail.com', 37000, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (197, ' John', ' Garcia', 5539962925, ' john@gmail.com', 16000, 2000, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (198, ' Katie', ' Miller', 5591979397, ' katie@gmail.com', 42000, 2013, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (199, ' Tom', ' Brown', 5591411882, ' tom@gmail.com', 44000, 2021, 0);
commit;
prompt 200 records committed...
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (200, ' Chris', ' Jones', 5532583836, ' chris@gmail.com', 15000, 2012, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (201, ' Katie', ' Martinez', 5588818863, ' katie@gmail.com', 6000, 2007, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (202, ' Anna', ' Jones', 5575790930, ' anna@gmail.com', 23000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (203, ' Mike', ' Miller', 5599488936, ' mike@gmail.com', 43000, 2022, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (204, ' Tom', ' Brown', 5537827621, ' tom@gmail.com', 41000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (205, ' Sara', ' Johnson', 5505862692, ' sara@gmail.com', 9000, 2015, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (206, ' John', ' Johnson', 5552223571, ' john@gmail.com', 46000, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (207, ' Alex', ' Brown', 5572673262, ' alex@gmail.com', 44000, 2016, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (208, ' Katie', ' Jones', 5514753401, ' katie@gmail.com', 4000, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (209, ' Mike', ' Davis', 5506919336, ' mike@gmail.com', 9000, 2020, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (210, ' Mike', ' Garcia', 5540328829, ' mike@gmail.com', 25000, 2008, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (211, ' Katie', ' Hernandez', 5560258260, ' katie@gmail.com', 41000, 2016, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (212, ' Tom', ' Williams', 5542902976, ' tom@gmail.com', 43000, 2015, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (213, ' Katie', ' Miller', 5540976806, ' katie@gmail.com', 44000, 2000, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (214, ' Paul', ' Williams', 5545958787, ' paul@gmail.com', 1000, 2002, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (215, ' Tom', ' Williams', 5549427197, ' tom@gmail.com', 37000, 2019, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (216, ' Katie', ' Martinez', 5526552792, ' katie@gmail.com', 40000, 2012, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (217, ' John', ' Smith', 5558852023, ' john@gmail.com', 28000, 2019, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (218, ' Paul', ' Davis', 5512252743, ' paul@gmail.com', 37000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (219, ' Mike', ' Davis', 5503188747, ' mike@gmail.com', 45000, 2015, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (220, ' John', ' Hernandez', 5552599596, ' john@gmail.com', 47000, 2017, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (221, ' Tom', ' Garcia', 5502761436, ' tom@gmail.com', 34000, 2009, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (222, ' Anna', ' Hernandez', 5568415127, ' anna@gmail.com', 22000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (223, ' John', ' Miller', 5580145568, ' john@gmail.com', 22000, 2014, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (224, ' Anna', ' Miller', 5538645047, ' anna@gmail.com', 27000, 2000, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (225, ' Anna', ' Smith', 5562325734, ' anna@gmail.com', 34000, 2019, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (226, ' Katie', ' Martinez', 5501948931, ' katie@gmail.com', 12000, 2008, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (227, ' Jane', ' Brown', 5534172472, ' jane@gmail.com', 42000, 2023, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (228, ' Sara', ' Garcia', 5538959847, ' sara@gmail.com', 13000, 2016, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (229, ' Chris', ' Davis', 5581305772, ' chris@gmail.com', 31000, 2012, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (230, ' Tom', ' Williams', 5574821200, ' tom@gmail.com', 16000, 2015, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (231, ' Katie', ' Johnson', 5530547849, ' katie@gmail.com', 47000, 2007, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (232, ' Paul', ' Brown', 5570151101, ' paul@gmail.com', 33000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (233, ' Anna', ' Smith', 5501912040, ' anna@gmail.com', 41000, 2019, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (234, ' Alex', ' Hernandez', 5583415320, ' alex@gmail.com', 29000, 2021, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (235, ' Alex', ' Smith', 5558881030, ' alex@gmail.com', 14000, 2014, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (236, ' Mike', ' Martinez', 5536821488, ' mike@gmail.com', 3000, 2012, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (237, ' Tom', ' Johnson', 5577028741, ' tom@gmail.com', 16000, 2005, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (238, ' Alex', ' Davis', 5533841059, ' alex@gmail.com', 43000, 2007, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (239, ' John', ' Hernandez', 5533879071, ' john@gmail.com', 47000, 2021, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (240, ' Sara', ' Hernandez', 5514042425, ' sara@gmail.com', 7000, 2007, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (241, ' Alex', ' Smith', 5567050067, ' alex@gmail.com', 33000, 2011, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (242, ' Mike', ' Johnson', 5531521329, ' mike@gmail.com', 32000, 2021, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (243, ' Anna', ' Miller', 5539795691, ' anna@gmail.com', 8000, 2005, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (244, ' Anna', ' Smith', 5509255160, ' anna@gmail.com', 47000, 2013, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (245, ' Tom', ' Garcia', 5508687930, ' tom@gmail.com', 50000, 2006, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (246, ' Mike', ' Jones', 5501283219, ' mike@gmail.com', 20000, 2023, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (247, ' Chris', ' Brown', 5535298456, ' chris@gmail.com', 36000, 2001, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (248, ' Chris', ' Hernandez', 5550555793, ' chris@gmail.com', 14000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (249, ' Sara', ' Davis', 5504046228, ' sara@gmail.com', 34000, 2005, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (250, ' John', ' Hernandez', 5517135548, ' john@gmail.com', 25000, 2022, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (251, ' Mike', ' Davis', 5583076060, ' mike@gmail.com', 27000, 2012, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (252, ' John', ' Davis', 5563759160, ' john@gmail.com', 30000, 2015, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (253, ' Anna', ' Davis', 5526376755, ' anna@gmail.com', 5000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (254, ' Tom', ' Brown', 5532986609, ' tom@gmail.com', 41000, 2017, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (255, ' Mike', ' Martinez', 5511379196, ' mike@gmail.com', 47000, 2021, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (256, ' Tom', ' Martinez', 5546128086, ' tom@gmail.com', 24000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (257, ' Alex', ' Miller', 5596618040, ' alex@gmail.com', 30000, 2008, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (258, ' Sara', ' Brown', 5579091940, ' sara@gmail.com', 11000, 2013, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (259, ' Sara', ' Martinez', 5598002117, ' sara@gmail.com', 17000, 2001, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (260, ' Anna', ' Williams', 5506296829, ' anna@gmail.com', 22000, 2013, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (261, ' Katie', ' Garcia', 5543437095, ' katie@gmail.com', 7000, 2003, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (262, ' Jane', ' Hernandez', 5503107821, ' jane@gmail.com', 5000, 2007, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (263, ' Anna', ' Martinez', 5563938833, ' anna@gmail.com', 29000, 2018, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (264, ' John', ' Davis', 5502083912, ' john@gmail.com', 31000, 2021, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (265, ' Katie', ' Williams', 5547336522, ' katie@gmail.com', 33000, 2013, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (266, ' Tom', ' Smith', 5584065230, ' tom@gmail.com', 37000, 2014, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (267, ' Mike', ' Martinez', 5558258695, ' mike@gmail.com', 30000, 2021, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (268, ' Katie', ' Jones', 5540504595, ' katie@gmail.com', 49000, 2005, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (269, ' Jane', ' Jones', 5524014853, ' jane@gmail.com', 21000, 2022, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (270, ' Chris', ' Martinez', 5580330490, ' chris@gmail.com', 21000, 2010, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (271, ' Anna', ' Johnson', 5518619909, ' anna@gmail.com', 5000, 2015, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (272, ' Anna', ' Johnson', 5534443888, ' anna@gmail.com', 42000, 2007, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (273, ' Alex', ' Davis', 5583907711, ' alex@gmail.com', 39000, 2021, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (274, ' Mike', ' Davis', 5549314387, ' mike@gmail.com', 30000, 2005, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (275, ' Tom', ' Smith', 5515622396, ' tom@gmail.com', 50000, 2012, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (276, ' Sara', ' Martinez', 5598266203, ' sara@gmail.com', 34000, 2011, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (277, ' Mike', ' Smith', 5548872233, ' mike@gmail.com', 29000, 2005, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (278, ' John', ' Smith', 5500886063, ' john@gmail.com', 16000, 2008, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (279, ' Paul', ' Miller', 5512011630, ' paul@gmail.com', 24000, 2019, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (280, ' Katie', ' Brown', 5527407454, ' katie@gmail.com', 42000, 2022, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (281, ' Katie', ' Martinez', 5519972830, ' katie@gmail.com', 9000, 2005, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (282, ' Anna', ' Johnson', 5502094676, ' anna@gmail.com', 24000, 2016, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (283, ' Sara', ' Smith', 5522049200, ' sara@gmail.com', 31000, 2019, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (284, ' Anna', ' Brown', 5531786140, ' anna@gmail.com', 33000, 2001, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (285, ' Tom', ' Jones', 5549330280, ' tom@gmail.com', 45000, 2004, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (286, ' Katie', ' Brown', 5531922015, ' katie@gmail.com', 26000, 2010, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (287, ' Anna', ' Hernandez', 5551583003, ' anna@gmail.com', 31000, 2014, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (288, ' Anna', ' Garcia', 5562192834, ' anna@gmail.com', 49000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (289, ' Paul', ' Garcia', 5544342874, ' paul@gmail.com', 19000, 2010, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (290, ' Chris', ' Garcia', 5571695883, ' chris@gmail.com', 27000, 2002, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (291, ' Anna', ' Smith', 5505660483, ' anna@gmail.com', 32000, 2018, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (292, ' John', ' Hernandez', 5578148242, ' john@gmail.com', 45000, 2014, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (293, ' Chris', ' Garcia', 5512598112, ' chris@gmail.com', 4000, 2009, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (294, ' Anna', ' Smith', 5568795191, ' anna@gmail.com', 15000, 2018, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (295, ' John', ' Hernandez', 5562336104, ' john@gmail.com', 27000, 2017, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (296, ' Anna', ' Hernandez', 5505072700, ' anna@gmail.com', 12000, 2014, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (297, ' Katie', ' Smith', 5554481854, ' katie@gmail.com', 16000, 2009, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (298, ' Mike', ' Johnson', 5507295358, ' mike@gmail.com', 13000, 2016, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (299, ' Mike', ' Garcia', 5554965104, ' mike@gmail.com', 27000, 2020, 0);
commit;
prompt 300 records committed...
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (300, ' Mike', ' Hernandez', 5558778675, ' mike@gmail.com', 33000, 2023, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (301, ' Alex', ' Martinez', 5574725995, ' alex@gmail.com', 25000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (302, ' Chris', ' Hernandez', 5597640676, ' chris@gmail.com', 15000, 2017, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (303, ' Jane', ' Miller', 5594602761, ' jane@gmail.com', 7000, 2021, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (304, ' John', ' Johnson', 5593744338, ' john@gmail.com', 3000, 2002, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (305, ' Chris', ' Martinez', 5529382180, ' chris@gmail.com', 5000, 2005, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (306, ' Anna', ' Martinez', 5530750075, ' anna@gmail.com', 36000, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (307, ' Tom', ' Miller', 5573897298, ' tom@gmail.com', 5000, 2009, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (308, ' John', ' Miller', 5558510339, ' john@gmail.com', 31000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (309, ' Jane', ' Garcia', 5559023736, ' jane@gmail.com', 31000, 2019, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (310, ' Sara', ' Johnson', 5577166988, ' sara@gmail.com', 11000, 2023, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (311, ' Sara', ' Davis', 5523922613, ' sara@gmail.com', 12000, 2018, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (312, ' Anna', ' Davis', 5547146157, ' anna@gmail.com', 12000, 2008, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (313, ' Paul', ' Brown', 5527195636, ' paul@gmail.com', 32000, 2018, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (314, ' Jane', ' Martinez', 5585100797, ' jane@gmail.com', 4000, 2015, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (315, ' Anna', ' Jones', 5525178264, ' anna@gmail.com', 5000, 2002, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (316, ' Anna', ' Hernandez', 5518528281, ' anna@gmail.com', 6000, 2008, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (317, ' Sara', ' Garcia', 5583964071, ' sara@gmail.com', 18000, 2016, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (318, ' Anna', ' Garcia', 5543041124, ' anna@gmail.com', 45000, 2018, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (319, ' Tom', ' Garcia', 5512657315, ' tom@gmail.com', 14000, 2005, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (320, ' Alex', ' Miller', 5502077660, ' alex@gmail.com', 22000, 2008, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (321, ' Paul', ' Smith', 5553214544, ' paul@gmail.com', 20000, 2005, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (322, ' Anna', ' Williams', 5505678111, ' anna@gmail.com', 47000, 2018, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (323, ' Katie', ' Brown', 5506527483, ' katie@gmail.com', 11000, 2011, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (324, ' Sara', ' Garcia', 5571354589, ' sara@gmail.com', 6000, 2006, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (325, ' Anna', ' Jones', 5553447098, ' anna@gmail.com', 37000, 2014, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (326, ' Mike', ' Brown', 5530038580, ' mike@gmail.com', 21000, 2018, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (327, ' Katie', ' Hernandez', 5515564746, ' katie@gmail.com', 31000, 2007, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (328, ' Anna', ' Martinez', 5562464300, ' anna@gmail.com', 21000, 2016, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (329, ' Jane', ' Brown', 5511638321, ' jane@gmail.com', 32000, 2016, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (330, ' Sara', ' Brown', 5544793056, ' sara@gmail.com', 47000, 2013, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (331, ' Alex', ' Garcia', 5540798428, ' alex@gmail.com', 9000, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (332, ' Anna', ' Williams', 5529744783, ' anna@gmail.com', 16000, 2015, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (333, ' Mike', ' Hernandez', 5562902522, ' mike@gmail.com', 40000, 2001, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (334, ' Alex', ' Jones', 5548296429, ' alex@gmail.com', 1000, 2009, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (335, ' Paul', ' Martinez', 5517778943, ' paul@gmail.com', 23000, 2016, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (336, ' Katie', ' Hernandez', 5565392293, ' katie@gmail.com', 29000, 2023, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (337, ' Jane', ' Miller', 5590563820, ' jane@gmail.com', 48000, 2010, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (338, ' Tom', ' Miller', 5595025425, ' tom@gmail.com', 6000, 2022, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (339, ' John', ' Brown', 5538222692, ' john@gmail.com', 45000, 2023, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (340, ' Jane', ' Garcia', 5589579798, ' jane@gmail.com', 32000, 2010, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (341, ' Jane', ' Smith', 5517232278, ' jane@gmail.com', 6000, 2013, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (342, ' Katie', ' Garcia', 5586807691, ' katie@gmail.com', 47000, 2015, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (343, ' Tom', ' Williams', 5554629093, ' tom@gmail.com', 15000, 2003, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (344, ' Jane', ' Miller', 5556070812, ' jane@gmail.com', 34000, 2010, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (345, ' Anna', ' Martinez', 5597124423, ' anna@gmail.com', 50000, 2009, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (346, ' Paul', ' Martinez', 5533203369, ' paul@gmail.com', 26000, 2004, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (347, ' Chris', ' Miller', 5558956281, ' chris@gmail.com', 16000, 2023, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (348, ' Katie', ' Martinez', 5554919199, ' katie@gmail.com', 28000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (349, ' Mike', ' Miller', 5529895428, ' mike@gmail.com', 25000, 2013, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (350, ' Alex', ' Martinez', 5524351198, ' alex@gmail.com', 13000, 2007, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (351, ' Jane', ' Smith', 5598462277, ' jane@gmail.com', 15000, 2010, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (352, ' Katie', ' Hernandez', 5567438733, ' katie@gmail.com', 12000, 2005, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (353, ' Anna', ' Williams', 5552378358, ' anna@gmail.com', 42000, 2023, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (354, ' Chris', ' Jones', 5564265434, ' chris@gmail.com', 42000, 2013, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (355, ' Paul', ' Brown', 5599126050, ' paul@gmail.com', 32000, 2014, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (356, ' Anna', ' Hernandez', 5549961189, ' anna@gmail.com', 17000, 2010, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (357, ' Chris', ' Smith', 5514875223, ' chris@gmail.com', 47000, 2008, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (358, ' Alex', ' Johnson', 5534902757, ' alex@gmail.com', 41000, 2007, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (359, ' Paul', ' Jones', 5594026483, ' paul@gmail.com', 45000, 2014, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (360, ' Mike', ' Davis', 5522956271, ' mike@gmail.com', 18000, 2007, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (361, ' Sara', ' Hernandez', 5546444790, ' sara@gmail.com', 11000, 2016, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (362, ' Katie', ' Hernandez', 5503154933, ' katie@gmail.com', 35000, 2002, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (363, ' Mike', ' Hernandez', 5553958894, ' mike@gmail.com', 24000, 2008, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (364, ' Anna', ' Hernandez', 5567582558, ' anna@gmail.com', 36000, 2016, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (365, ' Paul', ' Martinez', 5574752016, ' paul@gmail.com', 6000, 2009, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (366, ' Mike', ' Smith', 5519303328, ' mike@gmail.com', 10000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (367, ' Mike', ' Martinez', 5586661636, ' mike@gmail.com', 42000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (368, ' Sara', ' Garcia', 5533596968, ' sara@gmail.com', 31000, 2019, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (369, ' Anna', ' Williams', 5529143816, ' anna@gmail.com', 13000, 2023, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (370, ' Paul', ' Smith', 5514567391, ' paul@gmail.com', 2000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (371, ' Alex', ' Williams', 5561363435, ' alex@gmail.com', 48000, 2018, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (372, ' Paul', ' Martinez', 5594693913, ' paul@gmail.com', 49000, 2011, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (373, ' Anna', ' Davis', 5516517754, ' anna@gmail.com', 9000, 2014, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (374, ' Katie', ' Johnson', 5531351921, ' katie@gmail.com', 16000, 2014, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (375, ' Katie', ' Garcia', 5536619166, ' katie@gmail.com', 5000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (376, ' John', ' Davis', 5584344141, ' john@gmail.com', 27000, 2000, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (377, ' Tom', ' Brown', 5511759253, ' tom@gmail.com', 12000, 2012, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (378, ' Jane', ' Miller', 5582418635, ' jane@gmail.com', 21000, 2006, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (379, ' Anna', ' Hernandez', 5563785053, ' anna@gmail.com', 31000, 2017, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (380, ' John', ' Garcia', 5596781107, ' john@gmail.com', 6000, 2012, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (381, ' Alex', ' Miller', 5541341253, ' alex@gmail.com', 46000, 2005, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (382, ' Jane', ' Smith', 5592624996, ' jane@gmail.com', 50000, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (383, ' John', ' Williams', 5573669589, ' john@gmail.com', 44000, 2001, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (384, ' Jane', ' Martinez', 5551312124, ' jane@gmail.com', 34000, 2014, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (385, ' Chris', ' Miller', 5554935192, ' chris@gmail.com', 31000, 2001, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (386, ' Alex', ' Martinez', 5591854644, ' alex@gmail.com', 31000, 2001, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (387, ' Chris', ' Davis', 5561555456, ' chris@gmail.com', 42000, 2009, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (388, ' Anna', ' Garcia', 5520223098, ' anna@gmail.com', 20000, 2009, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (389, ' John', ' Davis', 5584645366, ' john@gmail.com', 5000, 2021, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (390, ' Chris', ' Martinez', 5539439505, ' chris@gmail.com', 43000, 2012, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (391, ' Katie', ' Jones', 5578276431, ' katie@gmail.com', 6000, 2018, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (392, ' Tom', ' Jones', 5525200587, ' tom@gmail.com', 5000, 2001, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (393, ' Jane', ' Martinez', 5578324441, ' jane@gmail.com', 19000, 2015, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (394, ' Chris', ' Brown', 5577021251, ' chris@gmail.com', 18000, 2003, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (395, ' Chris', ' Martinez', 5534017008, ' chris@gmail.com', 1000, 2006, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (396, ' Sara', ' Davis', 5553814798, ' sara@gmail.com', 10000, 2007, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (397, ' Paul', ' Smith', 5503328294, ' paul@gmail.com', 1000, 2004, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (398, ' Paul', ' Johnson', 5530456618, ' paul@gmail.com', 47000, 2016, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (399, ' Mike', ' Brown', 5541418614, ' mike@gmail.com', 20000, 2008, 0);
commit;
prompt 400 records loaded
prompt Loading INCLUDE...
insert into INCLUDE (professional_id, order_id)
values (0, 13);
insert into INCLUDE (professional_id, order_id)
values (0, 87);
insert into INCLUDE (professional_id, order_id)
values (1, 162);
insert into INCLUDE (professional_id, order_id)
values (2, 285);
insert into INCLUDE (professional_id, order_id)
values (5, 337);
insert into INCLUDE (professional_id, order_id)
values (7, 236);
insert into INCLUDE (professional_id, order_id)
values (10, 384);
insert into INCLUDE (professional_id, order_id)
values (11, 380);
insert into INCLUDE (professional_id, order_id)
values (11, 392);
insert into INCLUDE (professional_id, order_id)
values (14, 108);
insert into INCLUDE (professional_id, order_id)
values (14, 141);
insert into INCLUDE (professional_id, order_id)
values (15, 46);
insert into INCLUDE (professional_id, order_id)
values (16, 167);
insert into INCLUDE (professional_id, order_id)
values (17, 377);
insert into INCLUDE (professional_id, order_id)
values (18, 142);
insert into INCLUDE (professional_id, order_id)
values (18, 268);
insert into INCLUDE (professional_id, order_id)
values (21, 269);
insert into INCLUDE (professional_id, order_id)
values (22, 204);
insert into INCLUDE (professional_id, order_id)
values (22, 342);
insert into INCLUDE (professional_id, order_id)
values (22, 360);
insert into INCLUDE (professional_id, order_id)
values (26, 267);
insert into INCLUDE (professional_id, order_id)
values (26, 290);
insert into INCLUDE (professional_id, order_id)
values (26, 304);
insert into INCLUDE (professional_id, order_id)
values (30, 163);
insert into INCLUDE (professional_id, order_id)
values (36, 151);
insert into INCLUDE (professional_id, order_id)
values (41, 81);
insert into INCLUDE (professional_id, order_id)
values (41, 171);
insert into INCLUDE (professional_id, order_id)
values (41, 216);
insert into INCLUDE (professional_id, order_id)
values (42, 112);
insert into INCLUDE (professional_id, order_id)
values (44, 274);
insert into INCLUDE (professional_id, order_id)
values (46, 73);
insert into INCLUDE (professional_id, order_id)
values (47, 286);
insert into INCLUDE (professional_id, order_id)
values (48, 19);
insert into INCLUDE (professional_id, order_id)
values (48, 292);
insert into INCLUDE (professional_id, order_id)
values (49, 205);
insert into INCLUDE (professional_id, order_id)
values (50, 241);
insert into INCLUDE (professional_id, order_id)
values (51, 28);
insert into INCLUDE (professional_id, order_id)
values (53, 264);
insert into INCLUDE (professional_id, order_id)
values (54, 18);
insert into INCLUDE (professional_id, order_id)
values (54, 210);
insert into INCLUDE (professional_id, order_id)
values (56, 7);
insert into INCLUDE (professional_id, order_id)
values (56, 63);
insert into INCLUDE (professional_id, order_id)
values (58, 335);
insert into INCLUDE (professional_id, order_id)
values (59, 104);
insert into INCLUDE (professional_id, order_id)
values (59, 248);
insert into INCLUDE (professional_id, order_id)
values (59, 301);
insert into INCLUDE (professional_id, order_id)
values (59, 312);
insert into INCLUDE (professional_id, order_id)
values (60, 157);
insert into INCLUDE (professional_id, order_id)
values (60, 178);
insert into INCLUDE (professional_id, order_id)
values (60, 235);
insert into INCLUDE (professional_id, order_id)
values (61, 100);
insert into INCLUDE (professional_id, order_id)
values (62, 15);
insert into INCLUDE (professional_id, order_id)
values (62, 128);
insert into INCLUDE (professional_id, order_id)
values (62, 257);
insert into INCLUDE (professional_id, order_id)
values (64, 260);
insert into INCLUDE (professional_id, order_id)
values (64, 273);
insert into INCLUDE (professional_id, order_id)
values (64, 295);
insert into INCLUDE (professional_id, order_id)
values (64, 395);
insert into INCLUDE (professional_id, order_id)
values (67, 208);
insert into INCLUDE (professional_id, order_id)
values (72, 59);
insert into INCLUDE (professional_id, order_id)
values (72, 340);
insert into INCLUDE (professional_id, order_id)
values (74, 370);
insert into INCLUDE (professional_id, order_id)
values (77, 218);
insert into INCLUDE (professional_id, order_id)
values (77, 332);
insert into INCLUDE (professional_id, order_id)
values (78, 130);
insert into INCLUDE (professional_id, order_id)
values (81, 266);
insert into INCLUDE (professional_id, order_id)
values (83, 352);
insert into INCLUDE (professional_id, order_id)
values (84, 51);
insert into INCLUDE (professional_id, order_id)
values (84, 334);
insert into INCLUDE (professional_id, order_id)
values (85, 40);
insert into INCLUDE (professional_id, order_id)
values (86, 68);
insert into INCLUDE (professional_id, order_id)
values (87, 250);
insert into INCLUDE (professional_id, order_id)
values (88, 95);
insert into INCLUDE (professional_id, order_id)
values (89, 270);
insert into INCLUDE (professional_id, order_id)
values (90, 54);
insert into INCLUDE (professional_id, order_id)
values (92, 393);
insert into INCLUDE (professional_id, order_id)
values (93, 206);
insert into INCLUDE (professional_id, order_id)
values (97, 296);
insert into INCLUDE (professional_id, order_id)
values (97, 353);
insert into INCLUDE (professional_id, order_id)
values (97, 372);
insert into INCLUDE (professional_id, order_id)
values (99, 254);
insert into INCLUDE (professional_id, order_id)
values (102, 200);
insert into INCLUDE (professional_id, order_id)
values (102, 336);
insert into INCLUDE (professional_id, order_id)
values (102, 397);
insert into INCLUDE (professional_id, order_id)
values (103, 229);
insert into INCLUDE (professional_id, order_id)
values (103, 321);
insert into INCLUDE (professional_id, order_id)
values (105, 58);
insert into INCLUDE (professional_id, order_id)
values (106, 221);
insert into INCLUDE (professional_id, order_id)
values (106, 297);
insert into INCLUDE (professional_id, order_id)
values (107, 148);
insert into INCLUDE (professional_id, order_id)
values (108, 66);
insert into INCLUDE (professional_id, order_id)
values (108, 136);
insert into INCLUDE (professional_id, order_id)
values (109, 374);
insert into INCLUDE (professional_id, order_id)
values (110, 168);
insert into INCLUDE (professional_id, order_id)
values (110, 347);
insert into INCLUDE (professional_id, order_id)
values (110, 385);
insert into INCLUDE (professional_id, order_id)
values (111, 74);
insert into INCLUDE (professional_id, order_id)
values (112, 24);
insert into INCLUDE (professional_id, order_id)
values (112, 280);
insert into INCLUDE (professional_id, order_id)
values (114, 1);
commit;
prompt 100 records committed...
insert into INCLUDE (professional_id, order_id)
values (114, 114);
insert into INCLUDE (professional_id, order_id)
values (115, 282);
insert into INCLUDE (professional_id, order_id)
values (117, 318);
insert into INCLUDE (professional_id, order_id)
values (119, 39);
insert into INCLUDE (professional_id, order_id)
values (119, 320);
insert into INCLUDE (professional_id, order_id)
values (120, 344);
insert into INCLUDE (professional_id, order_id)
values (121, 177);
insert into INCLUDE (professional_id, order_id)
values (121, 255);
insert into INCLUDE (professional_id, order_id)
values (122, 145);
insert into INCLUDE (professional_id, order_id)
values (123, 316);
insert into INCLUDE (professional_id, order_id)
values (124, 50);
insert into INCLUDE (professional_id, order_id)
values (127, 198);
insert into INCLUDE (professional_id, order_id)
values (130, 271);
insert into INCLUDE (professional_id, order_id)
values (131, 185);
insert into INCLUDE (professional_id, order_id)
values (132, 44);
insert into INCLUDE (professional_id, order_id)
values (132, 293);
insert into INCLUDE (professional_id, order_id)
values (134, 23);
insert into INCLUDE (professional_id, order_id)
values (135, 246);
insert into INCLUDE (professional_id, order_id)
values (136, 77);
insert into INCLUDE (professional_id, order_id)
values (136, 155);
insert into INCLUDE (professional_id, order_id)
values (137, 43);
insert into INCLUDE (professional_id, order_id)
values (137, 88);
insert into INCLUDE (professional_id, order_id)
values (138, 159);
insert into INCLUDE (professional_id, order_id)
values (139, 169);
insert into INCLUDE (professional_id, order_id)
values (141, 153);
insert into INCLUDE (professional_id, order_id)
values (144, 189);
insert into INCLUDE (professional_id, order_id)
values (145, 278);
insert into INCLUDE (professional_id, order_id)
values (145, 303);
insert into INCLUDE (professional_id, order_id)
values (146, 101);
insert into INCLUDE (professional_id, order_id)
values (147, 328);
insert into INCLUDE (professional_id, order_id)
values (148, 341);
insert into INCLUDE (professional_id, order_id)
values (148, 389);
insert into INCLUDE (professional_id, order_id)
values (150, 330);
insert into INCLUDE (professional_id, order_id)
values (150, 376);
insert into INCLUDE (professional_id, order_id)
values (151, 71);
insert into INCLUDE (professional_id, order_id)
values (151, 126);
insert into INCLUDE (professional_id, order_id)
values (151, 259);
insert into INCLUDE (professional_id, order_id)
values (151, 272);
insert into INCLUDE (professional_id, order_id)
values (151, 383);
insert into INCLUDE (professional_id, order_id)
values (152, 125);
insert into INCLUDE (professional_id, order_id)
values (153, 300);
insert into INCLUDE (professional_id, order_id)
values (153, 307);
insert into INCLUDE (professional_id, order_id)
values (154, 193);
insert into INCLUDE (professional_id, order_id)
values (155, 209);
insert into INCLUDE (professional_id, order_id)
values (157, 355);
insert into INCLUDE (professional_id, order_id)
values (158, 242);
insert into INCLUDE (professional_id, order_id)
values (159, 173);
insert into INCLUDE (professional_id, order_id)
values (160, 38);
insert into INCLUDE (professional_id, order_id)
values (161, 354);
insert into INCLUDE (professional_id, order_id)
values (162, 176);
insert into INCLUDE (professional_id, order_id)
values (162, 253);
insert into INCLUDE (professional_id, order_id)
values (163, 302);
insert into INCLUDE (professional_id, order_id)
values (165, 294);
insert into INCLUDE (professional_id, order_id)
values (166, 207);
insert into INCLUDE (professional_id, order_id)
values (167, 30);
insert into INCLUDE (professional_id, order_id)
values (168, 202);
insert into INCLUDE (professional_id, order_id)
values (168, 315);
insert into INCLUDE (professional_id, order_id)
values (169, 165);
insert into INCLUDE (professional_id, order_id)
values (170, 72);
insert into INCLUDE (professional_id, order_id)
values (170, 82);
insert into INCLUDE (professional_id, order_id)
values (170, 174);
insert into INCLUDE (professional_id, order_id)
values (172, 6);
insert into INCLUDE (professional_id, order_id)
values (174, 350);
insert into INCLUDE (professional_id, order_id)
values (174, 371);
insert into INCLUDE (professional_id, order_id)
values (175, 49);
insert into INCLUDE (professional_id, order_id)
values (175, 67);
insert into INCLUDE (professional_id, order_id)
values (175, 115);
insert into INCLUDE (professional_id, order_id)
values (175, 122);
insert into INCLUDE (professional_id, order_id)
values (176, 52);
insert into INCLUDE (professional_id, order_id)
values (179, 192);
insert into INCLUDE (professional_id, order_id)
values (180, 135);
insert into INCLUDE (professional_id, order_id)
values (180, 144);
insert into INCLUDE (professional_id, order_id)
values (181, 118);
insert into INCLUDE (professional_id, order_id)
values (182, 219);
insert into INCLUDE (professional_id, order_id)
values (183, 85);
insert into INCLUDE (professional_id, order_id)
values (184, 36);
insert into INCLUDE (professional_id, order_id)
values (184, 180);
insert into INCLUDE (professional_id, order_id)
values (185, 160);
insert into INCLUDE (professional_id, order_id)
values (185, 322);
insert into INCLUDE (professional_id, order_id)
values (187, 102);
insert into INCLUDE (professional_id, order_id)
values (187, 314);
insert into INCLUDE (professional_id, order_id)
values (188, 283);
insert into INCLUDE (professional_id, order_id)
values (188, 298);
insert into INCLUDE (professional_id, order_id)
values (189, 263);
insert into INCLUDE (professional_id, order_id)
values (190, 41);
insert into INCLUDE (professional_id, order_id)
values (191, 127);
insert into INCLUDE (professional_id, order_id)
values (193, 222);
insert into INCLUDE (professional_id, order_id)
values (198, 196);
insert into INCLUDE (professional_id, order_id)
values (198, 251);
insert into INCLUDE (professional_id, order_id)
values (198, 387);
insert into INCLUDE (professional_id, order_id)
values (200, 252);
insert into INCLUDE (professional_id, order_id)
values (200, 288);
insert into INCLUDE (professional_id, order_id)
values (201, 133);
insert into INCLUDE (professional_id, order_id)
values (201, 240);
insert into INCLUDE (professional_id, order_id)
values (202, 381);
insert into INCLUDE (professional_id, order_id)
values (203, 184);
insert into INCLUDE (professional_id, order_id)
values (204, 105);
insert into INCLUDE (professional_id, order_id)
values (205, 3);
insert into INCLUDE (professional_id, order_id)
values (205, 107);
insert into INCLUDE (professional_id, order_id)
values (205, 150);
commit;
prompt 200 records committed...
insert into INCLUDE (professional_id, order_id)
values (206, 33);
insert into INCLUDE (professional_id, order_id)
values (206, 379);
insert into INCLUDE (professional_id, order_id)
values (206, 391);
insert into INCLUDE (professional_id, order_id)
values (207, 25);
insert into INCLUDE (professional_id, order_id)
values (209, 14);
insert into INCLUDE (professional_id, order_id)
values (209, 62);
insert into INCLUDE (professional_id, order_id)
values (209, 149);
insert into INCLUDE (professional_id, order_id)
values (209, 194);
insert into INCLUDE (professional_id, order_id)
values (211, 361);
insert into INCLUDE (professional_id, order_id)
values (212, 37);
insert into INCLUDE (professional_id, order_id)
values (213, 249);
insert into INCLUDE (professional_id, order_id)
values (214, 8);
insert into INCLUDE (professional_id, order_id)
values (214, 226);
insert into INCLUDE (professional_id, order_id)
values (215, 111);
insert into INCLUDE (professional_id, order_id)
values (218, 232);
insert into INCLUDE (professional_id, order_id)
values (219, 190);
insert into INCLUDE (professional_id, order_id)
values (220, 80);
insert into INCLUDE (professional_id, order_id)
values (220, 96);
insert into INCLUDE (professional_id, order_id)
values (221, 113);
insert into INCLUDE (professional_id, order_id)
values (224, 217);
insert into INCLUDE (professional_id, order_id)
values (226, 390);
insert into INCLUDE (professional_id, order_id)
values (227, 197);
insert into INCLUDE (professional_id, order_id)
values (228, 57);
insert into INCLUDE (professional_id, order_id)
values (229, 317);
insert into INCLUDE (professional_id, order_id)
values (230, 92);
insert into INCLUDE (professional_id, order_id)
values (230, 188);
insert into INCLUDE (professional_id, order_id)
values (231, 147);
insert into INCLUDE (professional_id, order_id)
values (232, 181);
insert into INCLUDE (professional_id, order_id)
values (233, 132);
insert into INCLUDE (professional_id, order_id)
values (233, 277);
insert into INCLUDE (professional_id, order_id)
values (234, 75);
insert into INCLUDE (professional_id, order_id)
values (235, 327);
insert into INCLUDE (professional_id, order_id)
values (236, 375);
insert into INCLUDE (professional_id, order_id)
values (237, 156);
insert into INCLUDE (professional_id, order_id)
values (239, 140);
insert into INCLUDE (professional_id, order_id)
values (239, 201);
insert into INCLUDE (professional_id, order_id)
values (240, 279);
insert into INCLUDE (professional_id, order_id)
values (241, 215);
insert into INCLUDE (professional_id, order_id)
values (241, 339);
insert into INCLUDE (professional_id, order_id)
values (241, 362);
insert into INCLUDE (professional_id, order_id)
values (242, 31);
insert into INCLUDE (professional_id, order_id)
values (244, 76);
insert into INCLUDE (professional_id, order_id)
values (244, 308);
insert into INCLUDE (professional_id, order_id)
values (246, 98);
insert into INCLUDE (professional_id, order_id)
values (248, 90);
insert into INCLUDE (professional_id, order_id)
values (249, 12);
insert into INCLUDE (professional_id, order_id)
values (249, 26);
insert into INCLUDE (professional_id, order_id)
values (249, 364);
insert into INCLUDE (professional_id, order_id)
values (250, 203);
insert into INCLUDE (professional_id, order_id)
values (253, 378);
insert into INCLUDE (professional_id, order_id)
values (254, 106);
insert into INCLUDE (professional_id, order_id)
values (254, 287);
insert into INCLUDE (professional_id, order_id)
values (254, 386);
insert into INCLUDE (professional_id, order_id)
values (255, 346);
insert into INCLUDE (professional_id, order_id)
values (257, 398);
insert into INCLUDE (professional_id, order_id)
values (258, 99);
insert into INCLUDE (professional_id, order_id)
values (258, 116);
insert into INCLUDE (professional_id, order_id)
values (258, 123);
insert into INCLUDE (professional_id, order_id)
values (259, 238);
insert into INCLUDE (professional_id, order_id)
values (260, 48);
insert into INCLUDE (professional_id, order_id)
values (263, 17);
insert into INCLUDE (professional_id, order_id)
values (263, 55);
insert into INCLUDE (professional_id, order_id)
values (264, 22);
insert into INCLUDE (professional_id, order_id)
values (266, 5);
insert into INCLUDE (professional_id, order_id)
values (266, 166);
insert into INCLUDE (professional_id, order_id)
values (268, 10);
insert into INCLUDE (professional_id, order_id)
values (268, 56);
insert into INCLUDE (professional_id, order_id)
values (270, 129);
insert into INCLUDE (professional_id, order_id)
values (270, 396);
insert into INCLUDE (professional_id, order_id)
values (271, 0);
insert into INCLUDE (professional_id, order_id)
values (272, 65);
insert into INCLUDE (professional_id, order_id)
values (274, 29);
insert into INCLUDE (professional_id, order_id)
values (274, 32);
insert into INCLUDE (professional_id, order_id)
values (274, 388);
insert into INCLUDE (professional_id, order_id)
values (276, 109);
insert into INCLUDE (professional_id, order_id)
values (277, 191);
insert into INCLUDE (professional_id, order_id)
values (277, 329);
insert into INCLUDE (professional_id, order_id)
values (278, 357);
insert into INCLUDE (professional_id, order_id)
values (281, 199);
insert into INCLUDE (professional_id, order_id)
values (282, 91);
insert into INCLUDE (professional_id, order_id)
values (284, 306);
insert into INCLUDE (professional_id, order_id)
values (284, 311);
insert into INCLUDE (professional_id, order_id)
values (285, 94);
insert into INCLUDE (professional_id, order_id)
values (285, 333);
insert into INCLUDE (professional_id, order_id)
values (285, 365);
insert into INCLUDE (professional_id, order_id)
values (286, 212);
insert into INCLUDE (professional_id, order_id)
values (288, 182);
insert into INCLUDE (professional_id, order_id)
values (293, 233);
insert into INCLUDE (professional_id, order_id)
values (293, 239);
insert into INCLUDE (professional_id, order_id)
values (294, 143);
insert into INCLUDE (professional_id, order_id)
values (294, 243);
insert into INCLUDE (professional_id, order_id)
values (294, 367);
insert into INCLUDE (professional_id, order_id)
values (295, 93);
insert into INCLUDE (professional_id, order_id)
values (295, 117);
insert into INCLUDE (professional_id, order_id)
values (295, 152);
insert into INCLUDE (professional_id, order_id)
values (295, 348);
insert into INCLUDE (professional_id, order_id)
values (296, 338);
insert into INCLUDE (professional_id, order_id)
values (297, 265);
insert into INCLUDE (professional_id, order_id)
values (300, 79);
insert into INCLUDE (professional_id, order_id)
values (300, 83);
commit;
prompt 300 records committed...
insert into INCLUDE (professional_id, order_id)
values (301, 131);
insert into INCLUDE (professional_id, order_id)
values (303, 382);
insert into INCLUDE (professional_id, order_id)
values (305, 103);
insert into INCLUDE (professional_id, order_id)
values (306, 120);
insert into INCLUDE (professional_id, order_id)
values (307, 21);
insert into INCLUDE (professional_id, order_id)
values (307, 313);
insert into INCLUDE (professional_id, order_id)
values (309, 4);
insert into INCLUDE (professional_id, order_id)
values (309, 138);
insert into INCLUDE (professional_id, order_id)
values (310, 172);
insert into INCLUDE (professional_id, order_id)
values (312, 34);
insert into INCLUDE (professional_id, order_id)
values (315, 281);
insert into INCLUDE (professional_id, order_id)
values (315, 351);
insert into INCLUDE (professional_id, order_id)
values (315, 368);
insert into INCLUDE (professional_id, order_id)
values (316, 234);
insert into INCLUDE (professional_id, order_id)
values (317, 261);
insert into INCLUDE (professional_id, order_id)
values (317, 331);
insert into INCLUDE (professional_id, order_id)
values (319, 119);
insert into INCLUDE (professional_id, order_id)
values (321, 42);
insert into INCLUDE (professional_id, order_id)
values (321, 64);
insert into INCLUDE (professional_id, order_id)
values (322, 9);
insert into INCLUDE (professional_id, order_id)
values (323, 223);
insert into INCLUDE (professional_id, order_id)
values (323, 224);
insert into INCLUDE (professional_id, order_id)
values (323, 366);
insert into INCLUDE (professional_id, order_id)
values (325, 179);
insert into INCLUDE (professional_id, order_id)
values (326, 89);
insert into INCLUDE (professional_id, order_id)
values (328, 2);
insert into INCLUDE (professional_id, order_id)
values (328, 35);
insert into INCLUDE (professional_id, order_id)
values (331, 258);
insert into INCLUDE (professional_id, order_id)
values (333, 124);
insert into INCLUDE (professional_id, order_id)
values (336, 220);
insert into INCLUDE (professional_id, order_id)
values (336, 256);
insert into INCLUDE (professional_id, order_id)
values (338, 325);
insert into INCLUDE (professional_id, order_id)
values (340, 394);
insert into INCLUDE (professional_id, order_id)
values (342, 244);
insert into INCLUDE (professional_id, order_id)
values (343, 187);
insert into INCLUDE (professional_id, order_id)
values (344, 359);
insert into INCLUDE (professional_id, order_id)
values (345, 20);
insert into INCLUDE (professional_id, order_id)
values (345, 319);
insert into INCLUDE (professional_id, order_id)
values (346, 247);
insert into INCLUDE (professional_id, order_id)
values (346, 284);
insert into INCLUDE (professional_id, order_id)
values (346, 309);
insert into INCLUDE (professional_id, order_id)
values (347, 45);
insert into INCLUDE (professional_id, order_id)
values (347, 164);
insert into INCLUDE (professional_id, order_id)
values (347, 245);
insert into INCLUDE (professional_id, order_id)
values (347, 373);
insert into INCLUDE (professional_id, order_id)
values (348, 305);
insert into INCLUDE (professional_id, order_id)
values (349, 78);
insert into INCLUDE (professional_id, order_id)
values (349, 289);
insert into INCLUDE (professional_id, order_id)
values (350, 60);
insert into INCLUDE (professional_id, order_id)
values (350, 214);
insert into INCLUDE (professional_id, order_id)
values (350, 343);
insert into INCLUDE (professional_id, order_id)
values (351, 299);
insert into INCLUDE (professional_id, order_id)
values (353, 61);
insert into INCLUDE (professional_id, order_id)
values (356, 231);
insert into INCLUDE (professional_id, order_id)
values (357, 121);
insert into INCLUDE (professional_id, order_id)
values (358, 11);
insert into INCLUDE (professional_id, order_id)
values (359, 70);
insert into INCLUDE (professional_id, order_id)
values (361, 110);
insert into INCLUDE (professional_id, order_id)
values (362, 137);
insert into INCLUDE (professional_id, order_id)
values (363, 84);
insert into INCLUDE (professional_id, order_id)
values (363, 139);
insert into INCLUDE (professional_id, order_id)
values (367, 186);
insert into INCLUDE (professional_id, order_id)
values (368, 213);
insert into INCLUDE (professional_id, order_id)
values (370, 291);
insert into INCLUDE (professional_id, order_id)
values (371, 170);
insert into INCLUDE (professional_id, order_id)
values (372, 262);
insert into INCLUDE (professional_id, order_id)
values (374, 195);
insert into INCLUDE (professional_id, order_id)
values (375, 16);
insert into INCLUDE (professional_id, order_id)
values (375, 227);
insert into INCLUDE (professional_id, order_id)
values (378, 158);
insert into INCLUDE (professional_id, order_id)
values (378, 349);
insert into INCLUDE (professional_id, order_id)
values (379, 86);
insert into INCLUDE (professional_id, order_id)
values (381, 97);
insert into INCLUDE (professional_id, order_id)
values (381, 345);
insert into INCLUDE (professional_id, order_id)
values (383, 399);
insert into INCLUDE (professional_id, order_id)
values (384, 161);
insert into INCLUDE (professional_id, order_id)
values (384, 225);
insert into INCLUDE (professional_id, order_id)
values (384, 363);
insert into INCLUDE (professional_id, order_id)
values (385, 154);
insert into INCLUDE (professional_id, order_id)
values (385, 211);
insert into INCLUDE (professional_id, order_id)
values (385, 323);
insert into INCLUDE (professional_id, order_id)
values (386, 47);
insert into INCLUDE (professional_id, order_id)
values (386, 183);
insert into INCLUDE (professional_id, order_id)
values (386, 356);
insert into INCLUDE (professional_id, order_id)
values (387, 134);
insert into INCLUDE (professional_id, order_id)
values (387, 310);
insert into INCLUDE (professional_id, order_id)
values (388, 27);
insert into INCLUDE (professional_id, order_id)
values (388, 69);
insert into INCLUDE (professional_id, order_id)
values (388, 175);
insert into INCLUDE (professional_id, order_id)
values (388, 369);
insert into INCLUDE (professional_id, order_id)
values (389, 275);
insert into INCLUDE (professional_id, order_id)
values (389, 324);
insert into INCLUDE (professional_id, order_id)
values (391, 326);
insert into INCLUDE (professional_id, order_id)
values (391, 358);
insert into INCLUDE (professional_id, order_id)
values (392, 146);
insert into INCLUDE (professional_id, order_id)
values (393, 53);
insert into INCLUDE (professional_id, order_id)
values (393, 237);
insert into INCLUDE (professional_id, order_id)
values (395, 230);
insert into INCLUDE (professional_id, order_id)
values (399, 228);
insert into INCLUDE (professional_id, order_id)
values (399, 276);
commit;
prompt 400 records loaded
prompt Loading PAYMENTMETHOD...
insert into PAYMENTMETHOD (pay_method_id, type)
values (0, 'Credit Card');
insert into PAYMENTMETHOD (pay_method_id, type)
values (1, 'Cash');
insert into PAYMENTMETHOD (pay_method_id, type)
values (2, 'PayPal');
insert into PAYMENTMETHOD (pay_method_id, type)
values (3, 'Bank Transfer');
commit;
prompt 4 records loaded
prompt Loading PAYMENT...
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (0, 45000, to_date('30-06-2021', 'dd-mm-yyyy'), 2, 0);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (1, 24000, to_date('05-04-2020', 'dd-mm-yyyy'), 1, 1);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (2, 25000, to_date('27-12-2022', 'dd-mm-yyyy'), 2, 2);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (3, 43000, to_date('03-11-2020', 'dd-mm-yyyy'), 2, 3);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (4, 24000, to_date('09-05-2021', 'dd-mm-yyyy'), 1, 4);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (5, 16000, to_date('29-08-2023', 'dd-mm-yyyy'), 1, 5);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (6, 17000, to_date('17-06-2020', 'dd-mm-yyyy'), 1, 6);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (7, 3000, to_date('21-09-2020', 'dd-mm-yyyy'), 0, 7);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (8, 1000, to_date('22-04-2022', 'dd-mm-yyyy'), 3, 8);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (9, 20000, to_date('27-07-2021', 'dd-mm-yyyy'), 3, 9);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (10, 44000, to_date('09-02-2024', 'dd-mm-yyyy'), 0, 10);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (11, 49000, to_date('17-11-2023', 'dd-mm-yyyy'), 0, 11);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (12, 14000, to_date('28-05-2020', 'dd-mm-yyyy'), 0, 12);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (13, 24000, to_date('19-02-2023', 'dd-mm-yyyy'), 3, 13);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (14, 37000, to_date('06-12-2020', 'dd-mm-yyyy'), 0, 14);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (15, 36000, to_date('20-11-2021', 'dd-mm-yyyy'), 2, 15);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (16, 31000, to_date('13-05-2023', 'dd-mm-yyyy'), 0, 16);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (17, 37000, to_date('21-02-2021', 'dd-mm-yyyy'), 2, 17);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (18, 30000, to_date('21-09-2021', 'dd-mm-yyyy'), 2, 18);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (19, 30000, to_date('25-02-2020', 'dd-mm-yyyy'), 2, 19);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (20, 29000, to_date('01-10-2020', 'dd-mm-yyyy'), 2, 20);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (21, 29000, to_date('26-07-2023', 'dd-mm-yyyy'), 0, 21);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (22, 33000, to_date('20-10-2020', 'dd-mm-yyyy'), 3, 22);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (23, 38000, to_date('19-01-2020', 'dd-mm-yyyy'), 3, 23);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (24, 48000, to_date('15-08-2022', 'dd-mm-yyyy'), 3, 24);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (25, 49000, to_date('07-04-2020', 'dd-mm-yyyy'), 3, 25);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (26, 6000, to_date('13-10-2023', 'dd-mm-yyyy'), 3, 26);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (27, 42000, to_date('27-04-2022', 'dd-mm-yyyy'), 2, 27);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (28, 28000, to_date('21-12-2022', 'dd-mm-yyyy'), 0, 28);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (29, 44000, to_date('14-05-2024', 'dd-mm-yyyy'), 1, 29);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (30, 28000, to_date('21-10-2022', 'dd-mm-yyyy'), 3, 30);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (31, 41000, to_date('21-07-2021', 'dd-mm-yyyy'), 2, 31);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (32, 16000, to_date('28-08-2023', 'dd-mm-yyyy'), 3, 32);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (33, 35000, to_date('10-01-2022', 'dd-mm-yyyy'), 3, 33);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (34, 1000, to_date('16-07-2023', 'dd-mm-yyyy'), 0, 34);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (35, 18000, to_date('01-12-2022', 'dd-mm-yyyy'), 2, 35);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (36, 23000, to_date('15-01-2022', 'dd-mm-yyyy'), 2, 36);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (37, 33000, to_date('06-08-2020', 'dd-mm-yyyy'), 2, 37);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (38, 12000, to_date('29-01-2023', 'dd-mm-yyyy'), 0, 38);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (39, 6000, to_date('19-11-2021', 'dd-mm-yyyy'), 2, 39);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (40, 9000, to_date('14-08-2023', 'dd-mm-yyyy'), 3, 40);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (41, 44000, to_date('28-04-2022', 'dd-mm-yyyy'), 3, 41);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (42, 31000, to_date('06-04-2023', 'dd-mm-yyyy'), 3, 42);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (43, 50000, to_date('03-10-2020', 'dd-mm-yyyy'), 3, 43);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (44, 15000, to_date('28-03-2021', 'dd-mm-yyyy'), 3, 44);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (45, 36000, to_date('30-08-2023', 'dd-mm-yyyy'), 1, 45);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (46, 24000, to_date('04-04-2020', 'dd-mm-yyyy'), 2, 46);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (47, 24000, to_date('25-08-2022', 'dd-mm-yyyy'), 1, 47);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (48, 6000, to_date('09-05-2021', 'dd-mm-yyyy'), 2, 48);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (49, 24000, to_date('17-01-2023', 'dd-mm-yyyy'), 1, 49);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (50, 5000, to_date('18-01-2022', 'dd-mm-yyyy'), 0, 50);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (51, 22000, to_date('06-07-2023', 'dd-mm-yyyy'), 1, 51);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (52, 44000, to_date('16-02-2021', 'dd-mm-yyyy'), 0, 52);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (53, 1000, to_date('14-12-2020', 'dd-mm-yyyy'), 2, 53);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (54, 42000, to_date('21-11-2023', 'dd-mm-yyyy'), 3, 54);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (55, 7000, to_date('04-12-2023', 'dd-mm-yyyy'), 3, 55);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (56, 31000, to_date('12-02-2020', 'dd-mm-yyyy'), 3, 56);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (57, 5000, to_date('23-08-2023', 'dd-mm-yyyy'), 0, 57);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (58, 12000, to_date('09-05-2020', 'dd-mm-yyyy'), 0, 58);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (59, 41000, to_date('30-01-2022', 'dd-mm-yyyy'), 3, 59);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (60, 6000, to_date('23-01-2023', 'dd-mm-yyyy'), 2, 60);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (61, 16000, to_date('07-06-2023', 'dd-mm-yyyy'), 0, 61);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (62, 11000, to_date('20-04-2021', 'dd-mm-yyyy'), 3, 62);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (63, 39500, to_date('02-09-2020', 'dd-mm-yyyy'), 2, 63);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (64, 9000, to_date('08-08-2023', 'dd-mm-yyyy'), 3, 64);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (65, 12000, to_date('11-09-2021', 'dd-mm-yyyy'), 2, 65);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (66, 37000, to_date('12-09-2023', 'dd-mm-yyyy'), 1, 66);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (67, 34000, to_date('30-01-2022', 'dd-mm-yyyy'), 1, 67);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (68, 5000, to_date('23-11-2020', 'dd-mm-yyyy'), 2, 68);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (69, 21000, to_date('01-06-2021', 'dd-mm-yyyy'), 1, 69);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (70, 5000, to_date('14-06-2021', 'dd-mm-yyyy'), 0, 70);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (71, 11000, to_date('15-07-2023', 'dd-mm-yyyy'), 2, 71);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (72, 27000, to_date('22-08-2021', 'dd-mm-yyyy'), 0, 72);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (73, 44000, to_date('26-07-2022', 'dd-mm-yyyy'), 3, 73);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (74, 3000, to_date('20-08-2023', 'dd-mm-yyyy'), 2, 74);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (75, 24000, to_date('13-07-2021', 'dd-mm-yyyy'), 0, 75);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (76, 15000, to_date('21-05-2020', 'dd-mm-yyyy'), 3, 76);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (77, 13000, to_date('10-12-2023', 'dd-mm-yyyy'), 0, 77);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (78, 24000, to_date('01-06-2023', 'dd-mm-yyyy'), 1, 78);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (79, 31000, to_date('23-09-2020', 'dd-mm-yyyy'), 2, 79);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (80, 50000, to_date('05-05-2022', 'dd-mm-yyyy'), 2, 80);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (81, 5000, to_date('27-12-2022', 'dd-mm-yyyy'), 1, 81);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (82, 44000, to_date('12-12-2021', 'dd-mm-yyyy'), 2, 82);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (83, 20200, to_date('15-02-2022', 'dd-mm-yyyy'), 3, 83);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (84, 4000, to_date('03-07-2020', 'dd-mm-yyyy'), 1, 84);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (85, 21000, to_date('16-11-2023', 'dd-mm-yyyy'), 3, 85);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (86, 9000, to_date('09-06-2022', 'dd-mm-yyyy'), 0, 86);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (87, 29000, to_date('21-04-2021', 'dd-mm-yyyy'), 1, 87);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (88, 35000, to_date('19-03-2024', 'dd-mm-yyyy'), 1, 88);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (89, 36000, to_date('31-03-2021', 'dd-mm-yyyy'), 3, 89);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (90, 10000, to_date('17-01-2022', 'dd-mm-yyyy'), 1, 90);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (91, 37000, to_date('21-05-2023', 'dd-mm-yyyy'), 0, 91);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (92, 22000, to_date('30-05-2022', 'dd-mm-yyyy'), 3, 92);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (93, 20900, to_date('13-04-2020', 'dd-mm-yyyy'), 1, 93);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (94, 34000, to_date('04-08-2022', 'dd-mm-yyyy'), 1, 94);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (95, 16200, to_date('20-12-2021', 'dd-mm-yyyy'), 0, 95);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (96, 28000, to_date('14-05-2020', 'dd-mm-yyyy'), 3, 96);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (97, 44000, to_date('06-04-2023', 'dd-mm-yyyy'), 3, 97);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (98, 16000, to_date('10-10-2022', 'dd-mm-yyyy'), 3, 98);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (99, 32000, to_date('10-02-2024', 'dd-mm-yyyy'), 2, 99);
commit;
prompt 100 records committed...
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (100, 16000, to_date('07-04-2022', 'dd-mm-yyyy'), 2, 100);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (101, 1000, to_date('18-07-2023', 'dd-mm-yyyy'), 3, 101);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (102, 35000, to_date('14-07-2022', 'dd-mm-yyyy'), 3, 102);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (103, 9000, to_date('21-03-2020', 'dd-mm-yyyy'), 1, 103);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (104, 10000, to_date('02-08-2021', 'dd-mm-yyyy'), 2, 104);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (105, 42000, to_date('15-08-2022', 'dd-mm-yyyy'), 2, 105);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (106, 33000, to_date('27-03-2020', 'dd-mm-yyyy'), 2, 106);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (107, 15000, to_date('09-08-2022', 'dd-mm-yyyy'), 0, 107);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (108, 48000, to_date('20-12-2022', 'dd-mm-yyyy'), 2, 108);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (109, 10000, to_date('15-04-2021', 'dd-mm-yyyy'), 1, 109);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (110, 50000, to_date('17-05-2022', 'dd-mm-yyyy'), 2, 110);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (111, 41000, to_date('25-02-2021', 'dd-mm-yyyy'), 2, 111);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (112, 18000, to_date('27-10-2023', 'dd-mm-yyyy'), 1, 112);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (113, 47000, to_date('23-05-2020', 'dd-mm-yyyy'), 1, 113);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (114, 43000, to_date('03-05-2022', 'dd-mm-yyyy'), 2, 114);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (115, 41400, to_date('12-06-2021', 'dd-mm-yyyy'), 2, 115);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (116, 1000, to_date('07-12-2020', 'dd-mm-yyyy'), 3, 116);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (117, 34000, to_date('28-06-2023', 'dd-mm-yyyy'), 3, 117);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (118, 28000, to_date('11-12-2020', 'dd-mm-yyyy'), 3, 118);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (119, 48100, to_date('19-06-2020', 'dd-mm-yyyy'), 3, 119);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (120, 45000, to_date('06-11-2020', 'dd-mm-yyyy'), 2, 120);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (121, 20000, to_date('08-01-2023', 'dd-mm-yyyy'), 1, 121);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (122, 11000, to_date('21-04-2021', 'dd-mm-yyyy'), 3, 122);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (123, 9000, to_date('25-11-2021', 'dd-mm-yyyy'), 2, 123);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (124, 4000, to_date('20-07-2020', 'dd-mm-yyyy'), 0, 124);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (125, 42000, to_date('16-03-2020', 'dd-mm-yyyy'), 0, 125);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (126, 26000, to_date('01-01-2021', 'dd-mm-yyyy'), 2, 126);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (127, 33000, to_date('02-08-2020', 'dd-mm-yyyy'), 2, 127);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (128, 3000, to_date('18-11-2022', 'dd-mm-yyyy'), 2, 128);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (129, 37700, to_date('01-09-2023', 'dd-mm-yyyy'), 1, 129);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (130, 3000, to_date('18-09-2023', 'dd-mm-yyyy'), 3, 130);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (131, 34000, to_date('08-03-2023', 'dd-mm-yyyy'), 3, 131);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (132, 5000, to_date('21-09-2023', 'dd-mm-yyyy'), 3, 132);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (133, 30000, to_date('02-11-2022', 'dd-mm-yyyy'), 2, 133);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (134, 4000, to_date('21-06-2020', 'dd-mm-yyyy'), 2, 134);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (135, 50000, to_date('25-12-2022', 'dd-mm-yyyy'), 3, 135);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (136, 1000, to_date('26-12-2022', 'dd-mm-yyyy'), 1, 136);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (137, 9500, to_date('26-04-2022', 'dd-mm-yyyy'), 3, 137);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (138, 47000, to_date('04-09-2022', 'dd-mm-yyyy'), 1, 138);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (139, 31000, to_date('10-06-2020', 'dd-mm-yyyy'), 2, 139);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (140, 26000, to_date('01-10-2020', 'dd-mm-yyyy'), 2, 140);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (141, 32000, to_date('23-05-2022', 'dd-mm-yyyy'), 2, 141);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (142, 44000, to_date('01-06-2020', 'dd-mm-yyyy'), 1, 142);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (143, 17000, to_date('05-12-2022', 'dd-mm-yyyy'), 2, 143);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (144, 50000, to_date('03-03-2024', 'dd-mm-yyyy'), 0, 144);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (145, 12000, to_date('01-08-2020', 'dd-mm-yyyy'), 1, 145);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (146, 45000, to_date('03-12-2022', 'dd-mm-yyyy'), 3, 146);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (147, 43000, to_date('01-03-2021', 'dd-mm-yyyy'), 2, 147);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (148, 16000, to_date('27-01-2022', 'dd-mm-yyyy'), 1, 148);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (149, 16000, to_date('16-07-2022', 'dd-mm-yyyy'), 1, 149);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (150, 34000, to_date('19-05-2023', 'dd-mm-yyyy'), 1, 150);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (151, 39500, to_date('08-04-2024', 'dd-mm-yyyy'), 2, 151);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (152, 49000, to_date('14-12-2020', 'dd-mm-yyyy'), 0, 152);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (153, 18000, to_date('21-11-2020', 'dd-mm-yyyy'), 3, 153);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (154, 42000, to_date('11-10-2020', 'dd-mm-yyyy'), 0, 154);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (155, 37700, to_date('17-10-2020', 'dd-mm-yyyy'), 2, 155);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (156, 41000, to_date('16-03-2021', 'dd-mm-yyyy'), 1, 156);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (157, 4000, to_date('06-05-2020', 'dd-mm-yyyy'), 1, 157);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (158, 9500, to_date('06-03-2022', 'dd-mm-yyyy'), 3, 158);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (159, 43000, to_date('04-08-2021', 'dd-mm-yyyy'), 3, 159);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (160, 20200, to_date('15-01-2024', 'dd-mm-yyyy'), 1, 160);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (161, 8000, to_date('26-07-2021', 'dd-mm-yyyy'), 3, 161);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (162, 25000, to_date('25-04-2024', 'dd-mm-yyyy'), 1, 162);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (163, 22000, to_date('03-08-2020', 'dd-mm-yyyy'), 0, 163);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (164, 47000, to_date('07-06-2020', 'dd-mm-yyyy'), 0, 164);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (165, 46000, to_date('05-05-2022', 'dd-mm-yyyy'), 1, 165);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (166, 18000, to_date('30-11-2022', 'dd-mm-yyyy'), 0, 166);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (167, 32300, to_date('24-04-2024', 'dd-mm-yyyy'), 0, 167);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (168, 30000, to_date('25-01-2024', 'dd-mm-yyyy'), 3, 168);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (169, 31000, to_date('05-01-2021', 'dd-mm-yyyy'), 1, 169);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (170, 16000, to_date('27-01-2020', 'dd-mm-yyyy'), 0, 170);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (171, 34000, to_date('29-12-2021', 'dd-mm-yyyy'), 0, 171);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (172, 10000, to_date('28-10-2022', 'dd-mm-yyyy'), 0, 172);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (173, 11000, to_date('18-07-2021', 'dd-mm-yyyy'), 3, 173);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (174, 34000, to_date('06-05-2023', 'dd-mm-yyyy'), 3, 174);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (175, 33000, to_date('05-11-2021', 'dd-mm-yyyy'), 2, 175);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (176, 43000, to_date('01-09-2022', 'dd-mm-yyyy'), 1, 176);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (177, 37000, to_date('14-02-2022', 'dd-mm-yyyy'), 0, 177);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (178, 37000, to_date('26-03-2022', 'dd-mm-yyyy'), 1, 178);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (179, 47000, to_date('09-04-2020', 'dd-mm-yyyy'), 1, 179);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (180, 16000, to_date('08-03-2021', 'dd-mm-yyyy'), 3, 180);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (181, 35200, to_date('07-03-2022', 'dd-mm-yyyy'), 3, 181);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (182, 19000, to_date('09-02-2021', 'dd-mm-yyyy'), 3, 182);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (183, 26000, to_date('26-05-2021', 'dd-mm-yyyy'), 3, 183);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (184, 31000, to_date('04-01-2021', 'dd-mm-yyyy'), 0, 184);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (185, 24000, to_date('31-10-2023', 'dd-mm-yyyy'), 1, 185);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (186, 48000, to_date('05-03-2020', 'dd-mm-yyyy'), 3, 186);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (187, 29000, to_date('05-12-2020', 'dd-mm-yyyy'), 3, 187);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (188, 28000, to_date('30-06-2023', 'dd-mm-yyyy'), 0, 188);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (189, 1000, to_date('01-11-2022', 'dd-mm-yyyy'), 1, 189);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (190, 34000, to_date('19-02-2021', 'dd-mm-yyyy'), 2, 190);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (191, 11000, to_date('16-06-2022', 'dd-mm-yyyy'), 2, 191);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (192, 9000, to_date('30-11-2022', 'dd-mm-yyyy'), 3, 192);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (193, 27300, to_date('16-09-2021', 'dd-mm-yyyy'), 2, 193);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (194, 34000, to_date('20-08-2021', 'dd-mm-yyyy'), 2, 194);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (195, 37000, to_date('17-12-2021', 'dd-mm-yyyy'), 0, 195);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (196, 33000, to_date('18-09-2022', 'dd-mm-yyyy'), 3, 196);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (197, 6000, to_date('12-07-2023', 'dd-mm-yyyy'), 1, 197);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (198, 5200, to_date('21-04-2020', 'dd-mm-yyyy'), 2, 198);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (199, 32000, to_date('18-01-2020', 'dd-mm-yyyy'), 1, 199);
commit;
prompt 200 records committed...
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (200, 45000, to_date('04-10-2021', 'dd-mm-yyyy'), 1, 200);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (201, 42000, to_date('20-12-2021', 'dd-mm-yyyy'), 1, 201);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (202, 46000, to_date('09-07-2020', 'dd-mm-yyyy'), 1, 202);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (203, 42000, to_date('20-04-2023', 'dd-mm-yyyy'), 2, 203);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (204, 27000, to_date('17-07-2020', 'dd-mm-yyyy'), 2, 204);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (205, 24000, to_date('23-11-2021', 'dd-mm-yyyy'), 1, 205);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (206, 43000, to_date('21-12-2021', 'dd-mm-yyyy'), 0, 206);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (207, 11000, to_date('18-08-2023', 'dd-mm-yyyy'), 3, 207);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (208, 29000, to_date('09-11-2023', 'dd-mm-yyyy'), 0, 208);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (209, 21000, to_date('14-09-2020', 'dd-mm-yyyy'), 2, 209);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (210, 7000, to_date('18-11-2020', 'dd-mm-yyyy'), 1, 210);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (211, 47000, to_date('27-01-2020', 'dd-mm-yyyy'), 2, 211);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (212, 41200, to_date('24-11-2021', 'dd-mm-yyyy'), 2, 212);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (213, 37000, to_date('03-01-2022', 'dd-mm-yyyy'), 0, 213);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (214, 29000, to_date('24-05-2023', 'dd-mm-yyyy'), 3, 214);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (215, 17200, to_date('06-06-2021', 'dd-mm-yyyy'), 3, 215);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (216, 21000, to_date('01-08-2020', 'dd-mm-yyyy'), 0, 216);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (217, 44000, to_date('24-10-2022', 'dd-mm-yyyy'), 1, 217);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (218, 3000, to_date('20-08-2020', 'dd-mm-yyyy'), 1, 218);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (219, 5000, to_date('24-11-2021', 'dd-mm-yyyy'), 3, 219);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (220, 14000, to_date('18-12-2021', 'dd-mm-yyyy'), 1, 220);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (221, 36000, to_date('31-08-2021', 'dd-mm-yyyy'), 3, 221);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (222, 6000, to_date('16-03-2024', 'dd-mm-yyyy'), 1, 222);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (223, 39500, to_date('23-10-2021', 'dd-mm-yyyy'), 2, 223);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (224, 6000, to_date('04-04-2023', 'dd-mm-yyyy'), 3, 224);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (225, 7000, to_date('15-10-2021', 'dd-mm-yyyy'), 1, 225);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (226, 32000, to_date('26-09-2020', 'dd-mm-yyyy'), 0, 226);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (227, 32000, to_date('13-01-2022', 'dd-mm-yyyy'), 1, 227);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (228, 6000, to_date('08-12-2020', 'dd-mm-yyyy'), 2, 228);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (229, 41000, to_date('28-11-2021', 'dd-mm-yyyy'), 1, 229);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (230, 32000, to_date('22-02-2021', 'dd-mm-yyyy'), 3, 230);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (231, 20000, to_date('16-07-2022', 'dd-mm-yyyy'), 0, 231);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (232, 32000, to_date('14-06-2020', 'dd-mm-yyyy'), 1, 232);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (233, 25000, to_date('02-08-2023', 'dd-mm-yyyy'), 2, 233);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (234, 47000, to_date('28-05-2020', 'dd-mm-yyyy'), 1, 234);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (235, 50000, to_date('05-08-2021', 'dd-mm-yyyy'), 3, 235);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (236, 23000, to_date('04-08-2022', 'dd-mm-yyyy'), 0, 236);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (237, 23000, to_date('13-08-2023', 'dd-mm-yyyy'), 3, 237);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (238, 5000, to_date('17-10-2022', 'dd-mm-yyyy'), 3, 238);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (239, 23000, to_date('04-01-2022', 'dd-mm-yyyy'), 2, 239);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (240, 50000, to_date('10-01-2020', 'dd-mm-yyyy'), 3, 240);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (241, 11000, to_date('19-07-2022', 'dd-mm-yyyy'), 0, 241);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (242, 27000, to_date('11-04-2020', 'dd-mm-yyyy'), 3, 242);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (243, 37000, to_date('04-03-2021', 'dd-mm-yyyy'), 1, 243);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (244, 36000, to_date('23-01-2021', 'dd-mm-yyyy'), 1, 244);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (245, 5200, to_date('11-01-2020', 'dd-mm-yyyy'), 3, 245);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (246, 14000, to_date('14-04-2022', 'dd-mm-yyyy'), 1, 246);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (247, 16200, to_date('22-02-2024', 'dd-mm-yyyy'), 3, 247);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (248, 44000, to_date('27-04-2022', 'dd-mm-yyyy'), 1, 248);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (249, 35000, to_date('21-06-2021', 'dd-mm-yyyy'), 1, 249);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (250, 45000, to_date('11-05-2020', 'dd-mm-yyyy'), 3, 250);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (251, 18000, to_date('11-09-2023', 'dd-mm-yyyy'), 3, 251);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (252, 38000, to_date('03-02-2024', 'dd-mm-yyyy'), 0, 252);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (253, 41000, to_date('17-03-2020', 'dd-mm-yyyy'), 0, 253);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (254, 25000, to_date('15-09-2022', 'dd-mm-yyyy'), 3, 254);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (255, 28000, to_date('01-11-2023', 'dd-mm-yyyy'), 1, 255);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (256, 45000, to_date('29-01-2021', 'dd-mm-yyyy'), 2, 256);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (257, 31000, to_date('20-03-2021', 'dd-mm-yyyy'), 2, 257);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (258, 16000, to_date('19-07-2021', 'dd-mm-yyyy'), 2, 258);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (259, 20000, to_date('10-03-2022', 'dd-mm-yyyy'), 1, 259);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (260, 47000, to_date('13-08-2020', 'dd-mm-yyyy'), 2, 260);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (261, 23000, to_date('09-03-2020', 'dd-mm-yyyy'), 3, 261);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (262, 11000, to_date('08-06-2020', 'dd-mm-yyyy'), 2, 262);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (263, 26000, to_date('10-03-2021', 'dd-mm-yyyy'), 0, 263);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (264, 6000, to_date('28-03-2023', 'dd-mm-yyyy'), 0, 264);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (265, 47000, to_date('10-10-2023', 'dd-mm-yyyy'), 3, 265);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (266, 1000, to_date('07-12-2021', 'dd-mm-yyyy'), 1, 266);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (267, 13000, to_date('27-09-2020', 'dd-mm-yyyy'), 2, 267);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (268, 16000, to_date('15-04-2024', 'dd-mm-yyyy'), 1, 268);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (269, 36000, to_date('01-08-2022', 'dd-mm-yyyy'), 0, 269);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (270, 20900, to_date('07-09-2021', 'dd-mm-yyyy'), 3, 270);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (271, 37000, to_date('28-08-2020', 'dd-mm-yyyy'), 2, 271);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (272, 10000, to_date('18-11-2021', 'dd-mm-yyyy'), 3, 272);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (273, 13000, to_date('10-06-2022', 'dd-mm-yyyy'), 2, 273);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (274, 44000, to_date('30-03-2021', 'dd-mm-yyyy'), 1, 274);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (275, 5000, to_date('19-10-2022', 'dd-mm-yyyy'), 3, 275);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (276, 12000, to_date('25-11-2021', 'dd-mm-yyyy'), 2, 276);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (277, 33000, to_date('13-06-2021', 'dd-mm-yyyy'), 0, 277);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (278, 16000, to_date('05-05-2023', 'dd-mm-yyyy'), 3, 278);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (279, 40000, to_date('27-11-2023', 'dd-mm-yyyy'), 2, 279);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (280, 43000, to_date('07-03-2023', 'dd-mm-yyyy'), 1, 280);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (281, 12000, to_date('18-12-2022', 'dd-mm-yyyy'), 2, 281);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (282, 21000, to_date('14-05-2023', 'dd-mm-yyyy'), 0, 282);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (283, 43000, to_date('29-12-2021', 'dd-mm-yyyy'), 0, 283);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (284, 26000, to_date('03-01-2024', 'dd-mm-yyyy'), 1, 284);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (285, 31000, to_date('15-06-2022', 'dd-mm-yyyy'), 3, 285);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (286, 15200, to_date('25-08-2023', 'dd-mm-yyyy'), 3, 286);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (287, 6000, to_date('22-09-2020', 'dd-mm-yyyy'), 3, 287);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (288, 16000, to_date('23-01-2022', 'dd-mm-yyyy'), 3, 288);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (289, 27300, to_date('09-02-2021', 'dd-mm-yyyy'), 1, 289);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (290, 50000, to_date('29-03-2023', 'dd-mm-yyyy'), 0, 290);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (291, 13000, to_date('07-09-2021', 'dd-mm-yyyy'), 2, 291);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (292, 42000, to_date('27-06-2020', 'dd-mm-yyyy'), 3, 292);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (293, 34000, to_date('16-11-2023', 'dd-mm-yyyy'), 3, 293);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (294, 20000, to_date('28-04-2023', 'dd-mm-yyyy'), 2, 294);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (295, 30000, to_date('27-11-2021', 'dd-mm-yyyy'), 1, 295);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (296, 4000, to_date('20-02-2023', 'dd-mm-yyyy'), 0, 296);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (297, 15000, to_date('12-05-2024', 'dd-mm-yyyy'), 0, 297);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (298, 9000, to_date('11-05-2024', 'dd-mm-yyyy'), 3, 298);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (299, 22000, to_date('05-12-2021', 'dd-mm-yyyy'), 3, 299);
commit;
prompt 300 records committed...
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (300, 45000, to_date('27-02-2021', 'dd-mm-yyyy'), 0, 300);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (301, 15000, to_date('08-03-2024', 'dd-mm-yyyy'), 1, 301);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (302, 34000, to_date('20-08-2022', 'dd-mm-yyyy'), 0, 302);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (303, 21000, to_date('09-01-2020', 'dd-mm-yyyy'), 1, 303);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (304, 12000, to_date('01-07-2023', 'dd-mm-yyyy'), 2, 304);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (305, 42000, to_date('06-04-2021', 'dd-mm-yyyy'), 3, 305);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (306, 36000, to_date('17-02-2023', 'dd-mm-yyyy'), 0, 306);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (307, 50000, to_date('19-01-2022', 'dd-mm-yyyy'), 3, 307);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (308, 47000, to_date('06-11-2020', 'dd-mm-yyyy'), 1, 308);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (309, 45000, to_date('16-02-2021', 'dd-mm-yyyy'), 2, 309);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (310, 37000, to_date('08-09-2023', 'dd-mm-yyyy'), 2, 310);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (311, 37000, to_date('29-10-2022', 'dd-mm-yyyy'), 2, 311);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (312, 26000, to_date('16-03-2023', 'dd-mm-yyyy'), 2, 312);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (313, 47000, to_date('14-03-2021', 'dd-mm-yyyy'), 3, 313);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (314, 41000, to_date('18-12-2021', 'dd-mm-yyyy'), 0, 314);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (315, 39600, to_date('25-04-2021', 'dd-mm-yyyy'), 3, 315);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (316, 41000, to_date('06-01-2020', 'dd-mm-yyyy'), 3, 316);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (317, 3000, to_date('26-03-2024', 'dd-mm-yyyy'), 1, 317);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (318, 14000, to_date('03-06-2023', 'dd-mm-yyyy'), 3, 318);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (319, 9500, to_date('17-05-2023', 'dd-mm-yyyy'), 3, 319);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (320, 44000, to_date('03-01-2024', 'dd-mm-yyyy'), 1, 320);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (321, 34000, to_date('20-04-2024', 'dd-mm-yyyy'), 1, 321);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (322, 21000, to_date('27-03-2024', 'dd-mm-yyyy'), 0, 322);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (323, 33000, to_date('14-01-2022', 'dd-mm-yyyy'), 2, 323);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (324, 6000, to_date('09-04-2021', 'dd-mm-yyyy'), 2, 324);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (325, 41000, to_date('05-10-2023', 'dd-mm-yyyy'), 1, 325);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (326, 45000, to_date('30-08-2021', 'dd-mm-yyyy'), 2, 326);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (327, 40000, to_date('23-10-2020', 'dd-mm-yyyy'), 0, 327);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (328, 41400, to_date('23-08-2020', 'dd-mm-yyyy'), 2, 328);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (329, 34000, to_date('22-04-2022', 'dd-mm-yyyy'), 0, 329);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (330, 34000, to_date('02-01-2024', 'dd-mm-yyyy'), 3, 330);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (331, 4000, to_date('12-01-2022', 'dd-mm-yyyy'), 0, 331);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (332, 19000, to_date('28-01-2020', 'dd-mm-yyyy'), 1, 332);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (333, 16000, to_date('14-04-2021', 'dd-mm-yyyy'), 2, 333);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (334, 45000, to_date('07-01-2023', 'dd-mm-yyyy'), 1, 334);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (335, 12000, to_date('17-09-2021', 'dd-mm-yyyy'), 0, 335);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (336, 33100, to_date('18-03-2024', 'dd-mm-yyyy'), 1, 336);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (337, 10000, to_date('30-06-2022', 'dd-mm-yyyy'), 0, 337);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (338, 41000, to_date('28-03-2021', 'dd-mm-yyyy'), 0, 338);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (339, 7000, to_date('02-09-2022', 'dd-mm-yyyy'), 1, 339);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (340, 5200, to_date('18-09-2020', 'dd-mm-yyyy'), 1, 340);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (341, 44000, to_date('14-02-2021', 'dd-mm-yyyy'), 0, 341);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (342, 23000, to_date('16-10-2020', 'dd-mm-yyyy'), 1, 342);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (343, 34000, to_date('28-12-2021', 'dd-mm-yyyy'), 3, 343);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (344, 36000, to_date('19-02-2021', 'dd-mm-yyyy'), 1, 344);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (345, 22000, to_date('07-10-2022', 'dd-mm-yyyy'), 1, 345);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (346, 19000, to_date('19-01-2023', 'dd-mm-yyyy'), 0, 346);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (347, 24000, to_date('08-11-2021', 'dd-mm-yyyy'), 1, 347);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (348, 29000, to_date('13-05-2023', 'dd-mm-yyyy'), 3, 348);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (349, 13000, to_date('02-01-2022', 'dd-mm-yyyy'), 1, 349);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (350, 45000, to_date('13-12-2020', 'dd-mm-yyyy'), 0, 350);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (351, 29000, to_date('03-12-2021', 'dd-mm-yyyy'), 0, 351);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (352, 11000, to_date('21-03-2021', 'dd-mm-yyyy'), 1, 352);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (353, 43000, to_date('10-03-2022', 'dd-mm-yyyy'), 3, 353);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (354, 11900, to_date('15-03-2022', 'dd-mm-yyyy'), 0, 354);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (355, 34000, to_date('23-08-2022', 'dd-mm-yyyy'), 1, 355);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (356, 10000, to_date('14-04-2021', 'dd-mm-yyyy'), 3, 356);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (357, 10000, to_date('15-03-2022', 'dd-mm-yyyy'), 0, 357);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (358, 45000, to_date('21-02-2020', 'dd-mm-yyyy'), 1, 358);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (359, 4000, to_date('02-10-2021', 'dd-mm-yyyy'), 2, 359);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (360, 6000, to_date('16-09-2023', 'dd-mm-yyyy'), 2, 360);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (361, 42000, to_date('07-11-2022', 'dd-mm-yyyy'), 0, 361);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (362, 45000, to_date('01-01-2023', 'dd-mm-yyyy'), 3, 362);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (363, 29000, to_date('22-05-2022', 'dd-mm-yyyy'), 3, 363);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (364, 9500, to_date('27-04-2021', 'dd-mm-yyyy'), 1, 364);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (365, 47000, to_date('03-07-2020', 'dd-mm-yyyy'), 1, 365);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (366, 4000, to_date('12-02-2021', 'dd-mm-yyyy'), 3, 366);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (367, 31000, to_date('14-02-2024', 'dd-mm-yyyy'), 2, 367);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (368, 25000, to_date('03-04-2024', 'dd-mm-yyyy'), 2, 368);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (369, 45000, to_date('24-05-2023', 'dd-mm-yyyy'), 0, 369);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (370, 26000, to_date('17-07-2022', 'dd-mm-yyyy'), 3, 370);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (371, 21000, to_date('23-11-2021', 'dd-mm-yyyy'), 0, 371);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (372, 47000, to_date('30-11-2021', 'dd-mm-yyyy'), 3, 372);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (373, 1000, to_date('27-11-2021', 'dd-mm-yyyy'), 0, 373);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (374, 21000, to_date('29-03-2021', 'dd-mm-yyyy'), 3, 374);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (375, 31000, to_date('13-06-2021', 'dd-mm-yyyy'), 0, 375);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (376, 12000, to_date('10-03-2023', 'dd-mm-yyyy'), 0, 376);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (377, 26000, to_date('11-08-2020', 'dd-mm-yyyy'), 2, 377);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (378, 38000, to_date('23-10-2021', 'dd-mm-yyyy'), 3, 378);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (379, 3000, to_date('19-11-2023', 'dd-mm-yyyy'), 1, 379);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (380, 10000, to_date('09-03-2023', 'dd-mm-yyyy'), 2, 380);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (381, 4000, to_date('10-08-2021', 'dd-mm-yyyy'), 1, 381);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (382, 42000, to_date('31-01-2022', 'dd-mm-yyyy'), 0, 382);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (383, 42000, to_date('28-10-2020', 'dd-mm-yyyy'), 2, 383);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (384, 50000, to_date('27-09-2022', 'dd-mm-yyyy'), 3, 384);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (385, 7000, to_date('08-01-2021', 'dd-mm-yyyy'), 0, 385);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (386, 37000, to_date('28-10-2022', 'dd-mm-yyyy'), 3, 386);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (387, 49000, to_date('10-10-2020', 'dd-mm-yyyy'), 0, 387);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (388, 31000, to_date('03-11-2020', 'dd-mm-yyyy'), 2, 388);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (389, 4000, to_date('15-05-2024', 'dd-mm-yyyy'), 3, 389);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (390, 37000, to_date('28-08-2020', 'dd-mm-yyyy'), 0, 390);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (391, 17200, to_date('07-03-2023', 'dd-mm-yyyy'), 3, 391);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (392, 18000, to_date('14-06-2021', 'dd-mm-yyyy'), 3, 392);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (393, 33000, to_date('01-01-2022', 'dd-mm-yyyy'), 1, 393);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (394, 9000, to_date('16-07-2020', 'dd-mm-yyyy'), 3, 394);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (395, 24000, to_date('04-01-2020', 'dd-mm-yyyy'), 3, 395);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (396, 50000, to_date('21-05-2023', 'dd-mm-yyyy'), 0, 396);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (397, 8000, to_date('27-04-2020', 'dd-mm-yyyy'), 1, 397);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (398, 11000, to_date('04-10-2021', 'dd-mm-yyyy'), 2, 398);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (399, 5000, to_date('05-06-2022', 'dd-mm-yyyy'), 0, 399);
commit;
prompt 400 records loaded
set feedback on
set define on
prompt Done.

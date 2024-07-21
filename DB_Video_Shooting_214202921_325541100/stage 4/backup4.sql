prompt PL/SQL Developer import file
prompt Created on יום ראשון 21 יולי 2024 by lelid
set feedback off
set define off
prompt Creating CLIENT...
create table CLIENT
(
  client_id NUMBER(5) not null,
  fname     VARCHAR2(15) not null,
  lname     VARCHAR2(15),
  address   VARCHAR2(50) not null,
  phone     NUMBER(10),
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
  lname           VARCHAR2(15),
  phone           NUMBER(10),
  email           VARCHAR2(25),
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

prompt Creating INSTRUMENT...
create table INSTRUMENT
(
  instrument_name VARCHAR2(15) not null,
  price           NUMBER(5) not null,
  instrument_id   NUMBER(5) not null
)
;
alter table INSTRUMENT
  add primary key (INSTRUMENT_ID);

prompt Creating ORDERINSTRUMENTS...
create table ORDERINSTRUMENTS
(
  instrument_id NUMBER(5) not null,
  order_id      NUMBER(5) not null
)
;
alter table ORDERINSTRUMENTS
  add primary key (INSTRUMENT_ID, ORDER_ID);
alter table ORDERINSTRUMENTS
  add constraint FK_INSTRUMENT_ORDER foreign key (ORDER_ID)
  references CUSTOMERORDER (ORDER_ID);
alter table ORDERINSTRUMENTS
  add foreign key (INSTRUMENT_ID)
  references INSTRUMENT (INSTRUMENT_ID);

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
values (322, 'Aaron', 'Wood', '93 H׳³ג€ssleholm Street', 548982163, 'aaron.wood@trx.com');
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
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (387, 'Carol Miller', null, 'carol@site.com', null, '429 Willow St');
commit;
prompt 400 records committed...
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (400, 'Carol Smith', null, 'carol@ex.com', null, '39 Aspen St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (401, 'Bob Johnson', null, 'bob.j@site.com', null, '215 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (402, 'John Davis', null, 'john.@ex.com', null, '139 Birch St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (403, 'Alice Davis', null, 'alice@web.com', null, '982 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (404, 'John Brown', null, 'john.@ex.com', null, '294 Pine St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (405, 'Henry Miller', null, 'henry@site.com', null, '567 Maple St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (406, 'Carol Brown', null, 'carol@mail.com', null, '55 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (407, 'Dan Brown', null, 'dan.b@ex.com', null, '161 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (408, 'Frank Garcia', null, 'frank@ex.com', null, '258 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (409, 'Carol Wilson', null, 'carol@web.com', null, '763 Aspen St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (410, 'Alice Jones', null, 'alice@web.com', null, '54 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (411, 'John Smith', null, 'john.@ex.com', null, '729 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (412, 'Frank Davis', null, 'frank@email.com', null, '107 Maple St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (413, 'Jane Smith', null, 'jane.@ex.com', null, '940 Birch St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (414, 'Alice Brown', null, 'alice@site.com', null, '331 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (415, 'Frank Wilson', null, 'frank@ex.com', null, '763 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (416, 'Henry Johnson', null, 'henry@ex.com', null, '329 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (417, 'John Davis', null, 'john.@mail.com', null, '418 Aspen St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (418, 'Alice Jones', null, 'alice@email.com', null, '337 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (419, 'Grace Brown', null, 'grace@mail.com', null, '438 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (420, 'Alice Doe', null, 'alice@web.com', null, '745 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (421, 'Alice Smith', null, 'alice@email.com', null, '270 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (422, 'Jane Davis', null, 'jane.@email.com', null, '13 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (423, 'Frank Smith', null, 'frank@ex.com', null, '147 Aspen St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (424, 'Carol Garcia', null, 'carol@web.com', null, '814 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (425, 'Bob Williams', null, 'bob.w@site.com', null, '88 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (426, 'Grace Davis', null, 'grace@email.com', null, '455 Maple St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (427, 'Dan Davis', null, 'dan.d@ex.com', null, '173 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (428, 'Alice Garcia', null, 'alice@site.com', null, '323 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (429, 'Henry Jones', null, 'henry@site.com', null, '26 Maple St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (430, 'Dan Garcia', null, 'dan.g@web.com', null, '388 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (431, 'Carol Brown', null, 'carol@site.com', null, '699 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (432, 'Bob Miller', null, 'bob.m@web.com', null, '45 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (433, 'Frank Davis', null, 'frank@ex.com', null, '57 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (434, 'Alice Miller', null, 'alice@site.com', null, '392 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (435, 'Carol Wilson', null, 'carol@email.com', null, '865 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (436, 'John Miller', null, 'john.@web.com', null, '308 Pine St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (437, 'Henry Brown', null, 'henry@ex.com', null, '61 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (438, 'Carol Davis', null, 'carol@mail.com', null, '917 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (439, 'Jane Davis', null, 'jane.@site.com', null, '635 Aspen St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (440, 'Dan Smith', null, 'dan.s@mail.com', null, '741 Birch St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (441, 'Grace Williams', null, 'grace@email.com', null, '655 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (442, 'Frank Smith', null, 'frank@ex.com', null, '930 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (443, 'Carol Miller', null, 'carol@email.com', null, '116 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (444, 'Eve Johnson', null, 'eve.j@email.com', null, '463 Aspen St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (445, 'Frank Johnson', null, 'frank@mail.com', null, '649 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (446, 'Dan Davis', null, 'dan.d@site.com', null, '766 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (447, 'Carol Jones', null, 'carol@mail.com', null, '890 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (448, 'Grace Brown', null, 'grace@web.com', null, '616 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (449, 'Eve Wilson', null, 'eve.w@site.com', null, '22 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (450, 'Frank Davis', null, 'frank@email.com', null, '607 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (451, 'Alice Brown', null, 'alice@email.com', null, '437 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (452, 'Henry Garcia', null, 'henry@ex.com', null, '279 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (453, 'Dan Johnson', null, 'dan.j@ex.com', null, '872 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (454, 'Carol Doe', null, 'carol@ex.com', null, '172 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (455, 'Eve Wilson', null, 'eve.w@email.com', null, '336 Aspen St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (456, 'Jane Johnson', null, 'jane.@mail.com', null, '785 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (457, 'Henry Wilson', null, 'henry@web.com', null, '261 Pine St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (458, 'Frank Wilson', null, 'frank@email.com', null, '254 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (459, 'Alice Jones', null, 'alice@email.com', null, '13 Maple St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (460, 'Bob Johnson', null, 'bob.j@web.com', null, '721 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (461, 'Eve Johnson', null, 'eve.j@site.com', null, '374 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (462, 'Dan Davis', null, 'dan.d@web.com', null, '234 Birch St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (463, 'Frank Doe', null, 'frank@ex.com', null, '360 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (464, 'Jane Johnson', null, 'jane.@mail.com', null, '787 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (465, 'Frank Brown', null, 'frank@web.com', null, '196 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (466, 'Dan Brown', null, 'dan.b@mail.com', null, '391 Pine St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (467, 'Eve Johnson', null, 'eve.j@site.com', null, '270 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (468, 'Dan Miller', null, 'dan.m@site.com', null, '567 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (469, 'Grace Brown', null, 'grace@mail.com', null, '431 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (470, 'Alice Doe', null, 'alice@web.com', null, '18 Pine St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (471, 'Frank Johnson', null, 'frank@web.com', null, '570 Maple St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (472, 'Eve Doe', null, 'eve.d@ex.com', null, '265 Pine St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (473, 'Carol Doe', null, 'carol@site.com', null, '845 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (474, 'Dan Garcia', null, 'dan.g@web.com', null, '544 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (475, 'Eve Garcia', null, 'eve.g@email.com', null, '571 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (476, 'Eve Doe', null, 'eve.d@email.com', null, '54 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (477, 'Dan Johnson', null, 'dan.j@mail.com', null, '873 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (478, 'Bob Garcia', null, 'bob.g@site.com', null, '707 Pine St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (479, 'Bob Doe', null, 'bob.d@web.com', null, '595 Pine St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (480, 'Jane Smith', null, 'jane.@email.com', null, '362 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (481, 'Frank Williams', null, 'frank@email.com', null, '219 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (482, 'Bob Smith', null, 'bob.s@email.com', null, '238 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (483, 'Dan Williams', null, 'dan.w@ex.com', null, '748 Maple St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (484, 'Alice Wilson', null, 'alice@mail.com', null, '871 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (485, 'Bob Doe', null, 'bob.d@mail.com', null, '30 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (486, 'Bob Wilson', null, 'bob.w@mail.com', null, '906 Birch St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (487, 'Carol Williams', null, 'carol@ex.com', null, '822 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (488, 'Carol Johnson', null, 'carol@ex.com', null, '327 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (489, 'Henry Brown', null, 'henry@web.com', null, '947 Pine St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (490, 'Jane Williams', null, 'jane.@email.com', null, '978 Pine St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (491, 'Eve Wilson', null, 'eve.w@web.com', null, '641 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (492, 'Dan Smith', null, 'dan.s@site.com', null, '122 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (493, 'Eve Brown', null, 'eve.b@site.com', null, '158 Pine St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (494, 'Dan Johnson', null, 'dan.j@site.com', null, '251 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (495, 'John Brown', null, 'john.@email.com', null, '643 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (496, 'Frank Williams', null, 'frank@mail.com', null, '799 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (497, 'John Miller', null, 'john.@web.com', null, '86 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (498, 'John Jones', null, 'john.@ex.com', null, '866 Birch St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (499, 'Frank Brown', null, 'frank@ex.com', null, '68 Maple St');
commit;
prompt 500 records committed...
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (500, 'Carol Garcia', null, 'carol@ex.com', null, '246 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (501, 'Dan Smith', null, 'dan.s@web.com', null, '662 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (502, 'Eve Brown', null, 'eve.b@site.com', null, '283 Aspen St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (503, 'Alice Doe', null, 'alice@email.com', null, '58 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (504, 'Bob Miller', null, 'bob.m@email.com', null, '685 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (505, 'Grace Brown', null, 'grace@email.com', null, '821 Pine St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (506, 'Jane Wilson', null, 'jane.@mail.com', null, '727 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (507, 'Dan Garcia', null, 'dan.g@email.com', null, '318 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (508, 'Dan Jones', null, 'dan.j@mail.com', null, '230 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (509, 'Frank Doe', null, 'frank@web.com', null, '648 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (510, 'Jane Williams', null, 'jane.@ex.com', null, '415 Aspen St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (511, 'Henry Davis', null, 'henry@email.com', null, '577 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (512, 'John Smith', null, 'john.@email.com', null, '800 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (513, 'Dan Doe', null, 'dan.d@mail.com', null, '944 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (514, 'Jane Brown', null, 'jane.@mail.com', null, '447 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (515, 'Eve Miller', null, 'eve.m@mail.com', null, '234 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (516, 'Frank Smith', null, 'frank@email.com', null, '214 Aspen St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (517, 'Carol Brown', null, 'carol@ex.com', null, '456 Aspen St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (518, 'Alice Johnson', null, 'alice@web.com', null, '177 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (519, 'Jane Williams', null, 'jane.@ex.com', null, '562 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (520, 'Grace Johnson', null, 'grace@email.com', null, '809 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (521, 'Jane Davis', null, 'jane.@site.com', null, '661 Aspen St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (522, 'Bob Miller', null, 'bob.m@web.com', null, '621 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (523, 'Bob Miller', null, 'bob.m@site.com', null, '902 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (524, 'Eve Wilson', null, 'eve.w@web.com', null, '796 Birch St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (525, 'Grace Davis', null, 'grace@site.com', null, '878 Aspen St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (526, 'Grace Brown', null, 'grace@web.com', null, '675 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (527, 'Eve Jones', null, 'eve.j@email.com', null, '205 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (528, 'Frank Brown', null, 'frank@ex.com', null, '992 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (529, 'Alice Garcia', null, 'alice@site.com', null, '412 Maple St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (530, 'Bob Garcia', null, 'bob.g@ex.com', null, '663 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (531, 'Carol Williams', null, 'carol@email.com', null, '949 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (532, 'Jane Williams', null, 'jane.@web.com', null, '14 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (533, 'Frank Doe', null, 'frank@mail.com', null, '871 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (534, 'Carol Doe', null, 'carol@email.com', null, '305 Birch St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (535, 'Eve Garcia', null, 'eve.g@ex.com', null, '890 Oak St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (536, 'Frank Doe', null, 'frank@email.com', null, '412 Willow St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (537, 'Bob Smith', null, 'bob.s@web.com', null, '992 Birch St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (538, 'Jane Davis', null, 'jane.@ex.com', null, '380 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (539, 'Eve Brown', null, 'eve.b@email.com', null, '620 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (540, 'Henry Garcia', null, 'henry@mail.com', null, '107 Cedar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (541, 'Bob Doe', null, 'bob.d@web.com', null, '124 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (542, 'John Williams', null, 'john.@mail.com', null, '402 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (543, 'Bob Williams', null, 'bob.w@web.com', null, '364 Elm St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (544, 'Alice Wilson', null, 'alice@ex.com', null, '736 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (545, 'Eve Davis', null, 'eve.d@email.com', null, '1 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (546, 'Carol Wilson', null, 'carol@email.com', null, '195 Poplar St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (547, 'Eve Davis', null, 'eve.d@email.com', null, '716 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (548, 'Dan Davis', null, 'dan.d@web.com', null, '841 Cherry St');
insert into CLIENT (client_id, fname, lname, address, phone, email)
values (549, 'Carol Williams', null, 'carol@web.com', null, '61 Maple St');
commit;
prompt 550 records loaded
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
prompt 400 records committed...
insert into EVENT (event_id, event_date, place)
values (501, to_date('28-11-2022', 'dd-mm-yyyy'), 'Ruby Gardens');
insert into EVENT (event_id, event_date, place)
values (502, to_date('31-12-2020', 'dd-mm-yyyy'), 'Ethereal Ballro');
insert into EVENT (event_id, event_date, place)
values (503, to_date('18-02-2028', 'dd-mm-yyyy'), 'Whispering Gard');
insert into EVENT (event_id, event_date, place)
values (504, to_date('03-03-2028', 'dd-mm-yyyy'), 'Grandeur Hall');
insert into EVENT (event_id, event_date, place)
values (505, to_date('29-01-2021', 'dd-mm-yyyy'), 'Pearl Pavilion');
insert into EVENT (event_id, event_date, place)
values (506, to_date('23-11-2020', 'dd-mm-yyyy'), 'Pearl Pavilion');
insert into EVENT (event_id, event_date, place)
values (507, to_date('24-11-2027', 'dd-mm-yyyy'), 'Gilded Palace');
insert into EVENT (event_id, event_date, place)
values (508, to_date('27-08-2022', 'dd-mm-yyyy'), 'Topaz Terrace');
insert into EVENT (event_id, event_date, place)
values (509, to_date('26-05-2025', 'dd-mm-yyyy'), 'Moonbeam Hall');
insert into EVENT (event_id, event_date, place)
values (510, to_date('13-02-2024', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (511, to_date('27-09-2021', 'dd-mm-yyyy'), 'Whispering Gard');
insert into EVENT (event_id, event_date, place)
values (512, to_date('11-08-2022', 'dd-mm-yyyy'), 'Mystic Terrace');
insert into EVENT (event_id, event_date, place)
values (513, to_date('18-05-2020', 'dd-mm-yyyy'), 'Noble Hall');
insert into EVENT (event_id, event_date, place)
values (514, to_date('13-07-2022', 'dd-mm-yyyy'), 'Grand Oasis Hal');
insert into EVENT (event_id, event_date, place)
values (516, to_date('16-10-2022', 'dd-mm-yyyy'), 'Luxury Pavilion');
insert into EVENT (event_id, event_date, place)
values (517, to_date('19-04-2027', 'dd-mm-yyyy'), 'Silver Springs ');
insert into EVENT (event_id, event_date, place)
values (518, to_date('03-11-2025', 'dd-mm-yyyy'), 'Noble Hall');
insert into EVENT (event_id, event_date, place)
values (519, to_date('16-03-2027', 'dd-mm-yyyy'), 'Harmony Hall');
insert into EVENT (event_id, event_date, place)
values (520, to_date('19-02-2026', 'dd-mm-yyyy'), 'Victory Pavilio');
insert into EVENT (event_id, event_date, place)
values (521, to_date('07-03-2027', 'dd-mm-yyyy'), 'Regal Ballroom');
insert into EVENT (event_id, event_date, place)
values (522, to_date('11-12-2023', 'dd-mm-yyyy'), 'Silver Springs ');
insert into EVENT (event_id, event_date, place)
values (523, to_date('14-06-2024', 'dd-mm-yyyy'), 'Whispering Gard');
insert into EVENT (event_id, event_date, place)
values (524, to_date('12-02-2024', 'dd-mm-yyyy'), 'Noble Hall');
insert into EVENT (event_id, event_date, place)
values (525, to_date('10-01-2024', 'dd-mm-yyyy'), 'Grand Oasis Hal');
insert into EVENT (event_id, event_date, place)
values (526, to_date('18-05-2023', 'dd-mm-yyyy'), 'Noble Hall');
insert into EVENT (event_id, event_date, place)
values (527, to_date('09-02-2021', 'dd-mm-yyyy'), 'Harmony Hall');
insert into EVENT (event_id, event_date, place)
values (528, to_date('06-01-2022', 'dd-mm-yyyy'), 'Dreamy Manor');
insert into EVENT (event_id, event_date, place)
values (529, to_date('14-03-2028', 'dd-mm-yyyy'), 'Dreamy Manor');
insert into EVENT (event_id, event_date, place)
values (530, to_date('02-12-2025', 'dd-mm-yyyy'), 'Sapphire Hall');
insert into EVENT (event_id, event_date, place)
values (531, to_date('04-12-2027', 'dd-mm-yyyy'), 'Pearl Pavilion');
insert into EVENT (event_id, event_date, place)
values (532, to_date('19-04-2023', 'dd-mm-yyyy'), 'Royal Garden Ha');
insert into EVENT (event_id, event_date, place)
values (533, to_date('21-05-2026', 'dd-mm-yyyy'), 'Radiant Hall');
insert into EVENT (event_id, event_date, place)
values (534, to_date('28-06-2026', 'dd-mm-yyyy'), 'Dreamy Manor');
insert into EVENT (event_id, event_date, place)
values (535, to_date('19-03-2021', 'dd-mm-yyyy'), 'Harmony Hall');
insert into EVENT (event_id, event_date, place)
values (536, to_date('04-05-2024', 'dd-mm-yyyy'), 'Grand Oasis Hal');
insert into EVENT (event_id, event_date, place)
values (537, to_date('28-10-2024', 'dd-mm-yyyy'), 'Glamorous Ballr');
insert into EVENT (event_id, event_date, place)
values (538, to_date('12-10-2028', 'dd-mm-yyyy'), 'Glamorous Ballr');
insert into EVENT (event_id, event_date, place)
values (539, to_date('21-03-2024', 'dd-mm-yyyy'), 'Glamorous Ballr');
insert into EVENT (event_id, event_date, place)
values (540, to_date('16-02-2028', 'dd-mm-yyyy'), 'Ruby Gardens');
insert into EVENT (event_id, event_date, place)
values (542, to_date('29-05-2025', 'dd-mm-yyyy'), 'Luxury Pavilion');
insert into EVENT (event_id, event_date, place)
values (543, to_date('16-10-2022', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (544, to_date('20-09-2024', 'dd-mm-yyyy'), 'Heavenly Terrac');
insert into EVENT (event_id, event_date, place)
values (545, to_date('15-11-2021', 'dd-mm-yyyy'), 'Diamond Palace');
insert into EVENT (event_id, event_date, place)
values (546, to_date('02-06-2026', 'dd-mm-yyyy'), 'Pearl Pavilion');
insert into EVENT (event_id, event_date, place)
values (547, to_date('26-01-2028', 'dd-mm-yyyy'), 'Platinum Plaza');
insert into EVENT (event_id, event_date, place)
values (548, to_date('09-08-2023', 'dd-mm-yyyy'), 'Grandeur Hall');
insert into EVENT (event_id, event_date, place)
values (549, to_date('27-04-2022', 'dd-mm-yyyy'), 'Aurora Ballroom');
insert into EVENT (event_id, event_date, place)
values (550, to_date('28-06-2024', 'dd-mm-yyyy'), 'Elegant Terrace');
insert into EVENT (event_id, event_date, place)
values (551, to_date('02-07-2025', 'dd-mm-yyyy'), 'Glamorous Ballr');
insert into EVENT (event_id, event_date, place)
values (552, to_date('20-03-2027', 'dd-mm-yyyy'), 'Moonbeam Hall');
insert into EVENT (event_id, event_date, place)
values (553, to_date('08-06-2021', 'dd-mm-yyyy'), 'Silver Springs ');
insert into EVENT (event_id, event_date, place)
values (554, to_date('21-02-2021', 'dd-mm-yyyy'), 'Diamond Palace');
insert into EVENT (event_id, event_date, place)
values (555, to_date('22-05-2028', 'dd-mm-yyyy'), 'Enchanted Garde');
insert into EVENT (event_id, event_date, place)
values (556, to_date('08-04-2026', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (557, to_date('10-10-2021', 'dd-mm-yyyy'), 'Platinum Plaza');
insert into EVENT (event_id, event_date, place)
values (558, to_date('03-10-2024', 'dd-mm-yyyy'), 'Whispering Gard');
insert into EVENT (event_id, event_date, place)
values (559, to_date('31-10-2024', 'dd-mm-yyyy'), 'Topaz Terrace');
insert into EVENT (event_id, event_date, place)
values (560, to_date('19-08-2027', 'dd-mm-yyyy'), 'Eclipse Ballroo');
insert into EVENT (event_id, event_date, place)
values (561, to_date('11-10-2021', 'dd-mm-yyyy'), 'Pearl Pavilion');
insert into EVENT (event_id, event_date, place)
values (562, to_date('06-05-2023', 'dd-mm-yyyy'), 'Jade Hall');
insert into EVENT (event_id, event_date, place)
values (563, to_date('19-09-2022', 'dd-mm-yyyy'), 'Jade Hall');
insert into EVENT (event_id, event_date, place)
values (564, to_date('01-12-2028', 'dd-mm-yyyy'), 'Eclipse Ballroo');
insert into EVENT (event_id, event_date, place)
values (565, to_date('30-11-2022', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (566, to_date('14-03-2027', 'dd-mm-yyyy'), 'Ruby Gardens');
insert into EVENT (event_id, event_date, place)
values (567, to_date('05-02-2022', 'dd-mm-yyyy'), 'Eclipse Ballroo');
insert into EVENT (event_id, event_date, place)
values (568, to_date('01-02-2027', 'dd-mm-yyyy'), 'Luxury Pavilion');
insert into EVENT (event_id, event_date, place)
values (569, to_date('11-04-2021', 'dd-mm-yyyy'), 'Noble Hall');
insert into EVENT (event_id, event_date, place)
values (570, to_date('28-12-2026', 'dd-mm-yyyy'), 'Dreamy Manor');
insert into EVENT (event_id, event_date, place)
values (571, to_date('29-03-2025', 'dd-mm-yyyy'), 'Whispering Gard');
insert into EVENT (event_id, event_date, place)
values (572, to_date('01-08-2024', 'dd-mm-yyyy'), 'Elegant Terrace');
insert into EVENT (event_id, event_date, place)
values (573, to_date('31-08-2027', 'dd-mm-yyyy'), 'Sapphire Hall');
insert into EVENT (event_id, event_date, place)
values (575, to_date('31-12-2025', 'dd-mm-yyyy'), 'Sapphire Hall');
insert into EVENT (event_id, event_date, place)
values (576, to_date('08-12-2025', 'dd-mm-yyyy'), 'Topaz Terrace');
insert into EVENT (event_id, event_date, place)
values (577, to_date('11-06-2027', 'dd-mm-yyyy'), 'Aurora Ballroom');
insert into EVENT (event_id, event_date, place)
values (578, to_date('02-12-2023', 'dd-mm-yyyy'), 'Glamorous Ballr');
insert into EVENT (event_id, event_date, place)
values (579, to_date('08-06-2021', 'dd-mm-yyyy'), 'Eclipse Ballroo');
insert into EVENT (event_id, event_date, place)
values (580, to_date('28-10-2028', 'dd-mm-yyyy'), 'Victory Pavilio');
insert into EVENT (event_id, event_date, place)
values (581, to_date('16-08-2027', 'dd-mm-yyyy'), 'Gilded Palace');
insert into EVENT (event_id, event_date, place)
values (582, to_date('02-02-2028', 'dd-mm-yyyy'), 'Serene Pavilion');
insert into EVENT (event_id, event_date, place)
values (583, to_date('08-10-2027', 'dd-mm-yyyy'), 'Serene Pavilion');
insert into EVENT (event_id, event_date, place)
values (584, to_date('18-12-2024', 'dd-mm-yyyy'), 'Silver Springs ');
insert into EVENT (event_id, event_date, place)
values (585, to_date('07-01-2026', 'dd-mm-yyyy'), 'Dazzle Pavilion');
insert into EVENT (event_id, event_date, place)
values (586, to_date('25-11-2020', 'dd-mm-yyyy'), 'Radiant Hall');
insert into EVENT (event_id, event_date, place)
values (587, to_date('03-03-2022', 'dd-mm-yyyy'), 'Royal Garden Ha');
insert into EVENT (event_id, event_date, place)
values (588, to_date('18-05-2028', 'dd-mm-yyyy'), 'Ruby Gardens');
insert into EVENT (event_id, event_date, place)
values (589, to_date('01-06-2027', 'dd-mm-yyyy'), 'Aurora Ballroom');
insert into EVENT (event_id, event_date, place)
values (590, to_date('08-09-2025', 'dd-mm-yyyy'), 'Sapphire Hall');
insert into EVENT (event_id, event_date, place)
values (591, to_date('02-11-2021', 'dd-mm-yyyy'), 'Diamond Palace');
insert into EVENT (event_id, event_date, place)
values (592, to_date('03-12-2024', 'dd-mm-yyyy'), 'Starlight Pavil');
insert into EVENT (event_id, event_date, place)
values (593, to_date('02-02-2027', 'dd-mm-yyyy'), 'Glamorous Ballr');
insert into EVENT (event_id, event_date, place)
values (594, to_date('10-08-2023', 'dd-mm-yyyy'), 'Gilded Palace');
insert into EVENT (event_id, event_date, place)
values (595, to_date('18-06-2028', 'dd-mm-yyyy'), 'Blissful Palace');
insert into EVENT (event_id, event_date, place)
values (596, to_date('25-01-2027', 'dd-mm-yyyy'), 'Dreamy Manor');
insert into EVENT (event_id, event_date, place)
values (597, to_date('13-02-2028', 'dd-mm-yyyy'), 'Grand Oasis Hal');
insert into EVENT (event_id, event_date, place)
values (598, to_date('31-01-2023', 'dd-mm-yyyy'), 'Heavenly Terrac');
insert into EVENT (event_id, event_date, place)
values (599, to_date('03-02-2027', 'dd-mm-yyyy'), 'Jade Hall');
insert into EVENT (event_id, event_date, place)
values (600, to_date('13-05-2024', 'dd-mm-yyyy'), 'Grandeur Hall');
insert into EVENT (event_id, event_date, place)
values (601, to_date('25-04-2026', 'dd-mm-yyyy'), 'Blissful Palace');
insert into EVENT (event_id, event_date, place)
values (602, to_date('23-04-2023', 'dd-mm-yyyy'), 'Amethyst Ballro');
insert into EVENT (event_id, event_date, place)
values (603, to_date('09-10-2023', 'dd-mm-yyyy'), 'Radiant Hall');
commit;
prompt 500 records committed...
insert into EVENT (event_id, event_date, place)
values (604, to_date('20-01-2027', 'dd-mm-yyyy'), 'Whispering Gard');
insert into EVENT (event_id, event_date, place)
values (605, to_date('02-10-2024', 'dd-mm-yyyy'), 'Moonbeam Hall');
insert into EVENT (event_id, event_date, place)
values (606, to_date('04-06-2025', 'dd-mm-yyyy'), 'Radiant Hall');
insert into EVENT (event_id, event_date, place)
values (607, to_date('17-09-2027', 'dd-mm-yyyy'), 'Topaz Terrace');
insert into EVENT (event_id, event_date, place)
values (608, to_date('15-10-2024', 'dd-mm-yyyy'), 'Topaz Terrace');
insert into EVENT (event_id, event_date, place)
values (609, to_date('07-03-2025', 'dd-mm-yyyy'), 'Aurora Ballroom');
insert into EVENT (event_id, event_date, place)
values (610, to_date('02-06-2022', 'dd-mm-yyyy'), 'Sunset Ballroom');
insert into EVENT (event_id, event_date, place)
values (612, to_date('23-05-2026', 'dd-mm-yyyy'), 'Onyx Mansion');
insert into EVENT (event_id, event_date, place)
values (613, to_date('28-10-2026', 'dd-mm-yyyy'), 'Sapphire Hall');
insert into EVENT (event_id, event_date, place)
values (614, to_date('30-10-2026', 'dd-mm-yyyy'), 'Opal Palace');
insert into EVENT (event_id, event_date, place)
values (615, to_date('06-07-2022', 'dd-mm-yyyy'), 'Harmony Hall');
insert into EVENT (event_id, event_date, place)
values (616, to_date('12-02-2025', 'dd-mm-yyyy'), 'Cherished Garde');
insert into EVENT (event_id, event_date, place)
values (617, to_date('04-05-2020', 'dd-mm-yyyy'), 'Jade Hall');
insert into EVENT (event_id, event_date, place)
values (618, to_date('08-11-2026', 'dd-mm-yyyy'), 'Sunset Ballroom');
insert into EVENT (event_id, event_date, place)
values (619, to_date('26-11-2027', 'dd-mm-yyyy'), 'Royal Garden Ha');
insert into EVENT (event_id, event_date, place)
values (620, to_date('25-11-2023', 'dd-mm-yyyy'), 'Opal Palace');
insert into EVENT (event_id, event_date, place)
values (621, to_date('11-12-2020', 'dd-mm-yyyy'), 'Blissful Palace');
insert into EVENT (event_id, event_date, place)
values (622, to_date('28-05-2024', 'dd-mm-yyyy'), 'Pearl Pavilion');
insert into EVENT (event_id, event_date, place)
values (624, to_date('16-06-2023', 'dd-mm-yyyy'), 'Dazzle Pavilion');
insert into EVENT (event_id, event_date, place)
values (625, to_date('28-12-2024', 'dd-mm-yyyy'), 'Enchanted Garde');
insert into EVENT (event_id, event_date, place)
values (626, to_date('18-03-2023', 'dd-mm-yyyy'), 'Platinum Plaza');
insert into EVENT (event_id, event_date, place)
values (627, to_date('25-02-2025', 'dd-mm-yyyy'), 'Amethyst Ballro');
insert into EVENT (event_id, event_date, place)
values (628, to_date('03-05-2022', 'dd-mm-yyyy'), 'Noble Hall');
insert into EVENT (event_id, event_date, place)
values (629, to_date('28-06-2028', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (630, to_date('21-01-2026', 'dd-mm-yyyy'), 'Majestic Manor');
insert into EVENT (event_id, event_date, place)
values (631, to_date('24-05-2021', 'dd-mm-yyyy'), 'Jade Hall');
insert into EVENT (event_id, event_date, place)
values (632, to_date('10-03-2026', 'dd-mm-yyyy'), 'Crystal Ballroo');
insert into EVENT (event_id, event_date, place)
values (633, to_date('11-05-2023', 'dd-mm-yyyy'), 'Platinum Plaza');
insert into EVENT (event_id, event_date, place)
values (634, to_date('16-09-2021', 'dd-mm-yyyy'), 'Harmony Hall');
insert into EVENT (event_id, event_date, place)
values (635, to_date('01-10-2021', 'dd-mm-yyyy'), 'Serene Pavilion');
insert into EVENT (event_id, event_date, place)
values (637, to_date('15-05-2024', 'dd-mm-yyyy'), 'Opal Palace');
insert into EVENT (event_id, event_date, place)
values (638, to_date('16-02-2025', 'dd-mm-yyyy'), 'Ruby Gardens');
insert into EVENT (event_id, event_date, place)
values (639, to_date('23-08-2026', 'dd-mm-yyyy'), 'Celestial Terra');
insert into EVENT (event_id, event_date, place)
values (640, to_date('18-05-2028', 'dd-mm-yyyy'), 'Jade Hall');
insert into EVENT (event_id, event_date, place)
values (641, to_date('07-03-2020', 'dd-mm-yyyy'), 'Breathtaking Te');
insert into EVENT (event_id, event_date, place)
values (642, to_date('08-01-2021', 'dd-mm-yyyy'), 'Exquisite Pavil');
insert into EVENT (event_id, event_date, place)
values (643, to_date('05-03-2024', 'dd-mm-yyyy'), 'Victory Pavilio');
insert into EVENT (event_id, event_date, place)
values (644, to_date('21-01-2024', 'dd-mm-yyyy'), 'Eclipse Ballroo');
insert into EVENT (event_id, event_date, place)
values (645, to_date('12-10-2022', 'dd-mm-yyyy'), 'Starlight Pavil');
insert into EVENT (event_id, event_date, place)
values (646, to_date('08-11-2022', 'dd-mm-yyyy'), 'Sapphire Hall');
insert into EVENT (event_id, event_date, place)
values (647, to_date('09-02-2023', 'dd-mm-yyyy'), 'Gilded Palace');
insert into EVENT (event_id, event_date, place)
values (648, to_date('26-06-2028', 'dd-mm-yyyy'), 'Royal Garden Ha');
insert into EVENT (event_id, event_date, place)
values (649, to_date('21-04-2023', 'dd-mm-yyyy'), 'Opal Palace');
insert into EVENT (event_id, event_date, place)
values (650, to_date('06-11-2020', 'dd-mm-yyyy'), 'Serene Pavilion');
insert into EVENT (event_id, event_date, place)
values (651, to_date('12-11-2022', 'dd-mm-yyyy'), 'Ethereal Ballro');
insert into EVENT (event_id, event_date, place)
values (652, to_date('07-08-2021', 'dd-mm-yyyy'), 'Sapphire Hall');
insert into EVENT (event_id, event_date, place)
values (653, to_date('03-02-2024', 'dd-mm-yyyy'), 'Amethyst Ballro');
insert into EVENT (event_id, event_date, place)
values (654, to_date('09-08-2026', 'dd-mm-yyyy'), 'Cherished Garde');
insert into EVENT (event_id, event_date, place)
values (655, to_date('14-03-2024', 'dd-mm-yyyy'), 'Harmony Hall');
insert into EVENT (event_id, event_date, place)
values (656, to_date('18-05-2023', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (657, to_date('02-05-2022', 'dd-mm-yyyy'), 'Whispering Gard');
insert into EVENT (event_id, event_date, place)
values (658, to_date('08-05-2028', 'dd-mm-yyyy'), 'Mystic Terrace');
insert into EVENT (event_id, event_date, place)
values (659, to_date('21-05-2024', 'dd-mm-yyyy'), 'Luxury Pavilion');
insert into EVENT (event_id, event_date, place)
values (660, to_date('20-02-2021', 'dd-mm-yyyy'), 'Elite Mansion');
insert into EVENT (event_id, event_date, place)
values (661, to_date('13-10-2020', 'dd-mm-yyyy'), 'Glamorous Ballr');
insert into EVENT (event_id, event_date, place)
values (662, to_date('28-12-2023', 'dd-mm-yyyy'), 'Majestic Manor');
insert into EVENT (event_id, event_date, place)
values (663, to_date('28-01-2024', 'dd-mm-yyyy'), 'Aurora Ballroom');
insert into EVENT (event_id, event_date, place)
values (664, to_date('01-09-2028', 'dd-mm-yyyy'), 'Topaz Terrace');
insert into EVENT (event_id, event_date, place)
values (665, to_date('27-04-2026', 'dd-mm-yyyy'), 'Regal Ballroom');
insert into EVENT (event_id, event_date, place)
values (666, to_date('24-05-2022', 'dd-mm-yyyy'), 'Radiant Hall');
insert into EVENT (event_id, event_date, place)
values (667, to_date('05-04-2021', 'dd-mm-yyyy'), 'Ruby Gardens');
insert into EVENT (event_id, event_date, place)
values (668, to_date('28-10-2024', 'dd-mm-yyyy'), 'Glamorous Ballr');
insert into EVENT (event_id, event_date, place)
values (669, to_date('25-05-2026', 'dd-mm-yyyy'), 'Heavenly Terrac');
insert into EVENT (event_id, event_date, place)
values (670, to_date('14-09-2022', 'dd-mm-yyyy'), 'Mystic Terrace');
insert into EVENT (event_id, event_date, place)
values (671, to_date('02-12-2023', 'dd-mm-yyyy'), 'Moonbeam Hall');
insert into EVENT (event_id, event_date, place)
values (672, to_date('27-05-2025', 'dd-mm-yyyy'), 'Imperial Mansio');
insert into EVENT (event_id, event_date, place)
values (673, to_date('19-07-2025', 'dd-mm-yyyy'), 'Regal Ballroom');
insert into EVENT (event_id, event_date, place)
values (674, to_date('10-07-2028', 'dd-mm-yyyy'), 'Elite Mansion');
insert into EVENT (event_id, event_date, place)
values (675, to_date('13-04-2025', 'dd-mm-yyyy'), 'Noble Hall');
insert into EVENT (event_id, event_date, place)
values (676, to_date('28-05-2022', 'dd-mm-yyyy'), 'Eclipse Ballroo');
insert into EVENT (event_id, event_date, place)
values (677, to_date('13-08-2028', 'dd-mm-yyyy'), 'Celestial Terra');
insert into EVENT (event_id, event_date, place)
values (678, to_date('31-03-2021', 'dd-mm-yyyy'), 'Platinum Plaza');
insert into EVENT (event_id, event_date, place)
values (679, to_date('03-11-2022', 'dd-mm-yyyy'), 'Glamorous Ballr');
insert into EVENT (event_id, event_date, place)
values (680, to_date('20-12-2021', 'dd-mm-yyyy'), 'Victory Pavilio');
insert into EVENT (event_id, event_date, place)
values (681, to_date('07-05-2021', 'dd-mm-yyyy'), 'Sapphire Hall');
insert into EVENT (event_id, event_date, place)
values (682, to_date('29-11-2025', 'dd-mm-yyyy'), 'Royal Garden Ha');
insert into EVENT (event_id, event_date, place)
values (684, to_date('01-08-2027', 'dd-mm-yyyy'), 'Pearl Pavilion');
insert into EVENT (event_id, event_date, place)
values (685, to_date('16-05-2028', 'dd-mm-yyyy'), 'Celestial Terra');
insert into EVENT (event_id, event_date, place)
values (686, to_date('06-06-2027', 'dd-mm-yyyy'), 'Victory Pavilio');
insert into EVENT (event_id, event_date, place)
values (687, to_date('18-04-2027', 'dd-mm-yyyy'), 'Moonbeam Hall');
insert into EVENT (event_id, event_date, place)
values (688, to_date('28-05-2024', 'dd-mm-yyyy'), 'Heavenly Terrac');
insert into EVENT (event_id, event_date, place)
values (689, to_date('26-12-2024', 'dd-mm-yyyy'), 'Grandeur Hall');
insert into EVENT (event_id, event_date, place)
values (690, to_date('11-12-2027', 'dd-mm-yyyy'), 'Grandeur Hall');
insert into EVENT (event_id, event_date, place)
values (691, to_date('01-06-2024', 'dd-mm-yyyy'), 'Pearl Pavilion');
insert into EVENT (event_id, event_date, place)
values (692, to_date('24-09-2022', 'dd-mm-yyyy'), 'Elegant Terrace');
insert into EVENT (event_id, event_date, place)
values (694, to_date('13-09-2025', 'dd-mm-yyyy'), 'Amethyst Ballro');
insert into EVENT (event_id, event_date, place)
values (695, to_date('11-02-2025', 'dd-mm-yyyy'), 'Topaz Terrace');
insert into EVENT (event_id, event_date, place)
values (696, to_date('27-12-2022', 'dd-mm-yyyy'), 'Dreamy Manor');
insert into EVENT (event_id, event_date, place)
values (697, to_date('25-08-2025', 'dd-mm-yyyy'), 'Cherished Garde');
insert into EVENT (event_id, event_date, place)
values (698, to_date('30-09-2021', 'dd-mm-yyyy'), 'Cherished Garde');
insert into EVENT (event_id, event_date, place)
values (699, to_date('12-07-2024', 'dd-mm-yyyy'), 'Onyx Mansion');
insert into EVENT (event_id, event_date, place)
values (700, to_date('31-10-2027', 'dd-mm-yyyy'), 'Dazzle Pavilion');
insert into EVENT (event_id, event_date, place)
values (701, to_date('22-06-2027', 'dd-mm-yyyy'), 'Pearl Pavilion');
insert into EVENT (event_id, event_date, place)
values (702, to_date('07-04-2028', 'dd-mm-yyyy'), 'Whispering Gard');
insert into EVENT (event_id, event_date, place)
values (703, to_date('16-01-2023', 'dd-mm-yyyy'), 'Ruby Gardens');
insert into EVENT (event_id, event_date, place)
values (704, to_date('11-02-2022', 'dd-mm-yyyy'), 'Eclipse Ballroo');
insert into EVENT (event_id, event_date, place)
values (705, to_date('04-06-2026', 'dd-mm-yyyy'), 'Blissful Palace');
insert into EVENT (event_id, event_date, place)
values (706, to_date('12-06-2027', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (707, to_date('07-06-2022', 'dd-mm-yyyy'), 'Silver Springs ');
insert into EVENT (event_id, event_date, place)
values (708, to_date('07-11-2023', 'dd-mm-yyyy'), 'Jade Hall');
commit;
prompt 600 records committed...
insert into EVENT (event_id, event_date, place)
values (709, to_date('01-10-2022', 'dd-mm-yyyy'), 'Aurora Ballroom');
insert into EVENT (event_id, event_date, place)
values (710, to_date('23-01-2021', 'dd-mm-yyyy'), 'Harmony Hall');
insert into EVENT (event_id, event_date, place)
values (711, to_date('15-11-2021', 'dd-mm-yyyy'), 'Breathtaking Te');
insert into EVENT (event_id, event_date, place)
values (712, to_date('13-07-2023', 'dd-mm-yyyy'), 'Royal Garden Ha');
insert into EVENT (event_id, event_date, place)
values (713, to_date('01-06-2022', 'dd-mm-yyyy'), 'Grandeur Hall');
insert into EVENT (event_id, event_date, place)
values (714, to_date('20-04-2025', 'dd-mm-yyyy'), 'Royal Garden Ha');
insert into EVENT (event_id, event_date, place)
values (715, to_date('18-03-2025', 'dd-mm-yyyy'), 'Breathtaking Te');
insert into EVENT (event_id, event_date, place)
values (716, to_date('17-04-2027', 'dd-mm-yyyy'), 'Cherished Garde');
insert into EVENT (event_id, event_date, place)
values (717, to_date('26-01-2022', 'dd-mm-yyyy'), 'Platinum Plaza');
insert into EVENT (event_id, event_date, place)
values (719, to_date('20-02-2028', 'dd-mm-yyyy'), 'Sunset Ballroom');
insert into EVENT (event_id, event_date, place)
values (720, to_date('06-11-2025', 'dd-mm-yyyy'), 'Mystic Terrace');
insert into EVENT (event_id, event_date, place)
values (721, to_date('02-11-2028', 'dd-mm-yyyy'), 'Enchanted Garde');
insert into EVENT (event_id, event_date, place)
values (723, to_date('19-02-2028', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (724, to_date('07-03-2028', 'dd-mm-yyyy'), 'Imperial Mansio');
insert into EVENT (event_id, event_date, place)
values (725, to_date('02-06-2028', 'dd-mm-yyyy'), 'Amethyst Ballro');
insert into EVENT (event_id, event_date, place)
values (726, to_date('18-12-2024', 'dd-mm-yyyy'), 'Noble Hall');
insert into EVENT (event_id, event_date, place)
values (727, to_date('18-05-2021', 'dd-mm-yyyy'), 'Emerald Manor');
insert into EVENT (event_id, event_date, place)
values (728, to_date('27-05-2022', 'dd-mm-yyyy'), 'Blissful Palace');
insert into EVENT (event_id, event_date, place)
values (729, to_date('16-04-2024', 'dd-mm-yyyy'), 'Jade Hall');
insert into EVENT (event_id, event_date, place)
values (730, to_date('17-05-2021', 'dd-mm-yyyy'), 'Moonbeam Hall');
insert into EVENT (event_id, event_date, place)
values (731, to_date('02-12-2024', 'dd-mm-yyyy'), 'Majestic Manor');
insert into EVENT (event_id, event_date, place)
values (732, to_date('11-04-2025', 'dd-mm-yyyy'), 'Crystal Ballroo');
insert into EVENT (event_id, event_date, place)
values (733, to_date('07-01-2021', 'dd-mm-yyyy'), 'Blissful Palace');
insert into EVENT (event_id, event_date, place)
values (734, to_date('28-05-2023', 'dd-mm-yyyy'), 'Dreamy Manor');
insert into EVENT (event_id, event_date, place)
values (736, to_date('10-05-2024', 'dd-mm-yyyy'), 'Breathtaking Te');
insert into EVENT (event_id, event_date, place)
values (737, to_date('14-12-2024', 'dd-mm-yyyy'), 'Elite Mansion');
insert into EVENT (event_id, event_date, place)
values (738, to_date('28-12-2027', 'dd-mm-yyyy'), 'Harmony Hall');
insert into EVENT (event_id, event_date, place)
values (739, to_date('30-07-2027', 'dd-mm-yyyy'), 'Gilded Palace');
insert into EVENT (event_id, event_date, place)
values (740, to_date('21-08-2023', 'dd-mm-yyyy'), 'Enchanted Garde');
insert into EVENT (event_id, event_date, place)
values (741, to_date('30-10-2020', 'dd-mm-yyyy'), 'Ruby Gardens');
insert into EVENT (event_id, event_date, place)
values (742, to_date('19-04-2024', 'dd-mm-yyyy'), 'Radiant Hall');
insert into EVENT (event_id, event_date, place)
values (743, to_date('07-04-2027', 'dd-mm-yyyy'), 'Blissful Palace');
insert into EVENT (event_id, event_date, place)
values (744, to_date('20-03-2028', 'dd-mm-yyyy'), 'Silver Springs ');
insert into EVENT (event_id, event_date, place)
values (745, to_date('18-12-2028', 'dd-mm-yyyy'), 'Ruby Gardens');
insert into EVENT (event_id, event_date, place)
values (746, to_date('16-06-2025', 'dd-mm-yyyy'), 'Crystal Ballroo');
insert into EVENT (event_id, event_date, place)
values (747, to_date('31-10-2023', 'dd-mm-yyyy'), 'Elegant Terrace');
insert into EVENT (event_id, event_date, place)
values (748, to_date('27-06-2021', 'dd-mm-yyyy'), 'Imperial Mansio');
insert into EVENT (event_id, event_date, place)
values (749, to_date('21-03-2026', 'dd-mm-yyyy'), 'Elite Mansion');
insert into EVENT (event_id, event_date, place)
values (750, to_date('19-10-2024', 'dd-mm-yyyy'), 'Starlight Pavil');
insert into EVENT (event_id, event_date, place)
values (751, to_date('28-01-2027', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (752, to_date('03-08-2026', 'dd-mm-yyyy'), 'Opal Palace');
insert into EVENT (event_id, event_date, place)
values (753, to_date('18-10-2028', 'dd-mm-yyyy'), 'Cherished Garde');
insert into EVENT (event_id, event_date, place)
values (754, to_date('10-08-2023', 'dd-mm-yyyy'), 'Exquisite Pavil');
insert into EVENT (event_id, event_date, place)
values (755, to_date('30-01-2025', 'dd-mm-yyyy'), 'Heavenly Terrac');
insert into EVENT (event_id, event_date, place)
values (756, to_date('31-05-2022', 'dd-mm-yyyy'), 'Regal Ballroom');
insert into EVENT (event_id, event_date, place)
values (757, to_date('08-08-2025', 'dd-mm-yyyy'), 'Victory Pavilio');
insert into EVENT (event_id, event_date, place)
values (758, to_date('05-07-2027', 'dd-mm-yyyy'), 'Emerald Manor');
insert into EVENT (event_id, event_date, place)
values (759, to_date('10-08-2025', 'dd-mm-yyyy'), 'Platinum Plaza');
insert into EVENT (event_id, event_date, place)
values (760, to_date('30-03-2026', 'dd-mm-yyyy'), 'Dazzle Pavilion');
insert into EVENT (event_id, event_date, place)
values (761, to_date('18-09-2028', 'dd-mm-yyyy'), 'Ruby Gardens');
insert into EVENT (event_id, event_date, place)
values (762, to_date('24-01-2028', 'dd-mm-yyyy'), 'Elegant Terrace');
insert into EVENT (event_id, event_date, place)
values (763, to_date('10-12-2024', 'dd-mm-yyyy'), 'Sunset Ballroom');
insert into EVENT (event_id, event_date, place)
values (764, to_date('31-10-2027', 'dd-mm-yyyy'), 'Silver Springs ');
insert into EVENT (event_id, event_date, place)
values (765, to_date('11-03-2024', 'dd-mm-yyyy'), 'Dreamy Manor');
insert into EVENT (event_id, event_date, place)
values (766, to_date('19-02-2024', 'dd-mm-yyyy'), 'Opal Palace');
insert into EVENT (event_id, event_date, place)
values (767, to_date('25-10-2025', 'dd-mm-yyyy'), 'Grandeur Hall');
insert into EVENT (event_id, event_date, place)
values (768, to_date('18-07-2028', 'dd-mm-yyyy'), 'Onyx Mansion');
insert into EVENT (event_id, event_date, place)
values (769, to_date('18-04-2022', 'dd-mm-yyyy'), 'Silver Springs ');
insert into EVENT (event_id, event_date, place)
values (770, to_date('26-01-2023', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (771, to_date('02-05-2021', 'dd-mm-yyyy'), 'Crystal Ballroo');
insert into EVENT (event_id, event_date, place)
values (772, to_date('30-10-2027', 'dd-mm-yyyy'), 'Opal Palace');
insert into EVENT (event_id, event_date, place)
values (773, to_date('14-10-2021', 'dd-mm-yyyy'), 'Gilded Palace');
insert into EVENT (event_id, event_date, place)
values (774, to_date('30-11-2026', 'dd-mm-yyyy'), 'Luxury Pavilion');
insert into EVENT (event_id, event_date, place)
values (775, to_date('20-12-2025', 'dd-mm-yyyy'), 'Cherished Garde');
insert into EVENT (event_id, event_date, place)
values (776, to_date('02-03-2026', 'dd-mm-yyyy'), 'Diamond Palace');
insert into EVENT (event_id, event_date, place)
values (777, to_date('24-12-2028', 'dd-mm-yyyy'), 'Onyx Mansion');
insert into EVENT (event_id, event_date, place)
values (778, to_date('15-01-2020', 'dd-mm-yyyy'), 'Jade Hall');
insert into EVENT (event_id, event_date, place)
values (779, to_date('19-02-2021', 'dd-mm-yyyy'), 'Grandeur Hall');
insert into EVENT (event_id, event_date, place)
values (780, to_date('01-04-2026', 'dd-mm-yyyy'), 'Breathtaking Te');
insert into EVENT (event_id, event_date, place)
values (781, to_date('18-08-2022', 'dd-mm-yyyy'), 'Celestial Terra');
insert into EVENT (event_id, event_date, place)
values (782, to_date('26-11-2021', 'dd-mm-yyyy'), 'Eclipse Ballroo');
insert into EVENT (event_id, event_date, place)
values (783, to_date('03-11-2026', 'dd-mm-yyyy'), 'Moonbeam Hall');
insert into EVENT (event_id, event_date, place)
values (784, to_date('30-01-2025', 'dd-mm-yyyy'), 'Luxury Pavilion');
insert into EVENT (event_id, event_date, place)
values (785, to_date('13-10-2027', 'dd-mm-yyyy'), 'Whispering Gard');
insert into EVENT (event_id, event_date, place)
values (786, to_date('30-12-2027', 'dd-mm-yyyy'), 'Mystic Terrace');
insert into EVENT (event_id, event_date, place)
values (787, to_date('04-06-2027', 'dd-mm-yyyy'), 'Glamorous Ballr');
insert into EVENT (event_id, event_date, place)
values (788, to_date('21-02-2028', 'dd-mm-yyyy'), 'Amethyst Ballro');
insert into EVENT (event_id, event_date, place)
values (789, to_date('09-05-2023', 'dd-mm-yyyy'), 'Amethyst Ballro');
insert into EVENT (event_id, event_date, place)
values (790, to_date('07-01-2024', 'dd-mm-yyyy'), 'Regal Ballroom');
insert into EVENT (event_id, event_date, place)
values (791, to_date('19-06-2021', 'dd-mm-yyyy'), 'Exquisite Pavil');
insert into EVENT (event_id, event_date, place)
values (792, to_date('07-12-2028', 'dd-mm-yyyy'), 'Radiant Hall');
insert into EVENT (event_id, event_date, place)
values (793, to_date('02-12-2021', 'dd-mm-yyyy'), 'Pearl Pavilion');
insert into EVENT (event_id, event_date, place)
values (794, to_date('31-10-2026', 'dd-mm-yyyy'), 'Jade Hall');
insert into EVENT (event_id, event_date, place)
values (795, to_date('28-03-2027', 'dd-mm-yyyy'), 'Aurora Ballroom');
insert into EVENT (event_id, event_date, place)
values (796, to_date('02-07-2025', 'dd-mm-yyyy'), 'Crystal Ballroo');
insert into EVENT (event_id, event_date, place)
values (797, to_date('12-12-2023', 'dd-mm-yyyy'), 'Exquisite Pavil');
insert into EVENT (event_id, event_date, place)
values (798, to_date('09-12-2026', 'dd-mm-yyyy'), 'Victory Pavilio');
insert into EVENT (event_id, event_date, place)
values (799, to_date('10-06-2021', 'dd-mm-yyyy'), 'Blissful Palace');
insert into EVENT (event_id, event_date, place)
values (800, to_date('10-09-2021', 'dd-mm-yyyy'), 'Diamond Palace');
insert into EVENT (event_id, event_date, place)
values (801, to_date('15-08-2027', 'dd-mm-yyyy'), 'Glamorous Ballr');
insert into EVENT (event_id, event_date, place)
values (802, to_date('19-04-2024', 'dd-mm-yyyy'), 'Sunset Ballroom');
insert into EVENT (event_id, event_date, place)
values (803, to_date('08-12-2024', 'dd-mm-yyyy'), 'Whispering Gard');
insert into EVENT (event_id, event_date, place)
values (804, to_date('01-05-2026', 'dd-mm-yyyy'), 'Grand Oasis Hal');
insert into EVENT (event_id, event_date, place)
values (805, to_date('23-10-2025', 'dd-mm-yyyy'), 'Amethyst Ballro');
insert into EVENT (event_id, event_date, place)
values (806, to_date('24-10-2027', 'dd-mm-yyyy'), 'Regal Ballroom');
insert into EVENT (event_id, event_date, place)
values (807, to_date('29-10-2020', 'dd-mm-yyyy'), 'Exquisite Pavil');
insert into EVENT (event_id, event_date, place)
values (809, to_date('17-12-2022', 'dd-mm-yyyy'), 'Jade Hall');
insert into EVENT (event_id, event_date, place)
values (810, to_date('19-11-2025', 'dd-mm-yyyy'), 'Eclipse Ballroo');
insert into EVENT (event_id, event_date, place)
values (811, to_date('04-02-2022', 'dd-mm-yyyy'), 'Gilded Palace');
insert into EVENT (event_id, event_date, place)
values (812, to_date('01-01-2028', 'dd-mm-yyyy'), 'Majestic Manor');
commit;
prompt 700 records committed...
insert into EVENT (event_id, event_date, place)
values (813, to_date('14-11-2025', 'dd-mm-yyyy'), 'Dreamy Manor');
insert into EVENT (event_id, event_date, place)
values (814, to_date('27-09-2027', 'dd-mm-yyyy'), 'Elite Mansion');
insert into EVENT (event_id, event_date, place)
values (815, to_date('24-07-2023', 'dd-mm-yyyy'), 'Emerald Manor');
insert into EVENT (event_id, event_date, place)
values (816, to_date('11-05-2028', 'dd-mm-yyyy'), 'Celestial Terra');
insert into EVENT (event_id, event_date, place)
values (817, to_date('21-09-2027', 'dd-mm-yyyy'), 'Regal Ballroom');
insert into EVENT (event_id, event_date, place)
values (818, to_date('27-06-2025', 'dd-mm-yyyy'), 'Whispering Gard');
insert into EVENT (event_id, event_date, place)
values (819, to_date('24-12-2024', 'dd-mm-yyyy'), 'Cherished Garde');
insert into EVENT (event_id, event_date, place)
values (820, to_date('09-12-2024', 'dd-mm-yyyy'), 'Whispering Gard');
insert into EVENT (event_id, event_date, place)
values (821, to_date('29-09-2024', 'dd-mm-yyyy'), 'Heavenly Terrac');
insert into EVENT (event_id, event_date, place)
values (822, to_date('11-02-2026', 'dd-mm-yyyy'), 'Ruby Gardens');
insert into EVENT (event_id, event_date, place)
values (823, to_date('21-06-2026', 'dd-mm-yyyy'), 'Moonbeam Hall');
insert into EVENT (event_id, event_date, place)
values (824, to_date('20-12-2028', 'dd-mm-yyyy'), 'Royal Garden Ha');
insert into EVENT (event_id, event_date, place)
values (825, to_date('22-05-2026', 'dd-mm-yyyy'), 'Victory Pavilio');
insert into EVENT (event_id, event_date, place)
values (826, to_date('16-11-2025', 'dd-mm-yyyy'), 'Ethereal Ballro');
insert into EVENT (event_id, event_date, place)
values (827, to_date('07-08-2025', 'dd-mm-yyyy'), 'Aurora Ballroom');
insert into EVENT (event_id, event_date, place)
values (828, to_date('15-08-2023', 'dd-mm-yyyy'), 'Gilded Palace');
insert into EVENT (event_id, event_date, place)
values (829, to_date('26-12-2021', 'dd-mm-yyyy'), 'Regal Ballroom');
insert into EVENT (event_id, event_date, place)
values (830, to_date('03-10-2026', 'dd-mm-yyyy'), 'Radiant Hall');
insert into EVENT (event_id, event_date, place)
values (831, to_date('07-11-2020', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (832, to_date('11-05-2026', 'dd-mm-yyyy'), 'Sunset Ballroom');
insert into EVENT (event_id, event_date, place)
values (833, to_date('18-02-2022', 'dd-mm-yyyy'), 'Moonbeam Hall');
insert into EVENT (event_id, event_date, place)
values (834, to_date('30-12-2025', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (835, to_date('10-04-2028', 'dd-mm-yyyy'), 'Luxury Pavilion');
insert into EVENT (event_id, event_date, place)
values (836, to_date('12-11-2028', 'dd-mm-yyyy'), 'Enchanted Garde');
insert into EVENT (event_id, event_date, place)
values (837, to_date('16-05-2025', 'dd-mm-yyyy'), 'Enchanted Garde');
insert into EVENT (event_id, event_date, place)
values (838, to_date('07-11-2028', 'dd-mm-yyyy'), 'Harmony Hall');
insert into EVENT (event_id, event_date, place)
values (839, to_date('25-07-2021', 'dd-mm-yyyy'), 'Heavenly Terrac');
insert into EVENT (event_id, event_date, place)
values (840, to_date('21-09-2027', 'dd-mm-yyyy'), 'Ruby Gardens');
insert into EVENT (event_id, event_date, place)
values (841, to_date('25-11-2023', 'dd-mm-yyyy'), 'Grand Oasis Hal');
insert into EVENT (event_id, event_date, place)
values (842, to_date('27-01-2020', 'dd-mm-yyyy'), 'Emerald Manor');
insert into EVENT (event_id, event_date, place)
values (843, to_date('23-10-2022', 'dd-mm-yyyy'), 'Exquisite Pavil');
insert into EVENT (event_id, event_date, place)
values (844, to_date('28-06-2028', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (847, to_date('28-09-2024', 'dd-mm-yyyy'), 'Ruby Gardens');
insert into EVENT (event_id, event_date, place)
values (848, to_date('18-01-2025', 'dd-mm-yyyy'), 'Golden Plaza');
insert into EVENT (event_id, event_date, place)
values (849, to_date('29-07-2020', 'dd-mm-yyyy'), 'Sapphire Hall');
insert into EVENT (event_id, event_date, place)
values (850, to_date('30-06-2026', 'dd-mm-yyyy'), 'Aurora Ballroom');
insert into EVENT (event_id, event_date, place)
values (851, to_date('16-03-2021', 'dd-mm-yyyy'), 'Sapphire Hall');
insert into EVENT (event_id, event_date, place)
values (852, to_date('14-03-2021', 'dd-mm-yyyy'), 'Diamond Palace');
insert into EVENT (event_id, event_date, place)
values (853, to_date('15-02-2025', 'dd-mm-yyyy'), 'Exquisite Pavil');
insert into EVENT (event_id, event_date, place)
values (854, to_date('25-05-2021', 'dd-mm-yyyy'), 'Serene Pavilion');
insert into EVENT (event_id, event_date, place)
values (856, to_date('02-12-2028', 'dd-mm-yyyy'), 'Topaz Terrace');
insert into EVENT (event_id, event_date, place)
values (857, to_date('25-02-2023', 'dd-mm-yyyy'), 'Platinum Plaza');
insert into EVENT (event_id, event_date, place)
values (858, to_date('10-08-2020', 'dd-mm-yyyy'), 'Regal Ballroom');
insert into EVENT (event_id, event_date, place)
values (859, to_date('15-12-2022', 'dd-mm-yyyy'), 'Emerald Manor');
insert into EVENT (event_id, event_date, place)
values (860, to_date('04-11-2024', 'dd-mm-yyyy'), 'Aurora Ballroom');
insert into EVENT (event_id, event_date, place)
values (861, to_date('10-10-2025', 'dd-mm-yyyy'), 'Eclipse Ballroo');
insert into EVENT (event_id, event_date, place)
values (862, to_date('21-12-2025', 'dd-mm-yyyy'), 'Breathtaking Te');
insert into EVENT (event_id, event_date, place)
values (863, to_date('05-07-2021', 'dd-mm-yyyy'), 'Tranquil Garden');
insert into EVENT (event_id, event_date, place)
values (864, to_date('13-09-2028', 'dd-mm-yyyy'), 'Silver Springs ');
insert into EVENT (event_id, event_date, place)
values (865, to_date('12-01-2022', 'dd-mm-yyyy'), 'Radiant Hall');
insert into EVENT (event_id, event_date, place)
values (866, to_date('11-03-2023', 'dd-mm-yyyy'), 'Ethereal Ballro');
insert into EVENT (event_id, event_date, place)
values (867, to_date('16-11-2025', 'dd-mm-yyyy'), 'Ethereal Ballro');
insert into EVENT (event_id, event_date, place)
values (868, to_date('28-12-2028', 'dd-mm-yyyy'), 'Crystal Ballroo');
insert into EVENT (event_id, event_date, place)
values (869, to_date('12-03-2023', 'dd-mm-yyyy'), 'Dreamy Manor');
insert into EVENT (event_id, event_date, place)
values (870, to_date('07-11-2025', 'dd-mm-yyyy'), 'Whispering Gard');
insert into EVENT (event_id, event_date, place)
values (871, to_date('19-10-2026', 'dd-mm-yyyy'), 'Blissful Palace');
insert into EVENT (event_id, event_date, place)
values (872, to_date('25-12-2022', 'dd-mm-yyyy'), 'Sapphire Hall');
insert into EVENT (event_id, event_date, place)
values (873, to_date('02-05-2021', 'dd-mm-yyyy'), 'Onyx Mansion');
insert into EVENT (event_id, event_date, place)
values (874, to_date('04-11-2020', 'dd-mm-yyyy'), 'Sunset Ballroom');
insert into EVENT (event_id, event_date, place)
values (875, to_date('12-07-2028', 'dd-mm-yyyy'), 'Harmony Hall');
insert into EVENT (event_id, event_date, place)
values (876, to_date('15-10-2026', 'dd-mm-yyyy'), 'Royal Garden Ha');
insert into EVENT (event_id, event_date, place)
values (877, to_date('26-12-2022', 'dd-mm-yyyy'), 'Mystic Terrace');
insert into EVENT (event_id, event_date, place)
values (878, to_date('22-09-2022', 'dd-mm-yyyy'), 'Noble Hall');
insert into EVENT (event_id, event_date, place)
values (879, to_date('22-04-2022', 'dd-mm-yyyy'), 'Gilded Palace');
insert into EVENT (event_id, event_date, place)
values (880, to_date('02-05-2021', 'dd-mm-yyyy'), 'Cherished Garde');
insert into EVENT (event_id, event_date, place)
values (881, to_date('18-04-2024', 'dd-mm-yyyy'), 'Glamorous Ballr');
insert into EVENT (event_id, event_date, place)
values (882, to_date('23-02-2024', 'dd-mm-yyyy'), 'Crystal Ballroo');
insert into EVENT (event_id, event_date, place)
values (883, to_date('11-03-2024', 'dd-mm-yyyy'), 'Royal Garden Ha');
insert into EVENT (event_id, event_date, place)
values (884, to_date('16-02-2027', 'dd-mm-yyyy'), 'Mystic Terrace');
insert into EVENT (event_id, event_date, place)
values (885, to_date('07-02-2021', 'dd-mm-yyyy'), 'Majestic Manor');
insert into EVENT (event_id, event_date, place)
values (886, to_date('24-05-2027', 'dd-mm-yyyy'), 'Serene Pavilion');
insert into EVENT (event_id, event_date, place)
values (887, to_date('18-07-2024', 'dd-mm-yyyy'), 'Dazzle Pavilion');
insert into EVENT (event_id, event_date, place)
values (888, to_date('08-06-2026', 'dd-mm-yyyy'), 'Glamorous Ballr');
insert into EVENT (event_id, event_date, place)
values (889, to_date('25-09-2023', 'dd-mm-yyyy'), 'Harmony Hall');
insert into EVENT (event_id, event_date, place)
values (891, to_date('14-05-2022', 'dd-mm-yyyy'), 'Onyx Mansion');
insert into EVENT (event_id, event_date, place)
values (893, to_date('25-07-2021', 'dd-mm-yyyy'), 'Elite Mansion');
insert into EVENT (event_id, event_date, place)
values (894, to_date('04-06-2025', 'dd-mm-yyyy'), 'Royal Garden Ha');
insert into EVENT (event_id, event_date, place)
values (895, to_date('07-04-2023', 'dd-mm-yyyy'), 'Breathtaking Te');
insert into EVENT (event_id, event_date, place)
values (896, to_date('19-06-2023', 'dd-mm-yyyy'), 'Silver Springs ');
insert into EVENT (event_id, event_date, place)
values (897, to_date('17-07-2024', 'dd-mm-yyyy'), 'Ethereal Ballro');
insert into EVENT (event_id, event_date, place)
values (898, to_date('07-08-2020', 'dd-mm-yyyy'), 'Emerald Manor');
insert into EVENT (event_id, event_date, place)
values (899, to_date('25-11-2025', 'dd-mm-yyyy'), 'Radiant Hall');
commit;
prompt 782 records loaded
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
prompt 400 records committed...
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (501, to_date('28-11-2022', 'dd-mm-yyyy'), 501, 525);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (502, to_date('31-12-2020', 'dd-mm-yyyy'), 502, 337);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (503, to_date('18-02-2028', 'dd-mm-yyyy'), 503, 221);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (504, to_date('03-03-2028', 'dd-mm-yyyy'), 504, 257);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (505, to_date('29-01-2021', 'dd-mm-yyyy'), 505, 541);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (506, to_date('23-11-2020', 'dd-mm-yyyy'), 506, 138);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (507, to_date('24-11-2027', 'dd-mm-yyyy'), 507, 184);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (508, to_date('27-08-2022', 'dd-mm-yyyy'), 508, 134);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (509, to_date('26-05-2025', 'dd-mm-yyyy'), 509, 376);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (510, to_date('13-02-2024', 'dd-mm-yyyy'), 510, 455);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (511, to_date('27-09-2021', 'dd-mm-yyyy'), 511, 388);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (512, to_date('11-08-2022', 'dd-mm-yyyy'), 512, 508);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (513, to_date('18-05-2020', 'dd-mm-yyyy'), 513, 204);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (514, to_date('13-07-2022', 'dd-mm-yyyy'), 514, 299);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (516, to_date('16-10-2022', 'dd-mm-yyyy'), 516, 138);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (517, to_date('19-04-2027', 'dd-mm-yyyy'), 517, 408);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (518, to_date('03-11-2025', 'dd-mm-yyyy'), 518, 411);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (519, to_date('16-03-2027', 'dd-mm-yyyy'), 519, 457);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (520, to_date('19-02-2026', 'dd-mm-yyyy'), 520, 347);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (521, to_date('07-03-2027', 'dd-mm-yyyy'), 521, 395);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (522, to_date('11-12-2023', 'dd-mm-yyyy'), 522, 400);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (523, to_date('14-06-2024', 'dd-mm-yyyy'), 523, 214);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (524, to_date('12-02-2024', 'dd-mm-yyyy'), 524, 383);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (525, to_date('10-01-2024', 'dd-mm-yyyy'), 525, 497);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (526, to_date('18-05-2023', 'dd-mm-yyyy'), 526, 229);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (527, to_date('09-02-2021', 'dd-mm-yyyy'), 527, 346);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (528, to_date('06-01-2022', 'dd-mm-yyyy'), 528, 338);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (529, to_date('14-03-2028', 'dd-mm-yyyy'), 529, 397);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (530, to_date('02-12-2025', 'dd-mm-yyyy'), 530, 390);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (531, to_date('04-12-2027', 'dd-mm-yyyy'), 531, 487);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (532, to_date('19-04-2023', 'dd-mm-yyyy'), 532, 407);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (533, to_date('21-05-2026', 'dd-mm-yyyy'), 533, 239);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (534, to_date('28-06-2026', 'dd-mm-yyyy'), 534, 147);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (535, to_date('19-03-2021', 'dd-mm-yyyy'), 535, 464);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (536, to_date('04-05-2024', 'dd-mm-yyyy'), 536, 218);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (537, to_date('28-10-2024', 'dd-mm-yyyy'), 537, 350);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (538, to_date('12-10-2028', 'dd-mm-yyyy'), 538, 544);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (539, to_date('21-03-2024', 'dd-mm-yyyy'), 539, 271);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (540, to_date('16-02-2028', 'dd-mm-yyyy'), 540, 227);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (542, to_date('29-05-2025', 'dd-mm-yyyy'), 542, 113);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (543, to_date('16-10-2022', 'dd-mm-yyyy'), 543, 346);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (544, to_date('20-09-2024', 'dd-mm-yyyy'), 544, 170);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (545, to_date('15-11-2021', 'dd-mm-yyyy'), 545, 290);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (546, to_date('02-06-2026', 'dd-mm-yyyy'), 546, 520);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (547, to_date('26-01-2028', 'dd-mm-yyyy'), 547, 183);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (548, to_date('09-08-2023', 'dd-mm-yyyy'), 548, 389);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (549, to_date('27-04-2022', 'dd-mm-yyyy'), 549, 406);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (550, to_date('28-06-2024', 'dd-mm-yyyy'), 550, 434);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (551, to_date('02-07-2025', 'dd-mm-yyyy'), 551, 125);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (552, to_date('20-03-2027', 'dd-mm-yyyy'), 552, 326);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (553, to_date('08-06-2021', 'dd-mm-yyyy'), 553, 446);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (554, to_date('21-02-2021', 'dd-mm-yyyy'), 554, 471);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (555, to_date('22-05-2028', 'dd-mm-yyyy'), 555, 542);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (556, to_date('08-04-2026', 'dd-mm-yyyy'), 556, 252);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (557, to_date('10-10-2021', 'dd-mm-yyyy'), 557, 375);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (558, to_date('03-10-2024', 'dd-mm-yyyy'), 558, 424);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (559, to_date('31-10-2024', 'dd-mm-yyyy'), 559, 345);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (560, to_date('19-08-2027', 'dd-mm-yyyy'), 560, 292);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (561, to_date('11-10-2021', 'dd-mm-yyyy'), 561, 109);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (562, to_date('06-05-2023', 'dd-mm-yyyy'), 562, 161);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (563, to_date('19-09-2022', 'dd-mm-yyyy'), 563, 466);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (564, to_date('01-12-2028', 'dd-mm-yyyy'), 564, 335);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (565, to_date('30-11-2022', 'dd-mm-yyyy'), 565, 189);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (566, to_date('14-03-2027', 'dd-mm-yyyy'), 566, 460);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (567, to_date('05-02-2022', 'dd-mm-yyyy'), 567, 123);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (568, to_date('01-02-2027', 'dd-mm-yyyy'), 568, 510);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (569, to_date('11-04-2021', 'dd-mm-yyyy'), 569, 458);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (570, to_date('28-12-2026', 'dd-mm-yyyy'), 570, 129);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (571, to_date('29-03-2025', 'dd-mm-yyyy'), 571, 259);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (572, to_date('01-08-2024', 'dd-mm-yyyy'), 572, 210);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (573, to_date('31-08-2027', 'dd-mm-yyyy'), 573, 415);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (575, to_date('31-12-2025', 'dd-mm-yyyy'), 575, 387);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (576, to_date('08-12-2025', 'dd-mm-yyyy'), 576, 495);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (577, to_date('11-06-2027', 'dd-mm-yyyy'), 577, 115);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (578, to_date('02-12-2023', 'dd-mm-yyyy'), 578, 415);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (579, to_date('08-06-2021', 'dd-mm-yyyy'), 579, 336);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (580, to_date('28-10-2028', 'dd-mm-yyyy'), 580, 460);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (581, to_date('16-08-2027', 'dd-mm-yyyy'), 581, 120);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (582, to_date('02-02-2028', 'dd-mm-yyyy'), 582, 438);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (583, to_date('08-10-2027', 'dd-mm-yyyy'), 583, 516);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (584, to_date('18-12-2024', 'dd-mm-yyyy'), 584, 246);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (585, to_date('07-01-2026', 'dd-mm-yyyy'), 585, 494);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (586, to_date('25-11-2020', 'dd-mm-yyyy'), 586, 435);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (587, to_date('03-03-2022', 'dd-mm-yyyy'), 587, 302);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (588, to_date('18-05-2028', 'dd-mm-yyyy'), 588, 171);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (589, to_date('01-06-2027', 'dd-mm-yyyy'), 589, 271);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (590, to_date('08-09-2025', 'dd-mm-yyyy'), 590, 124);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (591, to_date('02-11-2021', 'dd-mm-yyyy'), 591, 518);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (592, to_date('03-12-2024', 'dd-mm-yyyy'), 592, 338);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (593, to_date('02-02-2027', 'dd-mm-yyyy'), 593, 294);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (594, to_date('10-08-2023', 'dd-mm-yyyy'), 594, 453);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (595, to_date('18-06-2028', 'dd-mm-yyyy'), 595, 401);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (596, to_date('25-01-2027', 'dd-mm-yyyy'), 596, 300);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (597, to_date('13-02-2028', 'dd-mm-yyyy'), 597, 318);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (598, to_date('31-01-2023', 'dd-mm-yyyy'), 598, 278);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (599, to_date('03-02-2027', 'dd-mm-yyyy'), 599, 195);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (600, to_date('13-05-2024', 'dd-mm-yyyy'), 600, 245);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (601, to_date('25-04-2026', 'dd-mm-yyyy'), 601, 230);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (602, to_date('23-04-2023', 'dd-mm-yyyy'), 602, 166);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (603, to_date('09-10-2023', 'dd-mm-yyyy'), 603, 425);
commit;
prompt 500 records committed...
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (604, to_date('20-01-2027', 'dd-mm-yyyy'), 604, 324);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (605, to_date('02-10-2024', 'dd-mm-yyyy'), 605, 528);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (606, to_date('04-06-2025', 'dd-mm-yyyy'), 606, 357);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (607, to_date('17-09-2027', 'dd-mm-yyyy'), 607, 252);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (608, to_date('15-10-2024', 'dd-mm-yyyy'), 608, 288);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (609, to_date('07-03-2025', 'dd-mm-yyyy'), 609, 497);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (610, to_date('02-06-2022', 'dd-mm-yyyy'), 610, 235);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (612, to_date('23-05-2026', 'dd-mm-yyyy'), 612, 312);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (613, to_date('28-10-2026', 'dd-mm-yyyy'), 613, 190);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (614, to_date('30-10-2026', 'dd-mm-yyyy'), 614, 521);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (615, to_date('06-07-2022', 'dd-mm-yyyy'), 615, 399);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (616, to_date('12-02-2025', 'dd-mm-yyyy'), 616, 459);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (617, to_date('04-05-2020', 'dd-mm-yyyy'), 617, 399);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (618, to_date('08-11-2026', 'dd-mm-yyyy'), 618, 474);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (619, to_date('26-11-2027', 'dd-mm-yyyy'), 619, 518);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (620, to_date('25-11-2023', 'dd-mm-yyyy'), 620, 332);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (621, to_date('11-12-2020', 'dd-mm-yyyy'), 621, 231);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (622, to_date('28-05-2024', 'dd-mm-yyyy'), 622, 511);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (624, to_date('16-06-2023', 'dd-mm-yyyy'), 624, 182);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (625, to_date('28-12-2024', 'dd-mm-yyyy'), 625, 132);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (626, to_date('18-03-2023', 'dd-mm-yyyy'), 626, 540);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (627, to_date('25-02-2025', 'dd-mm-yyyy'), 627, 313);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (628, to_date('03-05-2022', 'dd-mm-yyyy'), 628, 327);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (629, to_date('28-06-2028', 'dd-mm-yyyy'), 629, 358);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (630, to_date('21-01-2026', 'dd-mm-yyyy'), 630, 121);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (631, to_date('24-05-2021', 'dd-mm-yyyy'), 631, 137);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (632, to_date('10-03-2026', 'dd-mm-yyyy'), 632, 337);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (633, to_date('11-05-2023', 'dd-mm-yyyy'), 633, 242);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (634, to_date('16-09-2021', 'dd-mm-yyyy'), 634, 423);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (635, to_date('01-10-2021', 'dd-mm-yyyy'), 635, 520);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (637, to_date('15-05-2024', 'dd-mm-yyyy'), 637, 159);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (638, to_date('16-02-2025', 'dd-mm-yyyy'), 638, 384);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (639, to_date('23-08-2026', 'dd-mm-yyyy'), 639, 167);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (640, to_date('18-05-2028', 'dd-mm-yyyy'), 640, 379);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (641, to_date('07-03-2020', 'dd-mm-yyyy'), 641, 101);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (642, to_date('08-01-2021', 'dd-mm-yyyy'), 642, 296);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (643, to_date('05-03-2024', 'dd-mm-yyyy'), 643, 133);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (644, to_date('21-01-2024', 'dd-mm-yyyy'), 644, 254);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (645, to_date('12-10-2022', 'dd-mm-yyyy'), 645, 113);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (646, to_date('08-11-2022', 'dd-mm-yyyy'), 646, 510);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (647, to_date('09-02-2023', 'dd-mm-yyyy'), 647, 147);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (648, to_date('26-06-2028', 'dd-mm-yyyy'), 648, 422);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (649, to_date('21-04-2023', 'dd-mm-yyyy'), 649, 336);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (650, to_date('06-11-2020', 'dd-mm-yyyy'), 650, 162);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (651, to_date('12-11-2022', 'dd-mm-yyyy'), 651, 341);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (652, to_date('07-08-2021', 'dd-mm-yyyy'), 652, 143);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (653, to_date('03-02-2024', 'dd-mm-yyyy'), 653, 280);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (654, to_date('09-08-2026', 'dd-mm-yyyy'), 654, 470);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (655, to_date('14-03-2024', 'dd-mm-yyyy'), 655, 454);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (656, to_date('18-05-2023', 'dd-mm-yyyy'), 656, 211);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (657, to_date('02-05-2022', 'dd-mm-yyyy'), 657, 243);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (658, to_date('08-05-2028', 'dd-mm-yyyy'), 658, 206);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (659, to_date('21-05-2024', 'dd-mm-yyyy'), 659, 373);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (660, to_date('20-02-2021', 'dd-mm-yyyy'), 660, 332);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (661, to_date('13-10-2020', 'dd-mm-yyyy'), 661, 245);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (662, to_date('28-12-2023', 'dd-mm-yyyy'), 662, 241);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (663, to_date('28-01-2024', 'dd-mm-yyyy'), 663, 117);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (664, to_date('01-09-2028', 'dd-mm-yyyy'), 664, 361);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (665, to_date('27-04-2026', 'dd-mm-yyyy'), 665, 493);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (666, to_date('24-05-2022', 'dd-mm-yyyy'), 666, 503);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (667, to_date('05-04-2021', 'dd-mm-yyyy'), 667, 218);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (668, to_date('28-10-2024', 'dd-mm-yyyy'), 668, 264);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (669, to_date('25-05-2026', 'dd-mm-yyyy'), 669, 332);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (670, to_date('14-09-2022', 'dd-mm-yyyy'), 670, 195);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (671, to_date('02-12-2023', 'dd-mm-yyyy'), 671, 391);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (672, to_date('27-05-2025', 'dd-mm-yyyy'), 672, 486);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (673, to_date('19-07-2025', 'dd-mm-yyyy'), 673, 376);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (674, to_date('10-07-2028', 'dd-mm-yyyy'), 674, 526);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (675, to_date('13-04-2025', 'dd-mm-yyyy'), 675, 341);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (676, to_date('28-05-2022', 'dd-mm-yyyy'), 676, 485);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (677, to_date('13-08-2028', 'dd-mm-yyyy'), 677, 488);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (678, to_date('31-03-2021', 'dd-mm-yyyy'), 678, 403);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (679, to_date('03-11-2022', 'dd-mm-yyyy'), 679, 395);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (680, to_date('20-12-2021', 'dd-mm-yyyy'), 680, 500);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (681, to_date('07-05-2021', 'dd-mm-yyyy'), 681, 346);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (682, to_date('29-11-2025', 'dd-mm-yyyy'), 682, 257);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (684, to_date('01-08-2027', 'dd-mm-yyyy'), 684, 481);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (685, to_date('16-05-2028', 'dd-mm-yyyy'), 685, 421);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (686, to_date('06-06-2027', 'dd-mm-yyyy'), 686, 186);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (687, to_date('18-04-2027', 'dd-mm-yyyy'), 687, 514);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (688, to_date('28-05-2024', 'dd-mm-yyyy'), 688, 144);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (689, to_date('26-12-2024', 'dd-mm-yyyy'), 689, 437);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (690, to_date('11-12-2027', 'dd-mm-yyyy'), 690, 199);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (691, to_date('01-06-2024', 'dd-mm-yyyy'), 691, 449);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (692, to_date('24-09-2022', 'dd-mm-yyyy'), 692, 127);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (694, to_date('13-09-2025', 'dd-mm-yyyy'), 694, 162);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (695, to_date('11-02-2025', 'dd-mm-yyyy'), 695, 113);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (696, to_date('27-12-2022', 'dd-mm-yyyy'), 696, 346);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (697, to_date('25-08-2025', 'dd-mm-yyyy'), 697, 394);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (698, to_date('30-09-2021', 'dd-mm-yyyy'), 698, 299);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (699, to_date('12-07-2024', 'dd-mm-yyyy'), 699, 463);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (700, to_date('31-10-2027', 'dd-mm-yyyy'), 700, 271);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (701, to_date('22-06-2027', 'dd-mm-yyyy'), 701, 256);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (702, to_date('07-04-2028', 'dd-mm-yyyy'), 702, 509);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (703, to_date('16-01-2023', 'dd-mm-yyyy'), 703, 323);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (704, to_date('11-02-2022', 'dd-mm-yyyy'), 704, 107);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (705, to_date('04-06-2026', 'dd-mm-yyyy'), 705, 170);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (706, to_date('12-06-2027', 'dd-mm-yyyy'), 706, 470);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (707, to_date('07-06-2022', 'dd-mm-yyyy'), 707, 330);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (708, to_date('07-11-2023', 'dd-mm-yyyy'), 708, 205);
commit;
prompt 600 records committed...
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (709, to_date('01-10-2022', 'dd-mm-yyyy'), 709, 320);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (710, to_date('23-01-2021', 'dd-mm-yyyy'), 710, 376);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (711, to_date('15-11-2021', 'dd-mm-yyyy'), 711, 241);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (712, to_date('13-07-2023', 'dd-mm-yyyy'), 712, 164);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (713, to_date('01-06-2022', 'dd-mm-yyyy'), 713, 338);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (714, to_date('20-04-2025', 'dd-mm-yyyy'), 714, 458);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (715, to_date('18-03-2025', 'dd-mm-yyyy'), 715, 415);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (716, to_date('17-04-2027', 'dd-mm-yyyy'), 716, 547);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (717, to_date('26-01-2022', 'dd-mm-yyyy'), 717, 189);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (719, to_date('20-02-2028', 'dd-mm-yyyy'), 719, 443);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (720, to_date('06-11-2025', 'dd-mm-yyyy'), 720, 382);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (721, to_date('02-11-2028', 'dd-mm-yyyy'), 721, 169);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (723, to_date('19-02-2028', 'dd-mm-yyyy'), 723, 107);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (724, to_date('07-03-2028', 'dd-mm-yyyy'), 724, 316);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (725, to_date('02-06-2028', 'dd-mm-yyyy'), 725, 314);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (726, to_date('18-12-2024', 'dd-mm-yyyy'), 726, 485);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (727, to_date('18-05-2021', 'dd-mm-yyyy'), 727, 362);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (728, to_date('27-05-2022', 'dd-mm-yyyy'), 728, 330);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (729, to_date('16-04-2024', 'dd-mm-yyyy'), 729, 124);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (730, to_date('17-05-2021', 'dd-mm-yyyy'), 730, 440);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (731, to_date('02-12-2024', 'dd-mm-yyyy'), 731, 324);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (732, to_date('11-04-2025', 'dd-mm-yyyy'), 732, 323);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (733, to_date('07-01-2021', 'dd-mm-yyyy'), 733, 462);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (734, to_date('28-05-2023', 'dd-mm-yyyy'), 734, 203);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (736, to_date('10-05-2024', 'dd-mm-yyyy'), 736, 320);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (737, to_date('14-12-2024', 'dd-mm-yyyy'), 737, 217);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (738, to_date('28-12-2027', 'dd-mm-yyyy'), 738, 181);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (739, to_date('30-07-2027', 'dd-mm-yyyy'), 739, 302);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (740, to_date('21-08-2023', 'dd-mm-yyyy'), 740, 302);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (741, to_date('30-10-2020', 'dd-mm-yyyy'), 741, 166);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (742, to_date('19-04-2024', 'dd-mm-yyyy'), 742, 331);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (743, to_date('07-04-2027', 'dd-mm-yyyy'), 743, 387);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (744, to_date('20-03-2028', 'dd-mm-yyyy'), 744, 241);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (745, to_date('18-12-2028', 'dd-mm-yyyy'), 745, 534);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (746, to_date('16-06-2025', 'dd-mm-yyyy'), 746, 304);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (747, to_date('31-10-2023', 'dd-mm-yyyy'), 747, 377);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (748, to_date('27-06-2021', 'dd-mm-yyyy'), 748, 108);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (749, to_date('21-03-2026', 'dd-mm-yyyy'), 749, 443);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (750, to_date('19-10-2024', 'dd-mm-yyyy'), 750, 277);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (751, to_date('28-01-2027', 'dd-mm-yyyy'), 751, 250);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (752, to_date('03-08-2026', 'dd-mm-yyyy'), 752, 210);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (753, to_date('18-10-2028', 'dd-mm-yyyy'), 753, 330);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (754, to_date('10-08-2023', 'dd-mm-yyyy'), 754, 422);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (755, to_date('30-01-2025', 'dd-mm-yyyy'), 755, 409);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (756, to_date('31-05-2022', 'dd-mm-yyyy'), 756, 502);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (757, to_date('08-08-2025', 'dd-mm-yyyy'), 757, 488);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (758, to_date('05-07-2027', 'dd-mm-yyyy'), 758, 190);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (759, to_date('10-08-2025', 'dd-mm-yyyy'), 759, 464);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (760, to_date('30-03-2026', 'dd-mm-yyyy'), 760, 358);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (761, to_date('18-09-2028', 'dd-mm-yyyy'), 761, 178);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (762, to_date('24-01-2028', 'dd-mm-yyyy'), 762, 495);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (763, to_date('10-12-2024', 'dd-mm-yyyy'), 763, 141);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (764, to_date('31-10-2027', 'dd-mm-yyyy'), 764, 361);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (765, to_date('11-03-2024', 'dd-mm-yyyy'), 765, 117);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (766, to_date('19-02-2024', 'dd-mm-yyyy'), 766, 348);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (767, to_date('25-10-2025', 'dd-mm-yyyy'), 767, 216);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (768, to_date('18-07-2028', 'dd-mm-yyyy'), 768, 189);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (769, to_date('18-04-2022', 'dd-mm-yyyy'), 769, 445);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (770, to_date('26-01-2023', 'dd-mm-yyyy'), 770, 227);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (771, to_date('02-05-2021', 'dd-mm-yyyy'), 771, 156);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (772, to_date('30-10-2027', 'dd-mm-yyyy'), 772, 212);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (773, to_date('14-10-2021', 'dd-mm-yyyy'), 773, 336);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (774, to_date('30-11-2026', 'dd-mm-yyyy'), 774, 346);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (775, to_date('20-12-2025', 'dd-mm-yyyy'), 775, 451);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (776, to_date('02-03-2026', 'dd-mm-yyyy'), 776, 218);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (777, to_date('24-12-2028', 'dd-mm-yyyy'), 777, 129);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (778, to_date('15-01-2020', 'dd-mm-yyyy'), 778, 518);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (779, to_date('19-02-2021', 'dd-mm-yyyy'), 779, 270);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (780, to_date('01-04-2026', 'dd-mm-yyyy'), 780, 399);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (781, to_date('18-08-2022', 'dd-mm-yyyy'), 781, 226);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (782, to_date('26-11-2021', 'dd-mm-yyyy'), 782, 326);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (783, to_date('03-11-2026', 'dd-mm-yyyy'), 783, 432);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (784, to_date('30-01-2025', 'dd-mm-yyyy'), 784, 491);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (785, to_date('13-10-2027', 'dd-mm-yyyy'), 785, 109);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (786, to_date('30-12-2027', 'dd-mm-yyyy'), 786, 217);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (787, to_date('04-06-2027', 'dd-mm-yyyy'), 787, 318);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (788, to_date('21-02-2028', 'dd-mm-yyyy'), 788, 180);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (789, to_date('09-05-2023', 'dd-mm-yyyy'), 789, 488);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (790, to_date('07-01-2024', 'dd-mm-yyyy'), 790, 226);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (791, to_date('19-06-2021', 'dd-mm-yyyy'), 791, 278);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (792, to_date('07-12-2028', 'dd-mm-yyyy'), 792, 480);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (793, to_date('02-12-2021', 'dd-mm-yyyy'), 793, 467);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (794, to_date('31-10-2026', 'dd-mm-yyyy'), 794, 321);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (795, to_date('28-03-2027', 'dd-mm-yyyy'), 795, 178);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (796, to_date('02-07-2025', 'dd-mm-yyyy'), 796, 444);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (797, to_date('12-12-2023', 'dd-mm-yyyy'), 797, 161);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (798, to_date('09-12-2026', 'dd-mm-yyyy'), 798, 172);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (799, to_date('10-06-2021', 'dd-mm-yyyy'), 799, 495);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (800, to_date('10-09-2021', 'dd-mm-yyyy'), 800, 355);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (801, to_date('15-08-2027', 'dd-mm-yyyy'), 801, 422);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (802, to_date('19-04-2024', 'dd-mm-yyyy'), 802, 342);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (803, to_date('08-12-2024', 'dd-mm-yyyy'), 803, 388);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (804, to_date('01-05-2026', 'dd-mm-yyyy'), 804, 166);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (805, to_date('23-10-2025', 'dd-mm-yyyy'), 805, 446);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (806, to_date('24-10-2027', 'dd-mm-yyyy'), 806, 223);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (807, to_date('29-10-2020', 'dd-mm-yyyy'), 807, 310);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (809, to_date('17-12-2022', 'dd-mm-yyyy'), 809, 425);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (810, to_date('19-11-2025', 'dd-mm-yyyy'), 810, 315);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (811, to_date('04-02-2022', 'dd-mm-yyyy'), 811, 203);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (812, to_date('01-01-2028', 'dd-mm-yyyy'), 812, 528);
commit;
prompt 700 records committed...
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (813, to_date('14-11-2025', 'dd-mm-yyyy'), 813, 355);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (814, to_date('27-09-2027', 'dd-mm-yyyy'), 814, 377);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (815, to_date('24-07-2023', 'dd-mm-yyyy'), 815, 172);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (816, to_date('11-05-2028', 'dd-mm-yyyy'), 816, 523);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (817, to_date('21-09-2027', 'dd-mm-yyyy'), 817, 130);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (818, to_date('27-06-2025', 'dd-mm-yyyy'), 818, 362);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (819, to_date('24-12-2024', 'dd-mm-yyyy'), 819, 290);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (820, to_date('09-12-2024', 'dd-mm-yyyy'), 820, 538);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (821, to_date('29-09-2024', 'dd-mm-yyyy'), 821, 369);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (822, to_date('11-02-2026', 'dd-mm-yyyy'), 822, 374);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (823, to_date('21-06-2026', 'dd-mm-yyyy'), 823, 369);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (824, to_date('20-12-2028', 'dd-mm-yyyy'), 824, 306);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (825, to_date('22-05-2026', 'dd-mm-yyyy'), 825, 320);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (826, to_date('16-11-2025', 'dd-mm-yyyy'), 826, 511);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (827, to_date('07-08-2025', 'dd-mm-yyyy'), 827, 171);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (828, to_date('15-08-2023', 'dd-mm-yyyy'), 828, 300);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (829, to_date('26-12-2021', 'dd-mm-yyyy'), 829, 167);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (830, to_date('03-10-2026', 'dd-mm-yyyy'), 830, 197);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (831, to_date('07-11-2020', 'dd-mm-yyyy'), 831, 217);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (832, to_date('11-05-2026', 'dd-mm-yyyy'), 832, 347);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (833, to_date('18-02-2022', 'dd-mm-yyyy'), 833, 260);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (834, to_date('30-12-2025', 'dd-mm-yyyy'), 834, 320);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (835, to_date('10-04-2028', 'dd-mm-yyyy'), 835, 295);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (836, to_date('12-11-2028', 'dd-mm-yyyy'), 836, 286);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (837, to_date('16-05-2025', 'dd-mm-yyyy'), 837, 316);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (838, to_date('07-11-2028', 'dd-mm-yyyy'), 838, 391);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (839, to_date('25-07-2021', 'dd-mm-yyyy'), 839, 546);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (840, to_date('21-09-2027', 'dd-mm-yyyy'), 840, 546);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (841, to_date('25-11-2023', 'dd-mm-yyyy'), 841, 350);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (842, to_date('27-01-2020', 'dd-mm-yyyy'), 842, 545);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (843, to_date('23-10-2022', 'dd-mm-yyyy'), 843, 213);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (844, to_date('28-06-2028', 'dd-mm-yyyy'), 844, 173);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (847, to_date('28-09-2024', 'dd-mm-yyyy'), 847, 485);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (848, to_date('18-01-2025', 'dd-mm-yyyy'), 848, 287);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (849, to_date('29-07-2020', 'dd-mm-yyyy'), 849, 213);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (850, to_date('30-06-2026', 'dd-mm-yyyy'), 850, 124);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (851, to_date('16-03-2021', 'dd-mm-yyyy'), 851, 484);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (852, to_date('14-03-2021', 'dd-mm-yyyy'), 852, 412);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (853, to_date('15-02-2025', 'dd-mm-yyyy'), 853, 388);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (854, to_date('25-05-2021', 'dd-mm-yyyy'), 854, 138);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (856, to_date('02-12-2028', 'dd-mm-yyyy'), 856, 351);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (857, to_date('25-02-2023', 'dd-mm-yyyy'), 857, 281);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (858, to_date('10-08-2020', 'dd-mm-yyyy'), 858, 152);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (859, to_date('15-12-2022', 'dd-mm-yyyy'), 859, 229);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (860, to_date('04-11-2024', 'dd-mm-yyyy'), 860, 229);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (861, to_date('10-10-2025', 'dd-mm-yyyy'), 861, 135);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (862, to_date('21-12-2025', 'dd-mm-yyyy'), 862, 452);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (863, to_date('05-07-2021', 'dd-mm-yyyy'), 863, 302);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (864, to_date('13-09-2028', 'dd-mm-yyyy'), 864, 371);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (865, to_date('12-01-2022', 'dd-mm-yyyy'), 865, 158);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (866, to_date('11-03-2023', 'dd-mm-yyyy'), 866, 470);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (867, to_date('16-11-2025', 'dd-mm-yyyy'), 867, 219);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (868, to_date('28-12-2028', 'dd-mm-yyyy'), 868, 144);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (869, to_date('12-03-2023', 'dd-mm-yyyy'), 869, 418);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (870, to_date('07-11-2025', 'dd-mm-yyyy'), 870, 106);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (871, to_date('19-10-2026', 'dd-mm-yyyy'), 871, 210);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (872, to_date('25-12-2022', 'dd-mm-yyyy'), 872, 355);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (873, to_date('02-05-2021', 'dd-mm-yyyy'), 873, 492);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (874, to_date('04-11-2020', 'dd-mm-yyyy'), 874, 549);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (875, to_date('12-07-2028', 'dd-mm-yyyy'), 875, 257);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (876, to_date('15-10-2026', 'dd-mm-yyyy'), 876, 476);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (877, to_date('26-12-2022', 'dd-mm-yyyy'), 877, 326);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (878, to_date('22-09-2022', 'dd-mm-yyyy'), 878, 193);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (879, to_date('22-04-2022', 'dd-mm-yyyy'), 879, 175);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (880, to_date('02-05-2021', 'dd-mm-yyyy'), 880, 443);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (881, to_date('18-04-2024', 'dd-mm-yyyy'), 881, 268);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (882, to_date('23-02-2024', 'dd-mm-yyyy'), 882, 179);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (883, to_date('11-03-2024', 'dd-mm-yyyy'), 883, 303);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (884, to_date('16-02-2027', 'dd-mm-yyyy'), 884, 330);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (885, to_date('07-02-2021', 'dd-mm-yyyy'), 885, 111);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (886, to_date('24-05-2027', 'dd-mm-yyyy'), 886, 546);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (887, to_date('18-07-2024', 'dd-mm-yyyy'), 887, 464);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (888, to_date('08-06-2026', 'dd-mm-yyyy'), 888, 238);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (889, to_date('25-09-2023', 'dd-mm-yyyy'), 889, 311);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (891, to_date('14-05-2022', 'dd-mm-yyyy'), 891, 383);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (893, to_date('25-07-2021', 'dd-mm-yyyy'), 893, 492);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (894, to_date('04-06-2025', 'dd-mm-yyyy'), 894, 463);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (895, to_date('07-04-2023', 'dd-mm-yyyy'), 895, 358);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (896, to_date('19-06-2023', 'dd-mm-yyyy'), 896, 418);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (897, to_date('17-07-2024', 'dd-mm-yyyy'), 897, 411);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (898, to_date('07-08-2020', 'dd-mm-yyyy'), 898, 265);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (899, to_date('25-11-2025', 'dd-mm-yyyy'), 899, 200);
commit;
prompt 782 records loaded
prompt Loading PROFESSION...
insert into PROFESSION (prof_id, prof_name)
values (0, 'photographer');
insert into PROFESSION (prof_id, prof_name)
values (1, 'video');
insert into PROFESSION (prof_id, prof_name)
values (2, 'Singer');
insert into PROFESSION (prof_id, prof_name)
values (3, 'Producer');
commit;
prompt 4 records loaded
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
prompt 400 records committed...
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (503, ' Alice Johnson', null, null, null, 4800, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (506, ' Michael Wilson', null, null, null, 4900, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (508, ' David White', null, null, null, 4600, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (509, ' Laura Harris', null, null, null, 5100, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (510, ' James Clark', null, null, null, 5400, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (511, 'Frank Garcia', null, null, null, 4911, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (513, 'Dan Smith', null, null, null, 6473, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (521, 'Dan Smith', null, null, null, 9381, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (523, 'Jane Williams', null, null, null, 5408, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (525, 'Carol Williams', null, null, null, 4508, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (526, 'Frank Miller', null, null, null, 1487, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (527, 'Henry Garcia', null, null, null, 1747, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (529, 'Carol Garcia', null, null, null, 4544, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (530, 'Jane Smith', null, null, null, 1894, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (532, 'Alice Miller', null, null, null, 1996, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (533, 'Jane Garcia', null, null, null, 8475, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (534, 'Jane Miller', null, null, null, 1051, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (536, 'Jane Miller', null, null, null, 5556, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (537, 'Frank Jones', null, null, null, 3422, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (538, 'Eve Johnson', null, null, null, 6343, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (540, 'Carol Johnson', null, null, null, 1961, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (541, 'Alice Garcia', null, null, null, 2756, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (542, 'Grace Doe', null, null, null, 6231, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (543, 'Frank Smith', null, null, null, 8439, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (544, 'Frank Davis', null, null, null, 3239, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (546, 'Bob Miller', null, null, null, 8936, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (550, 'Frank Johnson', null, null, null, 9606, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (552, 'Alice Brown', null, null, null, 6884, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (554, 'Eve Miller', null, null, null, 8006, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (558, 'Grace Miller', null, null, null, 3766, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (560, 'Henry Doe', null, null, null, 2894, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (562, 'Jane Davis', null, null, null, 7855, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (563, 'Alice Davis', null, null, null, 1979, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (565, 'Dan Johnson', null, null, null, 9696, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (568, 'Dan Wilson', null, null, null, 6812, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (569, 'Bob Jones', null, null, null, 9008, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (570, 'Dan Garcia', null, null, null, 8952, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (572, 'John Miller', null, null, null, 1709, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (573, 'Frank Doe', null, null, null, 5552, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (574, 'John Doe', null, null, null, 9101, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (576, 'Eve Smith', null, null, null, 1374, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (577, 'Frank Johnson', null, null, null, 8904, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (581, 'Frank Brown', null, null, null, 2765, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (586, 'Alice Garcia', null, null, null, 6870, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (587, 'Henry Johnson', null, null, null, 2101, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (588, 'Frank Davis', null, null, null, 8177, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (589, 'Henry Smith', null, null, null, 8483, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (592, 'Jane Smith', null, null, null, 4337, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (593, 'Eve Brown', null, null, null, 5219, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (594, 'Eve Williams', null, null, null, 6317, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (595, 'Eve Johnson', null, null, null, 5195, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (596, 'Henry Jones', null, null, null, 8406, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (597, 'Carol Smith', null, null, null, 3389, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (599, 'Jane Davis', null, null, null, 8329, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (601, 'Bob Johnson', null, null, null, 4788, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (603, 'Grace Jones', null, null, null, 6921, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (607, 'Eve Johnson', null, null, null, 1642, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (608, 'John Smith', null, null, null, 5671, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (609, 'Jane Jones', null, null, null, 9317, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (611, 'Bob Miller', null, null, null, 5510, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (612, 'Jane Doe', null, null, null, 7325, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (619, 'Eve Williams', null, null, null, 8967, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (624, 'Frank Garcia', null, null, null, 8758, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (628, 'Henry Doe', null, null, null, 9130, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (630, 'Dan Davis', null, null, null, 5813, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (631, 'Frank Johnson', null, null, null, 9328, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (635, 'Alice Brown', null, null, null, 7191, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (636, 'Frank Doe', null, null, null, 9247, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (637, 'Alice Doe', null, null, null, 7481, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (638, 'Henry Smith', null, null, null, 8995, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (639, 'Carol Doe', null, null, null, 7859, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (640, 'Jane Williams', null, null, null, 9882, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (641, 'Jane Brown', null, null, null, 3015, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (642, 'Bob Smith', null, null, null, 6290, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (643, 'Jane Smith', null, null, null, 6775, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (648, 'Jane Doe', null, null, null, 5772, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (649, 'Bob Jones', null, null, null, 6595, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (650, 'Jane Miller', null, null, null, 5120, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (651, 'Dan Davis', null, null, null, 2840, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (652, 'Jane Doe', null, null, null, 1971, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (653, 'Carol Smith', null, null, null, 6071, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (656, 'Dan Brown', null, null, null, 4315, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (659, 'Dan Wilson', null, null, null, 6653, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (660, 'Grace Johnson', null, null, null, 2750, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (662, 'Grace Doe', null, null, null, 5267, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (665, 'Carol Williams', null, null, null, 5003, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (666, 'Frank Williams', null, null, null, 4022, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (668, 'Dan Garcia', null, null, null, 5921, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (670, 'Bob Davis', null, null, null, 4651, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (671, 'Eve Garcia', null, null, null, 7444, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (674, 'Grace Wilson', null, null, null, 7080, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (675, 'Grace Doe', null, null, null, 10617, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (676, 'Bob Davis', null, null, null, 2685, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (678, 'Eve Doe', null, null, null, 2860, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (679, 'Henry Garcia', null, null, null, 8801, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (680, 'Alice Smith', null, null, null, 4993, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (681, 'Dan Johnson', null, null, null, 7258, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (682, 'Dan Garcia', null, null, null, 8518, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (683, 'Bob Garcia', null, null, null, 7961, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (685, 'Henry Wilson', null, null, null, 3811, 2000, 2);
commit;
prompt 500 records committed...
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (686, 'Eve Wilson', null, null, null, 6683, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (687, 'Eve Brown', null, null, null, 5344, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (688, 'Eve Smith', null, null, null, 2533, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (689, 'John Brown', null, null, null, 9274, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (691, 'Carol Miller', null, null, null, 8541, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (692, 'Carol Brown', null, null, null, 6786, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (693, 'Jane Miller', null, null, null, 2285, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (695, 'John Johnson', null, null, null, 2657, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (696, 'Carol Johnson', null, null, null, 6316, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (697, 'Alice Johnson', null, null, null, 5346, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (700, 'Alice Johnson', null, null, null, 9521, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (701, 'Carol Williams', null, null, null, 1514, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (702, 'Grace Williams', null, null, null, 9853, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (705, 'Alice Davis', null, null, null, 4682, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (706, 'Dan Jones', null, null, null, 1841, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (707, 'John Garcia', null, null, null, 8454, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (708, 'Eve Jones', null, null, null, 8508, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (709, 'Dan Johnson', null, null, null, 5624, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (711, 'Bob Miller', null, null, null, 7543, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (712, 'Bob Garcia', null, null, null, 9114, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (713, 'Bob Doe', null, null, null, 1060, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (714, 'Dan Brown', null, null, null, 1089, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (715, 'Frank Wilson', null, null, null, 3133, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (716, 'Grace Johnson', null, null, null, 4285, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (718, 'Eve Smith', null, null, null, 3546, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (719, 'Jane Doe', null, null, null, 8569, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (723, 'Dan Davis', null, null, null, 4905, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (724, 'Jane Garcia', null, null, null, 8437, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (726, 'Jane Smith', null, null, null, 9306, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (727, 'Frank Brown', null, null, null, 5417, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (730, 'John Williams', null, null, null, 9358, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (735, 'Eve Doe', null, null, null, 7117, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (736, 'Carol Wilson', null, null, null, 4989, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (737, 'Jane Garcia', null, null, null, 1931, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (738, 'Alice Smith', null, null, null, 2273, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (739, 'Henry Doe', null, null, null, 5838, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (740, 'Henry Doe', null, null, null, 1344, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (741, 'Alice Smith', null, null, null, 3260, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (742, 'Grace Wilson', null, null, null, 9747, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (743, 'Henry Miller', null, null, null, 9973, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (746, 'Grace Brown', null, null, null, 6930, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (747, 'John Miller', null, null, null, 3423, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (748, 'Grace Davis', null, null, null, 1006, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (749, 'Frank Garcia', null, null, null, 1231, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (750, 'Grace Miller', null, null, null, 4259, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (752, 'Jane Smith', null, null, null, 5535, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (753, 'Jane Wilson', null, null, null, 7360, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (755, 'Bob Miller', null, null, null, 2300, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (756, 'Henry Smith', null, null, null, 6797, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (757, 'Bob Miller', null, null, null, 7852, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (759, 'Grace Doe', null, null, null, 9827, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (761, 'Carol Doe', null, null, null, 2674, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (764, 'Carol Miller', null, null, null, 4056, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (766, 'Frank Garcia', null, null, null, 2288, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (767, 'Frank Jones', null, null, null, 9448, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (768, 'Alice Garcia', null, null, null, 5910, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (769, 'Bob Wilson', null, null, null, 2032, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (772, 'John Doe', null, null, null, 2936, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (778, 'Frank Miller', null, null, null, 6756, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (779, 'John Davis', null, null, null, 5176, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (780, 'Frank Garcia', null, null, null, 4762, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (782, 'Grace Johnson', null, null, null, 7763, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (786, 'John Johnson', null, null, null, 9032, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (787, 'Eve Johnson', null, null, null, 1420, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (788, 'Dan Miller', null, null, null, 4275, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (790, 'Bob Davis', null, null, null, 6350, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (792, 'Dan Wilson', null, null, null, 1171, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (793, 'Dan Jones', null, null, null, 5010, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (797, 'Henry Williams', null, null, null, 8226, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (799, 'Dan Garcia', null, null, null, 5313, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (802, 'Eve Miller', null, null, null, 7175, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (803, 'Grace Miller', null, null, null, 5713, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (805, 'Carol Jones', null, null, null, 6722, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (806, 'John Jones', null, null, null, 2679, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (807, 'Dan Johnson', null, null, null, 8218, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (809, 'John Smith', null, null, null, 9391, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (810, 'Bob Johnson', null, null, null, 7078, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (811, 'Henry Williams', null, null, null, 9599, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (813, 'Jane Smith', null, null, null, 4142, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (815, 'Jane Wilson', null, null, null, 2052, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (818, 'Grace Brown', null, null, null, 7149, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (820, 'Eve Johnson', null, null, null, 2601, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (821, 'Eve Johnson', null, null, null, 9848, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (822, 'John Miller', null, null, null, 7475, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (824, 'Eve Johnson', null, null, null, 1112, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (825, 'Henry Johnson', null, null, null, 7968, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (826, 'Eve Johnson', null, null, null, 4723, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (827, 'Carol Doe', null, null, null, 6292, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (832, 'Bob Davis', null, null, null, 4615, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (833, 'Bob Garcia', null, null, null, 7044, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (835, 'Bob Miller', null, null, null, 1479, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (836, 'Eve Doe', null, null, null, 6932, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (839, 'Frank Johnson', null, null, null, 9913, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (840, 'Dan Doe', null, null, null, 1521, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (843, 'Dan Brown', null, null, null, 3623, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (844, 'Dan Doe', null, null, null, 1152, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (845, 'Grace Davis', null, null, null, 1577, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (846, 'Jane Miller', null, null, null, 5071, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (850, 'Frank Brown', null, null, null, 6772, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (851, 'Dan Williams', null, null, null, 9403, 2000, 2);
commit;
prompt 600 records committed...
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (852, 'Bob Wilson', null, null, null, 2552, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (853, 'Jane Garcia', null, null, null, 1256, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (854, 'Jane Davis', null, null, null, 1139, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (858, 'John Doe', null, null, null, 7654, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (859, 'Frank Davis', null, null, null, 6232, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (860, 'Bob Williams', null, null, null, 6824, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (862, 'Carol Wilson', null, null, null, 7785, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (863, 'Jane Doe', null, null, null, 7762, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (864, 'John Garcia', null, null, null, 5405, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (865, 'John Garcia', null, null, null, 5028, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (867, 'Henry Davis', null, null, null, 9531, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (868, 'Alice Williams', null, null, null, 1648, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (871, 'Dan Doe', null, null, null, 6228, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (875, 'Grace Brown', null, null, null, 6711, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (879, 'Henry Brown', null, null, null, 10369, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (880, 'Dan Williams', null, null, null, 9221, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (881, 'John Johnson', null, null, null, 8902, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (883, 'Grace Brown', null, null, null, 8719, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (885, 'Grace Smith', null, null, null, 2092, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (888, 'Bob Brown', null, null, null, 4198, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (892, 'John Smith', null, null, null, 7403, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (893, 'Eve Doe', null, null, null, 7976, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (895, 'Carol Johnson', null, null, null, 7841, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (896, 'Eve Doe', null, null, null, 1095, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (897, 'Alice Johnson', null, null, null, 2216, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (898, 'Jane Smith', null, null, null, 5935, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (899, 'Henry Williams', null, null, null, 7749, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (901, 'Grace Wilson', null, null, null, 3074, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (903, 'Grace Garcia', null, null, null, 8497, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (906, 'Jane Johnson', null, null, null, 6179, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (911, 'Bob Brown', null, null, null, 5791, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (912, 'Eve Garcia', null, null, null, 7730, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (913, 'Grace Williams', null, null, null, 9251, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (914, 'Alice Miller', null, null, null, 3593, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (915, 'Dan Jones', null, null, null, 7873, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (917, 'Bob Miller', null, null, null, 8345, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (918, 'Alice Wilson', null, null, null, 2743, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (920, 'Dan Davis', null, null, null, 2593, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (921, 'John Miller', null, null, null, 4932, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (925, 'Dan Brown', null, null, null, 2018, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (927, 'Alice Brown', null, null, null, 5503, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (928, 'Carol Jones', null, null, null, 6808, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (929, 'Dan Garcia', null, null, null, 6472, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (930, 'Jane Wilson', null, null, null, 7223, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (931, 'Jane Johnson', null, null, null, 3719, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (932, 'Jane Wilson', null, null, null, 1909, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (933, 'Jane Williams', null, null, null, 9548, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (934, 'Frank Johnson', null, null, null, 8140, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (935, 'John Doe', null, null, null, 6832, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (937, 'John Wilson', null, null, null, 6013, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (938, 'Grace Williams', null, null, null, 9293, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (943, 'Alice Garcia', null, null, null, 2060, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (944, 'Bob Miller', null, null, null, 2546, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (945, 'Frank Davis', null, null, null, 4712, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (946, 'Carol Smith', null, null, null, 1868, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (947, 'Henry Davis', null, null, null, 6088, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (948, 'John Doe', null, null, null, 7215, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (949, 'Bob Brown', null, null, null, 1548, 2000, 2);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1201, ' Jon Doe', null, null, null, 3347, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1202, ' Jane Roe', null, null, null, 3570, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1203, ' Alice Li', null, null, null, 3793, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1204, ' Bob Lin', null, null, null, 4292, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1205, ' Carol Yu', null, null, null, 3681, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1206, ' Dan Kim', null, null, null, 3905, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1207, ' Eve Wu', null, null, null, 3600, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1208, ' Frank Ho', null, null, null, 4600, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1209, ' Grace Ma', null, null, null, 4240, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1210, ' Henry Xu', null, null, null, 4351, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1211, 'Bob Brown', null, null, null, 9094, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1212, 'John Davis', null, null, null, 8695, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1213, 'Dan Garcia', null, null, null, 9069, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1214, 'Alice Wilson', null, null, null, 6092, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1215, 'Carol Jones', null, null, null, 1590, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1216, 'John Garcia', null, null, null, 4461, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1217, 'John Williams', null, null, null, 8160, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1218, 'Jane Davis', null, null, null, 5922, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1219, 'Jane Brown', null, null, null, 10795, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1220, 'Carol Smith', null, null, null, 4849, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1221, 'Henry Williams', null, null, null, 12206, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1222, 'Jane Wilson', null, null, null, 5523, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1223, 'John Brown', null, null, null, 3830, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1224, 'Alice Miller', null, null, null, 8357, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1225, 'Eve Williams', null, null, null, 4617, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1226, 'Bob Jones', null, null, null, 7566, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1227, 'Grace Williams', null, null, null, 2408, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1228, 'Jane Davis', null, null, null, 1506, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1229, 'Bob Johnson', null, null, null, 4116, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1230, 'Jane Miller', null, null, null, 1497, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1231, 'Frank Johnson', null, null, null, 6201, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1232, 'Carol Brown', null, null, null, 2787, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1233, 'Bob Brown', null, null, null, 8919, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1234, 'Dan Smith', null, null, null, 8764, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1235, 'Jane Brown', null, null, null, 2903, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1236, 'Grace Brown', null, null, null, 1453, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1237, 'Dan Miller', null, null, null, 6106, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1238, 'Dan Smith', null, null, null, 7149, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1239, 'Carol Johnson', null, null, null, 1439, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1240, 'John Jones', null, null, null, 3956, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1241, 'Dan Wilson', null, null, null, 10932, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1242, 'Alice Brown', null, null, null, 2994, 2000, 3);
commit;
prompt 700 records committed...
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1243, 'Henry Wilson', null, null, null, 8965, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1244, 'Eve Garcia', null, null, null, 1541, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1245, 'Bob Smith', null, null, null, 3876, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1246, 'Frank Garcia', null, null, null, 2899, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1247, 'Dan Smith', null, null, null, 9328, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1248, 'Frank Garcia', null, null, null, 3236, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1249, 'Frank Wilson', null, null, null, 7283, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1250, 'Dan Wilson', null, null, null, 6940, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1251, 'Jane Wilson', null, null, null, 2715, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1252, 'John Johnson', null, null, null, 4596, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1253, 'Frank Williams', null, null, null, 1939, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1254, 'Grace Wilson', null, null, null, 5140, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1255, 'Henry Doe', null, null, null, 7468, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1256, 'Henry Doe', null, null, null, 9651, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1257, 'Eve Doe', null, null, null, 11715, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1258, 'Jane Davis', null, null, null, 2978, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1259, 'Frank Jones', null, null, null, 11561, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1260, 'Jane Wilson', null, null, null, 10651, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1261, 'Bob Doe', null, null, null, 7813, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1262, 'Dan Miller', null, null, null, 6966, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1263, 'John Jones', null, null, null, 2739, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1264, 'Alice Jones', null, null, null, 6272, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1265, 'John Brown', null, null, null, 2473, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1266, 'Alice Miller', null, null, null, 6870, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1267, 'Dan Wilson', null, null, null, 2710, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1268, 'Carol Smith', null, null, null, 7057, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1269, 'Grace Brown', null, null, null, 7572, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1270, 'Eve Johnson', null, null, null, 5262, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1271, 'Alice Johnson', null, null, null, 4626, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1272, 'John Davis', null, null, null, 15275, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1273, 'Grace Jones', null, null, null, 1326, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1274, 'Frank Garcia', null, null, null, 3389, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1275, 'Eve Wilson', null, null, null, 9089, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1276, 'Frank Miller', null, null, null, 7440, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1277, 'Dan Johnson', null, null, null, 10672, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1278, 'Eve Wilson', null, null, null, 3533, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1279, 'Bob Miller', null, null, null, 5766, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1280, 'Eve Smith', null, null, null, 8243, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1281, 'John Brown', null, null, null, 6943, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1282, 'Grace Williams', null, null, null, 2480, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1283, 'Henry Doe', null, null, null, 6497, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1284, 'Frank Davis', null, null, null, 8289, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1285, 'Carol Williams', null, null, null, 10109, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1286, 'Eve Garcia', null, null, null, 7840, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1287, 'Eve Davis', null, null, null, 5821, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1288, 'Henry Doe', null, null, null, 3394, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1289, 'Alice Williams', null, null, null, 13317, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1290, 'Eve Garcia', null, null, null, 2652, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1291, 'John Williams', null, null, null, 4265, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1292, 'Carol Williams', null, null, null, 13707, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1293, 'Dan Williams', null, null, null, 8956, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1294, 'Carol Williams', null, null, null, 3073, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1295, 'Henry Doe', null, null, null, 4023, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1296, 'Alice Davis', null, null, null, 7730, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1297, 'John Garcia', null, null, null, 11140, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1298, 'Eve Jones', null, null, null, 3590, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1299, 'John Brown', null, null, null, 6188, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1300, 'Grace Jones', null, null, null, 5862, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1301, 'Jane Jones', null, null, null, 2583, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1302, 'Grace Brown', null, null, null, 9838, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1303, 'Eve Smith', null, null, null, 5260, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1304, 'Alice Williams', null, null, null, 6029, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1305, 'Eve Davis', null, null, null, 4204, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1306, 'Frank Garcia', null, null, null, 3022, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1307, 'Alice Smith', null, null, null, 1880, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1308, 'Frank Wilson', null, null, null, 13229, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1309, 'Eve Brown', null, null, null, 6083, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1310, 'Henry Miller', null, null, null, 6447, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1311, 'Carol Garcia', null, null, null, 6079, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1312, 'Frank Brown', null, null, null, 1725, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1313, 'Grace Jones', null, null, null, 8605, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1314, 'Henry Williams', null, null, null, 7909, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1315, 'Grace Johnson', null, null, null, 9924, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1316, 'John Miller', null, null, null, 4450, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1317, 'Bob Brown', null, null, null, 3158, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1318, 'Dan Davis', null, null, null, 2126, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1319, 'Henry Davis', null, null, null, 4297, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1320, 'Eve Miller', null, null, null, 7206, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1321, 'John Miller', null, null, null, 8987, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1322, 'Frank Wilson', null, null, null, 6896, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1323, 'Frank Garcia', null, null, null, 2536, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1324, 'Eve Williams', null, null, null, 5819, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1325, 'John Brown', null, null, null, 11673, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1326, 'Eve Williams', null, null, null, 3379, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1327, 'Grace Jones', null, null, null, 1869, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1328, 'Eve Doe', null, null, null, 7206, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1329, 'Henry Smith', null, null, null, 7949, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1330, 'Alice Johnson', null, null, null, 3854, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1331, 'Dan Garcia', null, null, null, 8063, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1332, 'Eve Williams', null, null, null, 2338, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1333, 'Jane Johnson', null, null, null, 9430, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1334, 'Frank Jones', null, null, null, 6214, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1335, 'Eve Smith', null, null, null, 10947, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1336, 'Alice Johnson', null, null, null, 8851, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1337, 'Carol Brown', null, null, null, 1791, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1338, 'Bob Johnson', null, null, null, 7898, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1339, 'Grace Doe', null, null, null, 3136, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1340, 'Bob Brown', null, null, null, 6773, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1341, 'Henry Garcia', null, null, null, 3761, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1342, 'Alice Davis', null, null, null, 8657, 2000, 3);
commit;
prompt 800 records committed...
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1343, 'Jane Johnson', null, null, null, 5940, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1344, 'Alice Miller', null, null, null, 6770, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1345, 'Grace Johnson', null, null, null, 1657, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1346, 'Eve Davis', null, null, null, 3869, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1347, 'Henry Wilson', null, null, null, 4034, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1348, 'Grace Garcia', null, null, null, 3321, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1349, 'Jane Doe', null, null, null, 1323, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1350, 'Henry Davis', null, null, null, 2976, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1351, 'Eve Brown', null, null, null, 8802, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1352, 'Carol Miller', null, null, null, 6568, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1353, 'Frank Smith', null, null, null, 3604, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1354, 'Jane Davis', null, null, null, 1663, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1355, 'Dan Miller', null, null, null, 4737, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1356, 'Alice Jones', null, null, null, 6109, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1357, 'Grace Davis', null, null, null, 3570, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1358, 'Carol Miller', null, null, null, 3366, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1359, 'John Doe', null, null, null, 11465, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1360, 'Jane Brown', null, null, null, 12084, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1361, 'Frank Smith', null, null, null, 1985, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1362, 'Jane Doe', null, null, null, 2975, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1363, 'Alice Johnson', null, null, null, 10691, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1364, 'Alice Doe', null, null, null, 6580, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1365, 'John Johnson', null, null, null, 11979, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1366, 'Dan Smith', null, null, null, 2954, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1367, 'Carol Smith', null, null, null, 1587, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1368, 'Jane Jones', null, null, null, 1306, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1369, 'Henry Brown', null, null, null, 2991, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1370, 'John Miller', null, null, null, 11141, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1371, 'Henry Doe', null, null, null, 3203, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1372, 'Eve Smith', null, null, null, 2984, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1373, 'Jane Jones', null, null, null, 2442, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1374, 'Bob Smith', null, null, null, 7664, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1375, 'Dan Garcia', null, null, null, 5372, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1376, 'Dan Smith', null, null, null, 5086, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1377, 'Eve Doe', null, null, null, 2930, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1378, 'Bob Smith', null, null, null, 7318, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1379, 'Grace Garcia', null, null, null, 1388, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1380, 'Frank Doe', null, null, null, 3907, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1381, 'Alice Jones', null, null, null, 11114, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1382, 'Henry Williams', null, null, null, 10495, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1383, 'Frank Wilson', null, null, null, 3242, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1384, 'Eve Smith', null, null, null, 9749, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1385, 'Bob Williams', null, null, null, 9390, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1386, 'Grace Garcia', null, null, null, 7228, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1387, 'Dan Williams', null, null, null, 2781, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1388, 'Carol Doe', null, null, null, 3561, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1389, 'Bob Miller', null, null, null, 3036, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1390, 'Grace Wilson', null, null, null, 8633, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1391, 'Eve Brown', null, null, null, 5058, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1392, 'Dan Brown', null, null, null, 8193, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1393, 'Eve Wilson', null, null, null, 6174, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1394, 'Carol Doe', null, null, null, 5329, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1395, 'Eve Davis', null, null, null, 5384, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1396, 'Bob Wilson', null, null, null, 4760, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1397, 'Dan Johnson', null, null, null, 7722, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1398, 'Jane Brown', null, null, null, 1638, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1399, 'Carol Williams', null, null, null, 9349, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1400, 'Dan Davis', null, null, null, 7172, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1401, 'Eve Miller', null, null, null, 10153, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1402, 'Dan Johnson', null, null, null, 1452, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1403, 'Alice Jones', null, null, null, 6918, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1404, 'Eve Williams', null, null, null, 6007, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1405, 'Jane Brown', null, null, null, 3372, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1406, 'Jane Wilson', null, null, null, 10012, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1407, 'Alice Smith', null, null, null, 5606, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1408, 'Jane Davis', null, null, null, 9473, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1409, 'Henry Smith', null, null, null, 8652, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1410, 'John Doe', null, null, null, 7139, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1411, 'Eve Johnson', null, null, null, 2181, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1412, 'Eve Williams', null, null, null, 6434, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1413, 'Bob Miller', null, null, null, 3319, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1414, 'Frank Jones', null, null, null, 1362, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1415, 'Frank Wilson', null, null, null, 6173, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1416, 'Bob Wilson', null, null, null, 4777, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1417, 'Carol Miller', null, null, null, 2071, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1418, 'Grace Smith', null, null, null, 9465, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1419, 'Bob Williams', null, null, null, 1432, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1420, 'Dan Williams', null, null, null, 2870, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1421, 'Frank Johnson', null, null, null, 2032, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1422, 'Alice Garcia', null, null, null, 6437, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1423, 'Grace Jones', null, null, null, 10434, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1424, 'Eve Jones', null, null, null, 5618, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1425, 'John Garcia', null, null, null, 6999, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1426, 'Henry Davis', null, null, null, 1971, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1427, 'John Brown', null, null, null, 1310, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1428, 'Bob Brown', null, null, null, 11072, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1429, 'Alice Williams', null, null, null, 9205, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1430, 'Carol Doe', null, null, null, 8024, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1431, 'Jane Garcia', null, null, null, 10960, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1432, 'Jane Jones', null, null, null, 9283, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1433, 'Grace Brown', null, null, null, 6619, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1434, 'Dan Garcia', null, null, null, 3647, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1435, 'Carol Garcia', null, null, null, 4542, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1436, 'Eve Garcia', null, null, null, 7099, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1437, 'John Johnson', null, null, null, 7470, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1438, 'Bob Wilson', null, null, null, 2340, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1439, 'Bob Doe', null, null, null, 6995, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1440, 'Jane Williams', null, null, null, 3320, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1441, 'Grace Wilson', null, null, null, 3091, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1442, 'Carol Davis', null, null, null, 2616, 2000, 3);
commit;
prompt 900 records committed...
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1443, 'John Johnson', null, null, null, 4622, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1444, 'Grace Doe', null, null, null, 8529, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1445, 'Dan Doe', null, null, null, 8854, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1446, 'Henry Jones', null, null, null, 2179, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1447, 'Eve Wilson', null, null, null, 6187, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1448, 'Henry Wilson', null, null, null, 6140, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1449, 'Carol Wilson', null, null, null, 9835, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1450, 'Jane Doe', null, null, null, 7825, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1451, 'Carol Wilson', null, null, null, 3108, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1452, 'Alice Williams', null, null, null, 10666, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1453, 'John Wilson', null, null, null, 1292, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1454, 'Eve Miller', null, null, null, 1468, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1455, 'Carol Williams', null, null, null, 9752, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1456, 'Carol Davis', null, null, null, 4678, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1457, 'Grace Miller', null, null, null, 7029, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1458, 'Frank Williams', null, null, null, 9767, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1459, 'Grace Garcia', null, null, null, 2721, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1460, 'Grace Doe', null, null, null, 11744, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1461, 'Grace Jones', null, null, null, 6787, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1462, 'Carol Miller', null, null, null, 9710, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1463, 'Dan Jones', null, null, null, 4894, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1464, 'Alice Brown', null, null, null, 4304, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1465, 'Carol Johnson', null, null, null, 6642, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1466, 'Eve Brown', null, null, null, 5125, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1467, 'Dan Brown', null, null, null, 2788, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1468, 'Alice Davis', null, null, null, 8991, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1469, 'Dan Smith', null, null, null, 1382, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1470, 'Grace Williams', null, null, null, 6666, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1471, 'Henry Johnson', null, null, null, 9007, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1472, 'Bob Miller', null, null, null, 5359, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1473, 'John Brown', null, null, null, 2352, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1474, 'Dan Williams', null, null, null, 3887, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1475, 'Grace Doe', null, null, null, 8302, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1476, 'Alice Jones', null, null, null, 6329, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1477, 'Carol Garcia', null, null, null, 10483, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1478, 'Alice Davis', null, null, null, 4835, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1479, 'Frank Doe', null, null, null, 5851, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1480, 'Eve Davis', null, null, null, 11096, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1481, 'Grace Smith', null, null, null, 8593, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1482, 'Bob Johnson', null, null, null, 6978, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1483, 'Eve Garcia', null, null, null, 7009, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1484, 'Dan Doe', null, null, null, 3979, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1485, 'Carol Jones', null, null, null, 4819, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1486, 'Bob Jones', null, null, null, 7381, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1487, 'Dan Garcia', null, null, null, 4272, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1488, 'Jane Brown', null, null, null, 8458, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1489, 'Eve Miller', null, null, null, 2547, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1490, 'John Smith', null, null, null, 6612, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1491, 'Jane Jones', null, null, null, 4837, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1492, 'Carol Brown', null, null, null, 10813, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1493, 'Dan Johnson', null, null, null, 8598, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1494, 'Henry Wilson', null, null, null, 1580, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1495, 'Henry Williams', null, null, null, 5278, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1496, 'Eve Davis', null, null, null, 4658, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1497, 'Bob Jones', null, null, null, 7978, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1498, 'Alice Johnson', null, null, null, 3396, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1499, 'Eve Garcia', null, null, null, 4436, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1500, 'John Miller', null, null, null, 1372, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1501, 'Carol Miller', null, null, null, 1189, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1502, 'Henry Garcia', null, null, null, 1538, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1503, 'Frank Jones', null, null, null, 6167, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1504, 'Dan Miller', null, null, null, 6859, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1505, 'Jane Williams', null, null, null, 3905, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1506, 'John Johnson', null, null, null, 5627, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1507, 'Grace Davis', null, null, null, 6470, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1508, 'Carol Davis', null, null, null, 7743, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1509, 'Frank Johnson', null, null, null, 3765, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1510, 'Carol Wilson', null, null, null, 8555, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1511, 'Henry Wilson', null, null, null, 8490, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1512, 'Dan Miller', null, null, null, 5874, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1513, 'Jane Johnson', null, null, null, 6645, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1514, 'Bob Davis', null, null, null, 6695, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1515, 'Jane Wilson', null, null, null, 5201, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1516, 'Eve Miller', null, null, null, 5224, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1517, 'Carol Davis', null, null, null, 3305, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1518, 'Henry Johnson', null, null, null, 4580, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1519, 'Jane Davis', null, null, null, 2794, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1520, 'Carol Miller', null, null, null, 4261, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1521, 'Carol Davis', null, null, null, 11577, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1522, 'Frank Brown', null, null, null, 2221, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1523, 'Dan Brown', null, null, null, 2236, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1524, 'Bob Smith', null, null, null, 2372, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1525, 'Frank Williams', null, null, null, 2801, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1526, 'Dan Williams', null, null, null, 5681, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1527, 'Bob Jones', null, null, null, 6858, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1528, 'Frank Brown', null, null, null, 3545, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1529, 'Jane Davis', null, null, null, 11228, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1530, 'Frank Johnson', null, null, null, 8349, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1531, 'Alice Johnson', null, null, null, 8555, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1532, 'Alice Garcia', null, null, null, 5704, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1533, 'Carol Jones', null, null, null, 3464, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1534, 'Henry Smith', null, null, null, 7311, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1535, 'Dan Doe', null, null, null, 5310, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1536, 'Jane Miller', null, null, null, 6658, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1537, 'Frank Johnson', null, null, null, 12161, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1538, 'John Miller', null, null, null, 6294, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1539, 'Dan Doe', null, null, null, 3444, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1540, 'John Williams', null, null, null, 2649, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1541, 'Eve Williams', null, null, null, 1523, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1542, 'Frank Doe', null, null, null, 2943, 2000, 3);
commit;
prompt 1000 records committed...
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1543, 'Eve Garcia', null, null, null, 10604, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1544, 'Henry Wilson', null, null, null, 3575, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1545, 'Henry Jones', null, null, null, 4834, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1546, 'John Miller', null, null, null, 6855, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1547, 'Eve Brown', null, null, null, 4677, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1548, 'Grace Smith', null, null, null, 9601, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1549, 'Eve Johnson', null, null, null, 3231, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1550, 'Bob Jones', null, null, null, 7836, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1551, 'Alice Garcia', null, null, null, 5100, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1552, 'Alice Garcia', null, null, null, 5068, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1553, 'Alice Brown', null, null, null, 7691, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1554, 'Eve Davis', null, null, null, 5835, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1555, 'Henry Jones', null, null, null, 7063, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1556, 'Eve Johnson', null, null, null, 9649, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1557, 'Alice Davis', null, null, null, 7094, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1558, 'Carol Brown', null, null, null, 9139, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1559, 'Henry Doe', null, null, null, 6115, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1560, 'Alice Johnson', null, null, null, 3248, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1561, 'Henry Miller', null, null, null, 1907, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1562, 'John Garcia', null, null, null, 8497, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1563, 'Alice Smith', null, null, null, 8701, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1564, 'Dan Johnson', null, null, null, 4592, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1565, 'Henry Garcia', null, null, null, 8824, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1566, 'Carol Wilson', null, null, null, 4759, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1567, 'Frank Smith', null, null, null, 3351, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1568, 'Frank Miller', null, null, null, 5425, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1569, 'Dan Williams', null, null, null, 1654, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1570, 'Jane Williams', null, null, null, 3934, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1571, 'Grace Doe', null, null, null, 7478, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1572, 'John Wilson', null, null, null, 4282, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1573, 'Henry Garcia', null, null, null, 11121, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1574, 'Grace Davis', null, null, null, 1450, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1575, 'Dan Williams', null, null, null, 3163, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1576, 'John Johnson', null, null, null, 3601, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1577, 'Eve Williams', null, null, null, 6224, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1578, 'Grace Garcia', null, null, null, 6563, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1579, 'Alice Johnson', null, null, null, 6973, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1580, 'John Wilson', null, null, null, 10947, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1581, 'Jane Williams', null, null, null, 5562, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1582, 'Grace Smith', null, null, null, 3134, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1583, 'Dan Doe', null, null, null, 3172, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1584, 'John Doe', null, null, null, 6436, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1585, 'Bob Garcia', null, null, null, 9456, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1586, 'Jane Johnson', null, null, null, 2353, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1587, 'Eve Miller', null, null, null, 7767, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1588, 'Frank Garcia', null, null, null, 5375, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1589, 'Bob Miller', null, null, null, 10479, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1590, 'Alice Miller', null, null, null, 10753, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1591, 'Henry Smith', null, null, null, 7738, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1592, 'Grace Williams', null, null, null, 6328, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1593, 'Bob Wilson', null, null, null, 12329, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1594, 'Frank Jones', null, null, null, 10964, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1595, 'Carol Williams', null, null, null, 2084, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1596, 'Grace Williams', null, null, null, 2403, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1597, 'Eve Johnson', null, null, null, 4166, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1598, 'Alice Johnson', null, null, null, 7395, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1599, 'Grace Williams', null, null, null, 6121, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1600, 'Carol Jones', null, null, null, 1713, 2000, 3);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1601, 'Grace Will', null, null, null, 5000, 2000, 3);
commit;
prompt 1059 records loaded
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
prompt 400 records committed...
insert into INCLUDE (professional_id, order_id)
values (503, 570);
insert into INCLUDE (professional_id, order_id)
values (506, 539);
insert into INCLUDE (professional_id, order_id)
values (508, 579);
insert into INCLUDE (professional_id, order_id)
values (509, 784);
insert into INCLUDE (professional_id, order_id)
values (510, 638);
insert into INCLUDE (professional_id, order_id)
values (510, 642);
insert into INCLUDE (professional_id, order_id)
values (510, 733);
insert into INCLUDE (professional_id, order_id)
values (511, 757);
insert into INCLUDE (professional_id, order_id)
values (513, 544);
insert into INCLUDE (professional_id, order_id)
values (513, 589);
insert into INCLUDE (professional_id, order_id)
values (513, 605);
insert into INCLUDE (professional_id, order_id)
values (521, 721);
insert into INCLUDE (professional_id, order_id)
values (523, 532);
insert into INCLUDE (professional_id, order_id)
values (525, 608);
insert into INCLUDE (professional_id, order_id)
values (526, 542);
insert into INCLUDE (professional_id, order_id)
values (526, 837);
insert into INCLUDE (professional_id, order_id)
values (527, 864);
insert into INCLUDE (professional_id, order_id)
values (529, 685);
insert into INCLUDE (professional_id, order_id)
values (530, 625);
insert into INCLUDE (professional_id, order_id)
values (530, 777);
insert into INCLUDE (professional_id, order_id)
values (532, 511);
insert into INCLUDE (professional_id, order_id)
values (532, 584);
insert into INCLUDE (professional_id, order_id)
values (533, 516);
insert into INCLUDE (professional_id, order_id)
values (534, 867);
insert into INCLUDE (professional_id, order_id)
values (536, 565);
insert into INCLUDE (professional_id, order_id)
values (537, 673);
insert into INCLUDE (professional_id, order_id)
values (538, 686);
insert into INCLUDE (professional_id, order_id)
values (540, 796);
insert into INCLUDE (professional_id, order_id)
values (541, 639);
insert into INCLUDE (professional_id, order_id)
values (542, 538);
insert into INCLUDE (professional_id, order_id)
values (543, 654);
insert into INCLUDE (professional_id, order_id)
values (544, 888);
insert into INCLUDE (professional_id, order_id)
values (546, 725);
insert into INCLUDE (professional_id, order_id)
values (550, 876);
insert into INCLUDE (professional_id, order_id)
values (552, 569);
insert into INCLUDE (professional_id, order_id)
values (552, 710);
insert into INCLUDE (professional_id, order_id)
values (554, 676);
insert into INCLUDE (professional_id, order_id)
values (558, 728);
insert into INCLUDE (professional_id, order_id)
values (558, 831);
insert into INCLUDE (professional_id, order_id)
values (560, 533);
insert into INCLUDE (professional_id, order_id)
values (560, 723);
insert into INCLUDE (professional_id, order_id)
values (560, 868);
insert into INCLUDE (professional_id, order_id)
values (560, 883);
insert into INCLUDE (professional_id, order_id)
values (562, 505);
insert into INCLUDE (professional_id, order_id)
values (562, 795);
insert into INCLUDE (professional_id, order_id)
values (563, 535);
insert into INCLUDE (professional_id, order_id)
values (565, 627);
insert into INCLUDE (professional_id, order_id)
values (565, 827);
insert into INCLUDE (professional_id, order_id)
values (568, 529);
insert into INCLUDE (professional_id, order_id)
values (568, 787);
insert into INCLUDE (professional_id, order_id)
values (569, 599);
insert into INCLUDE (professional_id, order_id)
values (570, 824);
insert into INCLUDE (professional_id, order_id)
values (570, 865);
insert into INCLUDE (professional_id, order_id)
values (570, 895);
insert into INCLUDE (professional_id, order_id)
values (572, 889);
insert into INCLUDE (professional_id, order_id)
values (573, 789);
insert into INCLUDE (professional_id, order_id)
values (574, 615);
insert into INCLUDE (professional_id, order_id)
values (576, 800);
insert into INCLUDE (professional_id, order_id)
values (577, 809);
insert into INCLUDE (professional_id, order_id)
values (581, 887);
insert into INCLUDE (professional_id, order_id)
values (586, 548);
insert into INCLUDE (professional_id, order_id)
values (587, 640);
insert into INCLUDE (professional_id, order_id)
values (588, 880);
insert into INCLUDE (professional_id, order_id)
values (589, 736);
insert into INCLUDE (professional_id, order_id)
values (592, 751);
insert into INCLUDE (professional_id, order_id)
values (593, 618);
insert into INCLUDE (professional_id, order_id)
values (594, 643);
insert into INCLUDE (professional_id, order_id)
values (595, 729);
insert into INCLUDE (professional_id, order_id)
values (595, 898);
insert into INCLUDE (professional_id, order_id)
values (596, 666);
insert into INCLUDE (professional_id, order_id)
values (596, 690);
insert into INCLUDE (professional_id, order_id)
values (597, 582);
insert into INCLUDE (professional_id, order_id)
values (599, 668);
insert into INCLUDE (professional_id, order_id)
values (601, 667);
insert into INCLUDE (professional_id, order_id)
values (603, 635);
insert into INCLUDE (professional_id, order_id)
values (603, 832);
insert into INCLUDE (professional_id, order_id)
values (607, 762);
insert into INCLUDE (professional_id, order_id)
values (608, 537);
insert into INCLUDE (professional_id, order_id)
values (608, 656);
insert into INCLUDE (professional_id, order_id)
values (609, 553);
insert into INCLUDE (professional_id, order_id)
values (611, 785);
insert into INCLUDE (professional_id, order_id)
values (612, 817);
insert into INCLUDE (professional_id, order_id)
values (619, 647);
insert into INCLUDE (professional_id, order_id)
values (619, 882);
insert into INCLUDE (professional_id, order_id)
values (624, 581);
insert into INCLUDE (professional_id, order_id)
values (628, 697);
insert into INCLUDE (professional_id, order_id)
values (630, 534);
insert into INCLUDE (professional_id, order_id)
values (631, 687);
insert into INCLUDE (professional_id, order_id)
values (631, 828);
insert into INCLUDE (professional_id, order_id)
values (635, 793);
insert into INCLUDE (professional_id, order_id)
values (635, 849);
insert into INCLUDE (professional_id, order_id)
values (636, 680);
insert into INCLUDE (professional_id, order_id)
values (637, 885);
insert into INCLUDE (professional_id, order_id)
values (638, 857);
insert into INCLUDE (professional_id, order_id)
values (639, 558);
insert into INCLUDE (professional_id, order_id)
values (640, 624);
insert into INCLUDE (professional_id, order_id)
values (641, 616);
insert into INCLUDE (professional_id, order_id)
values (641, 782);
insert into INCLUDE (professional_id, order_id)
values (642, 545);
insert into INCLUDE (professional_id, order_id)
values (642, 641);
commit;
prompt 500 records committed...
insert into INCLUDE (professional_id, order_id)
values (643, 507);
insert into INCLUDE (professional_id, order_id)
values (648, 562);
insert into INCLUDE (professional_id, order_id)
values (648, 774);
insert into INCLUDE (professional_id, order_id)
values (649, 896);
insert into INCLUDE (professional_id, order_id)
values (650, 577);
insert into INCLUDE (professional_id, order_id)
values (651, 501);
insert into INCLUDE (professional_id, order_id)
values (652, 573);
insert into INCLUDE (professional_id, order_id)
values (652, 833);
insert into INCLUDE (professional_id, order_id)
values (653, 786);
insert into INCLUDE (professional_id, order_id)
values (653, 806);
insert into INCLUDE (professional_id, order_id)
values (656, 588);
insert into INCLUDE (professional_id, order_id)
values (659, 752);
insert into INCLUDE (professional_id, order_id)
values (659, 874);
insert into INCLUDE (professional_id, order_id)
values (660, 720);
insert into INCLUDE (professional_id, order_id)
values (662, 679);
insert into INCLUDE (professional_id, order_id)
values (665, 893);
insert into INCLUDE (professional_id, order_id)
values (666, 508);
insert into INCLUDE (professional_id, order_id)
values (666, 598);
insert into INCLUDE (professional_id, order_id)
values (666, 699);
insert into INCLUDE (professional_id, order_id)
values (668, 540);
insert into INCLUDE (professional_id, order_id)
values (670, 659);
insert into INCLUDE (professional_id, order_id)
values (670, 834);
insert into INCLUDE (professional_id, order_id)
values (671, 781);
insert into INCLUDE (professional_id, order_id)
values (674, 564);
insert into INCLUDE (professional_id, order_id)
values (674, 603);
insert into INCLUDE (professional_id, order_id)
values (675, 563);
insert into INCLUDE (professional_id, order_id)
values (675, 703);
insert into INCLUDE (professional_id, order_id)
values (675, 750);
insert into INCLUDE (professional_id, order_id)
values (676, 593);
insert into INCLUDE (professional_id, order_id)
values (678, 713);
insert into INCLUDE (professional_id, order_id)
values (679, 873);
insert into INCLUDE (professional_id, order_id)
values (680, 727);
insert into INCLUDE (professional_id, order_id)
values (681, 583);
insert into INCLUDE (professional_id, order_id)
values (682, 791);
insert into INCLUDE (professional_id, order_id)
values (683, 708);
insert into INCLUDE (professional_id, order_id)
values (685, 549);
insert into INCLUDE (professional_id, order_id)
values (685, 779);
insert into INCLUDE (professional_id, order_id)
values (686, 765);
insert into INCLUDE (professional_id, order_id)
values (687, 637);
insert into INCLUDE (professional_id, order_id)
values (687, 652);
insert into INCLUDE (professional_id, order_id)
values (688, 823);
insert into INCLUDE (professional_id, order_id)
values (689, 682);
insert into INCLUDE (professional_id, order_id)
values (691, 731);
insert into INCLUDE (professional_id, order_id)
values (692, 799);
insert into INCLUDE (professional_id, order_id)
values (693, 531);
insert into INCLUDE (professional_id, order_id)
values (695, 592);
insert into INCLUDE (professional_id, order_id)
values (695, 657);
insert into INCLUDE (professional_id, order_id)
values (696, 649);
insert into INCLUDE (professional_id, order_id)
values (696, 822);
insert into INCLUDE (professional_id, order_id)
values (697, 738);
insert into INCLUDE (professional_id, order_id)
values (697, 812);
insert into INCLUDE (professional_id, order_id)
values (700, 630);
insert into INCLUDE (professional_id, order_id)
values (701, 622);
insert into INCLUDE (professional_id, order_id)
values (702, 700);
insert into INCLUDE (professional_id, order_id)
values (705, 658);
insert into INCLUDE (professional_id, order_id)
values (705, 681);
insert into INCLUDE (professional_id, order_id)
values (706, 646);
insert into INCLUDE (professional_id, order_id)
values (706, 829);
insert into INCLUDE (professional_id, order_id)
values (707, 704);
insert into INCLUDE (professional_id, order_id)
values (708, 510);
insert into INCLUDE (professional_id, order_id)
values (709, 773);
insert into INCLUDE (professional_id, order_id)
values (711, 571);
insert into INCLUDE (professional_id, order_id)
values (711, 695);
insert into INCLUDE (professional_id, order_id)
values (711, 861);
insert into INCLUDE (professional_id, order_id)
values (712, 737);
insert into INCLUDE (professional_id, order_id)
values (712, 825);
insert into INCLUDE (professional_id, order_id)
values (713, 522);
insert into INCLUDE (professional_id, order_id)
values (714, 759);
insert into INCLUDE (professional_id, order_id)
values (715, 587);
insert into INCLUDE (professional_id, order_id)
values (716, 717);
insert into INCLUDE (professional_id, order_id)
values (716, 771);
insert into INCLUDE (professional_id, order_id)
values (718, 696);
insert into INCLUDE (professional_id, order_id)
values (718, 838);
insert into INCLUDE (professional_id, order_id)
values (719, 663);
insert into INCLUDE (professional_id, order_id)
values (723, 746);
insert into INCLUDE (professional_id, order_id)
values (724, 557);
insert into INCLUDE (professional_id, order_id)
values (724, 803);
insert into INCLUDE (professional_id, order_id)
values (726, 518);
insert into INCLUDE (professional_id, order_id)
values (726, 870);
insert into INCLUDE (professional_id, order_id)
values (727, 578);
insert into INCLUDE (professional_id, order_id)
values (727, 620);
insert into INCLUDE (professional_id, order_id)
values (730, 621);
insert into INCLUDE (professional_id, order_id)
values (730, 844);
insert into INCLUDE (professional_id, order_id)
values (735, 783);
insert into INCLUDE (professional_id, order_id)
values (735, 816);
insert into INCLUDE (professional_id, order_id)
values (736, 886);
insert into INCLUDE (professional_id, order_id)
values (737, 664);
insert into INCLUDE (professional_id, order_id)
values (738, 653);
insert into INCLUDE (professional_id, order_id)
values (738, 856);
insert into INCLUDE (professional_id, order_id)
values (739, 634);
insert into INCLUDE (professional_id, order_id)
values (739, 669);
insert into INCLUDE (professional_id, order_id)
values (739, 858);
insert into INCLUDE (professional_id, order_id)
values (739, 881);
insert into INCLUDE (professional_id, order_id)
values (740, 766);
insert into INCLUDE (professional_id, order_id)
values (741, 749);
insert into INCLUDE (professional_id, order_id)
values (742, 674);
insert into INCLUDE (professional_id, order_id)
values (743, 591);
insert into INCLUDE (professional_id, order_id)
values (746, 502);
insert into INCLUDE (professional_id, order_id)
values (746, 684);
insert into INCLUDE (professional_id, order_id)
values (746, 730);
commit;
prompt 600 records committed...
insert into INCLUDE (professional_id, order_id)
values (747, 820);
insert into INCLUDE (professional_id, order_id)
values (748, 813);
insert into INCLUDE (professional_id, order_id)
values (748, 862);
insert into INCLUDE (professional_id, order_id)
values (749, 671);
insert into INCLUDE (professional_id, order_id)
values (749, 801);
insert into INCLUDE (professional_id, order_id)
values (750, 899);
insert into INCLUDE (professional_id, order_id)
values (752, 660);
insert into INCLUDE (professional_id, order_id)
values (752, 661);
insert into INCLUDE (professional_id, order_id)
values (752, 744);
insert into INCLUDE (professional_id, order_id)
values (753, 797);
insert into INCLUDE (professional_id, order_id)
values (755, 675);
insert into INCLUDE (professional_id, order_id)
values (756, 688);
insert into INCLUDE (professional_id, order_id)
values (757, 761);
insert into INCLUDE (professional_id, order_id)
values (759, 709);
insert into INCLUDE (professional_id, order_id)
values (761, 691);
insert into INCLUDE (professional_id, order_id)
values (761, 754);
insert into INCLUDE (professional_id, order_id)
values (761, 891);
insert into INCLUDE (professional_id, order_id)
values (764, 805);
insert into INCLUDE (professional_id, order_id)
values (764, 871);
insert into INCLUDE (professional_id, order_id)
values (766, 719);
insert into INCLUDE (professional_id, order_id)
values (767, 747);
insert into INCLUDE (professional_id, order_id)
values (768, 748);
insert into INCLUDE (professional_id, order_id)
values (769, 694);
insert into INCLUDE (professional_id, order_id)
values (772, 594);
insert into INCLUDE (professional_id, order_id)
values (778, 875);
insert into INCLUDE (professional_id, order_id)
values (779, 566);
insert into INCLUDE (professional_id, order_id)
values (780, 711);
insert into INCLUDE (professional_id, order_id)
values (780, 850);
insert into INCLUDE (professional_id, order_id)
values (780, 860);
insert into INCLUDE (professional_id, order_id)
values (782, 610);
insert into INCLUDE (professional_id, order_id)
values (786, 802);
insert into INCLUDE (professional_id, order_id)
values (787, 818);
insert into INCLUDE (professional_id, order_id)
values (788, 546);
insert into INCLUDE (professional_id, order_id)
values (790, 554);
insert into INCLUDE (professional_id, order_id)
values (790, 648);
insert into INCLUDE (professional_id, order_id)
values (792, 776);
insert into INCLUDE (professional_id, order_id)
values (793, 770);
insert into INCLUDE (professional_id, order_id)
values (797, 869);
insert into INCLUDE (professional_id, order_id)
values (799, 792);
insert into INCLUDE (professional_id, order_id)
values (802, 523);
insert into INCLUDE (professional_id, order_id)
values (803, 517);
insert into INCLUDE (professional_id, order_id)
values (803, 619);
insert into INCLUDE (professional_id, order_id)
values (805, 628);
insert into INCLUDE (professional_id, order_id)
values (805, 707);
insert into INCLUDE (professional_id, order_id)
values (806, 767);
insert into INCLUDE (professional_id, order_id)
values (807, 576);
insert into INCLUDE (professional_id, order_id)
values (807, 614);
insert into INCLUDE (professional_id, order_id)
values (809, 604);
insert into INCLUDE (professional_id, order_id)
values (809, 755);
insert into INCLUDE (professional_id, order_id)
values (810, 866);
insert into INCLUDE (professional_id, order_id)
values (811, 633);
insert into INCLUDE (professional_id, order_id)
values (811, 677);
insert into INCLUDE (professional_id, order_id)
values (811, 756);
insert into INCLUDE (professional_id, order_id)
values (813, 602);
insert into INCLUDE (professional_id, order_id)
values (813, 732);
insert into INCLUDE (professional_id, order_id)
values (815, 524);
insert into INCLUDE (professional_id, order_id)
values (818, 772);
insert into INCLUDE (professional_id, order_id)
values (818, 819);
insert into INCLUDE (professional_id, order_id)
values (820, 600);
insert into INCLUDE (professional_id, order_id)
values (820, 780);
insert into INCLUDE (professional_id, order_id)
values (820, 821);
insert into INCLUDE (professional_id, order_id)
values (821, 527);
insert into INCLUDE (professional_id, order_id)
values (822, 897);
insert into INCLUDE (professional_id, order_id)
values (824, 580);
insert into INCLUDE (professional_id, order_id)
values (825, 804);
insert into INCLUDE (professional_id, order_id)
values (826, 525);
insert into INCLUDE (professional_id, order_id)
values (826, 848);
insert into INCLUDE (professional_id, order_id)
values (827, 712);
insert into INCLUDE (professional_id, order_id)
values (827, 745);
insert into INCLUDE (professional_id, order_id)
values (827, 826);
insert into INCLUDE (professional_id, order_id)
values (832, 743);
insert into INCLUDE (professional_id, order_id)
values (833, 530);
insert into INCLUDE (professional_id, order_id)
values (833, 769);
insert into INCLUDE (professional_id, order_id)
values (835, 724);
insert into INCLUDE (professional_id, order_id)
values (836, 597);
insert into INCLUDE (professional_id, order_id)
values (839, 512);
insert into INCLUDE (professional_id, order_id)
values (839, 555);
insert into INCLUDE (professional_id, order_id)
values (840, 561);
insert into INCLUDE (professional_id, order_id)
values (843, 859);
insert into INCLUDE (professional_id, order_id)
values (844, 595);
insert into INCLUDE (professional_id, order_id)
values (845, 596);
insert into INCLUDE (professional_id, order_id)
values (845, 698);
insert into INCLUDE (professional_id, order_id)
values (845, 811);
insert into INCLUDE (professional_id, order_id)
values (845, 853);
insert into INCLUDE (professional_id, order_id)
values (846, 631);
insert into INCLUDE (professional_id, order_id)
values (850, 590);
insert into INCLUDE (professional_id, order_id)
values (851, 854);
insert into INCLUDE (professional_id, order_id)
values (852, 689);
insert into INCLUDE (professional_id, order_id)
values (852, 742);
insert into INCLUDE (professional_id, order_id)
values (853, 814);
insert into INCLUDE (professional_id, order_id)
values (854, 536);
insert into INCLUDE (professional_id, order_id)
values (858, 701);
insert into INCLUDE (professional_id, order_id)
values (858, 741);
insert into INCLUDE (professional_id, order_id)
values (858, 753);
insert into INCLUDE (professional_id, order_id)
values (859, 851);
insert into INCLUDE (professional_id, order_id)
values (860, 692);
insert into INCLUDE (professional_id, order_id)
values (862, 739);
insert into INCLUDE (professional_id, order_id)
values (863, 609);
insert into INCLUDE (professional_id, order_id)
values (864, 764);
insert into INCLUDE (professional_id, order_id)
values (865, 884);
commit;
prompt 700 records committed...
insert into INCLUDE (professional_id, order_id)
values (867, 513);
insert into INCLUDE (professional_id, order_id)
values (867, 716);
insert into INCLUDE (professional_id, order_id)
values (868, 678);
insert into INCLUDE (professional_id, order_id)
values (868, 852);
insert into INCLUDE (professional_id, order_id)
values (871, 702);
insert into INCLUDE (professional_id, order_id)
values (875, 519);
insert into INCLUDE (professional_id, order_id)
values (875, 551);
insert into INCLUDE (professional_id, order_id)
values (875, 662);
insert into INCLUDE (professional_id, order_id)
values (879, 526);
insert into INCLUDE (professional_id, order_id)
values (879, 559);
insert into INCLUDE (professional_id, order_id)
values (879, 650);
insert into INCLUDE (professional_id, order_id)
values (880, 672);
insert into INCLUDE (professional_id, order_id)
values (880, 706);
insert into INCLUDE (professional_id, order_id)
values (881, 839);
insert into INCLUDE (professional_id, order_id)
values (881, 894);
insert into INCLUDE (professional_id, order_id)
values (883, 514);
insert into INCLUDE (professional_id, order_id)
values (883, 794);
insert into INCLUDE (professional_id, order_id)
values (883, 843);
insert into INCLUDE (professional_id, order_id)
values (885, 601);
insert into INCLUDE (professional_id, order_id)
values (888, 550);
insert into INCLUDE (professional_id, order_id)
values (888, 734);
insert into INCLUDE (professional_id, order_id)
values (888, 778);
insert into INCLUDE (professional_id, order_id)
values (892, 509);
insert into INCLUDE (professional_id, order_id)
values (892, 670);
insert into INCLUDE (professional_id, order_id)
values (893, 575);
insert into INCLUDE (professional_id, order_id)
values (893, 807);
insert into INCLUDE (professional_id, order_id)
values (893, 842);
insert into INCLUDE (professional_id, order_id)
values (895, 568);
insert into INCLUDE (professional_id, order_id)
values (896, 726);
insert into INCLUDE (professional_id, order_id)
values (896, 830);
insert into INCLUDE (professional_id, order_id)
values (897, 714);
insert into INCLUDE (professional_id, order_id)
values (898, 552);
insert into INCLUDE (professional_id, order_id)
values (899, 606);
insert into INCLUDE (professional_id, order_id)
values (899, 715);
insert into INCLUDE (professional_id, order_id)
values (901, 788);
insert into INCLUDE (professional_id, order_id)
values (903, 607);
insert into INCLUDE (professional_id, order_id)
values (906, 586);
insert into INCLUDE (professional_id, order_id)
values (906, 758);
insert into INCLUDE (professional_id, order_id)
values (906, 810);
insert into INCLUDE (professional_id, order_id)
values (906, 836);
insert into INCLUDE (professional_id, order_id)
values (911, 506);
insert into INCLUDE (professional_id, order_id)
values (911, 768);
insert into INCLUDE (professional_id, order_id)
values (911, 879);
insert into INCLUDE (professional_id, order_id)
values (912, 775);
insert into INCLUDE (professional_id, order_id)
values (913, 612);
insert into INCLUDE (professional_id, order_id)
values (913, 645);
insert into INCLUDE (professional_id, order_id)
values (913, 763);
insert into INCLUDE (professional_id, order_id)
values (914, 626);
insert into INCLUDE (professional_id, order_id)
values (914, 835);
insert into INCLUDE (professional_id, order_id)
values (915, 520);
insert into INCLUDE (professional_id, order_id)
values (915, 655);
insert into INCLUDE (professional_id, order_id)
values (917, 613);
insert into INCLUDE (professional_id, order_id)
values (918, 740);
insert into INCLUDE (professional_id, order_id)
values (920, 556);
insert into INCLUDE (professional_id, order_id)
values (921, 651);
insert into INCLUDE (professional_id, order_id)
values (921, 841);
insert into INCLUDE (professional_id, order_id)
values (921, 878);
insert into INCLUDE (professional_id, order_id)
values (925, 847);
insert into INCLUDE (professional_id, order_id)
values (927, 528);
insert into INCLUDE (professional_id, order_id)
values (928, 585);
insert into INCLUDE (professional_id, order_id)
values (929, 543);
insert into INCLUDE (professional_id, order_id)
values (929, 572);
insert into INCLUDE (professional_id, order_id)
values (930, 504);
insert into INCLUDE (professional_id, order_id)
values (931, 760);
insert into INCLUDE (professional_id, order_id)
values (932, 521);
insert into INCLUDE (professional_id, order_id)
values (932, 560);
insert into INCLUDE (professional_id, order_id)
values (932, 815);
insert into INCLUDE (professional_id, order_id)
values (933, 790);
insert into INCLUDE (professional_id, order_id)
values (934, 632);
insert into INCLUDE (professional_id, order_id)
values (934, 872);
insert into INCLUDE (professional_id, order_id)
values (935, 705);
insert into INCLUDE (professional_id, order_id)
values (937, 798);
insert into INCLUDE (professional_id, order_id)
values (938, 863);
insert into INCLUDE (professional_id, order_id)
values (943, 547);
insert into INCLUDE (professional_id, order_id)
values (944, 877);
insert into INCLUDE (professional_id, order_id)
values (945, 567);
insert into INCLUDE (professional_id, order_id)
values (946, 629);
insert into INCLUDE (professional_id, order_id)
values (947, 503);
insert into INCLUDE (professional_id, order_id)
values (948, 644);
insert into INCLUDE (professional_id, order_id)
values (948, 665);
insert into INCLUDE (professional_id, order_id)
values (949, 617);
insert into INCLUDE (professional_id, order_id)
values (949, 840);
insert into INCLUDE (professional_id, order_id)
values (1201, 550);
insert into INCLUDE (professional_id, order_id)
values (1202, 612);
insert into INCLUDE (professional_id, order_id)
values (1203, 529);
insert into INCLUDE (professional_id, order_id)
values (1204, 691);
insert into INCLUDE (professional_id, order_id)
values (1204, 695);
insert into INCLUDE (professional_id, order_id)
values (1204, 731);
insert into INCLUDE (professional_id, order_id)
values (1205, 804);
insert into INCLUDE (professional_id, order_id)
values (1206, 851);
insert into INCLUDE (professional_id, order_id)
values (1208, 606);
insert into INCLUDE (professional_id, order_id)
values (1208, 639);
insert into INCLUDE (professional_id, order_id)
values (1209, 518);
insert into INCLUDE (professional_id, order_id)
values (1210, 849);
insert into INCLUDE (professional_id, order_id)
values (1212, 721);
insert into INCLUDE (professional_id, order_id)
values (1216, 733);
insert into INCLUDE (professional_id, order_id)
values (1217, 610);
insert into INCLUDE (professional_id, order_id)
values (1219, 667);
insert into INCLUDE (professional_id, order_id)
values (1219, 717);
insert into INCLUDE (professional_id, order_id)
values (1219, 786);
commit;
prompt 800 records committed...
insert into INCLUDE (professional_id, order_id)
values (1220, 743);
insert into INCLUDE (professional_id, order_id)
values (1221, 560);
insert into INCLUDE (professional_id, order_id)
values (1221, 822);
insert into INCLUDE (professional_id, order_id)
values (1229, 629);
insert into INCLUDE (professional_id, order_id)
values (1229, 850);
insert into INCLUDE (professional_id, order_id)
values (1231, 888);
insert into INCLUDE (professional_id, order_id)
values (1233, 692);
insert into INCLUDE (professional_id, order_id)
values (1237, 869);
insert into INCLUDE (professional_id, order_id)
values (1238, 504);
insert into INCLUDE (professional_id, order_id)
values (1238, 874);
insert into INCLUDE (professional_id, order_id)
values (1239, 586);
insert into INCLUDE (professional_id, order_id)
values (1239, 896);
insert into INCLUDE (professional_id, order_id)
values (1241, 531);
insert into INCLUDE (professional_id, order_id)
values (1241, 781);
insert into INCLUDE (professional_id, order_id)
values (1241, 832);
insert into INCLUDE (professional_id, order_id)
values (1241, 839);
insert into INCLUDE (professional_id, order_id)
values (1243, 613);
insert into INCLUDE (professional_id, order_id)
values (1244, 561);
insert into INCLUDE (professional_id, order_id)
values (1246, 583);
insert into INCLUDE (professional_id, order_id)
values (1246, 669);
insert into INCLUDE (professional_id, order_id)
values (1246, 889);
insert into INCLUDE (professional_id, order_id)
values (1248, 698);
insert into INCLUDE (professional_id, order_id)
values (1248, 747);
insert into INCLUDE (professional_id, order_id)
values (1250, 565);
insert into INCLUDE (professional_id, order_id)
values (1250, 818);
insert into INCLUDE (professional_id, order_id)
values (1253, 741);
insert into INCLUDE (professional_id, order_id)
values (1253, 885);
insert into INCLUDE (professional_id, order_id)
values (1257, 660);
insert into INCLUDE (professional_id, order_id)
values (1257, 712);
insert into INCLUDE (professional_id, order_id)
values (1257, 812);
insert into INCLUDE (professional_id, order_id)
values (1258, 573);
insert into INCLUDE (professional_id, order_id)
values (1258, 773);
insert into INCLUDE (professional_id, order_id)
values (1259, 513);
insert into INCLUDE (professional_id, order_id)
values (1259, 591);
insert into INCLUDE (professional_id, order_id)
values (1259, 737);
insert into INCLUDE (professional_id, order_id)
values (1260, 576);
insert into INCLUDE (professional_id, order_id)
values (1265, 502);
insert into INCLUDE (professional_id, order_id)
values (1268, 540);
insert into INCLUDE (professional_id, order_id)
values (1268, 841);
insert into INCLUDE (professional_id, order_id)
values (1271, 537);
insert into INCLUDE (professional_id, order_id)
values (1272, 622);
insert into INCLUDE (professional_id, order_id)
values (1272, 719);
insert into INCLUDE (professional_id, order_id)
values (1272, 766);
insert into INCLUDE (professional_id, order_id)
values (1272, 811);
insert into INCLUDE (professional_id, order_id)
values (1272, 819);
insert into INCLUDE (professional_id, order_id)
values (1274, 664);
insert into INCLUDE (professional_id, order_id)
values (1274, 694);
insert into INCLUDE (professional_id, order_id)
values (1277, 588);
insert into INCLUDE (professional_id, order_id)
values (1277, 872);
insert into INCLUDE (professional_id, order_id)
values (1278, 505);
insert into INCLUDE (professional_id, order_id)
values (1279, 595);
insert into INCLUDE (professional_id, order_id)
values (1280, 605);
insert into INCLUDE (professional_id, order_id)
values (1281, 861);
insert into INCLUDE (professional_id, order_id)
values (1284, 655);
insert into INCLUDE (professional_id, order_id)
values (1284, 685);
insert into INCLUDE (professional_id, order_id)
values (1285, 697);
insert into INCLUDE (professional_id, order_id)
values (1286, 542);
insert into INCLUDE (professional_id, order_id)
values (1286, 704);
insert into INCLUDE (professional_id, order_id)
values (1286, 803);
insert into INCLUDE (professional_id, order_id)
values (1288, 859);
insert into INCLUDE (professional_id, order_id)
values (1289, 525);
insert into INCLUDE (professional_id, order_id)
values (1289, 528);
insert into INCLUDE (professional_id, order_id)
values (1289, 793);
insert into INCLUDE (professional_id, order_id)
values (1289, 794);
insert into INCLUDE (professional_id, order_id)
values (1289, 848);
insert into INCLUDE (professional_id, order_id)
values (1289, 883);
insert into INCLUDE (professional_id, order_id)
values (1291, 516);
insert into INCLUDE (professional_id, order_id)
values (1291, 689);
insert into INCLUDE (professional_id, order_id)
values (1292, 657);
insert into INCLUDE (professional_id, order_id)
values (1292, 753);
insert into INCLUDE (professional_id, order_id)
values (1292, 754);
insert into INCLUDE (professional_id, order_id)
values (1292, 852);
insert into INCLUDE (professional_id, order_id)
values (1293, 809);
insert into INCLUDE (professional_id, order_id)
values (1295, 608);
insert into INCLUDE (professional_id, order_id)
values (1296, 696);
insert into INCLUDE (professional_id, order_id)
values (1297, 784);
insert into INCLUDE (professional_id, order_id)
values (1300, 539);
insert into INCLUDE (professional_id, order_id)
values (1301, 663);
insert into INCLUDE (professional_id, order_id)
values (1303, 705);
insert into INCLUDE (professional_id, order_id)
values (1303, 713);
insert into INCLUDE (professional_id, order_id)
values (1303, 764);
insert into INCLUDE (professional_id, order_id)
values (1303, 882);
insert into INCLUDE (professional_id, order_id)
values (1304, 752);
insert into INCLUDE (professional_id, order_id)
values (1306, 878);
insert into INCLUDE (professional_id, order_id)
values (1307, 830);
insert into INCLUDE (professional_id, order_id)
values (1307, 881);
insert into INCLUDE (professional_id, order_id)
values (1308, 514);
insert into INCLUDE (professional_id, order_id)
values (1308, 598);
insert into INCLUDE (professional_id, order_id)
values (1308, 688);
insert into INCLUDE (professional_id, order_id)
values (1310, 538);
insert into INCLUDE (professional_id, order_id)
values (1311, 836);
insert into INCLUDE (professional_id, order_id)
values (1313, 631);
insert into INCLUDE (professional_id, order_id)
values (1313, 651);
insert into INCLUDE (professional_id, order_id)
values (1315, 644);
insert into INCLUDE (professional_id, order_id)
values (1319, 637);
insert into INCLUDE (professional_id, order_id)
values (1320, 552);
insert into INCLUDE (professional_id, order_id)
values (1322, 626);
insert into INCLUDE (professional_id, order_id)
values (1322, 702);
insert into INCLUDE (professional_id, order_id)
values (1323, 648);
insert into INCLUDE (professional_id, order_id)
values (1323, 835);
commit;
prompt 900 records committed...
insert into INCLUDE (professional_id, order_id)
values (1325, 740);
insert into INCLUDE (professional_id, order_id)
values (1325, 771);
insert into INCLUDE (professional_id, order_id)
values (1325, 792);
insert into INCLUDE (professional_id, order_id)
values (1326, 517);
insert into INCLUDE (professional_id, order_id)
values (1326, 673);
insert into INCLUDE (professional_id, order_id)
values (1326, 724);
insert into INCLUDE (professional_id, order_id)
values (1327, 796);
insert into INCLUDE (professional_id, order_id)
values (1328, 523);
insert into INCLUDE (professional_id, order_id)
values (1329, 609);
insert into INCLUDE (professional_id, order_id)
values (1333, 736);
insert into INCLUDE (professional_id, order_id)
values (1335, 592);
insert into INCLUDE (professional_id, order_id)
values (1337, 831);
insert into INCLUDE (professional_id, order_id)
values (1338, 708);
insert into INCLUDE (professional_id, order_id)
values (1341, 824);
insert into INCLUDE (professional_id, order_id)
values (1344, 616);
insert into INCLUDE (professional_id, order_id)
values (1344, 727);
insert into INCLUDE (professional_id, order_id)
values (1347, 829);
insert into INCLUDE (professional_id, order_id)
values (1348, 519);
insert into INCLUDE (professional_id, order_id)
values (1348, 600);
insert into INCLUDE (professional_id, order_id)
values (1348, 661);
insert into INCLUDE (professional_id, order_id)
values (1350, 521);
insert into INCLUDE (professional_id, order_id)
values (1350, 679);
insert into INCLUDE (professional_id, order_id)
values (1351, 678);
insert into INCLUDE (professional_id, order_id)
values (1352, 790);
insert into INCLUDE (professional_id, order_id)
values (1352, 862);
insert into INCLUDE (professional_id, order_id)
values (1353, 687);
insert into INCLUDE (professional_id, order_id)
values (1356, 788);
insert into INCLUDE (professional_id, order_id)
values (1359, 546);
insert into INCLUDE (professional_id, order_id)
values (1359, 558);
insert into INCLUDE (professional_id, order_id)
values (1360, 597);
insert into INCLUDE (professional_id, order_id)
values (1360, 686);
insert into INCLUDE (professional_id, order_id)
values (1361, 601);
insert into INCLUDE (professional_id, order_id)
values (1361, 665);
insert into INCLUDE (professional_id, order_id)
values (1363, 820);
insert into INCLUDE (professional_id, order_id)
values (1364, 857);
insert into INCLUDE (professional_id, order_id)
values (1365, 575);
insert into INCLUDE (professional_id, order_id)
values (1365, 652);
insert into INCLUDE (professional_id, order_id)
values (1365, 680);
insert into INCLUDE (professional_id, order_id)
values (1367, 701);
insert into INCLUDE (professional_id, order_id)
values (1367, 770);
insert into INCLUDE (professional_id, order_id)
values (1368, 582);
insert into INCLUDE (professional_id, order_id)
values (1369, 860);
insert into INCLUDE (professional_id, order_id)
values (1370, 720);
insert into INCLUDE (professional_id, order_id)
values (1372, 699);
insert into INCLUDE (professional_id, order_id)
values (1373, 557);
insert into INCLUDE (professional_id, order_id)
values (1373, 577);
insert into INCLUDE (professional_id, order_id)
values (1377, 522);
insert into INCLUDE (professional_id, order_id)
values (1377, 746);
insert into INCLUDE (professional_id, order_id)
values (1377, 795);
insert into INCLUDE (professional_id, order_id)
values (1379, 674);
insert into INCLUDE (professional_id, order_id)
values (1379, 834);
insert into INCLUDE (professional_id, order_id)
values (1380, 634);
insert into INCLUDE (professional_id, order_id)
values (1380, 871);
insert into INCLUDE (professional_id, order_id)
values (1381, 654);
insert into INCLUDE (professional_id, order_id)
values (1382, 581);
insert into INCLUDE (professional_id, order_id)
values (1382, 620);
insert into INCLUDE (professional_id, order_id)
values (1383, 681);
insert into INCLUDE (professional_id, order_id)
values (1383, 783);
insert into INCLUDE (professional_id, order_id)
values (1383, 826);
insert into INCLUDE (professional_id, order_id)
values (1384, 844);
insert into INCLUDE (professional_id, order_id)
values (1385, 568);
insert into INCLUDE (professional_id, order_id)
values (1386, 520);
insert into INCLUDE (professional_id, order_id)
values (1387, 554);
insert into INCLUDE (professional_id, order_id)
values (1387, 590);
insert into INCLUDE (professional_id, order_id)
values (1387, 675);
insert into INCLUDE (professional_id, order_id)
values (1387, 758);
insert into INCLUDE (professional_id, order_id)
values (1388, 768);
insert into INCLUDE (professional_id, order_id)
values (1389, 656);
insert into INCLUDE (professional_id, order_id)
values (1389, 761);
insert into INCLUDE (professional_id, order_id)
values (1391, 562);
insert into INCLUDE (professional_id, order_id)
values (1396, 729);
insert into INCLUDE (professional_id, order_id)
values (1397, 700);
insert into INCLUDE (professional_id, order_id)
values (1400, 897);
insert into INCLUDE (professional_id, order_id)
values (1401, 551);
insert into INCLUDE (professional_id, order_id)
values (1401, 782);
insert into INCLUDE (professional_id, order_id)
values (1402, 789);
insert into INCLUDE (professional_id, order_id)
values (1405, 827);
insert into INCLUDE (professional_id, order_id)
values (1406, 507);
insert into INCLUDE (professional_id, order_id)
values (1406, 821);
insert into INCLUDE (professional_id, order_id)
values (1407, 535);
insert into INCLUDE (professional_id, order_id)
values (1409, 524);
insert into INCLUDE (professional_id, order_id)
values (1409, 607);
insert into INCLUDE (professional_id, order_id)
values (1410, 873);
insert into INCLUDE (professional_id, order_id)
values (1412, 776);
insert into INCLUDE (professional_id, order_id)
values (1412, 856);
insert into INCLUDE (professional_id, order_id)
values (1414, 594);
insert into INCLUDE (professional_id, order_id)
values (1416, 526);
insert into INCLUDE (professional_id, order_id)
values (1420, 642);
insert into INCLUDE (professional_id, order_id)
values (1423, 572);
insert into INCLUDE (professional_id, order_id)
values (1423, 604);
insert into INCLUDE (professional_id, order_id)
values (1424, 891);
insert into INCLUDE (professional_id, order_id)
values (1426, 865);
insert into INCLUDE (professional_id, order_id)
values (1428, 898);
insert into INCLUDE (professional_id, order_id)
values (1429, 748);
insert into INCLUDE (professional_id, order_id)
values (1431, 506);
insert into INCLUDE (professional_id, order_id)
values (1431, 589);
insert into INCLUDE (professional_id, order_id)
values (1431, 837);
insert into INCLUDE (professional_id, order_id)
values (1433, 571);
insert into INCLUDE (professional_id, order_id)
values (1435, 886);
insert into INCLUDE (professional_id, order_id)
values (1436, 866);
commit;
prompt 1000 records committed...
insert into INCLUDE (professional_id, order_id)
values (1437, 864);
insert into INCLUDE (professional_id, order_id)
values (1438, 602);
insert into INCLUDE (professional_id, order_id)
values (1440, 676);
insert into INCLUDE (professional_id, order_id)
values (1440, 744);
insert into INCLUDE (professional_id, order_id)
values (1441, 533);
insert into INCLUDE (professional_id, order_id)
values (1442, 640);
insert into INCLUDE (professional_id, order_id)
values (1442, 668);
insert into INCLUDE (professional_id, order_id)
values (1442, 742);
insert into INCLUDE (professional_id, order_id)
values (1444, 682);
insert into INCLUDE (professional_id, order_id)
values (1445, 791);
insert into INCLUDE (professional_id, order_id)
values (1445, 833);
insert into INCLUDE (professional_id, order_id)
values (1446, 512);
insert into INCLUDE (professional_id, order_id)
values (1446, 662);
insert into INCLUDE (professional_id, order_id)
values (1447, 725);
insert into INCLUDE (professional_id, order_id)
values (1448, 570);
insert into INCLUDE (professional_id, order_id)
values (1452, 825);
insert into INCLUDE (professional_id, order_id)
values (1452, 854);
insert into INCLUDE (professional_id, order_id)
values (1453, 532);
insert into INCLUDE (professional_id, order_id)
values (1453, 853);
insert into INCLUDE (professional_id, order_id)
values (1454, 635);
insert into INCLUDE (professional_id, order_id)
values (1454, 802);
insert into INCLUDE (professional_id, order_id)
values (1456, 503);
insert into INCLUDE (professional_id, order_id)
values (1456, 653);
insert into INCLUDE (professional_id, order_id)
values (1458, 670);
insert into INCLUDE (professional_id, order_id)
values (1459, 706);
insert into INCLUDE (professional_id, order_id)
values (1460, 585);
insert into INCLUDE (professional_id, order_id)
values (1460, 823);
insert into INCLUDE (professional_id, order_id)
values (1462, 734);
insert into INCLUDE (professional_id, order_id)
values (1464, 633);
insert into INCLUDE (professional_id, order_id)
values (1464, 643);
insert into INCLUDE (professional_id, order_id)
values (1464, 732);
insert into INCLUDE (professional_id, order_id)
values (1464, 842);
insert into INCLUDE (professional_id, order_id)
values (1464, 884);
insert into INCLUDE (professional_id, order_id)
values (1466, 799);
insert into INCLUDE (professional_id, order_id)
values (1469, 887);
insert into INCLUDE (professional_id, order_id)
values (1471, 772);
insert into INCLUDE (professional_id, order_id)
values (1474, 847);
insert into INCLUDE (professional_id, order_id)
values (1475, 810);
insert into INCLUDE (professional_id, order_id)
values (1475, 875);
insert into INCLUDE (professional_id, order_id)
values (1476, 750);
insert into INCLUDE (professional_id, order_id)
values (1476, 778);
insert into INCLUDE (professional_id, order_id)
values (1477, 632);
insert into INCLUDE (professional_id, order_id)
values (1479, 666);
insert into INCLUDE (professional_id, order_id)
values (1479, 710);
insert into INCLUDE (professional_id, order_id)
values (1480, 508);
insert into INCLUDE (professional_id, order_id)
values (1480, 618);
insert into INCLUDE (professional_id, order_id)
values (1480, 638);
insert into INCLUDE (professional_id, order_id)
values (1482, 501);
insert into INCLUDE (professional_id, order_id)
values (1485, 739);
insert into INCLUDE (professional_id, order_id)
values (1486, 838);
insert into INCLUDE (professional_id, order_id)
values (1488, 893);
insert into INCLUDE (professional_id, order_id)
values (1489, 895);
insert into INCLUDE (professional_id, order_id)
values (1492, 684);
insert into INCLUDE (professional_id, order_id)
values (1492, 769);
insert into INCLUDE (professional_id, order_id)
values (1494, 566);
insert into INCLUDE (professional_id, order_id)
values (1496, 843);
insert into INCLUDE (professional_id, order_id)
values (1498, 677);
insert into INCLUDE (professional_id, order_id)
values (1498, 779);
insert into INCLUDE (professional_id, order_id)
values (1498, 785);
insert into INCLUDE (professional_id, order_id)
values (1499, 580);
insert into INCLUDE (professional_id, order_id)
values (1501, 584);
insert into INCLUDE (professional_id, order_id)
values (1502, 751);
insert into INCLUDE (professional_id, order_id)
values (1502, 858);
insert into INCLUDE (professional_id, order_id)
values (1503, 544);
insert into INCLUDE (professional_id, order_id)
values (1504, 510);
insert into INCLUDE (professional_id, order_id)
values (1505, 730);
insert into INCLUDE (professional_id, order_id)
values (1506, 894);
insert into INCLUDE (professional_id, order_id)
values (1507, 828);
insert into INCLUDE (professional_id, order_id)
values (1509, 630);
insert into INCLUDE (professional_id, order_id)
values (1510, 749);
insert into INCLUDE (professional_id, order_id)
values (1510, 775);
insert into INCLUDE (professional_id, order_id)
values (1511, 756);
insert into INCLUDE (professional_id, order_id)
values (1511, 767);
insert into INCLUDE (professional_id, order_id)
values (1512, 625);
insert into INCLUDE (professional_id, order_id)
values (1512, 774);
insert into INCLUDE (professional_id, order_id)
values (1514, 578);
insert into INCLUDE (professional_id, order_id)
values (1515, 511);
insert into INCLUDE (professional_id, order_id)
values (1515, 621);
insert into INCLUDE (professional_id, order_id)
values (1519, 671);
insert into INCLUDE (professional_id, order_id)
values (1520, 690);
insert into INCLUDE (professional_id, order_id)
values (1521, 549);
insert into INCLUDE (professional_id, order_id)
values (1521, 658);
insert into INCLUDE (professional_id, order_id)
values (1523, 755);
insert into INCLUDE (professional_id, order_id)
values (1523, 813);
insert into INCLUDE (professional_id, order_id)
values (1524, 760);
insert into INCLUDE (professional_id, order_id)
values (1525, 615);
insert into INCLUDE (professional_id, order_id)
values (1526, 534);
insert into INCLUDE (professional_id, order_id)
values (1527, 817);
insert into INCLUDE (professional_id, order_id)
values (1529, 509);
insert into INCLUDE (professional_id, order_id)
values (1529, 759);
insert into INCLUDE (professional_id, order_id)
values (1530, 738);
insert into INCLUDE (professional_id, order_id)
values (1531, 868);
insert into INCLUDE (professional_id, order_id)
values (1532, 801);
insert into INCLUDE (professional_id, order_id)
values (1533, 709);
insert into INCLUDE (professional_id, order_id)
values (1533, 777);
insert into INCLUDE (professional_id, order_id)
values (1534, 619);
insert into INCLUDE (professional_id, order_id)
values (1536, 659);
insert into INCLUDE (professional_id, order_id)
values (1537, 556);
insert into INCLUDE (professional_id, order_id)
values (1537, 624);
insert into INCLUDE (professional_id, order_id)
values (1539, 527);
commit;
prompt 1100 records committed...
insert into INCLUDE (professional_id, order_id)
values (1539, 815);
insert into INCLUDE (professional_id, order_id)
values (1539, 876);
insert into INCLUDE (professional_id, order_id)
values (1542, 641);
insert into INCLUDE (professional_id, order_id)
values (1543, 596);
insert into INCLUDE (professional_id, order_id)
values (1543, 880);
insert into INCLUDE (professional_id, order_id)
values (1544, 536);
insert into INCLUDE (professional_id, order_id)
values (1547, 553);
insert into INCLUDE (professional_id, order_id)
values (1551, 614);
insert into INCLUDE (professional_id, order_id)
values (1551, 798);
insert into INCLUDE (professional_id, order_id)
values (1553, 569);
insert into INCLUDE (professional_id, order_id)
values (1553, 877);
insert into INCLUDE (professional_id, order_id)
values (1554, 628);
insert into INCLUDE (professional_id, order_id)
values (1554, 899);
insert into INCLUDE (professional_id, order_id)
values (1555, 530);
insert into INCLUDE (professional_id, order_id)
values (1555, 726);
insert into INCLUDE (professional_id, order_id)
values (1555, 780);
insert into INCLUDE (professional_id, order_id)
values (1556, 728);
insert into INCLUDE (professional_id, order_id)
values (1558, 547);
insert into INCLUDE (professional_id, order_id)
values (1558, 765);
insert into INCLUDE (professional_id, order_id)
values (1559, 548);
insert into INCLUDE (professional_id, order_id)
values (1559, 647);
insert into INCLUDE (professional_id, order_id)
values (1560, 787);
insert into INCLUDE (professional_id, order_id)
values (1562, 650);
insert into INCLUDE (professional_id, order_id)
values (1562, 870);
insert into INCLUDE (professional_id, order_id)
values (1564, 757);
insert into INCLUDE (professional_id, order_id)
values (1566, 806);
insert into INCLUDE (professional_id, order_id)
values (1567, 745);
insert into INCLUDE (professional_id, order_id)
values (1567, 800);
insert into INCLUDE (professional_id, order_id)
values (1568, 603);
insert into INCLUDE (professional_id, order_id)
values (1569, 863);
insert into INCLUDE (professional_id, order_id)
values (1571, 587);
insert into INCLUDE (professional_id, order_id)
values (1573, 579);
insert into INCLUDE (professional_id, order_id)
values (1573, 814);
insert into INCLUDE (professional_id, order_id)
values (1573, 879);
insert into INCLUDE (professional_id, order_id)
values (1574, 627);
insert into INCLUDE (professional_id, order_id)
values (1574, 867);
insert into INCLUDE (professional_id, order_id)
values (1575, 762);
insert into INCLUDE (professional_id, order_id)
values (1576, 593);
insert into INCLUDE (professional_id, order_id)
values (1577, 805);
insert into INCLUDE (professional_id, order_id)
values (1578, 649);
insert into INCLUDE (professional_id, order_id)
values (1579, 715);
insert into INCLUDE (professional_id, order_id)
values (1580, 645);
insert into INCLUDE (professional_id, order_id)
values (1580, 703);
insert into INCLUDE (professional_id, order_id)
values (1581, 807);
insert into INCLUDE (professional_id, order_id)
values (1582, 711);
insert into INCLUDE (professional_id, order_id)
values (1587, 716);
insert into INCLUDE (professional_id, order_id)
values (1588, 555);
insert into INCLUDE (professional_id, order_id)
values (1588, 567);
insert into INCLUDE (professional_id, order_id)
values (1588, 763);
insert into INCLUDE (professional_id, order_id)
values (1589, 559);
insert into INCLUDE (professional_id, order_id)
values (1590, 672);
insert into INCLUDE (professional_id, order_id)
values (1592, 714);
insert into INCLUDE (professional_id, order_id)
values (1592, 797);
insert into INCLUDE (professional_id, order_id)
values (1592, 816);
insert into INCLUDE (professional_id, order_id)
values (1592, 840);
insert into INCLUDE (professional_id, order_id)
values (1593, 617);
insert into INCLUDE (professional_id, order_id)
values (1593, 707);
insert into INCLUDE (professional_id, order_id)
values (1594, 563);
insert into INCLUDE (professional_id, order_id)
values (1594, 646);
insert into INCLUDE (professional_id, order_id)
values (1596, 599);
insert into INCLUDE (professional_id, order_id)
values (1598, 543);
insert into INCLUDE (professional_id, order_id)
values (1598, 545);
insert into INCLUDE (professional_id, order_id)
values (1599, 564);
insert into INCLUDE (professional_id, order_id)
values (1599, 723);
commit;
prompt 1164 records loaded
prompt Loading INSTRUMENT...
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Pan Flute', 822, 1);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Djembe', 808, 2);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Didgeridoo', 597, 3);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Banjo', 720, 4);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Tuba', 679, 5);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Flute', 865, 6);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Piano', 845, 7);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Ukulele', 614, 8);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Banjo', 942, 9);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Balalaika', 820, 10);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Zither', 826, 11);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Clarinet', 610, 12);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Bandoneon', 933, 13);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Recorder', 721, 14);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Marimba', 830, 15);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Triangle', 553, 16);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Electric Guitar', 751, 17);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Kazoo', 748, 18);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Trombone', 732, 19);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Double Bass', 719, 20);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Balalaika', 584, 21);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Drum', 693, 22);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Cello', 576, 23);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Vuvuzela', 938, 24);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Organ', 815, 25);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Sitar', 980, 26);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Accordion', 943, 27);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Guitar', 751, 28);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Piano', 898, 29);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Pan Flute', 704, 30);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Organ', 595, 31);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Organ', 595, 32);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Vuvuzela', 528, 33);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Synthesizer', 716, 34);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Triangle', 910, 35);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Piano', 526, 36);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Oboe', 582, 37);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Tambourine', 725, 38);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Tuba', 583, 39);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Lyre', 959, 40);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Harmonica', 841, 41);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Lute', 941, 42);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Clarinet', 626, 43);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Djembe', 954, 44);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Tuba', 502, 45);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Violin', 743, 46);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Cello', 637, 47);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Bassoon', 527, 48);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Piccolo', 968, 49);
insert into INSTRUMENT (instrument_name, price, instrument_id)
values ('Drum', 887, 50);
commit;
prompt 50 records loaded
prompt Loading ORDERINSTRUMENTS...
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (1, 501);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (1, 502);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (1, 516);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (1, 569);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (1, 590);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (1, 663);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (1, 685);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (1, 738);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (1, 789);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (1, 803);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (1, 882);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 501);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 521);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 524);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 550);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 609);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 658);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 695);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 705);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 724);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 813);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 815);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 835);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 848);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (2, 875);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (3, 566);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (3, 580);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (3, 597);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (3, 608);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (3, 733);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (3, 744);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (3, 813);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (3, 842);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (4, 511);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (4, 544);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (4, 560);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (4, 582);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (4, 594);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (4, 625);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (4, 825);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (4, 862);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (4, 878);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (5, 539);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (5, 598);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (5, 689);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (5, 725);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (5, 772);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (5, 897);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (6, 522);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (6, 635);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (6, 637);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (6, 668);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (6, 696);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (6, 773);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (6, 777);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (6, 850);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (6, 871);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (6, 891);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (6, 898);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (7, 593);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (7, 608);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (7, 657);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (7, 691);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (8, 585);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (8, 603);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (8, 826);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (8, 835);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (8, 889);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (9, 510);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (9, 529);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (9, 537);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (9, 560);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (9, 590);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (9, 594);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (9, 724);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (9, 806);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (9, 873);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (9, 877);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (10, 544);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (10, 712);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (10, 758);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (10, 776);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (10, 891);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (11, 529);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (11, 562);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (11, 578);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (11, 595);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (11, 667);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (11, 799);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (11, 891);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (11, 897);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (12, 540);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (12, 598);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (12, 668);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (12, 724);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (12, 732);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (12, 842);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (12, 884);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (13, 523);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (13, 585);
commit;
prompt 100 records committed...
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (13, 725);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (13, 759);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (13, 772);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (13, 836);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (14, 539);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (14, 552);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (14, 689);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (14, 691);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (14, 723);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (14, 742);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (14, 766);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (14, 798);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (14, 804);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (14, 820);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (14, 864);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (15, 501);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (15, 524);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (15, 593);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (15, 620);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (15, 633);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (15, 666);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (15, 696);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (15, 697);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (15, 730);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (15, 804);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (15, 857);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (16, 506);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (16, 508);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (16, 510);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (16, 594);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (16, 684);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (16, 780);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (16, 802);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (16, 818);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (16, 819);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (16, 829);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (16, 833);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (17, 508);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (17, 548);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (17, 608);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (17, 655);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (17, 680);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (17, 817);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (17, 833);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (17, 894);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (18, 551);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (18, 695);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (18, 757);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (18, 883);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (19, 517);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (19, 584);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (19, 649);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (19, 669);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (19, 695);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (19, 748);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (19, 767);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (19, 774);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (20, 545);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (20, 546);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (20, 621);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (20, 626);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (20, 628);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (20, 681);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (20, 711);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (20, 712);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (20, 792);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (20, 795);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (20, 863);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (21, 531);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (21, 537);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (21, 590);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (21, 607);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (21, 685);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (21, 719);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (21, 768);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (22, 554);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (22, 615);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (22, 635);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (22, 661);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (22, 665);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (22, 689);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (22, 874);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (22, 886);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (22, 894);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (23, 629);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (23, 671);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (23, 864);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (23, 865);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (24, 568);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (24, 605);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (24, 663);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (24, 682);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (24, 696);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (24, 719);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (24, 737);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (24, 844);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (24, 873);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (25, 525);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (25, 576);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (25, 626);
commit;
prompt 200 records committed...
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (25, 671);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (25, 710);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (25, 726);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (25, 734);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (25, 740);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (25, 840);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (26, 537);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (26, 567);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (26, 588);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (26, 630);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (26, 633);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (26, 835);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (26, 863);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (26, 865);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (26, 882);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 569);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 607);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 628);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 633);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 772);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 782);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 792);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 795);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 799);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 809);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 813);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 840);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 864);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 875);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (27, 896);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (28, 504);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (28, 539);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (28, 717);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (28, 725);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (28, 879);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (29, 559);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (29, 581);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (29, 799);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (29, 866);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (30, 561);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (30, 607);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (30, 753);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (31, 609);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (31, 613);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (31, 635);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (31, 668);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (31, 895);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (32, 554);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (32, 556);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (32, 572);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (32, 630);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (32, 645);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (32, 694);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (32, 697);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (32, 774);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (32, 823);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (32, 830);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (33, 568);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (33, 615);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (33, 637);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (33, 723);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (33, 783);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (33, 801);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (33, 822);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (34, 585);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (34, 586);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (34, 642);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (34, 657);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (34, 721);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (34, 816);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (35, 670);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (35, 676);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (35, 725);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (35, 825);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (35, 836);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (35, 881);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (35, 888);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (36, 537);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (36, 575);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (36, 595);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (36, 622);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (36, 667);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (36, 669);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (36, 751);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (36, 841);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (36, 867);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (37, 516);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (37, 531);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (37, 555);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (37, 572);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (37, 580);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (37, 757);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (37, 835);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (38, 504);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (38, 582);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (38, 608);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (38, 625);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (38, 637);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (38, 643);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (38, 663);
commit;
prompt 300 records committed...
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (38, 738);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (38, 755);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (39, 520);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (39, 532);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (39, 600);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (39, 757);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (39, 781);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (39, 820);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (39, 827);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (39, 862);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (40, 591);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (40, 599);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (40, 676);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (40, 746);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (40, 759);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (40, 786);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (40, 875);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (41, 519);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (41, 667);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (41, 704);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (41, 739);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (41, 789);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (41, 841);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (42, 560);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (42, 570);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (42, 648);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (42, 733);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (42, 854);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (42, 897);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (43, 505);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (43, 508);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (43, 519);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (43, 534);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (43, 587);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (43, 625);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (43, 654);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (43, 710);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (43, 786);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (43, 853);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (44, 527);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (44, 673);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (44, 707);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (44, 771);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (44, 796);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (44, 799);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (44, 844);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (45, 508);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (45, 525);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (45, 600);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (45, 627);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (45, 829);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (45, 850);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (46, 510);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (46, 556);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (46, 651);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (46, 657);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (46, 671);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (46, 694);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (46, 723);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (46, 809);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (46, 818);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (46, 825);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (47, 609);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (47, 661);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (47, 743);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (47, 751);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (47, 799);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (47, 835);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (48, 626);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (48, 659);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (48, 785);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (48, 819);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (48, 858);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (49, 511);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (49, 687);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (49, 705);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (49, 749);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (49, 883);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (49, 899);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (50, 529);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (50, 561);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (50, 629);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (50, 647);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (50, 818);
insert into ORDERINSTRUMENTS (instrument_id, order_id)
values (50, 848);
commit;
prompt 385 records loaded
prompt Loading PAYMENTMETHOD...
insert into PAYMENTMETHOD (pay_method_id, type)
values (0, 'Credit Card');
insert into PAYMENTMETHOD (pay_method_id, type)
values (1, 'Cash');
insert into PAYMENTMETHOD (pay_method_id, type)
values (2, 'PayPal');
insert into PAYMENTMETHOD (pay_method_id, type)
values (3, 'Bank Transfer');
insert into PAYMENTMETHOD (pay_method_id, type)
values (4, 'Bit');
insert into PAYMENTMETHOD (pay_method_id, type)
values (5, 'Check');
commit;
prompt 6 records loaded
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
prompt 400 records committed...
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (501, 12278, to_date('28-11-2022', 'dd-mm-yyyy'), 2, 501);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (502, 10225, to_date('31-12-2020', 'dd-mm-yyyy'), 2, 502);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (503, 10766, to_date('18-02-2028', 'dd-mm-yyyy'), 3, 503);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (504, 15848, to_date('03-03-2028', 'dd-mm-yyyy'), 1, 504);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (505, 12014, to_date('29-01-2021', 'dd-mm-yyyy'), 2, 505);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (506, 17304, to_date('23-11-2020', 'dd-mm-yyyy'), 0, 506);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (507, 16787, to_date('24-11-2027', 'dd-mm-yyyy'), 1, 507);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (508, 17550, to_date('27-08-2022', 'dd-mm-yyyy'), 4, 508);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (509, 18631, to_date('26-05-2025', 'dd-mm-yyyy'), 2, 509);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (510, 17605, to_date('13-02-2024', 'dd-mm-yyyy'), 2, 510);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (511, 8885, to_date('27-09-2021', 'dd-mm-yyyy'), 4, 511);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (512, 12092, to_date('11-08-2022', 'dd-mm-yyyy'), 5, 512);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (513, 21092, to_date('18-05-2020', 'dd-mm-yyyy'), 2, 513);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (514, 21948, to_date('13-07-2022', 'dd-mm-yyyy'), 4, 514);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (516, 14144, to_date('16-10-2022', 'dd-mm-yyyy'), 5, 516);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (517, 9824, to_date('19-04-2027', 'dd-mm-yyyy'), 5, 517);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (518, 13546, to_date('03-11-2025', 'dd-mm-yyyy'), 4, 518);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (519, 11499, to_date('16-03-2027', 'dd-mm-yyyy'), 4, 519);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (520, 15684, to_date('19-02-2026', 'dd-mm-yyyy'), 5, 520);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (521, 5693, to_date('07-03-2027', 'dd-mm-yyyy'), 1, 521);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (522, 4855, to_date('11-12-2023', 'dd-mm-yyyy'), 1, 522);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (523, 15314, to_date('14-06-2024', 'dd-mm-yyyy'), 4, 523);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (524, 12342, to_date('12-02-2024', 'dd-mm-yyyy'), 0, 524);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (525, 19357, to_date('10-01-2024', 'dd-mm-yyyy'), 2, 525);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (526, 15146, to_date('18-05-2023', 'dd-mm-yyyy'), 5, 526);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (527, 14246, to_date('09-02-2021', 'dd-mm-yyyy'), 5, 527);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (528, 18820, to_date('06-01-2022', 'dd-mm-yyyy'), 3, 528);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (529, 13260, to_date('14-03-2028', 'dd-mm-yyyy'), 0, 529);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (530, 14107, to_date('02-12-2025', 'dd-mm-yyyy'), 3, 530);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (531, 14383, to_date('04-12-2027', 'dd-mm-yyyy'), 4, 531);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (532, 7283, to_date('19-04-2023', 'dd-mm-yyyy'), 1, 532);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (533, 5985, to_date('21-05-2026', 'dd-mm-yyyy'), 3, 533);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (534, 12120, to_date('28-06-2026', 'dd-mm-yyyy'), 5, 534);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (535, 7585, to_date('19-03-2021', 'dd-mm-yyyy'), 2, 535);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (536, 4714, to_date('04-05-2024', 'dd-mm-yyyy'), 2, 536);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (537, 13329, to_date('28-10-2024', 'dd-mm-yyyy'), 0, 537);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (538, 12678, to_date('12-10-2028', 'dd-mm-yyyy'), 3, 538);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (539, 12913, to_date('21-03-2024', 'dd-mm-yyyy'), 0, 539);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (540, 13588, to_date('16-02-2028', 'dd-mm-yyyy'), 1, 540);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (542, 9327, to_date('29-05-2025', 'dd-mm-yyyy'), 3, 542);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (543, 13867, to_date('16-10-2022', 'dd-mm-yyyy'), 1, 543);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (544, 14180, to_date('20-09-2024', 'dd-mm-yyyy'), 2, 544);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (545, 14404, to_date('15-11-2021', 'dd-mm-yyyy'), 3, 545);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (546, 16459, to_date('02-06-2026', 'dd-mm-yyyy'), 0, 546);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (547, 11199, to_date('26-01-2028', 'dd-mm-yyyy'), 5, 547);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (548, 13736, to_date('09-08-2023', 'dd-mm-yyyy'), 1, 548);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (549, 15388, to_date('27-04-2022', 'dd-mm-yyyy'), 2, 549);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (550, 8353, to_date('28-06-2024', 'dd-mm-yyyy'), 5, 550);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (551, 17612, to_date('02-07-2025', 'dd-mm-yyyy'), 0, 551);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (552, 13862, to_date('20-03-2027', 'dd-mm-yyyy'), 3, 552);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (553, 13994, to_date('08-06-2021', 'dd-mm-yyyy'), 1, 553);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (554, 10419, to_date('21-02-2021', 'dd-mm-yyyy'), 5, 554);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (555, 15870, to_date('22-05-2028', 'dd-mm-yyyy'), 4, 555);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (556, 16092, to_date('08-04-2026', 'dd-mm-yyyy'), 1, 556);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (557, 10879, to_date('10-10-2021', 'dd-mm-yyyy'), 2, 557);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (558, 19324, to_date('03-10-2024', 'dd-mm-yyyy'), 3, 558);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (559, 21746, to_date('31-10-2024', 'dd-mm-yyyy'), 3, 559);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (560, 16718, to_date('19-08-2027', 'dd-mm-yyyy'), 4, 560);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (561, 4653, to_date('11-10-2021', 'dd-mm-yyyy'), 5, 561);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (562, 11656, to_date('06-05-2023', 'dd-mm-yyyy'), 1, 562);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (563, 21581, to_date('19-09-2022', 'dd-mm-yyyy'), 1, 563);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (564, 13201, to_date('01-12-2028', 'dd-mm-yyyy'), 2, 564);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (565, 12496, to_date('30-11-2022', 'dd-mm-yyyy'), 1, 565);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (566, 7353, to_date('14-03-2027', 'dd-mm-yyyy'), 5, 566);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (567, 11067, to_date('05-02-2022', 'dd-mm-yyyy'), 5, 567);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (568, 18697, to_date('01-02-2027', 'dd-mm-yyyy'), 2, 568);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (569, 16340, to_date('11-04-2021', 'dd-mm-yyyy'), 0, 569);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (570, 11881, to_date('28-12-2026', 'dd-mm-yyyy'), 1, 570);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (571, 14162, to_date('29-03-2025', 'dd-mm-yyyy'), 4, 571);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (572, 18083, to_date('01-08-2024', 'dd-mm-yyyy'), 4, 572);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (573, 4949, to_date('31-08-2027', 'dd-mm-yyyy'), 4, 573);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (575, 20481, to_date('31-12-2025', 'dd-mm-yyyy'), 3, 575);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (576, 19684, to_date('08-12-2025', 'dd-mm-yyyy'), 2, 576);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (577, 7562, to_date('11-06-2027', 'dd-mm-yyyy'), 0, 577);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (578, 12938, to_date('02-12-2023', 'dd-mm-yyyy'), 1, 578);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (579, 15721, to_date('08-06-2021', 'dd-mm-yyyy'), 0, 579);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (580, 6727, to_date('28-10-2028', 'dd-mm-yyyy'), 1, 580);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (581, 20151, to_date('16-08-2027', 'dd-mm-yyyy'), 2, 581);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (582, 6140, to_date('02-02-2028', 'dd-mm-yyyy'), 5, 582);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (583, 10157, to_date('08-10-2027', 'dd-mm-yyyy'), 1, 583);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (584, 3917, to_date('18-12-2024', 'dd-mm-yyyy'), 2, 584);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (585, 20815, to_date('07-01-2026', 'dd-mm-yyyy'), 3, 585);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (586, 8334, to_date('25-11-2020', 'dd-mm-yyyy'), 0, 586);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (587, 11237, to_date('03-03-2022', 'dd-mm-yyyy'), 0, 587);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (588, 15967, to_date('18-05-2028', 'dd-mm-yyyy'), 0, 588);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (589, 17433, to_date('01-06-2027', 'dd-mm-yyyy'), 5, 589);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (590, 11901, to_date('08-09-2025', 'dd-mm-yyyy'), 1, 590);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (591, 22493, to_date('02-11-2021', 'dd-mm-yyyy'), 5, 591);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (592, 13604, to_date('03-12-2024', 'dd-mm-yyyy'), 3, 592);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (593, 7961, to_date('02-02-2027', 'dd-mm-yyyy'), 2, 593);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (594, 6513, to_date('10-08-2023', 'dd-mm-yyyy'), 3, 594);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (595, 8270, to_date('18-06-2028', 'dd-mm-yyyy'), 2, 595);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (596, 12181, to_date('25-01-2027', 'dd-mm-yyyy'), 1, 596);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (597, 19613, to_date('13-02-2028', 'dd-mm-yyyy'), 4, 597);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (598, 18540, to_date('31-01-2023', 'dd-mm-yyyy'), 1, 598);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (599, 12370, to_date('03-02-2027', 'dd-mm-yyyy'), 3, 599);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (600, 7007, to_date('13-05-2024', 'dd-mm-yyyy'), 2, 600);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (601, 4077, to_date('25-04-2026', 'dd-mm-yyyy'), 0, 601);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (602, 6482, to_date('23-04-2023', 'dd-mm-yyyy'), 4, 602);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (603, 13119, to_date('09-10-2023', 'dd-mm-yyyy'), 5, 603);
commit;
prompt 500 records committed...
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (604, 19825, to_date('20-01-2027', 'dd-mm-yyyy'), 2, 604);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (605, 15654, to_date('02-10-2024', 'dd-mm-yyyy'), 3, 605);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (606, 12349, to_date('04-06-2025', 'dd-mm-yyyy'), 5, 606);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (607, 19380, to_date('17-09-2027', 'dd-mm-yyyy'), 2, 607);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (608, 11449, to_date('15-10-2024', 'dd-mm-yyyy'), 3, 608);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (609, 17751, to_date('07-03-2025', 'dd-mm-yyyy'), 2, 609);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (610, 15923, to_date('02-06-2022', 'dd-mm-yyyy'), 1, 610);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (612, 12821, to_date('23-05-2026', 'dd-mm-yyyy'), 4, 612);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (613, 17905, to_date('28-10-2026', 'dd-mm-yyyy'), 2, 613);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (614, 13318, to_date('30-10-2026', 'dd-mm-yyyy'), 5, 614);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (615, 13123, to_date('06-07-2022', 'dd-mm-yyyy'), 1, 615);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (616, 9785, to_date('12-02-2025', 'dd-mm-yyyy'), 2, 616);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (617, 13877, to_date('04-05-2020', 'dd-mm-yyyy'), 2, 617);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (618, 16315, to_date('08-11-2026', 'dd-mm-yyyy'), 3, 618);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (619, 13024, to_date('26-11-2027', 'dd-mm-yyyy'), 5, 619);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (620, 16742, to_date('25-11-2023', 'dd-mm-yyyy'), 3, 620);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (621, 15278, to_date('11-12-2020', 'dd-mm-yyyy'), 1, 621);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (622, 17315, to_date('28-05-2024', 'dd-mm-yyyy'), 0, 622);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (624, 22043, to_date('16-06-2023', 'dd-mm-yyyy'), 4, 624);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (625, 9839, to_date('28-12-2024', 'dd-mm-yyyy'), 0, 625);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (626, 12550, to_date('18-03-2023', 'dd-mm-yyyy'), 0, 626);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (627, 11648, to_date('25-02-2025', 'dd-mm-yyyy'), 0, 627);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (628, 14219, to_date('03-05-2022', 'dd-mm-yyyy'), 1, 628);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (629, 7447, to_date('28-06-2028', 'dd-mm-yyyy'), 5, 629);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (630, 14861, to_date('21-01-2026', 'dd-mm-yyyy'), 1, 630);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (631, 13676, to_date('24-05-2021', 'dd-mm-yyyy'), 0, 631);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (632, 18623, to_date('10-03-2026', 'dd-mm-yyyy'), 5, 632);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (633, 16656, to_date('11-05-2023', 'dd-mm-yyyy'), 5, 633);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (634, 9745, to_date('16-09-2021', 'dd-mm-yyyy'), 2, 634);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (635, 10542, to_date('01-10-2021', 'dd-mm-yyyy'), 1, 635);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (637, 11759, to_date('15-05-2024', 'dd-mm-yyyy'), 2, 637);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (638, 16496, to_date('16-02-2025', 'dd-mm-yyyy'), 3, 638);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (639, 7356, to_date('23-08-2026', 'dd-mm-yyyy'), 0, 639);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (640, 4717, to_date('18-05-2028', 'dd-mm-yyyy'), 0, 640);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (641, 9233, to_date('07-03-2020', 'dd-mm-yyyy'), 3, 641);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (642, 8986, to_date('08-01-2021', 'dd-mm-yyyy'), 5, 642);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (643, 11346, to_date('05-03-2024', 'dd-mm-yyyy'), 5, 643);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (644, 17139, to_date('21-01-2024', 'dd-mm-yyyy'), 0, 644);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (645, 20793, to_date('12-10-2022', 'dd-mm-yyyy'), 3, 645);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (646, 12805, to_date('08-11-2022', 'dd-mm-yyyy'), 0, 646);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (647, 15969, to_date('09-02-2023', 'dd-mm-yyyy'), 4, 647);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (648, 9827, to_date('26-06-2028', 'dd-mm-yyyy'), 3, 648);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (649, 13611, to_date('21-04-2023', 'dd-mm-yyyy'), 0, 649);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (650, 18866, to_date('06-11-2020', 'dd-mm-yyyy'), 1, 650);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (651, 14280, to_date('12-11-2022', 'dd-mm-yyyy'), 0, 651);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (652, 17323, to_date('07-08-2021', 'dd-mm-yyyy'), 3, 652);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (653, 6951, to_date('03-02-2024', 'dd-mm-yyyy'), 5, 653);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (654, 20179, to_date('09-08-2026', 'dd-mm-yyyy'), 5, 654);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (655, 16913, to_date('14-03-2024', 'dd-mm-yyyy'), 4, 655);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (656, 8707, to_date('18-05-2023', 'dd-mm-yyyy'), 3, 656);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (657, 18668, to_date('02-05-2022', 'dd-mm-yyyy'), 3, 657);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (658, 17067, to_date('08-05-2028', 'dd-mm-yyyy'), 5, 658);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (659, 11836, to_date('21-05-2024', 'dd-mm-yyyy'), 4, 659);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (660, 17250, to_date('20-02-2021', 'dd-mm-yyyy'), 2, 660);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (661, 10186, to_date('13-10-2020', 'dd-mm-yyyy'), 3, 661);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (662, 8890, to_date('28-12-2023', 'dd-mm-yyyy'), 2, 662);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (663, 13637, to_date('28-01-2024', 'dd-mm-yyyy'), 5, 663);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (664, 5320, to_date('01-09-2028', 'dd-mm-yyyy'), 1, 664);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (665, 9893, to_date('27-04-2026', 'dd-mm-yyyy'), 2, 665);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (666, 15087, to_date('24-05-2022', 'dd-mm-yyyy'), 0, 666);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (667, 17776, to_date('05-04-2021', 'dd-mm-yyyy'), 5, 667);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (668, 13015, to_date('28-10-2024', 'dd-mm-yyyy'), 3, 668);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (669, 9995, to_date('25-05-2026', 'dd-mm-yyyy'), 5, 669);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (670, 18080, to_date('14-09-2022', 'dd-mm-yyyy'), 4, 670);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (671, 6159, to_date('02-12-2023', 'dd-mm-yyyy'), 5, 671);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (672, 19974, to_date('27-05-2025', 'dd-mm-yyyy'), 1, 672);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (673, 7755, to_date('19-07-2025', 'dd-mm-yyyy'), 2, 673);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (674, 11135, to_date('10-07-2028', 'dd-mm-yyyy'), 1, 674);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (675, 5081, to_date('13-04-2025', 'dd-mm-yyyy'), 0, 675);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (676, 13195, to_date('28-05-2022', 'dd-mm-yyyy'), 4, 676);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (677, 12995, to_date('13-08-2028', 'dd-mm-yyyy'), 4, 677);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (678, 10450, to_date('31-03-2021', 'dd-mm-yyyy'), 2, 678);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (679, 8243, to_date('03-11-2022', 'dd-mm-yyyy'), 4, 679);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (680, 21977, to_date('20-12-2021', 'dd-mm-yyyy'), 1, 680);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (681, 8643, to_date('07-05-2021', 'dd-mm-yyyy'), 4, 681);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (682, 18741, to_date('29-11-2025', 'dd-mm-yyyy'), 1, 682);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (684, 18296, to_date('01-08-2027', 'dd-mm-yyyy'), 4, 684);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (685, 14239, to_date('16-05-2028', 'dd-mm-yyyy'), 5, 685);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (686, 18427, to_date('06-06-2027', 'dd-mm-yyyy'), 4, 686);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (687, 13900, to_date('18-04-2027', 'dd-mm-yyyy'), 5, 687);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (688, 20026, to_date('28-05-2024', 'dd-mm-yyyy'), 2, 688);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (689, 8910, to_date('26-12-2024', 'dd-mm-yyyy'), 2, 689);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (690, 12667, to_date('11-12-2027', 'dd-mm-yyyy'), 2, 690);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (691, 8532, to_date('01-06-2024', 'dd-mm-yyyy'), 2, 691);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (692, 15743, to_date('24-09-2022', 'dd-mm-yyyy'), 0, 692);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (694, 6759, to_date('13-09-2025', 'dd-mm-yyyy'), 4, 694);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (695, 14123, to_date('11-02-2025', 'dd-mm-yyyy'), 3, 695);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (696, 13909, to_date('27-12-2022', 'dd-mm-yyyy'), 4, 696);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (697, 20664, to_date('25-08-2025', 'dd-mm-yyyy'), 2, 697);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (698, 4813, to_date('30-09-2021', 'dd-mm-yyyy'), 3, 698);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (699, 7006, to_date('12-07-2024', 'dd-mm-yyyy'), 0, 699);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (700, 17575, to_date('31-10-2027', 'dd-mm-yyyy'), 2, 700);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (701, 9241, to_date('22-06-2027', 'dd-mm-yyyy'), 1, 701);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (702, 13124, to_date('07-04-2028', 'dd-mm-yyyy'), 1, 702);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (703, 21564, to_date('16-01-2023', 'dd-mm-yyyy'), 0, 703);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (704, 17135, to_date('11-02-2022', 'dd-mm-yyyy'), 2, 704);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (705, 13868, to_date('04-06-2026', 'dd-mm-yyyy'), 2, 705);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (706, 11942, to_date('12-06-2027', 'dd-mm-yyyy'), 2, 706);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (707, 20005, to_date('07-06-2022', 'dd-mm-yyyy'), 4, 707);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (708, 15859, to_date('07-11-2023', 'dd-mm-yyyy'), 0, 708);
commit;
prompt 600 records committed...
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (709, 13291, to_date('01-10-2022', 'dd-mm-yyyy'), 4, 709);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (710, 14176, to_date('23-01-2021', 'dd-mm-yyyy'), 0, 710);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (711, 8615, to_date('15-11-2021', 'dd-mm-yyyy'), 2, 711);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (712, 19546, to_date('13-07-2023', 'dd-mm-yyyy'), 2, 712);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (713, 8120, to_date('01-06-2022', 'dd-mm-yyyy'), 0, 713);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (714, 8544, to_date('20-04-2025', 'dd-mm-yyyy'), 3, 714);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (715, 14722, to_date('18-03-2025', 'dd-mm-yyyy'), 4, 715);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (716, 17298, to_date('17-04-2027', 'dd-mm-yyyy'), 2, 716);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (717, 15831, to_date('26-01-2022', 'dd-mm-yyyy'), 2, 717);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (719, 19085, to_date('20-02-2028', 'dd-mm-yyyy'), 4, 719);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (720, 13891, to_date('06-11-2025', 'dd-mm-yyyy'), 3, 720);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (721, 18792, to_date('02-11-2028', 'dd-mm-yyyy'), 1, 721);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (723, 11007, to_date('19-02-2028', 'dd-mm-yyyy'), 0, 723);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (724, 7218, to_date('07-03-2028', 'dd-mm-yyyy'), 4, 724);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (725, 18396, to_date('02-06-2028', 'dd-mm-yyyy'), 1, 725);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (726, 8973, to_date('18-12-2024', 'dd-mm-yyyy'), 0, 726);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (727, 11763, to_date('18-05-2021', 'dd-mm-yyyy'), 5, 727);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (728, 13415, to_date('27-05-2022', 'dd-mm-yyyy'), 0, 728);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (729, 9955, to_date('16-04-2024', 'dd-mm-yyyy'), 4, 729);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (730, 11665, to_date('17-05-2021', 'dd-mm-yyyy'), 0, 730);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (731, 12833, to_date('02-12-2024', 'dd-mm-yyyy'), 5, 731);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (732, 9056, to_date('11-04-2025', 'dd-mm-yyyy'), 4, 732);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (733, 11399, to_date('07-01-2021', 'dd-mm-yyyy'), 5, 733);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (734, 14723, to_date('28-05-2023', 'dd-mm-yyyy'), 0, 734);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (736, 17913, to_date('10-05-2024', 'dd-mm-yyyy'), 4, 736);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (737, 21613, to_date('14-12-2024', 'dd-mm-yyyy'), 3, 737);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (738, 15242, to_date('28-12-2027', 'dd-mm-yyyy'), 1, 738);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (739, 13445, to_date('30-07-2027', 'dd-mm-yyyy'), 2, 739);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (740, 15231, to_date('21-08-2023', 'dd-mm-yyyy'), 5, 740);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (741, 9593, to_date('30-10-2020', 'dd-mm-yyyy'), 4, 741);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (742, 5889, to_date('19-04-2024', 'dd-mm-yyyy'), 0, 742);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (743, 10101, to_date('07-04-2027', 'dd-mm-yyyy'), 2, 743);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (744, 9452, to_date('20-03-2028', 'dd-mm-yyyy'), 3, 744);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (745, 9643, to_date('18-12-2028', 'dd-mm-yyyy'), 0, 745);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (746, 8794, to_date('16-06-2025', 'dd-mm-yyyy'), 0, 746);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (747, 12684, to_date('31-10-2023', 'dd-mm-yyyy'), 0, 747);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (748, 15847, to_date('27-06-2021', 'dd-mm-yyyy'), 0, 748);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (749, 12783, to_date('21-03-2026', 'dd-mm-yyyy'), 4, 749);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (750, 16946, to_date('19-10-2024', 'dd-mm-yyyy'), 0, 750);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (751, 7038, to_date('28-01-2027', 'dd-mm-yyyy'), 0, 751);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (752, 12682, to_date('03-08-2026', 'dd-mm-yyyy'), 2, 752);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (753, 22065, to_date('18-10-2028', 'dd-mm-yyyy'), 1, 753);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (754, 16381, to_date('10-08-2023', 'dd-mm-yyyy'), 2, 754);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (755, 12352, to_date('30-01-2025', 'dd-mm-yyyy'), 5, 755);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (756, 18089, to_date('31-05-2022', 'dd-mm-yyyy'), 2, 756);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (757, 11416, to_date('08-08-2025', 'dd-mm-yyyy'), 3, 757);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (758, 9780, to_date('05-07-2027', 'dd-mm-yyyy'), 0, 758);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (759, 14209, to_date('10-08-2025', 'dd-mm-yyyy'), 2, 759);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (760, 6091, to_date('30-03-2026', 'dd-mm-yyyy'), 4, 760);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (761, 10888, to_date('18-09-2028', 'dd-mm-yyyy'), 3, 761);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (762, 4805, to_date('24-01-2028', 'dd-mm-yyyy'), 4, 762);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (763, 14626, to_date('10-12-2024', 'dd-mm-yyyy'), 5, 763);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (764, 10665, to_date('31-10-2027', 'dd-mm-yyyy'), 1, 764);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (765, 15822, to_date('11-03-2024', 'dd-mm-yyyy'), 0, 765);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (766, 17340, to_date('19-02-2024', 'dd-mm-yyyy'), 5, 766);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (767, 11901, to_date('25-10-2025', 'dd-mm-yyyy'), 1, 767);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (768, 9936, to_date('18-07-2028', 'dd-mm-yyyy'), 0, 768);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (769, 17857, to_date('18-04-2022', 'dd-mm-yyyy'), 4, 769);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (770, 6597, to_date('26-01-2023', 'dd-mm-yyyy'), 0, 770);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (771, 16912, to_date('02-05-2021', 'dd-mm-yyyy'), 5, 771);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (772, 18711, to_date('30-10-2027', 'dd-mm-yyyy'), 0, 772);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (773, 9467, to_date('14-10-2021', 'dd-mm-yyyy'), 4, 773);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (774, 12973, to_date('30-11-2026', 'dd-mm-yyyy'), 2, 774);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (775, 16285, to_date('20-12-2025', 'dd-mm-yyyy'), 0, 775);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (776, 8425, to_date('02-03-2026', 'dd-mm-yyyy'), 0, 776);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (777, 6223, to_date('24-12-2028', 'dd-mm-yyyy'), 3, 777);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (778, 10527, to_date('15-01-2020', 'dd-mm-yyyy'), 0, 778);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (779, 7207, to_date('19-02-2021', 'dd-mm-yyyy'), 5, 779);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (780, 10217, to_date('01-04-2026', 'dd-mm-yyyy'), 3, 780);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (781, 18959, to_date('18-08-2022', 'dd-mm-yyyy'), 5, 781);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (782, 14111, to_date('26-11-2021', 'dd-mm-yyyy'), 0, 782);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (783, 10887, to_date('03-11-2026', 'dd-mm-yyyy'), 0, 783);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (784, 16240, to_date('30-01-2025', 'dd-mm-yyyy'), 2, 784);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (785, 9433, to_date('13-10-2027', 'dd-mm-yyyy'), 2, 785);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (786, 18451, to_date('30-12-2027', 'dd-mm-yyyy'), 2, 786);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (787, 10060, to_date('04-06-2027', 'dd-mm-yyyy'), 2, 787);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (788, 9183, to_date('21-02-2028', 'dd-mm-yyyy'), 2, 788);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (789, 8667, to_date('09-05-2023', 'dd-mm-yyyy'), 2, 789);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (790, 16116, to_date('07-01-2024', 'dd-mm-yyyy'), 4, 790);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (791, 17372, to_date('19-06-2021', 'dd-mm-yyyy'), 1, 791);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (792, 18648, to_date('07-12-2028', 'dd-mm-yyyy'), 3, 792);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (793, 20508, to_date('02-12-2021', 'dd-mm-yyyy'), 1, 793);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (794, 22036, to_date('31-10-2026', 'dd-mm-yyyy'), 2, 794);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (795, 12447, to_date('28-03-2027', 'dd-mm-yyyy'), 3, 795);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (796, 4784, to_date('02-07-2025', 'dd-mm-yyyy'), 2, 796);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (797, 13688, to_date('12-12-2023', 'dd-mm-yyyy'), 5, 797);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (798, 11834, to_date('09-12-2026', 'dd-mm-yyyy'), 3, 798);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (799, 16169, to_date('10-06-2021', 'dd-mm-yyyy'), 1, 799);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (800, 4725, to_date('10-09-2021', 'dd-mm-yyyy'), 2, 800);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (801, 7463, to_date('15-08-2027', 'dd-mm-yyyy'), 4, 801);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (802, 11053, to_date('19-04-2024', 'dd-mm-yyyy'), 0, 802);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (803, 17099, to_date('08-12-2024', 'dd-mm-yyyy'), 1, 803);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (804, 13200, to_date('01-05-2026', 'dd-mm-yyyy'), 1, 804);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (805, 10280, to_date('23-10-2025', 'dd-mm-yyyy'), 5, 805);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (806, 11772, to_date('24-10-2027', 'dd-mm-yyyy'), 1, 806);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (807, 13538, to_date('29-10-2020', 'dd-mm-yyyy'), 4, 807);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (809, 19546, to_date('17-12-2022', 'dd-mm-yyyy'), 3, 809);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (810, 14481, to_date('19-11-2025', 'dd-mm-yyyy'), 5, 810);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (811, 16852, to_date('04-02-2022', 'dd-mm-yyyy'), 2, 811);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (812, 17061, to_date('01-01-2028', 'dd-mm-yyyy'), 0, 812);
commit;
prompt 700 records committed...
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (813, 5590, to_date('14-11-2025', 'dd-mm-yyyy'), 4, 813);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (814, 12377, to_date('27-09-2027', 'dd-mm-yyyy'), 2, 814);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (815, 6161, to_date('24-07-2023', 'dd-mm-yyyy'), 1, 815);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (816, 14161, to_date('11-05-2028', 'dd-mm-yyyy'), 1, 816);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (817, 14934, to_date('21-09-2027', 'dd-mm-yyyy'), 0, 817);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (818, 10543, to_date('27-06-2025', 'dd-mm-yyyy'), 5, 818);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (819, 23504, to_date('24-12-2024', 'dd-mm-yyyy'), 5, 819);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (820, 15418, to_date('09-12-2024', 'dd-mm-yyyy'), 0, 820);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (821, 12613, to_date('29-09-2024', 'dd-mm-yyyy'), 2, 821);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (822, 19050, to_date('11-02-2026', 'dd-mm-yyyy'), 2, 822);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (823, 14872, to_date('21-06-2026', 'dd-mm-yyyy'), 0, 823);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (824, 12713, to_date('20-12-2028', 'dd-mm-yyyy'), 1, 824);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (825, 22153, to_date('22-05-2026', 'dd-mm-yyyy'), 1, 825);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (826, 10148, to_date('16-11-2025', 'dd-mm-yyyy'), 3, 826);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (827, 13651, to_date('07-08-2025', 'dd-mm-yyyy'), 3, 827);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (828, 15798, to_date('15-08-2023', 'dd-mm-yyyy'), 3, 828);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (829, 6930, to_date('26-12-2021', 'dd-mm-yyyy'), 2, 829);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (830, 3570, to_date('03-10-2026', 'dd-mm-yyyy'), 5, 830);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (831, 5557, to_date('07-11-2020', 'dd-mm-yyyy'), 5, 831);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (832, 17853, to_date('11-05-2026', 'dd-mm-yyyy'), 4, 832);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (833, 12129, to_date('18-02-2022', 'dd-mm-yyyy'), 1, 833);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (834, 6039, to_date('30-12-2025', 'dd-mm-yyyy'), 0, 834);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (835, 9750, to_date('10-04-2028', 'dd-mm-yyyy'), 0, 835);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (836, 14101, to_date('12-11-2028', 'dd-mm-yyyy'), 0, 836);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (837, 12447, to_date('16-05-2025', 'dd-mm-yyyy'), 1, 837);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (838, 10927, to_date('07-11-2028', 'dd-mm-yyyy'), 0, 838);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (839, 19834, to_date('25-07-2021', 'dd-mm-yyyy'), 2, 839);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (840, 9634, to_date('21-09-2027', 'dd-mm-yyyy'), 1, 840);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (841, 13356, to_date('25-11-2023', 'dd-mm-yyyy'), 5, 841);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (842, 13487, to_date('27-01-2020', 'dd-mm-yyyy'), 0, 842);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (843, 13377, to_date('23-10-2022', 'dd-mm-yyyy'), 2, 843);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (844, 20999, to_date('28-06-2028', 'dd-mm-yyyy'), 2, 844);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (847, 5905, to_date('28-09-2024', 'dd-mm-yyyy'), 3, 847);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (848, 19735, to_date('18-01-2025', 'dd-mm-yyyy'), 2, 848);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (849, 11542, to_date('29-07-2020', 'dd-mm-yyyy'), 5, 849);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (850, 10245, to_date('30-06-2026', 'dd-mm-yyyy'), 3, 850);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (851, 10137, to_date('16-03-2021', 'dd-mm-yyyy'), 0, 851);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (852, 15355, to_date('14-03-2021', 'dd-mm-yyyy'), 4, 852);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (853, 3495, to_date('15-02-2025', 'dd-mm-yyyy'), 5, 853);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (854, 21010, to_date('25-05-2021', 'dd-mm-yyyy'), 4, 854);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (856, 8707, to_date('02-12-2028', 'dd-mm-yyyy'), 4, 856);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (857, 16405, to_date('25-02-2023', 'dd-mm-yyyy'), 5, 857);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (858, 7903, to_date('10-08-2020', 'dd-mm-yyyy'), 2, 858);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (859, 7017, to_date('15-12-2022', 'dd-mm-yyyy'), 4, 859);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (860, 7753, to_date('04-11-2024', 'dd-mm-yyyy'), 0, 860);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (861, 14486, to_date('10-10-2025', 'dd-mm-yyyy'), 5, 861);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (862, 8877, to_date('21-12-2025', 'dd-mm-yyyy'), 1, 862);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (863, 12646, to_date('05-07-2021', 'dd-mm-yyyy'), 1, 863);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (864, 11457, to_date('13-09-2028', 'dd-mm-yyyy'), 3, 864);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (865, 12479, to_date('12-01-2022', 'dd-mm-yyyy'), 1, 865);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (866, 15075, to_date('11-03-2023', 'dd-mm-yyyy'), 4, 866);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (867, 3027, to_date('16-11-2025', 'dd-mm-yyyy'), 0, 867);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (868, 11449, to_date('28-12-2028', 'dd-mm-yyyy'), 5, 868);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (869, 14332, to_date('12-03-2023', 'dd-mm-yyyy'), 1, 869);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (870, 17803, to_date('07-11-2025', 'dd-mm-yyyy'), 5, 870);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (871, 8828, to_date('19-10-2026', 'dd-mm-yyyy'), 0, 871);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (872, 18812, to_date('25-12-2022', 'dd-mm-yyyy'), 0, 872);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (873, 17820, to_date('02-05-2021', 'dd-mm-yyyy'), 2, 873);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (874, 14495, to_date('04-11-2020', 'dd-mm-yyyy'), 2, 874);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (875, 17768, to_date('12-07-2028', 'dd-mm-yyyy'), 5, 875);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (876, 13050, to_date('15-10-2026', 'dd-mm-yyyy'), 0, 876);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (877, 11179, to_date('26-12-2022', 'dd-mm-yyyy'), 2, 877);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (878, 8674, to_date('22-09-2022', 'dd-mm-yyyy'), 3, 878);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (879, 17663, to_date('22-04-2022', 'dd-mm-yyyy'), 2, 879);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (880, 18781, to_date('02-05-2021', 'dd-mm-yyyy'), 4, 880);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (881, 8628, to_date('18-04-2024', 'dd-mm-yyyy'), 3, 881);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (882, 16029, to_date('23-02-2024', 'dd-mm-yyyy'), 1, 882);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (883, 17927, to_date('11-03-2024', 'dd-mm-yyyy'), 4, 883);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (884, 9942, to_date('16-02-2027', 'dd-mm-yyyy'), 1, 884);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (885, 9420, to_date('07-02-2021', 'dd-mm-yyyy'), 3, 885);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (886, 10224, to_date('24-05-2027', 'dd-mm-yyyy'), 2, 886);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (887, 4147, to_date('18-07-2024', 'dd-mm-yyyy'), 3, 887);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (888, 10350, to_date('08-06-2026', 'dd-mm-yyyy'), 4, 888);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (889, 5222, to_date('25-09-2023', 'dd-mm-yyyy'), 4, 889);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (891, 10803, to_date('14-05-2022', 'dd-mm-yyyy'), 0, 891);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (893, 13461, to_date('25-07-2021', 'dd-mm-yyyy'), 0, 893);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (894, 15973, to_date('04-06-2025', 'dd-mm-yyyy'), 3, 894);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (895, 12094, to_date('07-04-2023', 'dd-mm-yyyy'), 1, 895);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (896, 8977, to_date('19-06-2023', 'dd-mm-yyyy'), 5, 896);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (897, 17093, to_date('17-07-2024', 'dd-mm-yyyy'), 3, 897);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (898, 17132, to_date('07-08-2020', 'dd-mm-yyyy'), 1, 898);
insert into PAYMENT (payment_id, payment_amount, payment_date, pay_method_id, order_id)
values (899, 11062, to_date('25-11-2025', 'dd-mm-yyyy'), 1, 899);
commit;
prompt 782 records loaded
set feedback on
set define on
prompt Done.

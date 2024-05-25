insert into PROFESSION (prof_id, prof_name)
values (0, 'photographer');
insert into PROFESSION (prof_id, prof_name)
values (1, 'video');

insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (0, ' John', ' Smith', 511652243, ' john.smith@gmail.com', 37700, 2020, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (1, ' Paul', ' Smith', 583118533, ' paul.smith@gmail.com', 14600, 2015, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (2, ' Paul', ' Martinez', 511999596, ' paul.martinez@gmail.com', 7500, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (3, ' Katie', ' Miller', 573072267, ' katie.miller@gmail.com', 41400, 2005, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (4, ' Sara', ' Hernandez', 506837826, ' sara.hernandez@gmail.com', 25700, 2009, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (5, ' Paul', ' Williams', 531004594, ' paul.williams@gmail.com', 19100, 2015, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (6, ' Anna', ' Garcia', 578516792, ' anna.garcia@gmail.com', 41200, 2022, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (7, ' Alex', ' Martinez', 514172647, ' alex.martinez@gmail.com', 16200, 2000, 1);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (8, ' Katie', ' Smith', 571446153, ' katie.smith@gmail.com', 12200, 2018, 0);
insert into PROFESSIONAL (professional_id, fname, lname, phone, email, price, start_year, prof_id)
values (9, ' Alex', ' Williams', 525793180, ' alex.williams@gmail.com', 33100, 2017, 0);

insert into PAYMENTMETHOD (pay_method_id, type)
values (0, 'Credit Card');
insert into PAYMENTMETHOD (pay_method_id, type)
values (1, 'Cash');
insert into PAYMENTMETHOD (pay_method_id, type)
values (2, 'PayPal');
insert into PAYMENTMETHOD (pay_method_id, type)
values (3, 'Bank Transfer');

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

insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (289, to_date('11-10-2022', 'dd-mm-yyyy'), 177, 59);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (290, to_date('06-01-2020', 'dd-mm-yyyy'), 224, 26);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (291, to_date('22-04-2024', 'dd-mm-yyyy'), 343, 220);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (292, to_date('03-01-2020', 'dd-mm-yyyy'), 314, 205);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (293, to_date('25-03-2020', 'dd-mm-yyyy'), 383, 68);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (294, to_date('20-08-2020', 'dd-mm-yyyy'), 121, 204);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (295, to_date('27-09-2022', 'dd-mm-yyyy'), 21, 351);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (296, to_date('23-03-2023', 'dd-mm-yyyy'), 160, 230);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (297, to_date('18-04-2022', 'dd-mm-yyyy'), 155, 27);
insert into CUSTOMERORDER (order_id, order_date, event_id, client_id)
values (298, to_date('11-01-2021', 'dd-mm-yyyy'), 22, 109);

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

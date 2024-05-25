CREATE TABLE Profession
(
  prof_id INT NOT NULL,
  prof_name INT NOT NULL,
  PRIMARY KEY (prof_id)
);

CREATE TABLE Professional
(
  professional_id INT NOT NULL,
  fname INT NOT NULL,
  lname INT NOT NULL,
  phone INT NOT NULL,
  email INT NOT NULL,
  price INT NOT NULL,
  start_year INT NOT NULL,
  prof_id INT NOT NULL,
  PRIMARY KEY (professional_id),
  FOREIGN KEY (prof_id) REFERENCES Profession(prof_id)
);

CREATE TABLE PaymentMethod
(
  pay_method_id INT NOT NULL,
  type INT NOT NULL,
  PRIMARY KEY (pay_method_id)
);

CREATE TABLE Client
(
  client_id INT NOT NULL,
  fname INT NOT NULL,
  lname INT NOT NULL,
  address INT NOT NULL,
  phone INT NOT NULL,
  email INT NOT NULL,
  PRIMARY KEY (client_id)
);

CREATE TABLE Event
(
  event_id INT NOT NULL,
  event_date INT NOT NULL,
  place INT NOT NULL,
  PRIMARY KEY (event_id)
);

CREATE TABLE CustomerOrder
(
  order_id INT NOT NULL,
  order_date INT NOT NULL,
  event_id INT NOT NULL,
  client_id INT NOT NULL,
  PRIMARY KEY (order_id),
  FOREIGN KEY (event_id) REFERENCES Event(event_id),
  FOREIGN KEY (client_id) REFERENCES Client(client_id)
);

CREATE TABLE Payment
(
  payment_id INT NOT NULL,
  payment_amount INT NOT NULL,
  payment_date INT NOT NULL,
  pay_method_id INT NOT NULL,
  order_id INT NOT NULL,
  PRIMARY KEY (payment_id),
  FOREIGN KEY (pay_method_id) REFERENCES PaymentMethod(pay_method_id),
  FOREIGN KEY (order_id) REFERENCES CustomerOrder(order_id)
);

CREATE TABLE include
(
  professional_id INT NOT NULL,
  order_id INT NOT NULL,
  PRIMARY KEY (professional_id, order_id),
  FOREIGN KEY (professional_id) REFERENCES Professional(professional_id),
  FOREIGN KEY (order_id) REFERENCES CustomerOrder(order_id)
);


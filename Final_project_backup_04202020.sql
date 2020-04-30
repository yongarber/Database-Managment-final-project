create database Book_Store;

use Book_Store;

CREATE TABLE Customer (
  custoemr_id           SERIAL PRIMARY KEY,
  first_name   VARCHAR(20)        NOT NULL,
  last_name    VARCHAR(20)        NOT NULL,
  address      VARCHAR(255)        NOT NULL,
  phone_number VARCHAR(9),
  username     VARCHAR(100) UNIQUE NOT NULL,
  passwordU    VARCHAR(100)
);

CREATE TABLE Shipment_cost (
  shipment_address    Varchar(255) PRIMARY KEY,
  cost   float(15)        NOT NULL);

CREATE TABLE Shipment (
  shipment_trac_number SERIAL PRIMARY KEY,
  shipment_address    Varchar(255) not null REFERENCES Shipment_cost (shipment_address) ON DELETE CASCADE);

CREATE TABLE Author (
  author_id           SERIAL PRIMARY KEY,
  first_name   VARCHAR(20) NOT NULL,
  second_name  VARCHAR(20) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone_number integer(9),
  DOB date);

CREATE TABLE Publisher (
  publisher_id           SERIAL PRIMARY KEY,
  address   VARCHAR(20) NOT NULL);

CREATE TABLE Book (
  ISBN               VARCHAR(13) primary key,
  title              VARCHAR(255) NOT NULL,
  date_published     DATE ,
  quantity 			 integer(10)  NOT NULL DEFAULT 0 CHECK (quantity >= 0),
  price              integer(10) CHECK (price > 0),
  author_id            integer REFERENCES author (author_id) ON DELETE CASCADE,
  publisher_id          integer REFERENCES publisher (publisher_id) ON DELETE CASCADE
);


CREATE TABLE Warehouse (
  warehouse_id          SERIAL PRIMARY KEY,
  address   			VARCHAR(255) NOT NULL,
  phone_number  		integer(9),
  number_of_employees   integer(10) NOT NULL
);

CREATE TABLE Employee (
  employee_id          SERIAL PRIMARY KEY,
  first_name   VARCHAR(20) NOT NULL,
  last_name  VARCHAR(20) NOT NULL,
  address   			VARCHAR(255) NOT NULL,
  DOB date,
  phone_number  		integer(9),
  warehouse_id integer references Warehouse (arehouse_id) on delete cascade,
  salary   integer(10) NOT NULL
);

CREATE TABLE review (
  review_id          SERIAL PRIMARY KEY,
  title varchar(255) not null,
  content varchar(255) not null,
  review      INTEGER CHECK (review BETWEEN 0 AND 5),
  date        DATE not null,
  book_id     integer(13) NOT NULL REFERENCES book (book_id) ON DELETE CASCADE,
  customer_id integer  NOT NULL REFERENCES customer (customer_id) ON DELETE CASCADE
);

CREATE TABLE orders (
  order_id          SERIAL PRIMARY KEY,
  customer_id integer NOT NULL REFERENCES customer (customer_id) ON DELETE CASCADE,
  date        DATE    not null,
  total_value float(10) not null,
  employee_handling     integer NOT NULL REFERENCES Employee (employee_id) ON DELETE CASCADE,
  shipment_trac_number integer not null references shipment (shipment_trac_number) on delete cascade
);

CREATE TABLE orders_details (
  book_id  varchar(13) REFERENCES book (book_id) ON DELETE CASCADE,
  order_id integer NOT NULL REFERENCES orders (order_id) ON DELETE CASCADE,
  quantity   INTEGER CHECK (quantity > 0)
);

drop table orders_details

###INSERT-
INSERT INTO Warehouse (warehouse_id, address, phone_number, number_of_employees)
VALUES (1, 'Billbord St', 2027043720, 7);

INSERT INTO Employee (employee_id,first_name, last_name, address, phone_number,warehouse_id, salary)
VALUES (1, 'Yon', 'Garber', 'Door St', 202704369, 1, 700000),
(2, 'Rafi', 'Garber', 'Door St', 202704300, 1, 1000000),
(3, 'Liat', 'Garber', 'Door St', 202978369, 1, 576500),
(4, 'Mary', 'Zilber', 'Pop St', 789303654, 1, 143000);

insert into Book (ISBN, title, date_published, quantity, price, author_id, publisher_id)
values ('1234567891234', 'Song of fire', DATE '1909-09-14', 50, 125, 1,1),
('2234567891234', 'Harry Jogger', DATE '2019-09-10', 40, 100, 1,1),
('3234567891234', 'Rock the Road', DATE '2018-09-10', 45, 77, 1,1),
('4234567891234', 'Live long, dont die', DATE '2000-01-10', 45, 23, 2,2),
('5234567891234', 'COVID-19', DATE '2020-01-01', 30, 39, 2,2);

select *
from Employee;  

INSERT INTO Employee (employee_id,first_name, last_name, address, phone_number,warehouse_id, salary)
VALUES (5, 'Jane', 'Boading', 'Sun St', 123456789, 1, 350000);

select *
from customer

insert into Customer(select employee_id,first_name, last_name, address, phone_number, warehouse_id, salary from employee where first_name='Yon');
insert into Customer(select Employee.employee_id,Employee.first_name, Employee.last_name, Employee.address, Employee.phone_number, Warehouse.address, Warehouse.number_of_employees from Employee, Warehouse where Employee.warehouse_id=Warehouse.warehouse_id and first_name='Rafi');

###SELECT-
select *
from Employee
where salary>400000;

INSERT INTO Employee (employee_id,first_name, last_name, address, phone_number,warehouse_id, salary)
VALUES (6, 'Dalia', 'Fix', 'Lake St', 202345566, 2, 58000),
(7, 'Inna', 'Long', 'Fox St', 202704322, 2, 900000),
(8, 'Bear', 'Smith', 'Lake St', 202955559, 2, 230000),
(9, 'Jake', 'William', 'Pop St', 789310654, 2, 75000);


select AVG(salary),MIN(salary),MAX(salary),warehouse_id
from employee
group by warehouse_id;

select AVG(salary),warehouse_id
from employee
group by warehouse_id
having avg(salary)>400000;

select *
from employee
order by salary;


select *
from Employee
where warehouse_id in (select warehouse_id from warehouse where warehouse_id=1);

insert into customer(custoemr_id ,first_name,last_name, address, username, passwordU)
values (4, 'Rick', 'Jonson', 'Sea View St', 'Ricktherock', '12345'),
(5, 'Bob', 'Smith', 'Mass St', 'BobSmith', '11111')

select employee_id,first_name, last_name, address from employee
union
select custoemr_id ,first_name,last_name, address from customer

#DELETE-
select * from employee

delete from employee 
where salary <=150000 and warehouse_id in
	(select warehouse_id from warehouse where address='Billbord St');

select *
from customer;

delete from customer
where phone_number=202704300;

#UPDATE-

update customer
set username='USERnameYON'
where first_name='Yon';

select * from employee;

update employee
set salary=salary*1.1
where warehouse_id in (select warehouse_id from warehouse where number_of_employees>5); 


# CREATE VIEW-
create view HighEarner as
select *
from employee
where salary>=300000;

select *
from HighEarner;

Create view All_People as
select first_name, last_name from employee
union
select first_name, last_name from customer;

select *
from All_People;

update HighEarner
set salary=200000
where first_name='Jane';

# TRIGGERS-
#1-

create table warehouse_salary_summary(warehouse_id SERIAL PRIMARY KEY,min_salary integer(20), max_salary integer(20), avg_salary integer(20));

Delimiter $$
create trigger employee_summary_insert after insert on Employee
for each row
begin
delete from warehouse_salary_summary;
insert warehouse_salary_summary
select warehouse_id, min(salary),max(salary),avg(salary) from employee group by warehouse_id;
end; $$

select *
from warehouse_salary_summary;

INSERT INTO Employee (employee_id,first_name, last_name, address, phone_number,warehouse_id, salary)
VALUE (10, 'Brad', 'Pit', 'LA', 555666777, 2, 5600000);

INSERT INTO Employee (employee_id,first_name, last_name, address, phone_number,warehouse_id, salary)
VALUE(11, 'M&M', 'Rapper', 'Noname St', 999999999, 1, 7500000);

select *
from warehouse_salary_summary;

#2-


Delimiter $$
create trigger warehouse_delete after delete on warehouse for each row
begin
delete from employee where warehouse_id=old.warehouse_id; end;
$$

INSERT INTO Warehouse (warehouse_id, address, phone_number, number_of_employees)
VALUES (3, 'Delete St', 2027043720, 8);

INSERT INTO Employee (employee_id,first_name, last_name, address, phone_number,warehouse_id, salary)
VALUES (12, 'Delete', 'Now', 'Big Lake St', 202345566, 3, 75000),
(13, 'David', 'Delete', 'Foxfox St', 202704322, 3, 340000),
(14, 'Dudu', 'Topaz', 'Poppop St', 789310654, 3, 24000);

select *
from employee;

select *
from warehouse;

delete from warehouse
where warehouse_id=3;


select *
from employee;

select *
from warehouse;

#3-


Delimiter $$
Create trigger warehouse_id_domain_checking before insert on Employee
For each row
Begin
	Declare temp int; set temp=0;
	Select count(warehouse_id) into temp
	From Warehouse where warehouse_id=new.warehouse_id;
	If temp=0 then
	signal sqlstate '45000' set message_text = 'Warehouse_id DNE, wrong id'; End if;
End; $$

select *
from employee;

select *
from warehouse;


INSERT INTO Employee (employee_id,first_name, last_name, address, phone_number,warehouse_id, salary)
VALUES (12, 'Delete', 'Now', 'Big Lake St', 202345566, 3, 75000),
(14, 'Dudu', 'Topaz', 'Poppop St', 789310654, 3, 24000);

select *
from employee;

#4-

Create table insert_books_Log (message varchar(70));

select *
from insert_books_Log;

select *
from Book;


Delimiter $$
create trigger insert_book after insert on Book
for each row
begin
insert into insert_books_Log values(concat('Book has been inserted by ',current_user(), ' at ',CURRENT_TIMESTAMP()));
end; $$

insert into Book (ISBN, title, date_published, quantity, price, author_id, publisher_id)
values ('999967891234', 'SQL Insert', DATE '2020-04-03', 50, 200, 2,2),
('2234999991234', 'Harry Jogger is he Potter?', DATE '2019-05-25', 40, 75, 2,2);

select *
from insert_books_Log;

select *
from Book;

# Bonus-Triggers
Delimiter $$
create trigger is_available before insert on orders_details
for each row
begin
  IF new.quantity <= 0
  THEN signal sqlstate '45000' set message_text = 'you should buy something';END IF;
  IF new.quantity > (SELECT book.quantity
                   FROM book
                   WHERE new.book_id = book.ISBN
                   LIMIT 1)
  THEN
signal sqlstate '45000' set message_text =  'NOT AVAILABLE';
  END IF;
END; $$

drop trigger is_available

select *
from book;

INSERT INTO orders_details (book_id, order_id ,quantity)
VALUES (2234999991234, 1,0),
(3234567891234, 2, 20);

INSERT INTO orders_details (book_id, order_id ,quantity)
VALUES (2234999991234, 1,5),
(3234567891234, 2, 1000);

INSERT INTO orders_details (book_id, order_id ,quantity)
VALUES (2234999991234, 1,5),
(3234567891234, 2, 4);


select * from orders_details

#2-
Delimiter $$
create trigger adjust_quant after insert on orders_details
for each row
begin
  if new.quantity>0 then
  update book set book.quantity=book.quantity-new.quantity where ISBN=new.book_id;
  END IF;
END; $$


delete from orders_details

select *
from book;


INSERT INTO orders_details (book_id, order_id ,quantity)
VALUES (2234999991234, 1,7),
(3234567891234, 2, 9);

select *
from book;

select * from orders_details

select * from customer











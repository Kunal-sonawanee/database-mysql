/* clean up old tables;
   must drop tables with foreign keys first
   due to referential integrity constraints
 */

delete from Depositor;
drop table Depositor;

delete from Borrower;
drop table Borrower;

delete from Account;
drop table Account;

delete from Branch;
drop table Branch;

delete from Loan;
drop table Loan;

delete from Customer;
drop table Customer;
 */
 create database bank;
use  bank;


create table Branch
   (branch_name 	varchar(15)	not null unique,
    branch_city 	varchar(15)	not null,
    assets 	 	 	integer 	 	not null,
    primary key(branch_name));

create table Account
   (account_number  varchar(15) not null unique,
    branch_name     varchar(15) not null,
    balance         integer     not null,
    primary key(account_number),
	foreign key(branch_name) references Branch(branch_name)	);
	
create table Loan
   (loan_number 	 varchar(15)	 not null unique,
    branch_name	        	varchar(15) 	not null,
    amount    integer		 not null,
    primary key(loan_number),
	foreign key(branch_name) references Branch(branch_name));



create table Customer
   (customer_name 	varchar(15)	not null unique,
    customer_street 	varchar(12)	not null,
    customer_city 	varchar(15)	not null,
    primary key(customer_name));



create table Depositor
   (customer_name 	varchar(15)	not null,
    account_number 	varchar(15)	not null,
    primary key(customer_name, account_number),
    foreign key(account_number) references Account(account_number),
    foreign key(customer_name) references Customer(customer_name));

create table Borrower
   (customer_name 	varchar(15)	not null,
    loan_number 	varchar(15)	not null,
    primary key(customer_name, loan_number),
    foreign key(customer_name) references Customer(customer_name),
    foreign key(loan_number) references Loan(loan_number));

/* populate relations */

insert into Customer	 values ('Jones',	'Main',		'Harrison');
insert into Customer	 values ('Smith',	'Main',		'Rye');
insert into Customer	 values ('Hayes',	'Main',		'Harrison');
insert into Customer	 values ('Curry',	'North',	'Rye');
insert into Customer	 values ('Lindsay',	'Park',		'Pittsfield');
insert into Customer	 values ('Turner',	'Putnam',	'Stamford');
insert into Customer  	values ('Williams',	'Nassau',	'Princeton');
insert into Customer	 values ('Adams',	'Spring',	'Pittsfield');
insert into Customer  	values ('Johnson',	'Alma',		'Palo Alto');
insert into Customer	 values ('Glenn',	'Sand Hill',	'Woodside');
insert into Customer	 values ('Brooks',	'Senator',	'Brooklyn');
insert into Customer  values ('Green',	'Walnut',	'Stamford');
insert into Customer	 values ('Jackson',	'University',	'Salt Lake');
insert into Customer	 values ('Majeris',	'First',	'Rye');
insert into Customer	  values ('McBride',	'Safety',	'Rye');

insert into Branch	 values ('Downtown',	'Brooklyn',	 900000);
insert into Branch	 values ('Redwood',	'Palo Alto',	2100000);
insert into Branch	 values ('Perryridge',	'Horseneck',	1700000);
insert into Branch	 values ('Mianus',	'Horseneck',	 400200);
insert into Branch	 values ('Round Hill',	'Horseneck',	8000000);
insert into Branch	 values ('Pownal',	'Bennington',	 400000);
insert into Branch	 values ('North Town',	'Rye',		3700000);
insert into Branch	 values ('Brighton',	'Brooklyn',	7000000);
insert into Branch	 values ('Central',	'Rye',		 400280);

insert into Account	 values ('A-101',	'Downtown',	500);
insert into Account	 values ('A-215',	'Mianus',	700);
insert into Account	 values ('A-102',	'Perryridge',	400);
insert into Account	 values ('A-305',	'Round Hill',	350);
insert into Account	 values ('A-201',	'Perryridge',	900);
insert into Account	 values ('A-222',	'Redwood',	700);
insert into Account	 values ('A-217',	'Brighton',	750);
insert into Account	 values ('A-333',	'Central',	850);
insert into Account	 values ('A-444',	'North Town',	625);

insert into Depositor  values ('Johnson','A-101');
insert into Depositor  values ('Smith',	'A-215');
insert into Depositor  values ('Hayes',	'A-102');
insert into Depositor  values ('Hayes',	'A-101');
insert into Depositor  values ('Turner',	'A-305');
insert into Depositor  values ('Johnson','A-201');
insert into Depositor  values ('Jones',	'A-217');
insert into Depositor  values ('Lindsay','A-222');
insert into Depositor  values ('Majeris','A-333');
insert into Depositor  values ('Smith',	'A-444');

insert into Loan	 values ('L-17',		'Downtown',	1000);
insert into Loan	 values ('L-23',		'Redwood',	2000);
insert into Loan	 values ('L-15',		'Perryridge',	1500);
insert into Loan	 values ('L-14',		'Downtown',	1500);
insert into Loan	 values ('L-93',		'Mianus',	500);
insert into Loan	 values ('L-11',		'Round Hill',	900);
insert into Loan	 values ('L-16',		'Perryridge',	1300);
insert into Loan	 values ('L-20',		'North Town',	7500);
insert into Loan	 values ('L-21',		'Central',	570);

insert into Borrower   values ('Jones',	'L-17');
insert into Borrower   values ('Smith',	'L-23');
insert into Borrower   values ('Hayes',	'L-15');
insert into Borrower   values ('Jackson',	'L-14');
insert into Borrower   values ('Curry',	'L-93');
insert into Borrower   values ('Smith',	'L-11');
insert into Borrower   values ('Williams','L-17');
insert into Borrower   values ('Adams',	'L-16');
insert into Borrower   values ('McBride',	'L-20');
insert into Borrower   values ('Smith',	'L-21');
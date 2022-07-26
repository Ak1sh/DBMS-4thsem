create database orderprocessing074;
use  orderprocessing074;
create table customer(cust int primary key,cname varchar(30),city varchar(30));
create table order_details(orderd int,odate date,cust int,ord_amt int,primary key(orderd,cust),foreign key(cust) references customer(cust));
create table item(item int primary key,unit_price int);
create table order_item(orderd int,item int,qty int,primary key(orderd,item),foreign key(orderd) references order_details(orderd),foreign key(item) references item(item));
create table warehouse(warehouse int primary key,city varchar(30));
create table shipment(orderd int,warehouse int,ship_date date,primary key(orderd,warehouse),foreign key(orderd) references order_details(orderd),foreign key(warehouse) references warehouse(warehouse));
show tables;
desc shipment;

insert into customer values(1,"A","ananthapur");
insert into customer values(2,"B","bangalore");
insert into customer values(3,"C","raichur");
insert into customer values(4,"D","tumkur");
insert into customer values(5,"E","mangalore");


insert into order_details values(11,"2022-05-20",1,400);
insert into order_details values(22,"2022-07-20",2,2000);
insert into order_details values(33,"2022-05-10",3,20000);
insert into order_details values(44,"2022-01-16",4,16000);
insert into order_details values(55,"2021-12-08",5,4000);

insert into Item values(1, 10000);
insert into Item values(2, 5000);
insert into Item values(3, 500);
insert into Item values(4, 100);
insert into Item values(5, 1200);

insert into order_item values(11, 3, 1);
insert into order_item values(11, 4, 2);
insert into order_item values(22, 5, 3);
insert into order_item values(33, 2, 3);
insert into order_item values(55, 1, 2);

insert into Warehouse values(1, 'Bengaluru');
insert into Warehouse values(2, 'raichur');
insert into Warehouse values(3, 'Delhi');
insert into Warehouse values(4, 'manglore');
insert into Warehouse values(5, 'ananthapur');
insert into Warehouse values(6, 'Bengaluru');

insert into Shipment values(11, 2, '2022-06-12');
insert into Shipment values(22, 5, '2022-08-17');
insert into Shipment values(44, 4, '2022-02-05');
insert into Shipment values(55, 2, '2022-01-24');
insert into Shipment values(33, 1, '2022-06-16');

-- query(1)
 

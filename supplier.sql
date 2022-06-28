show databases;
create database supp;
use supp;
create table SUPPLIERS(sid integer,sname varchar(20),address varchar(40),primary key(sid));
INSERT INTO SUPPLIERS (`sid`, `sname`, `address`) VALUES ('10001', 'Acme Widget', 'Bangalore');
INSERT INTO SUPPLIERS (`sid`, `sname`, `address`) VALUES ('10002', 'Johns', 'Kolkata');
INSERT INTO  SUPPLIERS(`sid`, `sname`, `address`) VALUES ('10003', 'Vimal', 'Mumbai');
INSERT INTO SUPPLIERS(`sid`, `sname`, `address`) VALUES ('10004', 'Reliance', 'Delhi');

commit;
select* from SUPPLIERS;

create table PARTS(pid integer,pname varchar(20),color varchar(30),primary key(pid));
INSERT INTO  PARTS (`pid`, `pname`, `color`) VALUES ('20001', 'Book', 'Red');
INSERT INTO  PARTS(`pid`, `pname`, `color`) VALUES ('20002', 'Pen', 'Red');
INSERT INTO  PARTS (`pid`, `pname`, `color`) VALUES ('20003', 'Pencil', 'Green');
INSERT INTO  PARTS (`pid`, `pname`, `color`) VALUES ('20004', 'Mobile', 'Green');
INSERT INTO  PARTS (`pid`, `pname`, `color`) VALUES ('20005', 'Charger', 'Black');
commit;
select* from PART;

create table CATALOG(sid integer,pid integer,foreign key(sid)  references SUPPLIERS(sid),foreign key(pid) references PARTS(pid),
 cost integer,primary key(sid,pid));
INSERT INTO CATALOG (`sid`, `pid`, `cost`) VALUES ('10001', '20001', '10');
INSERT INTO CATALOG (`sid`, `pid`, `cost`) VALUES ('10001', '20002', '10');
INSERT INTO CATALOG (`sid`, `pid`, `cost`) VALUES ('10001', '20003', '30');
INSERT INTO CATALOG (`sid`, `pid`, `cost`) VALUES ('10001', '20004', '10');
INSERT INTO CATALOG (`sid`, `pid`, `cost`) VALUES ('10001', '20005', '10');
INSERT INTO CATALOG (`sid`, `pid`, `cost`) VALUES ('10002', '20001', '10');
INSERT INTO CATALOG (`sid`, `pid`, `cost`) VALUES ('10002', '20002', '20');
INSERT INTO CATALOG (`sid`, `pid`, `cost`) VALUES ('10003', '20003', '30');
INSERT INTO CATALOG (`sid`, `pid`, `cost`) VALUES ('10004', '20003', '40');

commit;
select* from CATALOG;


-- Query 1
SELECT DISTINCT P.pname
FROM PARTS P, CATALOG C
WHERE P.pid = C.pid;

-- Query 2
select S.sname from SUPPLIERS S where not exists
(select P.pid from PARTS P where not exists
 (select C.sid from CATALOG C where C.sid = S.sid and C.pid = P.pid));
 
-- Query 3
select S.sname from SUPPLIERS S where not exists
 (select P.pid from PARTS P where P.color = 'Red' and 
 (not exists (select C.sid from CATALOG C where C.sid = S.sid and C.pid = P.pid)));
 
 -- Query 4
 select P.pname from PARTS P, CATALOG C, SUPPLIERS S 
 where P.pid = C.pid and C.sid = S.sid and S.sname = 'Acme Widget'
 and not exists (select * from CATALOG C1, SUPPLIERS S1
 where P.pid = C1.pid and C1.sid = S1.sid and S1.sname <> 'Acme Widget');

-- Query 5
SELECT DISTINCT C.sid FROM CATALOG C
WHERE C.cost > ( SELECT AVG (C1.cost)
FROM CATALOG C1
WHERE C1.pid = C.pid );


-- Query 6
SELECT P.pid, S.sname
FROM Parts P, SUPPLIERS S, Catalog C
WHERE C.pid = P.pid
AND C.sid = S.sid
AND C.cost = (SELECT MAX(C1.cost)
FROM Catalog C1
WHERE C1.pid = P.pid);

     CREATE TABLE branch
     ( branch_name VARCHAR(15),
       branch_city VARCHAR(15),
       assets NUMBER(10,2),
       PRIMARY KEY(branch_name)
     );

     CREATE TABLE account
     ( accno INTEGER(8),
       branch_name VARCHAR(15),
       balance NUMBER(10,2),
       PRIMARY KEY(accno),
       FOREIGN KEY(branch_name) REFERENCES branch(branch_name)ON DELETE CASCADE
     );

    CREATE TABLE customer
    ( customer_name VARCHAR(15),
      customer_street VARCHAR(15),
      customer_city VARCHAR(15),
      PRIMARY KEY(customer_name)
    );

    CREATE TABLE loan
    ( loan_number INTEGER(8),
      branc_hname VARCHAR(15),
      amount NUMBER(10,2),
      PRIMARY KEY(loan_number),
      FOREIGN KEY(branch_name) REFERENCES branch(branch_name)
    );

    CREATE TABLE depositor
    ( customer_name VARCHAR(15),
      accno INTEGER,
      PRIMARY KEY(customer_name, accno),
      FOREIGN KEY(customer_name) REFERENCES customer(customer_name),
      FOREIGN KEY(accno) REFERENCES account(accno)
    );

    CREATE TABLE borrower
    ( customer_name  VARCHAR(15),
      loan_number INTEGER(8),
      PRIMARY KEY(customer_name, loan_number),
      FOREIGN KEY(customer_name) REFERENCES customer(customer_name),
      FOREIGN KEY(loan_number) REFERENCES loan(loan_number)
    );
    
    
    insert into branch (branch_name,branch_city,assets) values
         ("b1","c1",10000),
    ("b2","c2",20000),
        ("b3","c3",30000),
         ("b4","c4",40000),
    (b5","c5",50000);
    
    
     INSERT INTO account (accno,branch_name,balance) VALUES
       (12,"b1",3000),
    (22,"b2",4000),
       (32,"b3",5000),
    (42,"b4",6000),
    (52,"b5",7000);        
    
    INSERT INTO depositor (customer_name,accno) VALUES
          ("cust1",12),
          ("cust2",22),
          ("cust3",32),
          ("cust4",42),
          ("cust5",52);
          
    INSERT INTO loan (loan_number,branch_name,amount) VALUES
     (10,"b1",10000),
     (20,"b2",20000),
     (30,"b3",30000),
     (40,"b4",40000),
     (50,"b5",50000);
     
    INSERT INTO borrower (customer_name,loan_number) VALUES
     ("cust1",10),
     ("cust2",20),
     ("cust3",30),
     ("cust4",40),
     ("cust5",50);
     
      SELECT customer_name
            FROM depositor d,account a
            WHERE d.accno=a.accno
            AND a.branch_name='Main'
            GROUP BY d.customer_name
            HAVING COUNT(d.customer_name)>=2;
            
            
       SELECT d.customer_name
             FROM account a,branch b,depositor d
             WHERE b.branch_name=a.branch_name AND
             a.accno=d.accno AND
             b.branch_city='c3'
             GROUP BY d.customer_name
             HAVING COUNT(distinct b.branch_name)=(
                SELECT COUNT(branch_name)
                FROM branch
                WHERE branch_city='c3');


         DELETE FROM account WHERE branch_name IN(SELECT branch_name FROM branch WHERE branch_city='c5');



         



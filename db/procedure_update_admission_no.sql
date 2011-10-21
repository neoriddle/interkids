CREATE PROCEDURE updateadmminno()
BEGIN
   -- Declare local variables
   DECLARE done BOOLEAN DEFAULT 0;
   DECLARE _no VARCHAR(10);
   DECLARE _id INT;
   -- Declare the cursor
   DECLARE ordernumbers CURSOR
   FOR
   SELECT admission_no, id FROM `finance_fee_particulars` WHERE where admission_no IS NOT NULL;
   -- Declare continue handler
   DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done=1;
   -- Open the cursor
   OPEN ordernumbers;
   -- Loop through all rows
   REPEAT
      -- Get order number
      FETCH ordernumbers INTO _no, _id;
      update finance_fee_particulars p set p.admission_no=REPLACE(_no, '-', '') where p.id=_id; 
      
   -- End of loop
   UNTIL done END REPEAT;
   -- Close the cursor
   CLOSE ordernumbers;
END;
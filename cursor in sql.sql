use sakila;
DELIMITER $$

create procedure create_email_list ()
begin
     DECLARE empname varchar(100) default "";
     DECLARE done bool default false;
     
     -- declare cursor for employee email
     DECLARE cur cursor for 
     select first_name from sakila.actor where actor_id < 5;
     
     DECLARE continue handler 
       for not found set done = true;
	 
     -- open the cursor
     open cur;
     process_name: loop
        
        fetch cur into empname;
        IF done = true then 
           leave process_name;
	    END IF;
        select empname;
	end loop;
    
    -- close the cursor
     close cur;
     
     
END $$

DElIMITER ;
drop procedure create_email_list;

call create_email_list;


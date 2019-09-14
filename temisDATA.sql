/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.1.50-community : Database - TEMIS
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`TEMIS` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `TEMIS`;

/*Table structure for table `tbl_temis_account_types` */

DROP TABLE IF EXISTS `tbl_temis_account_types`;

CREATE TABLE `tbl_temis_account_types` (
  `tid` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `created_by` int(2) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_temis_account_types` */

insert  into `tbl_temis_account_types`(`tid`,`name`,`date_created`,`created_by`) values (1,'Super Admin',NULL,NULL),(2,'Admin',NULL,NULL),(3,'User',NULL,NULL),(13,'nenen','2019-09-14 11:09:17',1),(16,'BENSON MUNUHE','2019-09-14 11:31:21',1),(17,'deb','2019-09-14 13:01:58',1);

/*Table structure for table `tbl_temis_customer_data` */

DROP TABLE IF EXISTS `tbl_temis_customer_data`;

CREATE TABLE `tbl_temis_customer_data` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_doc_types` varchar(45) DEFAULT NULL COMMENT 'passport,national_id, DL special document',
  `customer_doc_id` varchar(45) DEFAULT NULL COMMENT 'passport,national_id, DL special document',
  `customer_name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `customer_type` varchar(45) DEFAULT NULL COMMENT 'VIP, Normal, etc',
  `msisdn` bigint(20) DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `edit_date` datetime DEFAULT NULL,
  `blacklist_status` int(11) DEFAULT NULL,
  `blacklist_date` datetime DEFAULT NULL,
  `unblacklist_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_temis_customer_data` */

/*Table structure for table `tbl_temis_debug_logs` */

DROP TABLE IF EXISTS `tbl_temis_debug_logs`;

CREATE TABLE `tbl_temis_debug_logs` (
  `log_data` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tbl_temis_debug_logs` */

insert  into `tbl_temis_debug_logs`(`log_data`) values ('110'),('110'),('55'),('55'),('55'),('55'),('33'),('33'),('88'),('88'),('40'),('40'),('40'),('40'),('55'),('55'),('0'),('0');

/*Table structure for table `tbl_temis_logs_exceptions` */

DROP TABLE IF EXISTS `tbl_temis_logs_exceptions`;

CREATE TABLE `tbl_temis_logs_exceptions` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOG_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LOG_EVENT` varchar(200) DEFAULT NULL,
  `LOG_CODE` varchar(200) DEFAULT NULL,
  `LOG_MESSAGE` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_temis_logs_exceptions` */

insert  into `tbl_temis_logs_exceptions`(`LOG_ID`,`LOG_DATE`,`LOG_EVENT`,`LOG_CODE`,`LOG_MESSAGE`) values (6,'2017-01-09 11:58:29','Eligibility','42000','Incorrect numbe'),(7,'2017-01-09 12:00:51','Eligibility','42S22','Unknown column '),(8,'2017-01-10 09:25:51','sp_ethiotel_loa','42S22','Unknown column '),(9,'2017-01-10 09:34:48','sp_ethiotel_loan_borrow','42S22','Unknown column \'10AA\' in \'field list\''),(10,'2017-01-10 10:32:25','sp_check_eligibility','Unknown column \'loan_type_id\' in \'where clause\'','42S22'),(11,'2017-01-10 10:32:38','sp_check_eligibility','Unknown column \'loan_type_id\' in \'where clause\'','42S22'),(12,'2017-01-10 12:24:58','sp_optout','Table \'ethiotel.tbl_ethiotel_subscribe\' doesn\'t exist','42S02'),(20,'2017-01-11 11:53:19','sp_check_eligibility','Result consisted of more than one row','42000'),(21,'2017-01-11 11:58:44','sp_check_eligibility','Result consisted of more than one row','42000'),(22,'2017-01-11 12:04:17','sp_check_eligibility','Result consisted of more than one row','42000');

/*Table structure for table `tbl_temis_rbac` */

DROP TABLE IF EXISTS `tbl_temis_rbac`;

CREATE TABLE `tbl_temis_rbac` (
  `tid` int(2) NOT NULL AUTO_INCREMENT,
  `account_type` int(2) NOT NULL DEFAULT '0',
  `can_add_admin` int(1) NOT NULL DEFAULT '0',
  `can_add_super_admin` int(1) NOT NULL DEFAULT '0',
  `can_add_guest` int(1) NOT NULL DEFAULT '0',
  `can_unblacklist` int(1) NOT NULL DEFAULT '0',
  `can_edit_admin` int(1) NOT NULL DEFAULT '0',
  `can_edit_super_admin` int(1) NOT NULL DEFAULT '0',
  `can_edit_guest` int(1) NOT NULL DEFAULT '0',
  `can_delete_admin` int(1) NOT NULL DEFAULT '0',
  `can_delete_super_admin` int(1) NOT NULL DEFAULT '0',
  `can_delete_guest` int(1) NOT NULL DEFAULT '0',
  `can_add_loan_type` int(1) NOT NULL DEFAULT '0',
  `can_edit_loan_type` int(1) NOT NULL DEFAULT '0',
  `can_delete_loan_type` int(1) NOT NULL DEFAULT '0',
  `can_add_award` int(1) NOT NULL DEFAULT '0',
  `can_edit_award` int(1) NOT NULL DEFAULT '0',
  `can_delete_award` int(1) NOT NULL DEFAULT '0',
  `can_add_score_award` int(1) NOT NULL DEFAULT '0',
  `can_edit_score_award` int(1) NOT NULL DEFAULT '0',
  `can_delete_score_award` int(1) NOT NULL DEFAULT '0',
  `can_add_credit_rating_attributes` int(1) NOT NULL DEFAULT '0',
  `can_edit_credit_rating_attributes` int(1) NOT NULL DEFAULT '0',
  `can_delete_credit_rating_attributes` int(1) NOT NULL DEFAULT '0',
  `can_view_audit_trail` int(1) NOT NULL DEFAULT '0',
  `can_create_appconfig` int(1) NOT NULL DEFAULT '0',
  `can_edit_appconfig` int(1) NOT NULL DEFAULT '0',
  `can_delete_appconfig` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_temis_rbac` */

insert  into `tbl_temis_rbac`(`tid`,`account_type`,`can_add_admin`,`can_add_super_admin`,`can_add_guest`,`can_unblacklist`,`can_edit_admin`,`can_edit_super_admin`,`can_edit_guest`,`can_delete_admin`,`can_delete_super_admin`,`can_delete_guest`,`can_add_loan_type`,`can_edit_loan_type`,`can_delete_loan_type`,`can_add_award`,`can_edit_award`,`can_delete_award`,`can_add_score_award`,`can_edit_score_award`,`can_delete_score_award`,`can_add_credit_rating_attributes`,`can_edit_credit_rating_attributes`,`can_delete_credit_rating_attributes`,`can_view_audit_trail`,`can_create_appconfig`,`can_edit_appconfig`,`can_delete_appconfig`) values (1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(2,2,0,0,1,1,0,0,1,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(3,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0);

/*Table structure for table `tbl_temis_users` */

DROP TABLE IF EXISTS `tbl_temis_users`;

CREATE TABLE `tbl_temis_users` (
  `tid` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Unique user id, which is primary key',
  `names` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `has_resetpassword` int(1) NOT NULL DEFAULT '0',
  `account_type` int(2) NOT NULL DEFAULT '3',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  UNIQUE KEY `username` (`username`),
  KEY `FK_tbl_ethiotel_users_tbl_ethiotel_account_types` (`account_type`),
  CONSTRAINT `FK_tbl_ethiotel_users_tbl_ethiotel_account_types` FOREIGN KEY (`account_type`) REFERENCES `tbl_temis_account_types` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `tbl_temis_users` */

insert  into `tbl_temis_users`(`tid`,`names`,`username`,`email`,`password`,`has_resetpassword`,`account_type`,`date_created`,`created_by`) values (1,'Benson Munuhe','ben','vbini21@gmail.com','5994471abb1112afcc18159f6cc74b4f511b9986da59b3caf5a9c173cacfc5',0,1,'2016-12-14 11:22:32',0),(3,'Kimutai Admin','kim2','briantkim@outlook.com','2cc95c1b09f3ecb1affc7a552b00caf1ea3320438da05b596e57d4f3026e3e4a',1,2,'2016-12-15 14:05:17',1),(21,'Brian Kimutai','kim3','bkimutai1@safaricom.co.ke','927f07f1a42e14743d2ac4ec208e09104fbb7ba33e5e5cf8023cbfce613ad138',1,1,'2016-12-22 15:06:26',1),(22,'Wifred Kiprop','wkip','wrop@safaricom.co.ke','b1c45f69b3cba6d04a558a65610d203c6590f6ccc54a199925e1f985c6d9f152',1,3,'2016-12-22 15:13:57',1);

/*!50106 set global event_scheduler = 1*/;

/* Event structure for event `event_ethiotel_credit_score` */

/*!50106 DROP EVENT IF EXISTS `event_ethiotel_credit_score`*/;

DELIMITER $$

/*!50106 CREATE EVENT `event_ethiotel_credit_score` ON SCHEDULE EVERY 1 MONTH STARTS '2017-01-09 14:41:28' ON COMPLETION PRESERVE ENABLE COMMENT 'Performs Credit-Scoring after every one month' DO call `sp_ethiotel_creditscore` */$$
DELIMITER ;

/* Event structure for event `event_ethiotel_loan_reminders` */

/*!50106 DROP EVENT IF EXISTS `event_ethiotel_loan_reminders`*/;

DELIMITER $$

/*!50106 CREATE EVENT `event_ethiotel_loan_reminders` ON SCHEDULE EVERY 1 DAY STARTS '2017-01-15 23:59:59' ON COMPLETION PRESERVE ENABLE COMMENT 'Activates the loan reminders service scheduled to occur daily' DO CALL `sp_ethiotel_loan_reminders` */$$
DELIMITER ;

/* Function  structure for function  `to_date` */

/*!50003 DROP FUNCTION IF EXISTS `to_date` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` FUNCTION `to_date`(strDateTime varchar(30), strFormat varchar(30)) RETURNS datetime
BEGIN
RETURN STR_TO_DATE(strDateTime,'%Y-%m-%d %H:%i:%s');
END */$$
DELIMITER ;

/* Procedure structure for procedure `debug_msg` */

/*!50003 DROP PROCEDURE IF EXISTS  `debug_msg` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` PROCEDURE `debug_msg`(enabled INTEGER, msg VARCHAR(255))
BEGIN
  IF enabled THEN BEGIN
    select concat("** ", msg) AS '** DEBUG:';
  END; END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `init_data` */

/*!50003 DROP PROCEDURE IF EXISTS  `init_data` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` PROCEDURE `init_data`()
BEGIN
END */$$
DELIMITER ;

/* Procedure structure for procedure `resultset_test` */

/*!50003 DROP PROCEDURE IF EXISTS  `resultset_test` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` PROCEDURE `resultset_test`(OUT v_code INT,OUT v_message VARCHAR(200))
BEGIN
	SELECT * from ethiotel.tbl_ethiotel_active_loans;
	SET v_code = 12222;
    set v_message = 'Success';
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_loan_balance` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_loan_balance` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` PROCEDURE `sp_check_loan_balance`(IN v_msisdn VARCHAR(12),OUT v_code INT,OUT v_message VARCHAR(200))
BEGIN
	/* --Declaration-- */
	
    DECLARE has_loan_record INT;
	DECLARE looping INT;
    DECLARE msg_loan_name VARCHAR(20);
    DECLARE msg_loan_msisdn VARCHAR(20);
    DECLARE msg_loan_type VARCHAR(20);
    DECLARE msg_loan_bal DOUBLE;
    DECLARE msg TEXT;
    DECLARE v_finished INT;
    DECLARE loan_cur CURSOR FOR 
		SELECT l.msisdn, l.loan_type_id, l.loan_balance, t.loan_type_name from ethiotel.tbl_ethiotel_active_loans `l` JOIN ethiotel.tbl_ethiotel_loan_type `t` where `l`.msisdn = v_msisdn AND `t`.loan_type_id = `l`.loan_type_id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_finished = 1;
	/* --Check Existing Record-- */
	/*SELECT count(*) FROM ethiotel.tbl_ethiotel_active_loans WHERE msisdn = v_msisdn INTO has_loan_record;*/
    /* --No record found-- */
    /*IF (IFNULL(has_loan_record,0) < 1) THEN*/
		SET v_code=-1;
		SET v_message="No loan record found";
        CALL `sp_send_sms`('254701562852', 'Dear Customer, you currently do not have an outstanding loan. Ethiotel.');
	/*ELSE */
		/* --At least one record found-- */
		/*SELECT msisdn, loan_type_id, loan_balance from ethiotel.tbl_ethiotel_active_loans where msisdn = v_msisdn;*/
        SET v_code=0;
		SET v_message="Success";
		SET looping := 0;
        SET msg := "";
        
        OPEN loan_cur;
        
        create_sms: LOOP
        FETCH loan_cur INTO msg_loan_msisdn,msg_loan_type,msg_loan_bal,msg_loan_name;
        
        IF v_finished = 1 THEN
			
			SET v_code=-1;
			SET v_message="No loan record found";
			CALL `sp_send_sms`('254701562852', 'Dear Customer, you currently do not have an outstanding loan. Ethiotel.');
        ELSE 
        
			IF v_finished = 1 THEN 
			LEAVE create_sms;
			END IF;
			
			SET msg = msg || "/n" || msg_loan_name||" - ETB"||msg_loan_bal;
	 
			
			CALL `sp_send_sms`('254701562852', concat('Dear Customer, you currently have the following loan balances:',msg,' Ethiotel.'));
		END IF;	
        
			END LOOP create_sms;
	 
			CLOSE loan_cur;
    /*END IF;*/
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ethiotel_creditscore` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ethiotel_creditscore` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` PROCEDURE `sp_ethiotel_creditscore`()
BEGIN
        DECLARE no_more_rows boolean default false;
        
        DECLARE age_on_network_code INT DEFAULT 0;
	DECLARE topup_amount_code INT DEFAULT 0;
	DECLARE blacklisted_times_code INT DEFAULT 0;
	DECLARE airtime_usage_code INT DEFAULT 0;
	DECLARE number_of_loans_paid_code INT DEFAULT 0;
	DECLARE number_of_msisdn_code INT DEFAULT 0;
	DECLARE segment_code INT DEFAULT 0;
	declare v_msisdn varchar(20) default "";
	DECLARE age_on_network_val INT DEFAULT 0;
	DECLARE topup_amount_val INT DEFAULT 0;
	DECLARE blacklisted_times_val INT DEFAULT 0;
	DECLARE airtime_usage_val INT DEFAULT 0;
	DECLARE number_of_loans_paid_val INT DEFAULT 0;
	DECLARE number_of_msisdn_val INT DEFAULT 0;
	DECLARE segment_val INT DEFAULT 0;
	DECLARE age_on_network_score INT DEFAULT 0;
	DECLARE topup_amount_score INT DEFAULT 0;
	DECLARE blacklisted_times_score INT DEFAULT 0;
	DECLARE airtime_usage_score INT DEFAULT 0;
	DECLARE number_of_loans_paid_score INT DEFAULT 0;
	DECLARE number_of_msisdn_score INT DEFAULT 0;
	DECLARE segment_score INT DEFAULT 0;
	
	declare cur2_min_value int default 0;
	DECLARE cur2_max_value INT DEFAULT 0; 
	DECLARE cur2_rating_code INT DEFAULT 0;
	DECLARE cur2_score INT DEFAULT 0;
	DECLARE sum_credit_score INT DEFAULT 0;
	
	DECLARE cur3_min_credit_score INT DEFAULT 0;
	DECLARE cur3_max_credit_score INT DEFAULT 0; 
	DECLARE cur3_value INT DEFAULT 0;
	DECLARE score_award INT DEFAULT 0;
	
	
 -- declare cur1
	 DECLARE cur1 CURSOR FOR 
	 SELECT
	 msisdn,age_on_network,topup_amount,blacklisted_times,airtime_usage,number_of_loans_paid,number_of_msisdn,segment_val 
	 FROM `tbl_ethiotel_credit_rating_data`;
	 
 -- declare cur2
	 DECLARE cur2 CURSOR FOR 
	 SELECT
	 `min_value`,`max_value`,rating_code,score 
	 FROM `tbl_ethiotel_credit_rating_attributes`;
-- declare cur3
	 DECLARE cur3 CURSOR FOR 
	 SELECT
	 `min_credit_score`,`max_credit_score`,`value`
	 FROM `tbl_ethiotel_score_awards`;
	 
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET no_more_rows=true;
 
 SELECT rating_code FROM `tbl_ethiotel_code_description` WHERE rating_attribute='age_on_network' INTO age_on_network_code;
 SELECT rating_code FROM `tbl_ethiotel_code_description` WHERE rating_attribute='topup_amount' INTO topup_amount_code;
 SELECT rating_code FROM `tbl_ethiotel_code_description` WHERE rating_attribute='blacklisted_times' INTO blacklisted_times_code;
 SELECT rating_code FROM `tbl_ethiotel_code_description` WHERE rating_attribute='airtime_usage' INTO airtime_usage_code;
 SELECT rating_code FROM `tbl_ethiotel_code_description` WHERE rating_attribute='number_of_loans_paid' INTO number_of_loans_paid_code;
 SELECT rating_code FROM `tbl_ethiotel_code_description` WHERE rating_attribute='number_of_msisdn' INTO number_of_msisdn_code;
 SELECT rating_code FROM `tbl_ethiotel_code_description` WHERE rating_attribute='segment' INTO segment_code;
 open cur1;
 
 outer_loop: loop
     FETCH cur1 INTO v_msisdn,age_on_network_val,topup_amount_val,blacklisted_times_val,airtime_usage_val,
                        number_of_loans_paid_val,number_of_msisdn_val,segment_val; 
     IF no_more_rows THEN
      close cur1;
      leave outer_loop;
     END IF;
     
     OPEN cur2;
         
        set age_on_network_score = 0;
	SET topup_amount_score = 0;
	SET blacklisted_times_score  = 0;
	SET airtime_usage_score  = 0;
	SET number_of_loans_paid_score = 0;
	SET number_of_msisdn_score = 0;
	SET segment_score  = 0;
	SET sum_credit_score = 0;  
	
     inner_loop1: loop   
                  
	     fetch cur2 into cur2_min_value,cur2_max_value,cur2_rating_code,cur2_score;
	     	    
	     if no_more_rows then
	      set no_more_rows=false;
	      close cur2;
	      leave inner_loop1;	      
	     end if;
	     
	     if (age_on_network_val>cur2_min_value and age_on_network_val<cur2_max_value and cur2_rating_code = age_on_network_code)
	     then set age_on_network_score = cur2_score;    
	     end if;     
	     
	     IF (topup_amount_val>cur2_min_value AND topup_amount_val<cur2_max_value AND cur2_rating_code = topup_amount_code)
	     THEN SET topup_amount_score = cur2_score;
	     end if;
	     
	     IF (blacklisted_times_val>cur2_min_value AND blacklisted_times_val<cur2_max_value AND cur2_rating_code = blacklisted_times_code)
	     THEN SET blacklisted_times_score = cur2_score;	    
	     end if;
	     
	     IF (airtime_usage_val>cur2_min_value AND airtime_usage_val<cur2_max_value AND cur2_rating_code = airtime_usage_code)
	     THEN SET airtime_usage_score = cur2_score;	     
	     end if;
	     
	     IF (number_of_loans_paid_val>cur2_min_value AND number_of_loans_paid_val<cur2_max_value AND cur2_rating_code = number_of_loans_paid_code)
	     THEN SET number_of_loans_paid_score = cur2_score;	     
             end if;
		
	     IF (number_of_msisdn_val>cur2_min_value AND number_of_msisdn_val<cur2_max_value AND cur2_rating_code = number_of_msisdn_code)
	     THEN SET number_of_msisdn_score = cur2_score;	     
	     end if;
	     
	     IF (segment_val>cur2_min_value AND segment_val<cur2_max_value AND cur2_rating_code = segment_code)
	     THEN SET segment_score = cur2_score;	     
	     end if;
	     
	     set sum_credit_score = age_on_network_score + topup_amount_score + blacklisted_times_score +airtime_usage_score
	                          + number_of_loans_paid_score + number_of_msisdn_score + segment_score;
		                    
     end loop inner_loop1;     
     open cur3;
     inner_loop2: LOOP
	     FETCH cur3 INTO cur3_min_credit_score,cur3_max_credit_score,cur3_value;
	     
	     IF no_more_rows THEN
	        SET no_more_rows = FALSE;
		CLOSE cur3;
		LEAVE inner_loop2;
	     END IF;
	     
	     IF (sum_credit_score>cur3_min_credit_score AND sum_credit_score<cur3_max_credit_score)
	     THEN SET score_award = cur3_value;	     
	     END IF;	     
     END LOOP inner_loop2;
        
     update `tbl_ethiotel_subscriber` set `credit_score` = sum_credit_score,`loan_limit`=score_award  where `msisdn` = v_msisdn;
          
 end LOOP outer_loop;  
 
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ethiotel_error_logger` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ethiotel_error_logger` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` PROCEDURE `sp_ethiotel_error_logger`(IN log_event VARCHAR(200),IN log_message  VARCHAR(200),IN log_code  VARCHAR(200))
BEGIN
INSERT INTO `ethiotel`.`tbl_ethiotel_logs_exceptions`
(`LOG_EVENT`,
`LOG_CODE`,
`LOG_MESSAGE`)
VALUES
(log_event,log_code,log_message);
            
        commit ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ethiotel_loan_reminders` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ethiotel_loan_reminders` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` PROCEDURE `sp_ethiotel_loan_reminders`()
BEGIN
/*      == loan reminders settings
	--  -1    -> Should not be reminded at all
	--   0    -> Should be reminded daily.
	-- 1 to n -> Should be reminded n days before due date or after due date
	== all active loans
	-- select all active loans and put them in a cursor where
	   loan_status=4202,4203,4204 
	   sql = select msisdn,loan_due_date,loan_balance,loan_reminders_count from `tbl_ethiotel_active_loans`;
	  
	== loop though the loans checking if the current loan is due or overdue.
	== if due/overdue check from configs table for the actions to be done 
	
*/
	declare due_setting_value int default -1;
	DECLARE overdue_setting_value INT DEFAULT -1;
	
	declare no_more_rows boolean default false;
	
	DECLARE days INT DEFAULT 0;	
	declare days_due int default 0;
	declare days_overdue int default 0;
	declare tid_val int default 0;
	declare msisdn_val bigint default 0;
	declare loan_due_date_val date default null;
	declare loan_balance_val int default 0;
	declare due_loan_reminders_count_val int default 0;
	DECLARE overdue_loan_reminders_count_val INT DEFAULT 0;
	
	declare cur1 cursor for 
	select tid,msisdn,loan_due_date,loan_balance,due_loan_reminders_count,overdue_loan_reminders_count 
	from `tbl_ethiotel_active_loans`;
	
	declare continue handler for not found set no_more_rows=true;
	open cur1;
		
	select `setting_value` from `tbl_ethiotel_application_config`
        where `category`='due_loan_reminders' and `setting_name`='due_total_reminders' 
        into due_setting_value;
        
        SELECT `setting_value` FROM `tbl_ethiotel_application_config`
        WHERE `category`='overdue_loan_reminders' AND `setting_name`='overdue_total_reminders' 
        INTO overdue_setting_value;
        
	active_loans_loop: loop
	   if no_more_rows then
		close cur1;
		leave active_loans_loop;
	   end if;	   	
	   -- perform other acions here
	   
	   fetch cur1 into tid_val,msisdn_val,loan_due_date_val,loan_balance_val,due_loan_reminders_count_val,overdue_loan_reminders_count_val;
           
           set days = DATEDIFF(loan_due_date_val, CURDATE());
	   	
           if (days >= 0) then            
            -- loan is due
            
              set days_due = days;
              IF (due_setting_value = -1) then
		  -- should not be reminded at all
		  SELECT 1;              
	      ELSEif (due_setting_value = 0) then
	          -- be sent a reminder daily and update due_loan_reminders_count_val+1
	          -- CALL sp_send_sms('254726516070', concat('Dear Customer, Please pay your loan balance of ',loan_balance_val, ' before ',loan_due_date_val,' to avoid service disruption'));
	          SELECT 1;	      
	      else
	          IF (due_loan_reminders_count_val < due_setting_value) THEN
		   -- send due loan sms reminder and update due_loan_reminders_count_val+1
		
		   CALL sp_send_sms(msisdn_val, CONCAT('Dear Customer, Please pay your loan balance of ',loan_balance_val, ' before ',loan_due_date_val,' to avoid service disruption'));
	           
		  insert into `tbl_ethiotel_debug_logs`(`log_data`)values(loan_balance_val);
		  update `tbl_ethiotel_active_loans` set `due_loan_reminders_count` = (due_loan_reminders_count_val + 1) where `tid` = tid_val;
	          
	          END IF;  
	      END IF;
	   END IF;
	   
	   IF (days < 0) THEN   
             -- loan is overdue               
              SET days_overdue = days;
             IF (overdue_setting_value = -1) THEN
		SELECT 1;
	     ELSEIF (overdue_setting_value = 0) THEN	             
	         -- be sent a reminder daily  
	         -- CALL sp_send_sms('254726516070', CONCAT('Dear Customer, Please pay your loan balance of ',loan_balance_val, ' which was due on ',loan_due_date_val,' to avoid service disruption'));
	        SELECT 1;
	     ELSE
		 IF (overdue_loan_reminders_count_val < overdue_setting_value) THEN
		      -- send overdue loan sms reminder and update overdue_loan_reminders_count_val+1
		 -- CALL sp_send_sms(msisdn_val, CONCAT('Dear Customer, Please pay your loan balance of ',loan_balance_val, ' which was due on ',loan_due_date_val,' to avoid service disruption'));
		 SELECT 1;
		-- INSERT INTO `tbl_ethiotel_debug_logs`(`log_data`)VALUES(loan_balance_val);
		-- UPDATE `tbl_ethiotel_active_loans` SET `overdue_loan_reminders_count` = (overdue_loan_reminders_count_val + 1) WHERE `tid` = tid_val;
		 END IF;        
             END IF;
          END IF;
	   
	end loop active_loans_loop;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_ethiotel_loan_repayment` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_ethiotel_loan_repayment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` PROCEDURE `sp_ethiotel_loan_repayment`(
	IN `p_active_loan_trx_id` INT,
	IN `p_msisdn` INT,
	IN `p_loan_repayment_amount` INT,
	IN `p_loan_amount` INT,
	IN `p_repayment_cbs_trx_id` VARCHAR(50),
	IN `p_loan_status` INT
)
BEGIN
/*update tbl_ethiotel_active_loans */
update tbl_ethiotel_active_loans set last_update= sysdate(), repayment_date=sysdate(), loan_status=p_loan_status,
loan_balance=loan_balance-p_loan_repayment_amount where tid=p_active_loan_trx_id;
/*insert tbl_ethiotel_loan_repayments */
insert into tbl_ethiotel_loan_repayments 
(repayment_amount,msisdn,active_loan_trx_id,repayment_channel,balance_after_repayment,repayment_cbs_trx_id) values
(p_loan_repayment_amount,p_msisdn,p_active_loan_trx_id,'WebService',p_loan_repayment_amount,p_repayment_cbs_trx_id);
/*send sms*/
CALL `sp_send_sms`('254703764251', concat('Dear Customer ,',p_msisdn,' You have repaid your loan of ',p_loan_amount, ' with ',p_loan_repayment_amount,' your new loan balance is ', (p_loan_amount-p_loan_repayment_amount) ));
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_send_sms` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_send_sms` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` PROCEDURE `sp_send_sms`(
	IN `p_msisdn` VARCHAR(50),
	IN `p_message` VARCHAR(150)
)
BEGIN
insert into SENT_SMS_T (msisdn, message)values (p_msisdn, p_message);
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_unblacklist_subscriber` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_unblacklist_subscriber` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` PROCEDURE `sp_unblacklist_subscriber`(OUT message VARCHAR(50))
BEGIN
-- Retrieve all blacklist candindates
UPDATE tbl_ethiotel_blacklist SET blacklist_status = 0 WHERE blacklist_status = 1;
SET message = "Updated successfully";
END */$$
DELIMITER ;

/* Procedure structure for procedure `update_sms_delivered` */

/*!50003 DROP PROCEDURE IF EXISTS  `update_sms_delivered` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` PROCEDURE `update_sms_delivered`(IN smsid int, IN status int)
BEGIN
update SENT_SMS_T set sms_delivered = status, date_delivered = NOW()
    where id = smsid;
    
    commit;
END */$$
DELIMITER ;

/* Procedure structure for procedure `update_sms_submitted` */

/*!50003 DROP PROCEDURE IF EXISTS  `update_sms_submitted` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` PROCEDURE `update_sms_submitted`(IN smsid int, IN status int)
BEGIN
update SENT_SMS_T set sms_submitted = status, date_submitted = NOW()
    where id = smsid;
    
    commit;
END */$$
DELIMITER ;

/* Procedure structure for procedure `ussd_get_profile` */

/*!50003 DROP PROCEDURE IF EXISTS  `ussd_get_profile` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`etudbuser`@`%` PROCEDURE `ussd_get_profile`(in p_msisdn varchar(15), out p_cnt varchar(10), out p_blacklist_status varchar(20),
 out p_credit_score varchar(20), out p_lang varchar(10), out p_subscriber_id varchar(20), out p_sub_type varchar(30), 
  out v_code varchar(100), out v_msg text, out v_error_msg text, out p_loan_limit varchar(20))
BEGIN
	Declare subscriber_count int;
    DECLARE defaultStatus VARCHAR(20) DEFAULT '-1';
	/*
    
		Activities:
        1. Fetch count
        2. If count == 0, then assign default status to the rest of the variables.
        3. If count > 0 then pick the rest of the details from subscriber table.
    	
    */
    
    select count(*) 
    into subscriber_count
    from tbl_ethiotel_subscriber 
    where substr(msisdn,-9) = substr(trim(p_msisdn),-9);
    
    if subscriber_count = 0 then
		
        set p_cnt = subscriber_count;
		set p_blacklist_status = defaultStatus;
		set p_credit_score = defaultStatus;
        set p_lang = defaultStatus;
        set p_sub_type = defaultStatus;
		set v_code = '4999';
        set p_subscriber_id = defaultStatus;
		set p_loan_limit = defaultStatus;
		set v_msg = 'Sorry, subscriber does not exist in the system.';
        set v_error_msg = 'SUBSCRIBER_DOES_NOT_EXIST';
        
    else
		
        select subscriber_id,subscriber_type,ifnull(preffered_language,'NA') preffered_language,subscriber_status,
        credit_score, loan_limit 
        into p_subscriber_id, p_sub_type, p_lang, p_blacklist_status, p_credit_score, p_loan_limit 
		from tbl_ethiotel_subscriber
		where substr(msisdn,-9) = substr(trim(p_msisdn),-9);
        
        set p_cnt = subscriber_count;
		set v_code = '4000';
		set v_msg = 'Operation Successful.';
        set v_error_msg = 'SUBSCRIBER_EXIST';
        
    end if;
    
    
    
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

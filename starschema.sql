							  								  
create table IF NOT EXISTS tblapp (appid int PRIMARY KEY REFERENCES tblfact (appid), 
					   appname varchar (20));
					   
create table IF NOT EXISTS tblapphostmapping (apphostmappingid int PRIMARY KEY REFERENCES tblfact (apphostmappingid), 
								  hostid int, 
								  appid int );

create table IF NOT EXISTS tbldetectedissues (detectedissueid int PRIMARY KEY REFERENCES tblfact (detectedissueid),
										ipaddress varchar(50),	 
										 firstdetecteddate varchar(50),
										 lastdetecteddate varchar(50), 
										 status varchar (20),
										 statuschangedate varchar(50),
										 issueid int);

create table IF NOT EXISTS tblhost (hostid int PRIMARY KEY REFERENCES tblfact (hostid), 
						hostip varchar (20));
						
create table IF NOT EXISTS tblissue (issueid int PRIMARY KEY REFERENCES tblfact (issueid), 
								 issuename varchar (50));
								 
create table IF NOT EXISTS tblrole (roleid int PRIMARY KEY REFERENCES tblfact (roleid),
						roletype varchar (20));
						
create table IF NOT EXISTS tbluser (userid int PRIMARY KEY REFERENCES tblfact (userid),
						userlogin varchar (20));
						
create table IF NOT EXISTS tbluseraccess (useraccessid int PRIMARY KEY REFERENCES tblfact (useraccessid),
							  roleid int,
							  hostid int,
							  appid int,
							  userlogin int );

create table IF NOT EXISTS tblfact (appid int  REFERENCES tblapp ,
						  			apphostmappingid int REFERENCES tblapphostmapping ,
						  			detectedissueid int REFERENCES tbldetectedissues ,
						  			hostid int REFERENCES tblhost,
						  			issueid int REFERENCES tblissue , 
						  			roleid int REFERENCES tblrole,
							  		userid int REFERENCES tbluser ,
							  		useraccessid int REFERENCES tbluseraccess,
							  		firstdetecteddate varchar(50),
								    lastdetecteddate varchar(50), 
									status varchar (20),
								    statuschangedate varchar(50)
								    constraint pk primary key (appid, apphostmappingid, detectedissueid,
								     hostid, issueid, roleid,  userid, useraccessid));
							  		
create table "tblUser" ("UserID" int PRIMARY KEY,
						"UserLogin" varchar (20));
						
create table "tblRole" ("RoleID" int PRIMARY KEY,
						"RoleType" varchar (20));
						
create table "tblUserAccess" ("UserAccessID" int PRIMARY KEY,
							  "RoleID" int REFERENCES "tblRole" ("RoleID"));
							  

create table "tblApp" ("AppID" int PRIMARY KEY, 
					   "AppName" varchar (20) not null);

create table "tblVulnerability" ("VulnerabilityID" int PRIMARY KEY, 
								 "VulnerabilityName" varchar (20) not null);
								 
create table "tblHost" ("HostID" int PRIMARY KEY, 
						"HostIP" varchar (20) not null);

create table "tblDetectedVulnerability" ("DetectedVulnerability" int PRIMARY KEY, 
										 "FirstDetectedDate" timestamp,
										 "LastDetectedDate" timestamp, 
										 "Status" varchar (20));
										 
create table "tblAppHostMapping" ("AppHostMappingID" int PRIMARY KEY, 
								  "HostID" int REFERENCES "tblHost" ("HostID"), 
								  "AppID" int REFERENCES "tblApp" ("AppID"));





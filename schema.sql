create table IF NOT EXISTS "tblUser" ("UserID" int PRIMARY KEY,
						"UserLogin" varchar (20));
						
create table IF NOT EXISTS "tblRole" ("RoleID" int PRIMARY KEY,
						"RoleType" varchar (20));
						
create table IF NOT EXISTS "tblUserAccess" ("UserAccessID" int PRIMARY KEY,
							  "RoleID" int REFERENCES "tblRole" ("RoleID"));
							  

create table IF NOT EXISTS "tblApp" ("AppID" int PRIMARY KEY, 
					   "AppName" varchar (20) not null);

create table IF NOT EXISTS "tblVulnerability" ("VulnerabilityID" int PRIMARY KEY, 
								 "VulnerabilityName" varchar (20) not null);
								 
create table IF NOT EXISTS "tblHost" ("HostID" int PRIMARY KEY, 
						"HostIP" varchar (20) not null);

create table IF NOT EXISTS "tblDetectedVulnerability" ("DetectedVulnerability" int PRIMARY KEY, 
										 "FirstDetectedDate" timestamp,
										 "LastDetectedDate" timestamp, 
										 "Status" varchar (20));
										 
create table IF NOT EXISTS "tblAppHostMapping" ("AppHostMappingID" int PRIMARY KEY, 
								  "HostID" int REFERENCES "tblHost" ("HostID"), 
								  "AppID" int REFERENCES "tblApp" ("AppID"));





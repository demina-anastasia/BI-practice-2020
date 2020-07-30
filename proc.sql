BEGIN
       
       update pa
	   set pa.appname=fa.appname
	   from public.tblapp as pa
       inner join f.tblapp as fa 
	   on pa.appid=fa.appid;
       
	   insert into public.tblapp(appid,appname,startdate,enddate)
	   select appid,appname,now(),null from f.tblapp;
	   
	END; 

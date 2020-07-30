BEGIN
       
       update star.tblapp
	   set appname=pa.appname, 
	   enddate = now()
       from star.tblapp sa
       inner join public.tblapp pa 
	   on sa.appid=pa.appid;
	   
	   insert into star.tblapp(appid,appname,startdate,enddate)
	   select appid,appname,now(),null from public.tblapp pp
	   where not exists (select 1 from star.tblapp ss where ss.appid = pp.appid and ss.enddate is null);
	   
	END; 

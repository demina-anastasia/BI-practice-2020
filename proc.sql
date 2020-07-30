CREATE OR REPLACE PROCEDURE star.procapp(
	)
LANGUAGE 'plpgsql'

AS $BODY$BEGIN
  
	   
	  update star.tblapp sa
	set 
	enddate = now()
	from public.tblapp pa
	where sa.appid=pa.appid and sa.enddate is null and  sa.updateon>now()-INTERVAL '1 DAY';
	   
	   insert into star.tblapp(appid,appname,startdate,enddate,updateon)
	   select appid,appname,now(),null,now() from public.tblapp pp
	   where not exists (select 1 from star.tblapp ss where ss.appid = pp.appid and ss.enddate is null ) and  pp.updateon is null 
	   
	   union all  select appid,appname,now(),null,now() from public.tblapp pp
	   where not exists (select 1 from star.tblapp ss where ss.appid = pp.appid and ss.enddate is null ) and  pp.updateon>now()-INTERVAL '1 DAY';
	   
	END; $BODY$;

CREATE OR REPLACE PROCEDURE procapp() 
LANGUAGE plpgsql
 AS $$
	BEGIN
        insert into public.tblapp select * from f.tblapp
on conflict (appid) do update set appname=EXCLUDED.appname, startdate = now(), enddate = NULL;
	
	END; $$
	

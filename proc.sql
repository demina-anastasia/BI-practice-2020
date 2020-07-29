CREATE OR REPLACE PROCEDURE procapp() 
LANGUAGE plpgsql
 AS $$
	BEGIN
        IF (TG_OP = 'UPDATE') THEN
            INSERT INTO public.tblapp SELECT new.*, now(), NULL;
			
		ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO public.tblapp SELECT new.*, now(), NULL;
	END IF;
	END; $$
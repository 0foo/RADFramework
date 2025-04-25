DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'web_anon') THEN
CREATE ROLE web_anon NOLOGIN;
END IF;
END
$$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'authenticated') THEN
CREATE ROLE authenticated NOLOGIN;
END IF;
END
$$;

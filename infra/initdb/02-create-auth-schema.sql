-- Create the auth schema for helper functions
CREATE SCHEMA IF NOT EXISTS auth;

-- Create the auth.uid() function to extract user id from JWT
CREATE OR REPLACE FUNCTION auth.uid()
RETURNS integer
LANGUAGE sql
STABLE
AS $$
SELECT nullif(current_setting('request.jwt.claim.sub', true), '')::integer;
$$;

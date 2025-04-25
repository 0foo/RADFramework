-- Grant usage of public schema
GRANT USAGE ON SCHEMA public TO web_anon;
GRANT USAGE ON SCHEMA public TO authenticated;

-- Allow authenticated users to select, insert, update users
GRANT SELECT, INSERT, UPDATE ON users TO authenticated;

-- Enable Row-Level Security (RLS) on the users table
ALTER TABLE users ENABLE ROW LEVEL SECURITY;

-- Allow users to select their own record
CREATE POLICY select_own_user ON users
    FOR SELECT
                   USING (auth.uid() = id);

-- Allow users to update their own record
CREATE POLICY update_own_user ON users
    FOR UPDATE
                   USING (auth.uid() = id);

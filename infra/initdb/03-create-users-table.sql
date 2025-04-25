-- Create the users table
CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       email TEXT UNIQUE NOT NULL,
                       password TEXT NOT NULL,
                       role TEXT DEFAULT 'authenticated' NOT NULL,
                       created_at TIMESTAMPTZ DEFAULT now()
);

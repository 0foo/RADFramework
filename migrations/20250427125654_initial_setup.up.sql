-- Profiles (Optional)
CREATE TABLE profiles (
    user_id INTEGER PRIMARY KEY REFERENCES users(id),
    bio TEXT,
    avatar_url TEXT,
    location TEXT
);

-- Posts
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Comments
CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(id) NOT NULL,
    user_id INTEGER REFERENCES users(id) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Likes (for posts)
CREATE TABLE likes (
    id SERIAL PRIMARY KEY,
    post_id INTEGER REFERENCES posts(id) NOT NULL,
    user_id INTEGER REFERENCES users(id) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now(),
    UNIQUE (post_id, user_id) -- no duplicate likes
);

-- Follows
CREATE TABLE follows (
    follower_id INTEGER REFERENCES users(id) NOT NULL,
    followed_id INTEGER REFERENCES users(id) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT now(),
    PRIMARY KEY (follower_id, followed_id)
);

DO $$
BEGIN
    IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'follows') THEN
        DROP TABLE follows;
    END IF;

    IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'likes') THEN
        DROP TABLE likes;
    END IF;

    IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'comments') THEN
        DROP TABLE comments;
    END IF;

    IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'posts') THEN
        DROP TABLE posts;
    END IF;

    IF EXISTS (SELECT FROM information_schema.tables WHERE table_name = 'profiles') THEN
        DROP TABLE profiles;
    END IF;
END
$$;

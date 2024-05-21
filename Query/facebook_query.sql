-- Copying everything from CSV into database table
COPY facebook FROM 'C:\Users\moham\Downloads\facebook_reviews.csv' WITH CSV HEADER;

-- All users who have said something positive about the app
SELECT username, content_posted
FROM facebook
WHERE content_posted ILIKE 'Good%' OR content_posted ILIKE 'Nice%' OR content_posted ILIKE 'Great%' OR content_posted ILIKE 'Excellent' OR content_posted ILIKE 'Lovely%' OR content_posted ILIKE 'Best%'

-- Total count of people who have something good
-- Out of 56112 total users recorded, only 9227 have something positive about the app, that's about 16 percent 
SELECT COUNT(username)
FROM facebook 
WHERE content_posted ILIKE 'Good%' OR content_posted ILIKE 'Nice%' OR content_posted ILIKE 'Great%' OR content_posted ILIKE 'Excellent' OR content_posted ILIKE 'Lovely%' OR content_posted ILIKE 'Best%'

-- Bad Ratings
SELECT COUNT(score)
FROM facebook
WHERE score = 1 or score = 2

-- Good Ratings
SELECT COUNT(score)
FROM facebook
WHERE score = 3 OR score = 4 OR score = 5

-- Day that had the most users on the app
SELECT MAX(last_update)
FROM facebook

-- Day that had the least users on the app
SELECT MIN(last_update)
FROM facebook

-- The content posted that has more than 1000 thumbs up
SELECT content_posted, MAX(thumbs_up_count)
FROM facebook
WHERE thumbs_up_count > 1000
GROUP BY content_posted

-- All users who have posted content greater than 1000 thumbs up reactions
SELECT username, content_posted, thumbs_up_count
FROM facebook
WHERE thumbs_up_count > 1000

-- Dates when users joined the app from 2016 up until May of this year
SELECT last_update, COUNT(username)
FROM facebook
WHERE last_update BETWEEN '01-01-2016' AND '05-01-2024'
GROUP BY last_update

-- Popular posts that post good content about the app
SELECT COUNT(*)
FROM facebook
WHERE thumbs_up_count > 1000 AND score = 1 OR score = 2


-- Popular posts that post bad content about the app
SELECT COUNT(*)
FROM facebook
WHERE thumbs_up_count > 1000 AND score = 3 OR score = 4 OR score = 5


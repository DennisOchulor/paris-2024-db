-- Dennis Nwanevu Chong Ochulor - 22472393
-- Rebuild the entire database from scratch

-- Recreate the database
\. create/create_database.sql

-- Recreate all the tables
\. create/create_country.sql
\. create/create_participant.sql
\. create/create_athlete.sql
\. create/create_team.sql
\. create/create_coach.sql
\. create/create_sport.sql
\. create/create_venue.sql
\. create/create_event.sql
\. create/create_participate.sql
\. create/create_consists.sql
\. create/create_coaches.sql

-- Create triggers
\. triggers/afterInsertConsists.sql
\. triggers/afterUpdateConsists.sql
\. triggers/afterDeleteConsists.sql

-- Insert data into the tables
\. insert/insert_country.sql
\. insert/insert_athlete.sql
\. insert/insert_team.sql
\. insert/insert_coach.sql
\. insert/insert_sport.sql
\. insert/insert_venue.sql
\. insert/insert_event.sql
\. insert/insert_participate.sql
\. insert/insert_consists.sql
\. insert/insert_coaches.sql

-- Create stored procedures
\. procedures/insertAthlete.sql
\. procedures/insertTeam.sql

-- Create views
\. views/MedalTally.sql
\. views/Medallists.sql

-- Create indexes
\. indexes/AthleteNameIndex.sql
\. indexes/ParticipantCountryIndex.sql

-- Make the output look cleaner
pager less -SFX


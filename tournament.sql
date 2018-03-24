-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

--had a hard time with this as I work in a MSSQL environment daily and the 
--syntax is slightly different

--drops DB and tables if they exist
DROP DATABASE if exists tournament;

--creates the tournament db and connects
CREATE DATABASE tournament;
\c tournament 

--Drop Tables if they exist
DROP TABLE IF EXISTS players CASCADE;
DROP TABLE IF EXISTS match CASCADE;
DROP VIEW IF EXISTS win_count CASCADE;
DROP VIEW IF EXISTS match_count CASCADE;
DROP VIEW IF EXISTS standings CASCADE;


--Creates table of players
CREATE TABLE players(
	playerID serial primary key,
	playerName text not null
);

--creates a table to track matches
CREATE TABLE match(
	matchID serial primary key,
	winner int,
	loser int,
	constraint
		fk_player_winner FOREIGN KEY (winner) 
			references players(playerID),
	constraint
		fk_player_loser FOREIGN KEY (loser) 
			references players(playerID)
);

--View wins per player
CREATE view win_count AS
	SELECT p.playerID as winnerID,
			p.playerName as playerName,
			count(m.winner) as wins
    FROM players p LEFT JOIN match m ON p.playerID = m.winner
    GROUP BY p.playerID, p.playerName;


--VIEW matches per player
CREATE view match_count AS
	SELECT p.playerID as playerID,
			p.playerName as playerName,
			count(case when p.PlayerID = m.winner OR p.playerID = m.loser then 1 end) as matches
	FROM players p LEFT JOIN match m ON p.playerID = m.winner or p.playerID = m.loser
	GROUP BY p.playerID, p.playerName;


-- Pulls standings displays wins and matches, player with most wins in row 1
CREATE VIEW standings AS 
	SELECT m.playerID as playerID,
			m.playerName as playerName,
			w.wins as wins,
			m.matches as matches
	FROM match_count m, win_count w
	WHERE m.playerID = w.winnerID
	ORDER BY w.wins DESC;

# Swiss Tournament Runner
A project that uses a relational database to run and keep results of Swiss style tournament where all players play each round and the matchup for each round is determined by the results of previous rounds.  Build using Python and PSQL.

## FILEs
- **Tournament.sql** (The PSQL commands that build the DB, tables and views used to run the tournament)
- **Tournament.py** (The Python code used to input to and recall data from the DB)
- **Tournament_test.py** (The Python code that tests the functionality of tournament.py)
- **Tournament.pyc**

## Required Software
- **Vagrant** ([installation instructions and links to software](https://www.udacity.com/wiki/ud197/install-vagrant)) 
- **Python 2.7.X** ([link to software](https://www.python.org/downloads/))

## Instructions for Review
- Clone tis repo to your local machine
- Open your terminal and navigate to the repo folder you just downloaded
- Start Vagrant with `vagrant up`
- Log into the virtual machine with `vagrant ssh`
- Create the PSQL DB with `psql -f tournament.sql`
- Execute the tournament with `python tournament_test.py`

## What You Should See
1. countPlayers() returns 0 after initial deletePlayers() execution.
2. countPlayers() returns 1 after one player is registered.
3. countPlayers() returns 2 after two players are registered.
4. countPlayers() returns zero after registered players are deleted.
5. Player records successfully deleted.
6. Newly registered players appear in the standings with no matches.
7. After a match, players have updated standings.
8. After match deletion, player standings are properly reset.
9. Matches are properly deleted.
10. After one match, players with one win are properly paired.
Success!  All tests pass!


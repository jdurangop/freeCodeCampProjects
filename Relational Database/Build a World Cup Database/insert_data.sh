#! /bin/bash

if [[ $1 == "test" ]]; then
    PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
    PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
QUERY=$( $PSQL "CREATE OR REPLACE FUNCTION insert_or_select_team_id(team_name TEXT)
  RETURNS INTEGER AS \$\$
  DECLARE
    selected_id INTEGER;
  BEGIN
    SELECT team_id INTO selected_id
    FROM teams
    WHERE name = team_name;

    IF selected_id IS NULL THEN
      INSERT INTO teams (name)
      VALUES (team_name)
      RETURNING team_id INTO selected_id;
    END IF;

    RETURN selected_id;
  END;
\$\$ LANGUAGE plpgsql;" )

QUERY=$( $PSQL "CREATE OR REPLACE FUNCTION insert_game(
    g_year INT,
    g_round VARCHAR(50),
    g_winner TEXT,
    g_opponent TEXT,
    g_winner_goals INT,
    g_opponent_goals INT
  )
  RETURNS INTEGER AS \$\$
  DECLARE
    selected_game_id INT;
  BEGIN
    INSERT INTO games(
      year,
      round,
      winner_id,
      opponent_id,
      winner_goals,
      opponent_goals
    )
    VALUES (
      g_year,
      g_round,
      insert_or_select_team_id(g_winner),
      insert_or_select_team_id(g_opponent),
      g_winner_goals,
      g_opponent_goals
    )
    RETURNING game_id INTO selected_game_id;

    RETURN selected_game_id;
  END;
\$\$ LANGUAGE plpgsql;" )

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; do
    if [[ $YEAR == 'year' ]]; then
        continue
    fi
    
    QUERY=$( $PSQL "SELECT  insert_game($YEAR, '$ROUND', '$WINNER', '$OPPONENT', $WINNER_GOALS, $OPPONENT_GOALS)" )
done

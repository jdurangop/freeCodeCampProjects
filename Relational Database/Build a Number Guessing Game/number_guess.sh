#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -qAtX -c"

echo "Enter your username:"
read USERNAME

USER=$($PSQL "SELECT user_id, count(*) AS games_played, MIN(guesses) AS best_game
              FROM users
              INNER JOIN games USING(user_id)
              WHERE users.name = '$USERNAME'
              GROUP BY users.user_id")

if [[ -z $USER ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."

  USER_ID=$($PSQL "INSERT INTO users(name)
                  VALUES ('$USERNAME')
                  ON CONFLICT DO NOTHING
                  RETURNING user_id")

  if [[ -z $USER_ID ]]; then
    USER_ID=$($PSQL "SELECT user_id
                    FROM users
                    WHERE users.name = '$USERNAME'")
  fi
else
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< "$USER"

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(($RANDOM%1000 + 1))
NUMBER_OF_GUESSES=1

echo "Guess the secret number between 1 and 1000:"
read GUESS

while [ ! "$GUESS" = "$SECRET_NUMBER" ]; do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
  else
    if [[ $GUESS -gt $SECRET_NUMBER ]]; then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
  fi
  
  read GUESS
  ((NUMBER_OF_GUESSES++))
done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

GAME=$($PSQL "INSERT INTO games(user_id, guesses)
              VALUES ($USER_ID, $NUMBER_OF_GUESSES)")
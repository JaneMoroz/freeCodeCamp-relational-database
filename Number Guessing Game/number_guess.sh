#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# regular expression to detect number
re='^[0-9]+$'

# get player's name
echo Enter your username:
read USERNAME

PLAYER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

# if player doesn't exist
if [[ -z $PLAYER_ID ]]
then
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
  # add user to the databse
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')") 
  # get new user id
  PLAYER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
else
  # get more information
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = '$PLAYER_ID'")
  BEST_GAME=$($PSQL "SELECT MAX(number_of_guesses) FROM games WHERE user_id = '$PLAYER_ID'")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# start game
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESES=1

echo Guess the secret number between 1 and 1000:
read ANSWER

function PLAY_GAME() {
  (( NUMBER_OF_GUESES++ ))
  if [[ ! $ANSWER =~ $re ]]
  then
    echo That is not an integer, guess again:
  else
    if [[ $ANSWER > $SECRET_NUMBER ]]
    then
      echo -e "It's lower than that, guess again:"
    elif [[ $ANSWER < $SECRET_NUMBER ]]
    then
      echo -e "It's higher than that, guess again:"
    fi
  fi
  read ANSWER
}

until [[ $ANSWER == $SECRET_NUMBER ]]
do
  PLAY_GAME
done

# save result
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES($PLAYER_ID, $NUMBER_OF_GUESES)") 
echo -e "You guessed it in $NUMBER_OF_GUESES tries. The secret number was $SECRET_NUMBER. Nice job!"





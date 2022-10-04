#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# regular expression to detect number
re1='^[0-9]+$'
# regular expression to detect up to two letters
re2='^[a-zA-Z]$|^[a-zA-Z]{2}$'
# regular expression to detect word with more than 2 letters
re3='^[a-zA-Z]{3,}$'

if [[ $1 ]]
then
  # number is provided
  if [[ $1 =~ $re1 ]]
  then
    # find element by id
    ELEMENT_ID=$1
    ELEMENT=$($PSQL "SELECT name, type, symbol, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties using(atomic_number) FULL JOIN types using(type_id) WHERE atomic_number=$ELEMENT_ID")
    # if element doesn't exist
    if [[ -z $ELEMENT ]]
    then
      echo -e "I could not find that element in the database."
    else 
      # get columns
      echo "$ELEMENT" | while read ELEMENT_NAME A ELEMENT_TYPE B ELEMENT_SYMBOL C ELEMENT_MASS D ELEMENT_MELT_POINT E ELEMENT_BOIL_POINT
      do
        echo -e "The element with atomic number $ELEMENT_ID is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELT_POINT celsius and a boiling point of $ELEMENT_BOIL_POINT celsius."
      done
    fi
  elif [[ $1 =~ $re2 ]]
  then
    # find element by symbol
    ELEMENT_SYMBOL=$1
    ELEMENT=$($PSQL "SELECT atomic_number, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties using(atomic_number) FULL JOIN types using(type_id) WHERE symbol='$ELEMENT_SYMBOL';")
    # if element doesn't exist
    if [[ -z $ELEMENT ]]
    then
      echo -e "I could not find that element in the database."
    else 
      # get columns
      echo "$ELEMENT" | while read ELEMENT_ID A ELEMENT_NAME B ELEMENT_TYPE C ELEMENT_MASS D ELEMENT_MELT_POINT E ELEMENT_BOIL_POINT
      do
        echo -e "The element with atomic number $ELEMENT_ID is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELT_POINT celsius and a boiling point of $ELEMENT_BOIL_POINT celsius."
      done
    fi
  elif [[ $1 =~ $re3 ]]
  then
    # find element by name
    ELEMENT_NAME=$1
    ELEMENT=$($PSQL "SELECT atomic_number, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements FULL JOIN properties using(atomic_number) FULL JOIN types using(type_id) WHERE name='$ELEMENT_NAME';")
    # if element doesn't exist
    if [[ -z $ELEMENT ]]
    then
      echo -e "I could not find that element in the database."
    else 
      # get columns
      echo "$ELEMENT" | while read ELEMENT_ID A ELEMENT_SYMBOL B ELEMENT_TYPE C ELEMENT_MASS D ELEMENT_MELT_POINT E ELEMENT_BOIL_POINT
      do
        echo -e "The element with atomic number $ELEMENT_ID is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELT_POINT celsius and a boiling point of $ELEMENT_BOIL_POINT celsius."
      done
    fi
  fi
else 
  # if no argument provided
  echo Please provide an element as an argument.
fi

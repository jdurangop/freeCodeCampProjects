#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -qAtX -c"

SERVICE_LIST=$($PSQL "SELECT service_id, name
                      FROM services
                      ORDER BY service_id")

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]; then
    echo -e "$1"
  fi
  
  echo "$SERVICE_LIST" | while IFS="|" read SERVICE_ID NAME; do
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
    MAIN_MENU "\nI could not find that service. What would you like today?"
    return 0
  fi

  SERVICE_NAME=$($PSQL "SELECT name
                        FROM services
                        WHERE service_id = $SERVICE_ID_SELECTED")

  if [[ -z $SERVICE_NAME ]]; then
    MAIN_MENU "\nI could not find that service. What would you like today?"
    return 0
  fi

  INSERT_NEW_APPOINTMENT
}

INSERT_NEW_APPOINTMENT(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_INFO=$($PSQL "SELECT customer_id, name
                        FROM customers
                        WHERE phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_INFO ]]; then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    CUSTOMER_ID=$($PSQL "INSERT INTO customers(phone, name)
                        VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')
                        RETURNING customer_id")
  else
    IFS="|" read CUSTOMER_ID CUSTOMER_NAME <<< "$CUSTOMER_INFO"
  fi

  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
  read SERVICE_TIME

  APPOINTMENT_ID=$($PSQL "INSERT INTO appointments(customer_id, service_id, time)
                          VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')
                          RETURNING appointment_id")

  if [[ $APPOINTMENT_ID =~ ^[0-9]+$ ]]; then
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MAIN_MENU "Welcome to My Salon, how can I help you?\n"

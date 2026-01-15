CLASS zcl_02_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_demo_08 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA carrier_id    TYPE /dmo/carrier_id    VALUE 'LH'.
    DATA connection_id TYPE /dmo/connection_id VALUE '0400'.

    " select [spalten] FROM [datenbankquelle] where [BEDINGUNG]

    " Lesen von einzelsätzen
    DATA connection    TYPE /dmo/connection.
    DATA connections type table of /dmo/connection.
    DATA connection3 TYPE z02_connection.

    SELECT SINGLE FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id AND @connection_id = @connection_id
      INTO @connection.
    out->write( connection ).

    " lesen mehrerer datensätze

    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO TABLE @connections.

      out->write( connections ).
clear connections.
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = @carrier_id
      INTO @connection.
      append connection to connections.

    ENDSELECT.

    " lesen mehrerer datensätze


    "definition der zielvariablen( inlinedeklaration
    select single from /dmo/connection
    FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
    where carrier_id = @carrier_id and connection_id = @connection_id
    into @data(connection2).
     out->write( connection2 ).

    "definition der zielvariablen( angabe passender felder)
    select single from /dmo/connection
    FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
    where carrier_id = @carrier_id and connection_id = @connection_id
    into @connection3.
     out->write( connection3 ).

    "definition der zielvariablen( kopieren namensgleicher felder)
    select single from /dmo/connection
    FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
    where carrier_id = @carrier_id and connection_id = @connection_id
    into CORRESPONDING fields of @connection.
     out->write( connection ).

    "definition von tabellen-joins (elegantere lösung für aufgabe 9)

    select from /dmo/connection
    inner join /dmo/carrier on /dmo/connection~carrier_id = /dmo/carrier~carrier_id
    fields /dmo/connection~connection_id, /dmo/carrier~name
    into table @DATA(connections2).





  ENDMETHOD.
ENDCLASS.

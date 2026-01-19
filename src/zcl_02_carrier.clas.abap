CLASS zcl_02_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  interfaces zif_02_Partner.
    DATA name      TYPE string        READ-ONLY.
    DATA airplanes TYPE z02_airplanes READ-ONLY.

    METHODS constructor             IMPORTING !name        TYPE string.
    METHODS add_airplane            IMPORTING airplane     TYPE REF TO zcl_02_airplane.
    METHODS get_biggest_cargo_plane RETURNING VALUE(cargo) TYPE REF TO zcl_02_cargo_plane.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_carrier IMPLEMENTATION.
  METHOD add_airplane.
    append airplane to airplanes.
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA biggest_cargo TYPE i.

    LOOP AT airplanes INTO DATA(airplane).
      IF airplane IS INSTANCE OF zcl_02_cargo_plane.
        IF airplane->get_total_weight_in_tons( ) > biggest_cargo.
          biggest_cargo = airplane->get_total_weight_in_tons( ).
          cargo = CAST #( airplane ).
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD zif_02_partner~to_string.
string = 'Ich bin die Fluggesellschaft'.
  ENDMETHOD.

ENDCLASS.

CLASS zcl_02_main_airplanes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA airplane  TYPE REF TO zcl_02_airplane.
    DATA airplanes TYPE TABLE OF REF TO zcl_02_airplane.

    airplane = NEW #( id                   = 'D-ABUK'
                      plane_type           = 'Airbus A380-800'
                      empty_weight_in_tons = '277' ).
    APPEND airplane TO airplanes.
    out->write( zcl_02_airplane=>number_of_airplanes ).

    airplane = NEW #( id                   = 'D-AIND'
                      plane_type           = 'Airbus A320-200'
                      empty_weight_in_tons = '42' ).
    APPEND airplane TO airplanes.
    out->write( zcl_02_airplane=>number_of_airplanes ).

    airplane = NEW #( id                   = 'D-AJKF'
                      plane_type           = 'Boeing 747-400F'
                      empty_weight_in_tons = '166' ).
    APPEND airplane TO airplanes.
    out->write( zcl_02_airplane=>number_of_airplanes ).

    LOOP AT airplanes INTO airplane.
      out->write( |{ airplane->id } { airplane->plane_type }  { airplane->empty_weight_in_tons } | ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

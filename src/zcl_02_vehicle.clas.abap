CLASS zcl_02_vehicle DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS constructor IMPORTING make  TYPE string
                                  model TYPE string.

    METHODS accelerate IMPORTING !value TYPE i
                       RAISING   zcl_02_value_too_high.

    METHODS brake IMPORTING !value TYPE i
                  RAISING   zcl_02_value_too_high.


    METHODS to_string RETURNING VALUE(string) TYPE string.

    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.
    CLASS-DATA NUMBER_of_vehicles TYPE i READ-ONLY.
    PROTECTED SECTION.
    PRIVATE SECTION.
ENDCLASS.


CLASS zcl_02_vehicle IMPLEMENTATION.
  METHOD accelerate.
  if speed_in_kmh + value > 300.
  raise exception new ZCL_02_VALUE_TOO_HIGH( value = value ).
  endif.
    speed_in_kmh += value.
  ENDMETHOD.

  METHOD brake.
  if value > speed_in_kmh.
  raise exception new ZCL_02_VALUE_TOO_HIGH( value = value ).
  endif.
    " TODO: parameter VALUE is never used (ABAP cleaner)
    speed_in_kmh -= value.
  ENDMETHOD.

  METHOD constructor.
  me->make = make.
  me->model = model.
  number_of_vehicles += 1.
  ENDMETHOD.

  METHOD to_string.
    string = |{ make } { model } (  { speed_in_kmh }km/h)|.
  ENDMETHOD.


ENDCLASS.

CLASS zcl_02_rental DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_02_partner.

    TYPES ty_vehicles TYPE TABLE OF REF TO zcl_02_vehicle.

    DATA vehicles TYPE ty_vehicles READ-ONLY.

    METHODS add_vehicle
      IMPORTING vehicle TYPE REF TO zcl_02_vehicle.
ENDCLASS.


CLASS zcl_02_rental IMPLEMENTATION.
  METHOD add_vehicle.
    APPEND vehicle TO vehicles.
  ENDMETHOD.

  METHOD zif_02_partner~to_string.
    string = 'ich bin eine Autovermietung'.
  ENDMETHOD.
ENDCLASS.

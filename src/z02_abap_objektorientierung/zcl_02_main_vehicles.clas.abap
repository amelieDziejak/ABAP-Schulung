CLASS zcl_02_main_vehicles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " deklaration
    DATA vehicle  TYPE REF TO zcl_02_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_02_vehicle.

    " instanziierungen
    vehicle = NEW #( make  = 'Porsche'
                     model = '911' ).
    APPEND vehicle TO vehicles.

    vehicle = NEW #( make  = 'MAN'
                     model = 'TGX' ).
    APPEND vehicle TO vehicles.

    vehicle = NEW #( make  = 'Skoda'
                     model = 'Suerb Combi' ).
    APPEND vehicle TO vehicles.

    "
    LOOP AT vehicles INTO vehicle.
    TRY.
        vehicle->accelerate( 30 ).
        vehicle->brake( 10 ).
        vehicle->accelerate( 300 ).
      CATCH zcl_02_value_too_high into data(x).
      out->write( x->get_text( ) ).
        "handle exception
    ENDTRY.
      out->write( | { vehicle->make } { vehicle->model }| ).

    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

CLASS zcl_02_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_abap_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA travel_id TYPE /DMO/TRAVEL_ID VALUE '0000001'.

  TRY.
  data(travel_with_customer) = zcl_18_helper=>Get_travel_with_customer( travel_id = travel_id ).
  CATCH zcx_abap_no_data INTO DATA(x).
    out->write( x->get_text( ) ).
  ENDTRY.
  out->write( travel_with_customer ).

  ENDMETHOD.
ENDCLASS.

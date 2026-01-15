CLASS zcl_02_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_abap_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA customer_id TYPE /DMO/CUSTOMER_ID VALUE '0000001'.

  data(travels) = zcl_02_abap_06_helper=>get_travels( customer_id = customer_id ).
  out->write( travels ).

  ENDMETHOD.
ENDCLASS.

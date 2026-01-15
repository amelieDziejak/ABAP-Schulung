CLASS zcl_02_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_abap_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA customer type z02_customer_info.
  customer-customer_id = 450450.

  TRY.
      zcl_abap_helper=>get_customer( customer-customer_id ).
    CATCH zcx_abap_no_data.
      "handle exception
  ENDTRY.

  out->write( customer-customer_id ).
  out->write( customer-first_name ).
  out->write( customer-last_name ).
  out->write( customer-city ).
  out->write( customer-country_code ).

out->write( customer ).

  ENDMETHOD.
ENDCLASS.

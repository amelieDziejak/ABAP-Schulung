CLASS zcl_02_abap_06_helper DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS get_travel_with_customer

      IMPORTING travel_id                   TYPE /dmo/travel_id

      RETURNING VALUE(travel_with_customer) TYPE zabap_travel_with_customer.

    CLASS-METHODS get_travels
      IMPORTING customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE z02_travels.
ENDCLASS.


CLASS zcl_02_abap_06_helper IMPLEMENTATION.


  METHOD get_travel_with_customer.
    " lösung 1 ***************************************************************************


    SELECT SINGLE FROM /dmo/travel
      FIELDS *
      WHERE travel_id = @travel_id
      INTO @DATA(travel).

    IF sy-subrc <> 0. " if IF lines( travels ) = 0. " IF sy-dbcnt = 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'travel_id'
                                            table = '/dmo/travel'
                                            value = CONV #( travel_id ) ).
    ENDIF.

    SELECT SINGLE FROM /dmo/customer
      FIELDS *
      WHERE customer_id = @travel-customer_id
      INTO @DATA(customer).
    IF sy-subrc <> 0. " if IF lines( travels ) = 0. " IF sy-dbcnt = 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'customer_id'
                                            table = '/dmo/travel'
                                            value = CONV #( travel-customer_id ) ).
    ENDIF.

    Travel_WITH_CUSTOMER = CORRESPONDING #( travel ).

    travel_with_customer = CORRESPONDING #( BASE ( TRAVEL_with_customer ) customer ).



    " lösung 2 ***************************************************************************



    SELECT SINGLE
      FROM /dmo/travel
             INNER JOIN
               /dmo/customer ON /dmo/travel~customer_id = /dmo/customer~customer_id
      FIELDS *
      WHERE travel_id = @travel_id
      INTO CORRESPONDING FIELDS OF @travel_with_customer.

    IF sy-subrc <> 0. " if IF lines( travels ) = 0. " IF sy-dbcnt = 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'travel_id'
                                            table = '/dmo/travel'
                                            value = CONV #( travel_id ) ).
    ENDIF.

    " TRY.
    "  DATA(TRAVEL) = ZCL_ABAP_HELPER=>GET_TRAVEL( TRAVEL_ID = TRAVEL_ID ).
    "    DATA(CUSTOMER) = ZCL_ABAP_HELPER=>GET_CUSTOMER( TRAVEL-CUSTOMER_ID ).
    "    Travel_WITH_CUSTOMER = CORRESPONDING #( TRAVEL ).
    "    TRAVEL_WITH_CUSTOMER = CORRESPONDING #( BASE ( TRAVEL_with_customer ) CUSTOMER ).
    " CATCH ZCX_ABAP_NO_DATA INTO DATA(X) .
    " ENDTRY.
  ENDMETHOD.

  METHOD get_travels.
    " TRY.
    "   TRAVELS = ZCL_ABAP_HELPER=>GET_TRAVELS( CUSTOMER_ID = CUSTOMER_ID ).
    " CATCH ZCX_ABAP_NO_DATA.
    " handle exception
    " ENDTRY.

    SELECT FROM /dmo/travel
      FIELDS *
      WHERE customer_id = @customer_id
      INTO TABLE @travels.

    " TRY.
    "   TRAVELS = ZCL_ABAP_HELPER=>GET_TRAVELS( CUSTOMER_ID = CUSTOMER_ID ).
    " CATCH ZCX_ABAP_NO_DATA.
    " handle exception
    " ENDTRY.

    IF sy-subrc <> 0. " if IF lines( travels ) = 0. " IF sy-dbcnt = 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( field = 'customer_id'
                                            table = '/dmo/travel'
                                            value = CONV #( customer_id ) ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.

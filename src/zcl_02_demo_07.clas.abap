CLASS zcl_02_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_demo_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " DEKLARATION interner tabellen
    DATA connections TYPE z02_connections. " type [tabellentyp]
    DATA connection  TYPE z02_connection.  " type table of [strukturtyp]

    " hinzufügen von datensätzen
    connections = VALUE #( ( carrier_id = 'LH' connection_id = '0400' )
                           ( carrier_id = 'UA' airport_from_id = 'FRA' )
                           ( connection_id = '0401' airport_to_id = 'FRA' ) ).

    " anfügen von datensätzen
    connection = VALUE #( carrier_id      = 'AZ'
                          connection_id   = '0402'
                          airport_to_id   = 'FRA'
                          airport_from_id = 'FRA' ).

    connections = VALUE #( BASE connections
                           ( connection ) ).

    APPEND connection TO connections.

    " lesen von Einzelsätzen
    TRY.
        connection = connections[ 3 ]. " per index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ). " per schlüsselkomponent
      connection = connections[ connection_id = '0400' ].
    ENDIF.

    " ändern von Einzelsätzen
    TRY.
        connection = connections[ 3 ]. " per index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0400' ] ). " per schlüsselkomponent
      connections[ connection_id = '0400' ]-connection_id = '0402'.
    ENDIF.

    " lesen mehrerer datensätze
    " loop at connections into data(cannections2)
    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL.
      out->write( |{ sy-tabix } { connection-carrier_id }| ).
    ENDLOOP.

    " ändern mehrerer datensätze (per sy-tabix)
    " loop at connections into data(cannections2)
    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL.
      connection-airport_to_id = 'JFK'.
    ENDLOOP.

    " ändern mehrerer datensätze (per datenreferenz)
    " loop at connections into data(cannections2)
    DATA connection2 TYPE REF TO z02_connection.
    LOOP AT connections INTO connection WHERE carrier_id IS NOT INITIAL.
      connection2->airport_from_id = 'BER'.
    ENDLOOP.

    " ändern mehrerer datensätze (per feldsymbol)
    FIELD-SYMBOLS <connection> TYPE z02_connection.
    LOOP AT connections ASSIGNING <connection>.
      <connection>-airport_to_id = 'LH'.
    ENDLOOP.

    out->write( connections ).
  ENDMETHOD.
ENDCLASS.

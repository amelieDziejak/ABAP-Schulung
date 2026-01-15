CLASS zcl_02_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_demo_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  DATA result_i TYPE i.
  data result_p type p length 8 decimals 3.

  result_i = 5 + 3.
  out->write( result_i ).

  result_i = 5 - 3.
  out->write( result_i ).

  result_i = 5 * 3.
  out->write( result_i ).

  result_p = 5 / 3.      "
  out->write( result_p ).

  result_i = 5 DIV 3.     " ganzzahl
  out->write( result_i ).

  result_i = 5 MOD 3.     " modulo
  out->write( result_i ).

  result_i = 5 ** 3.     " potenzieren
  out->write( result_i ).

  result_i = result_i + 1.
  result_i += 1.

  add 1 to result_i. "veraltet
  subtract 1 from result_i. " veraltet

"numerische funktionen : f1
result_i = sqrt( 81 ).
out->write( result_i ).

out->write( round( val = '47.865' dec = 2 ) ).




  ENDMETHOD.
ENDCLASS.

CLASS zcl_02_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_abap_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA operand1 TYPE p LENGTH 8 DECIMALS 3.
    DATA operator TYPE c LENGTH 1.
    DATA operand2 TYPE p LENGTH 8 DECIMALS 3.
    DATA result   TYPE p LENGTH 8 DECIMALS 3.

    operand1 = 10.
    operator = '/'.
    operand2 = 9.

    CASE operator.
      WHEN '+'.
        result = operand1 + operand2.
        out->write( |{ operand1 } { operator } { operand2 } = { result }| ).
      WHEN '-'.
        result = operand1 - operand2.
        out->write( |{ operand1 } { operator } { operand2 } = { result }| ).
      WHEN '*'.
        result = operand1 * operand2.
        out->write( |{ operand1 } { operator } { operand2 } = { result }| ).
      WHEN '/'.
        result = operand1 / operand2.
        out->write( |{ operand1 } { operator } { operand2 } = { result }| ).
      WHEN OTHERS.
        out->write( 'Operator not supported' ).
    ENDCASE.
  ENDMETHOD.
ENDCLASS.

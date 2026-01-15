CLASS zcl_02_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS divide
      IMPORTING operand1      TYPE z02_decimal
                operand2      TYPE z02_decimal
      RETURNING VALUE(result) TYPE z02_decimal.

    CLASS-METHODS calc_percentage
      IMPORTING percentage             TYPE z02_decimal
                base                   TYPE z02_decimal
      RETURNING VALUE(percentage_value) TYPE z02_decimal.

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
ENDCLASS.



CLASS zcl_02_calculator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(result) = zcl_02_calculator=>divide( operand1 = 5
                                              operand2 = 0 ).
    out->write( result ).
  ENDMETHOD.

  METHOD calc_percentage.
   percentage_value = base * ( percentage / 100 ).
  ENDMETHOD.

  METHOD divide.
*Eingabeprüfung
    IF operand2 IS INITIAL. " if operand2 = 0.
      RAISE EXCEPTION NEW cx_sy_zerodivide( ).
    ENDIF.
    result = operand1 / operand2.
*    RETURN operand1 / operand2.
  ENDMETHOD.

ENDCLASS.

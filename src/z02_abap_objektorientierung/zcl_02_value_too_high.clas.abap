CLASS zcl_02_value_too_high DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

 constants:
   begin of ZCL_02_VALUE_TOO_HIGH,
     msgid type symsgid value 'Z02',
     msgno type symsgno value '000',
     attr1 type scx_attrname value 'VALUE',
     attr2 type scx_attrname value '',
     attr3 type scx_attrname value '',
     attr4 type scx_attrname value '',
   end of ZCL_02_VALUE_TOO_HIGH.

   DATA value TYPE i. " muss genau so heißen wie attr1

    METHODS constructor
      IMPORTING
        !previous LIKE previous OPTIONAL
        value type i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_value_too_high IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    if_t100_message~t100key = zcl_02_value_too_high.
    me->value = value.

  ENDMETHOD.
ENDCLASS.

CLASS zcl_02_demo_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_02_demo_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  " einfache verzweigungen
DATA age TYPE i VALUE 40.
data gender type c length 1 value 'm'. " data gender.
data first_name type c length 40 value 'hans'.
data last_name type c length 40 value 'maier'.

* Vergleichsoperatoren: >, >=, <, <=, =, <>
* logischer operatoren: AND OR NOT
* * IS (NOT) INITIAL
if age < 18.
out->write( |Hallo { first_name }| ).
elseif gender = 'm' or gender = 'M'.
out->write( |Hallo Herr { last_name }| ).
elseif gender = 'w' or gender = 'W'.
out->write( |Hallo Frau { last_name }| ).
else.
out->write( |Hallo { last_name }| ).
endif.

out->write( |HAllo { cond #( when age < 18 then first_name
                              when gender = 'm' OR gender = 'M' then |Herr | && last_name
                              when gender = 'w' OR gender = 'W' then |Frau | && last_name
                              ELSE last_name ) } | ).

  ENDMETHOD.
ENDCLASS.

CLASS zcl_02_demo_01 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_02_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
******************************************************************
* Hello World
******************************************************************
    DATA text TYPE string. "Deklaration

    text = 'Hello World'. "Wertzuweisung

* Ausgabe
    out->write( text ).

*******************************************************************
* Datentypen und Datenobjekte
******************************************************************

  DATA age TYPE i. "Ganze Zahlen
  DATA salary_in_euro TYPE p length 16 decimals 2. "Kommazahlen
  DATA first_name type c length 40. " Zeichenketten fester Länge
  DATA matriculation_number type n length 7. "Ziffernfolge
  DATA xmas type d." Datumsangaben
  DATA noon TYPE t. "zeitangaben
  DATA flag. "Kennzeichen

  DATA carrier_id TYPE c length 3. " ABAP Standardtyp
  DATA carrier_id2 TYPE /dmo/carrier_id."datenelement

******************************************************************
*  Wertzuweisungen
******************************************************************

  age = 44.
  salary_in_euro = '6000.52'.
  first_name = 'Daniel'.
  matriculation_number = '9182364'.
  xmas = '20261224'.
  noon = '120000'.
  flag = 'X'.

  flag = ''.
  flag = ' '.
  Clear flag.

  DATA last_name TYPE c length 40 value 'Appenmaier'.

  data(size_in_cm) = 179. " deklaration in einer variable (keine lehrzeichen)
  size_in_cm = '179'.







  ENDMETHOD.


ENDCLASS.

CLASS zcl_02_airplane DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING !id                  TYPE string
                                  plane_type           TYPE string
                                  empty_weight_in_tons TYPE i
                        RAISING   zcx_abap_initial_parameter.

    DATA id                   TYPE string READ-ONLY.
    DATA plane_type           TYPE string READ-ONLY.
    DATA empty_weight_in_tons TYPE i      READ-ONLY.

    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.
ENDCLASS.



CLASS zcl_02_airplane IMPLEMENTATION.

  method constructor.
  if id is initial.
  try.
      raise exception new zcx_abap_initial_parameter( 'id' ).
    catch zcx_abap_initial_parameter.
      "handle exception
  endtry.

  elseif plane_type is initial.
  try.
      raise exception new zcx_abap_initial_parameter( 'plane_type' ).
    catch zcx_abap_initial_parameter.
      "handle exception
  endtry.

  elseif empty_weight_in_tons is initial.
  try.
      raise exception new zcx_abap_initial_parameter( 'empty_weight_in_tons' ).
    catch zcx_abap_initial_parameter.
      "handle exception
  endtry.

  else.
  me->id = id.
  me->plane_type = plane_type.
  me->empty_weight_in_tons = empty_weight_in_tons.
  number_of_airplanes += 1.
  endif.
  endmethod.

ENDCLASS.

CLASS zcl_runnable_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_runnable_test IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  out->write('start test').
  DATA(demo_class) = new zcl_elinares_bussiness_logic( 2 ).
  try.
      demo_class->validar( ).
      out->write('call demo_class').


    catch zcx_bs_demo_data_error into DATA(cx).

      out->write( cx->get_text( ) )..

  endtry.



  ENDMETHOD.
ENDCLASS.

CLASS zcl_elinares_bussiness_logic DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
   methods CONSTRUCTOR
    importing
      !I_MONTO type i.
   methods VALIDAR RAISING zcx_bs_demo_data_error .

  PROTECTED SECTION.
  PRIVATE SECTION.
  data MONTO type i.
ENDCLASS.



CLASS zcl_elinares_bussiness_logic IMPLEMENTATION.

method CONSTRUCTOR.

  monto = i_monto.

endmethod.

METHOD validar.

  IF monto IS INITIAL.
    RAISE EXCEPTION NEW zcx_bs_demo_data_error(
            id_error = 3
            textid   = zcx_bs_demo_data_error=>cs_invalid_params )  .
  ENDIF.


  IF monto > 1 AND monto < 3.
    RAISE EXCEPTION NEW zcx_bs_demo_data_error(
            id_error = 4
            textid   = zcx_bs_demo_data_error=>cs_limite_inferior )  .
  ENDIF.

  IF monto > 4 and monto < 6 .
        RAISE EXCEPTION NEW zcx_bs_demo_data_error(
            id_error = 5
            textid   = zcx_bs_demo_data_error=>cs_limite_superior )  .
  ENDIF.

ENDMETHOD.

ENDCLASS.

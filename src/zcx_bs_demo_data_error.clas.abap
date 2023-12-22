CLASS zcx_bs_demo_data_error DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:


      BEGIN OF  cs_data_error,
        msgid TYPE symsgid VALUE 'ZBS_DEMO_LOG',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF  cs_data_error,

  BEGIN OF cs_invalid_params,
        msgid TYPE symsgid VALUE 'ZBS_DEMO_LOG',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF cs_invalid_params,

      BEGIN OF cs_limite_inferior,
        msgid TYPE symsgid VALUE 'ZBS_DEMO_LOG',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE '',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF cs_limite_inferior,

      BEGIN OF cs_limite_superior,
        msgid TYPE symsgid VALUE 'ZBS_DEMO_LOG',
        msgno TYPE symsgno VALUE '005',
        attr1 TYPE scx_attrname VALUE 'Limite Superior',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF cs_limite_superior.

 DATA:
      md_error TYPE sysubrc.


    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        id_error  TYPE sysubrc.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_bs_demo_data_error IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = cs_data_error.
    ELSE.
      if_t100_message~t100key = textid.

    ENDIF.

     md_error = id_error.

  ENDMETHOD.
ENDCLASS.

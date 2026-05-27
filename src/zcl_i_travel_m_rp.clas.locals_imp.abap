CLASS lhc_ZI_TRAVEl_M_RP DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_TRAVEl_M_RP RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZI_TRAVEl_M_RP RESULT result.

ENDCLASS.

CLASS lhc_ZI_TRAVEl_M_RP IMPLEMENTATION.

  METHOD get_instance_authorizations.
  LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).

    APPEND VALUE #(
      %tky = <key>-%tky
      %update = if_abap_behv=>auth-allowed
      %delete = if_abap_behv=>auth-allowed
    ) TO result.

  ENDLOOP.
  ENDMETHOD.

  METHOD get_global_authorizations.
   result-%create = if_abap_behv=>auth-allowed.
  ENDMETHOD.

ENDCLASS.

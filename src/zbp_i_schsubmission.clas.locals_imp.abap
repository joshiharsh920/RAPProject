CLASS lhc_ZI_SchSubmission DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR ZI_SchSubmission RESULT result.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR zi_schsubmission RESULT result.

ENDCLASS.

CLASS lhc_ZI_SchSubmission IMPLEMENTATION.

  METHOD get_instance_authorizations.
   LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).

    APPEND VALUE #(
      %tky    = <key>-%tky
      %update = if_abap_behv=>auth-allowed
      %delete = if_abap_behv=>auth-allowed
    ) TO result.

  ENDLOOP.
  ENDMETHOD.

  METHOD get_global_authorizations.
    result = VALUE #(
    %create = if_abap_behv=>auth-allowed
  ).

  ENDMETHOD.

ENDCLASS.

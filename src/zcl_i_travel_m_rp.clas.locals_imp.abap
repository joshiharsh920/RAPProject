CLASS lhc_ZI_TRAVEl_M_RP DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_TRAVEl_M_RP RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZI_TRAVEl_M_RP RESULT result.
    METHODS AcceptTravel FOR MODIFY
      IMPORTING keys FOR ACTION ZI_TRAVEl_M_RP~AcceptTravel RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR ZI_TRAVEl_M_RP RESULT result.

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

  METHOD AcceptTravel.

  MODIFY ENTITIES OF ZI_TRAVEl_M_RP IN LOCAL MODE
  ENTITY ZI_TRAVEl_M_RP
  UPDATE FIELDS ( status )
  WITH  VALUE #( FOR key IN keys ( %tky = key-%tky status = 'A' ) )
     FAILED failed
     REPORTED reported.

  READ ENTITIES OF ZI_TRAVEl_M_RP IN LOCAL MODE
  ENTITY ZI_TRAVEl_M_RP
  ALL FIELDS WITH
  CORRESPONDING #( keys )
  RESULT DATA(lt_travel).

  result = VALUE #( FOR travel IN lt_travel
  ( %tky = travel-%tky  " or explicitly list key fields
    %param = travel
  ) ).

  ENDMETHOD.

      METHOD get_instance_features.
     READ ENTITIES OF ZI_TRAVEL_M_RP IN LOCAL MODE
      ENTITY ZI_TRAVEL_M_RP
      FIELDS ( status )
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_travel_result)
      FAILED failed.

      result = VALUE #( FOR ls_travel IN lt_travel_result

                 (  %tky = ls_travel-%tky
                 %features-%action-acceptTravel = COND #( WHEN ls_travel-status = 'A'
                 THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled ) ) ) .
      ENDMETHOD.

ENDCLASS.

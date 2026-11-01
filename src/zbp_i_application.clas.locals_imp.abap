CLASS lhc_ZI_Application DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR ZI_Application RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR ZI_Application RESULT result.

    METHODS verifyApplication FOR MODIFY
       keys FOR ACTION ZI_Application~verifyApplication RESULT result.

ENDCLASS.

CLASS lhc_ZI_Application IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD verifyApplication.

   DATA lv_timestamp TYPE timestampl.

  GET TIME STAMP FIELD lv_timestamp.

    MODIFY ENTITIES OF ZI_Application IN LOCAL MODE
      ENTITY ZI_Application
      UPDATE FIELDS ( status verified_at verified_by )
      WITH VALUE #(
        FOR key IN keys
        (
          %tky = key-%tky
          status = 'VERIFIED'
          verified_at = lv_timestamp
          verified_by = sy-uname
        )
      ).

    READ ENTITIES OF ZI_Application IN LOCAL MODE
      ENTITY ZI_Application
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(applications).

    result = VALUE #(
      FOR application IN applications
      (
        %tky = application-%tky
        %param = application
      )
    ).
  ENDMETHOD.

ENDCLASS.

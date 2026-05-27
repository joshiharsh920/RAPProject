CLASS zcl_eml_test_rp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_EML_TEST_RP IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  read ENTITIES OF ZI_TRAVEl_M_RP
  ENTITY ZI_TRAVEl_M_RP
  ALL FIELDS WITH VALUE #( ( TravelId = '00000007' ) )
  RESULT  DATA(lt_result)
  FAILED DATA(lt_failed)
  REPORTED DATA(lt_reported).

  if sy-subrc = 0.

  out->write( lt_result ) .
  endif.
  ENDMETHOD.
ENDCLASS.

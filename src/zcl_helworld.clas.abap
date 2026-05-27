CLASS zcl_helworld DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_HELWORLD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  select * from /dmo/flight into TABLE @DATA(lt_table).
    out->write('Hello world!' ).
  ENDMETHOD.
ENDCLASS.

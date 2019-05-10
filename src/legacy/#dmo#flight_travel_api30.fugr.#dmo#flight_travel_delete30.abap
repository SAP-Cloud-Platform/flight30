"! <h1>API for Deleting a Travel</h1>
"!
"! <p>
"! Function module to delete a single Travel instance.
"! It will also delete all related subnodes of Booking and Booking Supplement.
"! </p>
"!
"! @parameter iv_travel_id          | ID of the Travel to be deleted
"! @parameter et_messages           | Table of occurred messages
"!
FUNCTION /DMO/FLIGHT_TRAVEL_DELETE30.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_TRAVEL_ID) TYPE  /DMO/TRAVEL_ID30
*"  EXPORTING
*"     REFERENCE(ET_MESSAGES) TYPE  /DMO/IF_FLIGHT_LEGACY30=>TT_MESSAGE
*"----------------------------------------------------------------------
  CLEAR et_messages.

  /dmo/cl_flight_legacy30=>get_instance( )->delete_travel( EXPORTING iv_travel_id = iv_travel_id
                                                         IMPORTING et_messages  = DATA(lt_messages) ).

  /dmo/cl_flight_legacy30=>get_instance( )->convert_messages( EXPORTING it_messages = lt_messages
                                                            IMPORTING et_messages = et_messages ).
ENDFUNCTION.

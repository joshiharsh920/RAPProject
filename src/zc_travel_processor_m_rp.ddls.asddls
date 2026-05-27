@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projection View'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo.typeNamePlural: 'Travel Application'
@UI.headerInfo.typeName: 'Travel App'
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity zc_travel_processor_m_rp
provider contract transactional_query
as projection on ZI_TRAVEl_M_RP
{

@Search.defaultSearchElement: true
    key TravelId,

    AgencyId,


    CustomerId,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    
    Description,
    Status,
    City,
    _booking: redirected to composition child zc_booking_processor_m_rp
}   

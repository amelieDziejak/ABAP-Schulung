@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ABAP_CDS_03'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z02_TravelWithCustomer 
as select from Z02_Customer as c  
inner join Z02_Travel as t on t.CustomerId = c.CustomerId
                    


{
  key c.CustomerId,
  key t.TravelId,
  c.FirstName,
  c.LastName,
  c.Title,
  c.Street,
  c.PostalCode,
  c.City,
  c.CountryCode,
  t.AgencyId,
  t.BeginDate,
  t.EndDate,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  t.BookingFee,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  t.TotalPrice,
  t.CurrencyCode,
  t.Description,
  t.Status
}

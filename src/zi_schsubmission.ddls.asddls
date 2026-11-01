@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Scholarship Submission'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZI_SchSubmission as select from zsc_scholarship
{
    key scholarship_id,
    scholarship_name,
    description,
    scholarship_type,
    scholarship_category,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    amount as Amount,
    currency_code as CurrencyCode,
    minimum_percentage,
     @Semantics.amount.currencyCode: 'CurrencyCode'
    maximum_family_income,
    start_date,
    end_date,
    max_applicants,
    status,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,

    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt
}

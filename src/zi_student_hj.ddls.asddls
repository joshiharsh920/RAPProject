@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Student Interface view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_Student_HJ as select from zstudent101
{
    key id,
    first_name,
    last_name,
    email,
    phone,
    course,
    university,
    date_of_birth,
    created_by,
    created_at,
    last_changed_by,
    last_changed_at,
    local_last_changed_at
}

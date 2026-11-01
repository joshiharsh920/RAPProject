@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Application Projection View'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZP_Application
provider contract transactional_query
 as projection on ZI_Application

{
     key id,
        student_id,
        status,
        submitted_at,
        correction_reason,
        workflow_instance_id,
        verified_at,
        verified_by
}

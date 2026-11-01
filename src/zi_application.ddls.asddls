define root view entity ZI_Application
  as select from zapplication

  association [1..1] to ZI_Student_HJ as _Student
    on $projection.student_id = _Student.id
{
    key id,
        student_id,
        status,
        submitted_at,
        correction_reason,
        workflow_instance_id,
        verified_at,
        verified_by,

        _Student
}

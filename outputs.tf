output "read_parameter_store_policy" {
  description = "A JSON policy document that only allows read access to the parameter store."
  value       = data.aws_iam_policy_document.read_parameter_store.json
}

output "write_parameter_store_policy" {
  description = "A JSON policy document that only allows write access to the parameter store."
  value       = data.aws_iam_policy_document.write_parameter_store.json
}

output "manage_kms_store_policy" {
  description = "A JSON policy document that allows decryption access to a KMS key."
  value       = data.aws_iam_policy_document.manage_kms_store.json
}

output "manage_parameter_store_policy" {
  description = "A JSON policy document that allows full access to the parameter store."
  value       = data.aws_iam_policy_document.manage_parameter_store.json
}

output "put_xray_trace_policy" {
  description = "A JSON policy document that allows putting data into x-ray for tracing parameter store requests."
  value       = data.aws_iam_policy_document.put_xray_trace.json
}

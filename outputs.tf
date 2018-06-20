output "read_parameter_store_policy" {
  value = "${data.aws_iam_policy_document.read_parameter_store.json}"
}

output "write_parameter_store_policy" {
  value = "${data.aws_iam_policy_document.write_parameter_store.json}"
}

output "manage_kms_store_policy" {
  value = "${data.aws_iam_policy_document.manage_kms_store.json}"
}

output "manage_parameter_store_policy" {
  value = "${data.aws_iam_policy_document.manage_parameter_store.json}"
}

output "put_xray_trace_policy" {
  value = "${data.aws_iam_policy_document.put_xray_trace.json}"
}

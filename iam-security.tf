resource "aws_iam_policy" "s3_access_policy" {
  name = "s3_access_policy"
  path = "/"
  policy = data.aws_iam_policy_document.s3_access_policy.json
}

resource "aws_iam_policy" "iam_pass_role_policy" {
  name = "iam_pass_role_policy"
  path = "/"
  policy = data.aws_iam_policy_document.iam_pass_role_policy_doc.json
}

resource "aws_iam_role" "ec2_iam_role" {
  assume_role_policy = data.aws_iam_policy_document.ec2_iam_assume_role_doc.json
  name = "iam_ec2_role"
}

resource "aws_iam_role_policy_attachment" "ec2_s3_access_role_policy_attachments" {
  role = aws_iam_role.ec2_iam_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

resource "aws_iam_role_policy_attachment" "ec2_pass_role_role_policy_attachments" {
  role = aws_iam_role.ec2_iam_role.name
  policy_arn = aws_iam_policy.iam_pass_role_policy.arn
}

resource "aws_iam_role_policy_attachment" "ec2_container_service_for_ec2_role_policy_attachments" {
  role = aws_iam_role.ec2_iam_role.name
  policy_arn = data.aws_iam_policy.ec2_container_service_for_ec2_role_policy.arn
}

resource "aws_iam_role_policy_attachment" "ec2_task_execution_role_policy_attachments" {
  role = aws_iam_role.ec2_iam_role.name
  policy_arn = data.aws_iam_policy.ecs_task_execution_policy.arn
}

resource "aws_iam_role_policy_attachment" "ec2_container_service_role_policy_attachments" {
  role = aws_iam_role.ec2_iam_role.name
  policy_arn = data.aws_iam_policy.ec2_container_service_role_policy.arn
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_iam_role.name
}
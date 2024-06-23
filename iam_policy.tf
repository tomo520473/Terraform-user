# ---------------------------------------------
# IAM Policy
# ---------------------------------------------
resource "aws_iam_policy" "billing_deny" {
  name        = "${var.project}-${var.environment}-billing-deny"
  description = "Deny billing access"
  policy      = data.aws_iam_policy_document.billing_deny.json
}

data "aws_iam_policy_document" "billing_deny" {
  statement {
    effect = "Deny"
    actions = [
      "aws-portal:"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "iam_change_own_password" {
  name        = "${var.project}-${var.environment}-iam-change-own-password"
  description = "Allow change own password"
  policy      = data.aws_iam_policy_document.iam_change_own_password.json
}

data "aws_iam_policy_document" "iam_change_own_password" {
  statement {
    effect = "Allow"
    actions = [
      "iam:ChangePassword"
    ]
    resources = ["arn:aws:iam::*:user/$${aws:username}"]
  }
}

resource "aws_iam_policy" "ec2_rebootable" {
  name        = "${var.project}-${var.environment}-ec2-rebootable"
  description = "Allow reboot EC2 instances"
  policy      = data.aws_iam_policy_document.ec2_rebootable.json
}

data "aws_iam_policy_document" "ec2_rebootable" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:RebootInstances"
    ]
    resources = ["*"]
  }
}
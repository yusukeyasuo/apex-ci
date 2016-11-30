resource "aws_cloudwatch_event_rule" "every_one_minute" {
    name = "every-one-minute"
    schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "stg-python_simple_evenry_one_minute" {
  rule = "${aws_cloudwatch_event_rule.every_one_minute.name}"
  target_id = "stg-python_simple"
  arn = "arn:aws:lambda:ap-northeast-1:333762020587:function:stg-python_simple"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_stg-python_simple" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
  	function_name = "${aws_cloudwatch_event_target.stg-python_simple_evenry_one_minute.arn}"
    principal = "events.amazonaws.com"
    source_account = "333762020587"
    source_arn = "${aws_cloudwatch_event_rule.every_one_minute.arn}"
}


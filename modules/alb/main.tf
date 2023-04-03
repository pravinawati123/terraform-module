# Create application Load balancer
resource "aws_lb" "application_load_balancer" {
  name                       = var.alb_name
  internal                   = var.alb_internal
  load_balancer_type         = var.alb_type
  security_groups            = var.alb_security_groups
  subnets                    = var.alb_subnets
  enable_deletion_protection = var.enable_deletion_protection

  tags = var.alb_tags
}

# Create target group
resource "aws_lb_target_group" "target_group" {
  name        = var.target_group_name
  target_type = var.target_type
  port        = var.target_group_port
  protocol    = var.target_group_protocol
  vpc_id      = var.vpc_id

  health_check {
    enable              = var.health_check_enable
    interval            = var.health_check_interval
    path                = var.health_check_path
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    matcher             = var.health_check_matcher
  }

  lifecycle {
    create_before_destroy = var.create_before_destroy
  }
}

# Create a listener on port 80 with redirect action
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = var.http_listener_port
  protocol          = var.http_listener_protocol

  default_action {
    type = "redirect"

    redirect {
      port        = var.redirect_port
      protocol    = var.redirect_protocol
      status_code = var.redirect_status_code
    }
  }
}

# Create a listener on port 443 with forward action
resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = var.https_listener_port
  protocol          = var.https_listener_protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = var.target_id
  port             = var.target_port
}

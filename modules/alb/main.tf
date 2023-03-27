# Create application Load balancer
resource "aws_lb" "application_load_balancer" {
  name = "demo-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [var.security_group_id]
  subnets = [var.subnet_id]
  enable_deletion_protection = false

  tags = {
    Name = "VIP-alb"
  }
}

# Create target group

resource "aws_lb_target_group" "alb_target_group" {
    name           = "demo-tg"
    target_type    = "ip"
    port           = 80
    protocol       = "HTTP"
    vpc_id         = var.vpc_id

    
    health_check {
    #  enable      = true
      interval    = 300
      path        = "/"
      timeout     = 60
      mather      = 200
      healthy_threshold = 5
      unhealthy_threshold = 5
      }
    lifecycle {  create_before_destroy   =   true }
}
# Create a listener on port 80 with redirect action
resource "aws_lb_listener" "alb_http_listener" {
    load_load_balancer_arn =   aws_lb.application_load_balancer.arn
    port                   =    80
    protocol               =   "HTTP"

    default_action {
      type  =   "redirect"
    }

    redirect {
        port    =   443
        protocol    =   "HTTPS"
        status_code =   "HTTP_301"
        }
    }

# Create a listener on port 443 with forward action
resource "aws_lb_listener" "alb_https_listener" {
    load_load_balancer_arn =   aws_lb.application_load_balancer.arn
    port                   =    443
    protocol               =   "HTTPS"
    ssl_policy =    "ELBSecurityPolicy-TLS-1-2-2017-01"
    certificate_arn =   "arn:aws:acm:us-west-2:352215179221:certificate/56fdf442-b75f-428e-8714-b195fdb196d4"

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.alb_target_group.arn
      }
    }
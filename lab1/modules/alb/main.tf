resource "aws_security_group" "lab1_security_group" {
  name        = "sc_alb"
  description = "Security group for ALB"
  vpc_id  = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic 
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_lb" "trainee_alb" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = var.load_balancer_type
  subnets            = var.public_subnet
  security_groups    = [aws_security_group.lab1_security_group.id]

  tags = {
    Name = "trainee-alb"
  }
}
 
 resource "aws_lb_target_group" "trainee_target_group" {
  name     = "trainee-target-group"                                                                          
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = var.HTTP
    timeout             = 5
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }     
}

resource "aws_lb_listener" "trainee_listener" {
  load_balancer_arn = aws_lb.trainee_alb.arn
  port              = "80"
  protocol          = var.HTTP

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.trainee_target_group.arn
  }
}

resource "aws_lb_target_group_attachment" "instance_attachment" {
  count            = 2
  target_group_arn = aws_lb_target_group.trainee_target_group.arn
  # target_id      = data.terraform_remote_state.instance.outputs.instance_id[count.index]
  target_id        = var.instance_id[0]
  port             = 80
}

resource "aws_route53_record" "trainee_dns" {
  zone_id = var.zone_id
  name    = var.name
  type    = var.type
  ttl     = var.ttl
  records = [aws_lb.trainee_alb.dns_name]
}


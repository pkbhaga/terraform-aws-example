// Declare backend securitygroups, launchconfigurations, autoscaling group configurations for backend
resource "aws_security_group" "app" {
  name = format("%s-app-sg", var.name)

  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = concat(module.vpc.public_subnets_cidr_blocks, module.vpc.private_subnets_cidr_blocks)
  }

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = module.vpc.public_subnets_cidr_blocks
  }

  egress {
    from_port   = "0"
    to_port     = "65535"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Group = var.name
    Name  = "${var.name}-backend-app-sg"
    Owner = var.owner
  }
}

resource "aws_launch_configuration" "app" {
  image_id        = data.aws_ami.amazon_linux.id
  instance_type   = var.app_instance_type
  security_groups = [aws_security_group.app.id]

  key_name    = var.app_key_pair_name
  name_prefix = "${var.name}-backend-app-vm-"

  user_data = <<-EOF
                ## We will bring up a application server here
                EOF
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "app" {
  launch_configuration = aws_launch_configuration.app.id
  vpc_zone_identifier  = module.vpc.private_subnets
  load_balancers       = [module.elb_app.this_elb_name]
  health_check_type    = "EC2"

  min_size = var.app_autoscale_min_size
  max_size = var.app_autoscale_max_size

  tags = [
    {
      key                 = "Group"
      value               = var.name
      Name                = "${var.name}-backend-app-asg"
      Owner               = var.owner
      propagate_at_launch = true
    }
  ]
}

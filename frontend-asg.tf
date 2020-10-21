//Declare the frontend securitygroups, autoscalinggroups, launchconfigurations for frontend
resource "aws_security_group" "web" {
  name = format("%s-web-sg", var.name)

  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = var.web_port
    to_port     = var.web_port
    protocol    = "tcp"
    cidr_blocks = module.vpc.public_subnets_cidr_blocks
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
    Name  = "${var.name}-web-sg"
    Owner = var.owner
  }
}

resource "aws_launch_configuration" "web" {
  image_id        = data.aws_ami.amazon_linux.id
  instance_type   = var.web_instance_type
  security_groups = [aws_security_group.web.id]

  key_name    = var.web_key_pair_name
  name_prefix = "${var.name}-web-vm-"

  user_data = <<-EOF
              ### Bring up an nginx server
EOF


  lifecycle {
    create_before_destroy = true
  }

}


resource "aws_autoscaling_group" "web" {
  launch_configuration = aws_launch_configuration.web.id

  vpc_zone_identifier = module.vpc.public_subnets
  load_balancers      = [module.elb_web.this_elb_name]
  health_check_type   = "EC2"

  min_size = var.web_autoscale_min_size
  max_size = var.web_autoscale_max_size

  tags = [
    {
      key                 = "Group"
      value               = var.name
      Name                = "${var.name}-web-asg"
      Owner               = var.owner
      propagate_at_launch = true
    }
  ]
}

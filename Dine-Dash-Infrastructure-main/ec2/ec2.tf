resource "aws_launch_template" "webapp" {
  name          = "webapp-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.instance_sg_id]
  }

  iam_instance_profile {
    arn = var.instance_role
  }

  user_data = base64encode(<<-EOT
    #!/bin/bash

    # Create folder
    mkdir -p /usr/bin/dine-dash

    # Variables
    PROJECT_DIR="/home/ubuntu/DineAndDashWebApp"
    ENVPATH="/usr/bin/dine-dash/.env"

    # Navigate to the project folder
    cd "$PROJECT_DIR"

    cat <<EOF > "$ENVPATH"
      VITE_AUTH0_DOMAIN=dev-13y0ygu7181lssdm.us.auth0.com
      VITE_AUTH0_CLIENT=IQUnX4LIWnbcniZWx4OECEQqwoLWHb1k
      VITE_AUTH0_REDIRECT_URL=https://dine-dash.net
      VITE_API_BASE_URL=https://dine-dash.net
      VITE_AUTH0_AUDIENCE=dish-and-dash-api
    EOF
    
    # Set permission
    chmod 600 "$ENVPATH"

    # Build and start the Docker containers
    sudo docker-compose build
    sudo docker-compose up -d
  EOT
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "WebApp Instance"
    }
  }
}
module "ecs-fargate" {
    source              = "cn-terraform/ecs-fargate/aws"
    version             = "2.0.9"
    name_preffix        = format("webapp-%s",var.environment_name)
    profile             = ""
    region              = var.region_name
    vpc_id              = var.vpc_id
    availability_zones  = var.availability_zones
    public_subnets_ids  = var.public_subnets_ids
    private_subnets_ids = var.private_subnets_ids
    container_name               = format("webappcontainer-%s",var.environment_name)
    container_image              = var.container_image
    container_cpu                = "1024"
    container_memory             = "8192"
    container_memory_reservation = "2048"
    essential                    = true
    container_port               = "5000"

}

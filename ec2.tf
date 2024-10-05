module "ec2-project-module" {
  source = "./modules/ec2"
  ec2-subnet-id = module.vpc-final-project.subnet-id
  vpc-id = module.vpc-final-project.vpc-id
}
variable "region-name"{
    description = "name of region"
    default = "eu-west-2"
    type = string 
}

variable "cidr-for-public" {
    description = "public cidr"
    default = "10.0.110.0/24"
    type = string 

}


variable "cidr-for-private" {
    description = "private cidr"
    default = "10.0.110.0/24"
    type = string 
}
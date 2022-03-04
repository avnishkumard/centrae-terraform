variable "availability-zone-1" {
  type = string
  default = "us-west-2a"
}
variable "availability-zone-2" {
  type = string
  default = "us-west-2b"
}
variable "availability-zone-3" {
  type = string
  default = "us-west-2c"
}
variable "availability-zone-4" {
  type = string
  default = "us-west-2d"
}
variable "non-Prod-vpc" {
  default = "20.0.0.0/17"
  description = "enter the production vpc"
}
variable "Prod-vpc" {
  default = "20.0.128.0/17"
  description = "enter the non-production vpc"
} 

variable "non-prod-subnet-1" {
  default = "20.0.0.0/21"
  description = "enter the non-production subnet"
} 
variable "non-prod-subnet-2" {
  default = "20.0.8.0/21"
  description = "enter the non-production subnet"
} 
variable "non-prod-subnet-3" {
  default = "20.0.16.0/21"
  description = "enter the non-production subnet"
} 
variable "non-prod-subnet-4" {
  default = "20.0.24.0/21"
  description = "enter the non-production subnet"
} 
variable "non-prod-subnet-5" {
  default = "20.0.32.0/21"
  description = "enter the non-production subnet"
} 
variable "non-prod-subnet-6" {
  default = "20.0.40.0/21"
  description = "enter the non-production subnet"
} 
variable "non-prod-subnet-7" {
  default = "20.0.48.0/21"
  description = "enter the non-production subnet"
} 
variable "non-prod-subnet-8" {
  default = "20.0.56.0/21"
  description = "enter the non-production subnet"
} 


variable "prod-subnet-1" {
  default = "20.0.128.0/21"
  description = "enter the production subnet"
} 
variable "prod-subnet-2" {
  default = "20.0.136.0/21"
  description = "enter the production subnet"
} 
variable "prod-subnet-3" {
  default = "20.0.144.0/21"
  description = "enter the production subnet"
} 
variable "prod-subnet-4" {
  default = "20.0.152.0/21"
  description = "enter the production subnet"
} 
variable "prod-subnet-5" {
  default = "20.0.160.0/21"
  description = "enter the production subnet"
} 
variable "prod-subnet-6" {
  default = "20.0.168.0/21"
  description = "enter the production subnet"
} 
variable "prod-subnet-7" {
  default = "20.0.176.0/21"
  description = "enter the production subnet"
} 
variable "prod-subnet-8" {
  default = "20.0.184.0/21"
  description = "enter the production subnet"
} 
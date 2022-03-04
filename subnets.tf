resource "aws_subnet" "non-prod-pub-a" {
  vpc_id            = aws_vpc.non-Prod-vpc.id
  cidr_block        = var.non-prod-subnet-1
  availability_zone = var.availability-zone-1

  tags = {
    "Name"          = "non-prod-pub-a"
  }
}
resource "aws_subnet" "non-prod-priv-a" {
  vpc_id            = aws_vpc.non-Prod-vpc.id
  cidr_block        = var.non-prod-subnet-2
  availability_zone = var.availability-zone-1

  tags = {
    "Name"          = "non-prod-priv-a"
  }
}
resource "aws_subnet" "non-prod-pub-b" {
  vpc_id            = aws_vpc.non-Prod-vpc.id
  cidr_block        = var.non-prod-subnet-3
  availability_zone = var.availability-zone-2

  tags = {
    "Name"          = "non-prod-pub-b"
  }
}
resource "aws_subnet" "non-prod-priv-b" {
  vpc_id            = aws_vpc.non-Prod-vpc.id
  cidr_block        = var.non-prod-subnet-4
  availability_zone = var.availability-zone-2

  tags = {
    "Name"          = "non-prod-priv-b"
  }
}
resource "aws_subnet" "non-prod-pub-c" {
  vpc_id            = aws_vpc.non-Prod-vpc.id
  cidr_block        = var.non-prod-subnet-5
  availability_zone = var.availability-zone-3

  tags = {
    "Name"          = "non-prod-pub-c"
  }
}
resource "aws_subnet" "non-prod-priv-c" {
  vpc_id            = aws_vpc.non-Prod-vpc.id
  cidr_block        = var.non-prod-subnet-6
  availability_zone = var.availability-zone-3

  tags = {
    "Name"          = "non-prod-priv-c"
  }
}

resource "aws_subnet" "non-prod-pub-d" {
  vpc_id            = aws_vpc.non-Prod-vpc.id
  cidr_block        = var.non-prod-subnet-7
  availability_zone = var.availability-zone-4

  tags = {
    "Name"          = "non-prod-pub-d"
  }
}
resource "aws_subnet" "non-prod-priv-d" {
  vpc_id            = aws_vpc.non-Prod-vpc.id
  cidr_block        = var.non-prod-subnet-8
  availability_zone = var.availability-zone-4

  tags = {
    "Name"          = "non-prod-priv-d"
  }
}



resource "aws_subnet" "prod-pub-a" {
  vpc_id            = aws_vpc.Prod-vpc.id
  cidr_block        = var.prod-subnet-1
  availability_zone = var.availability-zone-1

  tags = {
    "Name"          = "prod-pub-a"
  }
}
resource "aws_subnet" "prod-priv-a" {
  vpc_id            = aws_vpc.Prod-vpc.id
  cidr_block        = var.prod-subnet-2
  availability_zone = var.availability-zone-1

  tags = {
    "Name"          = "prod-priv-a"
  }
}
resource "aws_subnet" "prod-pub-b" {
  vpc_id            = aws_vpc.Prod-vpc.id
  cidr_block        = var.prod-subnet-3
  availability_zone = var.availability-zone-2

  tags = {
    "Name"          = "prod-pub-b"
  }
}
resource "aws_subnet" "prod-priv-b" {
  vpc_id            = aws_vpc.Prod-vpc.id
  cidr_block        = var.prod-subnet-4
  availability_zone = var.availability-zone-2

  tags = {
    "Name"          = "prod-priv-b"
  }
}
resource "aws_subnet" "prod-pub-c" {
  vpc_id            = aws_vpc.Prod-vpc.id
  cidr_block        = var.prod-subnet-5
  availability_zone = var.availability-zone-3

  tags = {
    "Name"          = "prod-pub-c"
  }
}
resource "aws_subnet" "prod-priv-c" {
  vpc_id            = aws_vpc.Prod-vpc.id
  cidr_block        = var.prod-subnet-6
  availability_zone = var.availability-zone-3

  tags = {
    "Name"          = "prod-priv-c"
  }
}

resource "aws_subnet" "prod-pub-d" {
  vpc_id            = aws_vpc.Prod-vpc.id
  cidr_block        = var.prod-subnet-7
  availability_zone = var.availability-zone-4

  tags = {
    "Name"          = "prod-pub-d"
  }
}
resource "aws_subnet" "prod-priv-d" {
  vpc_id            = aws_vpc.Prod-vpc.id
  cidr_block        = var.prod-subnet-8
  availability_zone = var.availability-zone-4

  tags = {
    "Name"          = "prod-priv-d"
  }
}


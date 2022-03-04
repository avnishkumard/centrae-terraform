resource "aws_internet_gateway" "non-Prod-igw" {
  vpc_id = aws_vpc.non-Prod-vpc.id

  tags = {
    Name = "non-Prod-igw"
  }
}

resource "aws_internet_gateway" "Prod-igw" {
  vpc_id = aws_vpc.Prod-vpc.id

  tags = {
    Name = "Prod-igw"
  }
}

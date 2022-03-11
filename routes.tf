
resource "aws_route_table" "non-pro-pub-route" {
  vpc_id = aws_vpc.non-Prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.non-Prod-igw.id
  }

  tags = {
    Name = "non-Prod-pub-route"
  }
}

resource "aws_route_table" "non-pro-pri-route" {
  vpc_id = aws_vpc.non-Prod-vpc.id

  route = []

  tags = {
    Name = "non-Prod-pri-route"
  }
}

resource "aws_route_table" "pro-pub-route" {
  vpc_id = aws_vpc.Prod-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Prod-igw.id
  }

  tags = {
    Name = "Pro-pub-route"
  }
}

resource "aws_route_table" "pro-pri-route" {
  vpc_id = aws_vpc.Prod-vpc.id

  route = []

  tags = {
    Name = "Pro-pri-route"
  }
}


resource "aws_route_table_association" "non-prod-pub-a" {
  subnet_id      = aws_subnet.non-prod-pub-a.id
  route_table_id = aws_route_table.non-pro-pub-route.id
}

resource "aws_route_table_association" "non-prod-priv-a" {
  subnet_id      = aws_subnet.non-prod-priv-a.id
  route_table_id = aws_route_table.non-pro-pri-route.id
}

resource "aws_route_table_association" "non-prod-pub-b" {
  subnet_id      = aws_subnet.non-prod-pub-b.id
  route_table_id = aws_route_table.non-pro-pub-route.id
}

resource "aws_route_table_association" "non-prod-priv-b" {
  subnet_id      = aws_subnet.non-prod-priv-b.id
  route_table_id = aws_route_table.non-pro-pri-route.id
}

resource "aws_route_table_association" "non-prod-pub-c" {
  subnet_id      = aws_subnet.non-prod-pub-c.id
  route_table_id = aws_route_table.non-pro-pub-route.id
}

resource "aws_route_table_association" "non-prod-priv-c" {
  subnet_id      = aws_subnet.non-prod-priv-c.id
  route_table_id = aws_route_table.non-pro-pri-route.id
}

resource "aws_route_table_association" "non-prod-pub-d" {
  subnet_id      = aws_subnet.non-prod-pub-d.id
  route_table_id = aws_route_table.non-pro-pub-route.id
}

resource "aws_route_table_association" "non-prod-priv-d" {
  subnet_id      = aws_subnet.non-prod-priv-d.id
  route_table_id = aws_route_table.non-pro-pri-route.id
}



resource "aws_route_table_association" "prod-pub-a" {
  subnet_id      = aws_subnet.prod-pub-a.id
  route_table_id = aws_route_table.pro-pub-route.id
}

resource "aws_route_table_association" "prod-priv-a" {
  subnet_id      = aws_subnet.prod-priv-a.id
  route_table_id = aws_route_table.pro-pri-route.id
}

resource "aws_route_table_association" "prod-pub-b" {
  subnet_id      = aws_subnet.prod-pub-b.id
  route_table_id = aws_route_table.pro-pub-route.id
}

resource "aws_route_table_association" "prod-priv-b" {
  subnet_id      = aws_subnet.prod-priv-b.id
  route_table_id = aws_route_table.pro-pri-route.id
}

resource "aws_route_table_association" "prod-pub-c" {
  subnet_id      = aws_subnet.prod-pub-c.id
  route_table_id = aws_route_table.pro-pub-route.id
}

resource "aws_route_table_association" "prod-priv-c" {
  subnet_id      = aws_subnet.prod-priv-c.id
  route_table_id = aws_route_table.pro-pri-route.id
}

resource "aws_route_table_association" "prod-pub-d" {
  subnet_id      = aws_subnet.prod-pub-d.id
  route_table_id = aws_route_table.pro-pub-route.id
}

resource "aws_route_table_association" "prod-priv-d" {
  subnet_id      = aws_subnet.prod-priv-d.id
  route_table_id = aws_route_table.pro-pri-route.id
}

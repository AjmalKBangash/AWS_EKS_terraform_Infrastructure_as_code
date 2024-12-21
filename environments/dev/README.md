

.....1 vpc is needed
.....4 we need multiple subnet for mult az availability (2 subnets are public and two are private)
.....1 internet gateway in that one vpc 
.....1 nat gatway one is needed in any public subnet 
.....2 iam roles (control plane iam role and node group iam role) (policies)
.....2 route_tables one for igw and one for ngw

terraform apply (access keys)

Routes
public subnet traffic ----> igw
private subnet traffic ---> ngw ----> igw 

----> ec2 ---> public subnet ---> igw
----> ec2 ---> private subnet ---> ngw ---> eip public is needed ---> public subnet ----> igw


....1 ---> acess keys generate 
....2 vpc, subnets, igw, ngw, eip, route tables (routing rules), iam role with policies (assignment) (cluster)


k8s start (basic knowledge)


query ----> list me all possible concepts and features in k8s ? do not leave any ? only list it ?


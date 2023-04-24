Week 9 - Task 8


DNS record AWS CLI:
- aws configure --profile aws-bosnia
- export AWS_PROFILE=aws-bosnia
- aws route53 change-resource-record-sets --hosted-zone-id <ID> --change-batch '{"Changes":[{"Action":"CREATE","ResourceRecordSet":{"Name":"sabina-dzino.awsbosnia.com","Type":"A","TTL":60,"ResourceRecords":[{"Value":"3.74.43.149"}]}}]}' --profile aws-bosnia
-sudo yum install jq (to be able to read only my DNS record name and value)
- aws route53 list-resource-record-sets --hosted-zone-id Z3LHP8UIUC8CDK | jq '.ResourceRecordSets[] | select(.Name == "sabina-dzino.awsbosnia.com.") | {Name, Value}'

Certificate:
- sudo dnf install python3 augeas-libs
- sudo python3 -m venv /opt/certbot/
- sudo /opt/certbot/bin/pip install --upgrade pip
- sudo /opt/certbot/bin/pip install certbot certbot-nginx
- sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot
- sudo certbot certonly --nginx
- SLEEPTIME=$(awk 'BEGIN{srand(); print int(rand()*(3600+1))}'); echo "0 0,12 * * * root sleep $SLEEPTIME && certbot renew -q" | sudo tee -a /etc/crontab > /dev/null (automatic renewal)

Openssl:
- openssl s_client -connect sabina-dzino.awsbosnia,com:443 | openssl x509 -noout -dates
- openssl s_client -connect sabina-dzino.awsbosnia.com:443

AWS certificate:
- aws route53 change-resource-record-sets --hosted-zone-id <ID> --change-batch '{"Changes":[{"Action":"CREATE","ResourceRecordSet":{"Name":"<CNAME Name>","Type":"CNAME","TTL":60,"ResourceRecords":[{"Value":"<CNAME Value>"}]}}]}' --profile aws-bosnia

Load balancer:
Wasn't able to update the existing DNS record from type A to CNAME, so first deleted the old one:
-aws route53 change-resource-record-sets --hosted-zone-id <ID> --change-batch '{"Changes":[{"Action":"DELETE","ResourceRecordSet":{"Name":"sabina-dzino.awsbosnia.com","Type":"A","TTL":60,"ResourceRecords":[{"Value":"3.74.43.149"}]}}]}' --profile aws-bosnia
Then created a new one for load balancer:
- aws route53 change-resource-record-sets --hosted-zone-id <ID> --change-batch '{"Changes":[{"Action":"UPSERT","ResourceRecordSet":{"Name":"sabina-dzino.awsbosnia.com","Type":"CNAME","TTL":60,"ResourceRecords":[{"Value":"sabina-dzino-alb-task-8-586371840.eu-central-1.elb.amazonaws.com"}]}}]}' --profile aws-bosnia

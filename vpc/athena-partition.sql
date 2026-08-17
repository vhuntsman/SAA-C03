ALTER TABLE vpc_flow_logs
ADD PARTITION (`date`='2026-08-14')
LOCATION 's3://vpcflowlogsdemo-vpcflowlogbucket-kravq3ewnibh/AWSLogs/414691912724/vpcflowlogs/us-east-1/2026/08/14/';

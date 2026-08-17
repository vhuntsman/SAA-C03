ALTER TABLE vpc_flow_logs
ADD PARTITION (`date`='YYYY-MM-DD')
LOCATION 's3://vpcflowlogsdemo-vpcflowlogbucket-<replace_this>/AWSLogs/<replace_this>/vpcflowlogs/us-east-1/YYYY/MM/DD/';

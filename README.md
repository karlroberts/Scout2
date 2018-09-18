# README
#### run the Scout2 AWS audit in a docker container and delegate roles using aws-vault
We use aws-vault to assume Roles that can run a security audit any which ever account we have permissions for. This prevents the need to pass around AWS credentials to perform this crucial task.


## Setup the Docker image

    ./build-docker.sh

## Run
    
    # aws-vault exec <profile from ~/.aws/config> -- ./run.sh
    aws-vault exec my-iam-user -- ./run.sh

### aws config
You should have set up your AWS config such that you have specified a region
and have a profile that can assume a role that has Admin read only permisions

so an example `~/.aws/config` may look like

    [default]
    region=ap-southeast-2
    output=json

    # I have credentials for this user in account 012345678910
    # it uses MFA but has no permisions other than it can assume the 
    # SECURITY_AUDIT role in another account 10987654321
    # SECURITY_AUDIT role has policy `SecurityAudit` or `ReadOnlyAccess` on it.
    [my-iam-user]
    region=ap-southeast-2
    mfa_serial=arn:aws:iam::012345678910:mfa/my.username

    # This profile uses the credentials for `my-iam-user` but assumes a Role in an account
    # that has the AWS managed policy `ReadOnlyAccess` or `SecurityAudit` attached to it
    [profile securityAudit]
    region=ap-souteast-2
    source_profile=my-iam-user
    mfa_serial=arn:aws:iam::012345678910:mfa/my.username
    role_arn=arn:aws:iam::10987654321:role/SECURITY_AUDIT

### credentials
Download an Access Key for the user my.username from the AWS console -> Security Credentials -> Access key panel for the user my.username

Add the credentials to aws-vault

    aws-vault add my-iam-user
    # then follow the prompt






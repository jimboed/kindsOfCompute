## Secrets Manager. 

 
 
A "AP_< domain >_userRole" creates a policy that limits access to the secrets that the pod needs to access

    The policy must Allow: 
    {
        "Effect": "Allow",
        "Action": [
                    "secretsmanager:GetSecretValue", 
                    "secretsmanager:DescribeSecret"
        ],
        "Resource": ["<SECRETARN>"]
    }


    

An "AP_< domain >_userRole" creates a serviceRole and attaches the policy that role.


Any service that assumes the role can access the secret. 
Service Roles must have permission boundary policies attatched to them, so service roles 
can never go outside of the bounds of permssion boundaries set on them. 

It is imposed by ther permission boundary policy, 
that the serviceRole with access to the secret is READ ONLY. 

The ASCP retrieves the pod identity and exchanges it for the IAM role, 
then it can retrieve secrets from Secrets Manager that are authorized for that role.

Other containers can't access the secrets unless you also associate them with the IAM role.

# Networking
## Overview
Sample configurations and necessary knowledge for Calico and Kubernetes Networking

# Calico Policies
## Notes
- Example1
- Example2

## Sample Policies
###### Sample 1:

    apiVersion: projectcalico.org/v3
    kind: NetworkPolicy
    metadata:
      name: post-allow-list
      namespace: microblog
    spec:
      selector: "role == 'k8s-worker'"
      order: 0
      ingress:
      - action: Allow
        protocol: TCP
        source:
          nets:
          - "<your management CIDR>"
        destination:
          ports: [22]
      - action: Allow
        protocol: ICMP
      - action: Allow
        protocol: TCP
        destination:
          ports: [10250]
      egress:
      - action: Allow
        protocol: TCP
        destination:
          nets:
          - "<your etcd IP>/32"
          ports: [2379]
      - action: Allow
        protocol: UDP
        destination:
          ports: [53, 67]

    # see https://docs.tigera.io/security/protect-hosts#avoid-accidentally-cutting-all-host-connectivity

*************************************************************************************

# Kubernetes Networking Policies
## Notes
- Example1
- Example2

## Sample Policies
###### Sample 1:
    apiVersion: networking.k8s.io/v1
    kind: NetworkPolicy
    metadata:
      name: untitled-policy
    spec:
      podSelector: {}
      ingress:
        - from:
            - namespaceSelector:
                matchExpressions:
                  - key: namespace
                    operator: In
                    values:
                      - testone
          ports:
            - port: 443
            - port: 80
        - from:
            - ipBlock:
                cidr: 10.254.0.1/24
          ports:
            - port: 443
            - port: 80
            - port: 22
            - port: 3389
        - from:
            - podSelector:
                matchLabels:
                  app: testone
      egress:
        - to:
            - podSelector:
                matchLabels:
                  app: testone


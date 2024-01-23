# Requirements: 
#   - metallb
#   - traefik
#   - install tls-certificate under certificates

# 1) find bridge interface and add an alias
ifconfig | grep '^bridge' | awk -F":" '{print $1}'
sudo ifconfig bridge100 alias 192.168.66.1 255.255.255.0

# 2) add pool to metallb
add an address-pool to metallb called mo-pool (e.g. 192.168.66.1 - 192.168.66.50)

# 3) patch traefik svc to use the pool
kubectl patch svc -n mogenius traefik -p '{"metadata":{"annotations":{"metallb.universe.tf/ip-allocated-from-pool": "mo-pool"}}}'
kubectl patch svc -n mogenius traefik -p '{"metadata":{"annotations":{"metallb.universe.tf/loadBalancerIPs": "192.168.66.1"}}}'
# 1) find bridge interface
ifconfig | grep '^bridge' | awk -F":" '{print $1}'

# 2) create alias
sudo ifconfig bridge100 alias 192.168.66.1 255.255.255.0; done

# 3) add pool to metallb
add an address-pool to metallb called mo-pool (e.g. 192.168.66.1 - 192.168.66.50)

# 4) patch traefik svc to use the pool
kubectl patch svc -n mogenius traefik -p '{"metadata":{"annotations":{"metallb.universe.tf/ip-allocated-from-pool": "mo-pool"}}}'
kubectl patch svc -n mogenius traefik -p '{"metadata":{"annotations":{"metallb.universe.tf/loadBalancerIPs": "192.168.66.1"}}}'
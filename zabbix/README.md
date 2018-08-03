# Deploy Zabbix with docker

[Zabbix](https://github.com/zabbix/zabbix) is an enterprise-class open source distributed monitoring solution.

## Pure docker

## Swarm

In server node, run

```bash
./swarm_start_mysql.sh

./swarm_start_gateway.sh

./swarm_start_server.sh

./swarm_start_web.sh
```

In agent nodes, run
```bash
./swarm_start_agent.sh
``

*Notes:*`
*Replace SERVER_HOST as the real server node ip*
*Set mysql persistent location*
*Only Zabbix Agent(active) items are supported since swarm will produce different ips which not in the allowed hosts*

## k8s


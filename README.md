## Tigase docker PoC

- docker-compose build
- Set DBPREP=1 in data/scripts/start-endpoint.sh for DB preparation ( DB\user creation ), xmpp-server container will go in infinite sleep after
- stop all containers
- Set DBPREP=0 in data/scripts/start-endpoint.sh for tigase server start 


# Services :

| Service   | URL | Note |
| :---       | :---    | :--- |
| mysql | 'tcp:localhost:3306' | |
| adminer | 'http://localhost:8081' | |
| tigase-webui | 'http://localhost:8080' | |
| tigase-xmpp | 'tcp://localhost:5222' | Default xmpp socket port |
| tigase-xmpp | 'tcp://localhost:5223' | Legacy xmpp socket port |
| tigase-s2s | 'tcp://localhost:5269' | Default s2s port, i.e.: federation support |
| tigase-component | 'tcp://localhost:5277' | component protocol port, e.g.: for external components |
| tigase-bosh | 'tcp://localhost:5280' | Default BOSH port - plain |
| tigase-bosh | 'tcp://localhost:5281' | Default BOSH port - ssl |
| tigase-wss | 'tcp://localhost:5290' | Default WebSocket port - plain |
| tigase-wss | 'tcp://localhost:5291' | Default WebSocket port - ssl |
| tigase-jmxxmon | 'tcp://localhost:9050' | JMX Monitoring |

# docker-squid-noauth
Simple squid container to provide access for any kind a application through a corporate proxy that needs authentication.


# Usage

TODO

## Example

```
docker run -d --restart=always \
  -p 3128:3128 \
  -e PROXY=proxy.yourcompany.com \
  -e PORT=8080 \
  -e USERNAME=foo \
  -e PASSWORD=bar \
  jcoeltjen/squid-noauth
```

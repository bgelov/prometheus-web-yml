## What kind of script is this?
The script generates a web.yml file with a password hash using [bcrypt](https://en.wikipedia.org/wiki/Bcrypt), which is necessary to enable basic authentication for Prometheus.

## How does it work?
The script prompts for username and password.
When you enter username and password, you need waiting 10 seconds timeout for bcrypt processing.
- If there is a web.yml file, you will be prompted to either recreate it or add credentials to the end of the file.
- If there is no web.yml file, a new file will be generated.

## Example of a generated file
```
basic_auth_users:
  test:$2y$17$Ac2deeUOLKZSP2L81awluuTAiisMp46T4NTJ0MX3tpfPXC3MUVl8G
```

## Why is it necessary?
Read the article by [JFrog](https://github.com/jfrog): [Don’t let Prometheus Steal your Fire](https://jfrog.com/blog/dont-let-prometheus-steal-your-fire/)


## Add rights for executing .sh file
```
chmod u+x generate_web_yml.sh
```

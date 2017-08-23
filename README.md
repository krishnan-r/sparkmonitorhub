Docker Images for jupyterhub with the SparkMonitor Extension

- The image downloads a sparkmonitor from a tagged github release mentioned in the docker file
- To update the extension version, change the tag version in the dockerfile
- The extension adds a modified systemuser.sh startup script with necessary configurations
- The image also adds a python startup script that adds options mentioned in startup.py to the SparkConf given to the user.


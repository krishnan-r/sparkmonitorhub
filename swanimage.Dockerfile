FROM cernphsft/systemuser:test

# #Possible fix for serverextension not loading??
RUN pip install jupyter_nbextensions_configurator 
ADD ./notebooks/ /notebooks/


RUN which pip3; pip3 install https://github.com/krishnan-r/sparkmonitor/releases/download/v0.0.8/sparkmonitor.tar.gz
RUN which pip2; pip2 install https://github.com/krishnan-r/sparkmonitor/releases/download/v0.0.8/sparkmonitor.tar.gz
RUN which pip; pip install https://github.com/krishnan-r/sparkmonitor/releases/download/v0.0.8/sparkmonitor.tar.gz

#RUN sudo /usr/local/bin/jupyter serverextension enable sparkmonitor --py
RUN which jupyter; jupyter serverextension enable sparkmonitor --sys-prefix --py
RUN which jupyter; jupyter serverextension enable sparkmonitor --user --py
RUN which jupyter; jupyter serverextension enable sparkmonitor --py
# RUN which jupyter; jupyter serverextension enable sparkmonitor --system --py


ADD startup.py /srv/singleuser/startup.py
ADD systemuser.sh /srv/singleuser/systemuser.sh
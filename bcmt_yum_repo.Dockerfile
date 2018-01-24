FROM registry.access.redhat.com/rhel7.4


COPY ./*.repo /etc/yum.repos.d/

RUN touch /var/lib/rpm/*;\
    yum --noplugins -y install nginx && \
    yum --noplugins -y clean all && \
    rm -rf /var/cache/yum /etc/yum.repos.d/*.repo && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

# COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

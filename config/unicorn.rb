working_directory /home/deployer/apps/captest/current


# listen on both a Unix domain socket and a TCP port,
# we use a shorter backlog for quicker failover when busy
listen "/tmp/unicorn.#{application}.sock", :backlog => 64
listen 8080, :tcp_nopush => true

# nuke workers after 30 seconds instead of 60 seconds (the default)
timeout 30

# feel free to point this anywhere accessible on the filesystem
pid "/#{working_directory}/shared/pids/unicorn.pid"

stderr_path "/#{working_directory}/shared/log/unicorn.stderr.log"
stdout_path "/#{working_directory}/shared/log/unicorn.stdout.log"
worker_processes 2
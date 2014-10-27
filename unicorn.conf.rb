# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.

APP_PATH = ''

worker_processes 4

working_directory APP_PATH

listen "#{APP_PATH}/unicorn.sock", backlog: 64
# listen 8080, :tcp_nopush => true

pid "#{APP_PATH}/unicorn.pid"

stderr_path "#{APP_PATH}/log/unicorn.stderr.log"
stdout_path "#{APP_PATH}/log/unicorn.stdout.log"

# combine Ruby 2.0.0dev or REE with "preload_app true" for memory savings
# http://rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
preload_app true
GC.respond_to?(:copy_on_write_friendly=) &&
  GC.copy_on_write_friendly = true

before_fork do |_server, _worker|
  defined?(DB) && DB.disconnect
end

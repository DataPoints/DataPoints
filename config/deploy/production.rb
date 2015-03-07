# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# Don't declare `role :all`, it's a meta role
role :app, %w{rails@178.62.29.235}
role :web, %w{rails@178.62.29.235}
role :db,  %w{rails@178.62.29.235}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.

# server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
# and/or per server

# server 'example.com',
# user: 'deploy',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options

# Define server(s)
set :password, ask('Server password', nil)
server '178.62.29.235', user: 'rails', password: fetch(:password), roles: %w{web app db}


# add email addresses for people who should receive deployment notifications
load 'config/deploy/cap_notify.rb'

# Create task to send a notification
namespace :deploy do
  desc "Send email notification"
  task :send_notification do
    Notifier.deploy_notification.deliver
  end
end

after :deploy, 'deploy:send_notification'

# desc 'Post deploy actions'
# task :postprocess do
#   on roles(:app), in: :sequence, wait: 1 do
#       within '/home/deploy/datapoints/current' do
#           # commands in this block execute as the "deploy" user.
#           # with rails_env: :production do
#               # execute *%w[ bundle install ]
#               # execute ""
#               # execute "rake assets:precompile"
#               # execute "rake db:migrate"
#           end
#       end
#   end
# end

# after 'deploy:published', :postprocess

# on roles(:app), in: :sequence, wait: 1 do
#   within "/home/deploy/datapoints/current" do
#       # commands in this block execute as the "deploy" user.
#       with rails_env: :production do
#         # commands in this block execute with the environment
#         # variable RAILS_ENV=production
#         execute "pwd"
#         # execute "rake assets:precompile"
#         # execute "rake db:migrate"
#       end
#   end
# end


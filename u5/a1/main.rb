#!/usr/bin/env ruby


def reset
  name = 'Reset'
  puts "[INFO] #{name} configuration..."
  system "sudo ipdown eth0"
  system "sudo ipup eth0"
end

def set_classroom109
  name = 'classroom109'
  puts "[INFO] Setting '#{name}' configuration..."
  system "sudo ip addr add 172.19.16.33/16 dev eth0"
end

def set_myhome
  name = 'myhome'
  puts "[INFO] Setting '#{name}' configuration..."
  system "sudo ip addr add 192.168.1.116/24 dev eth0"
end

def refresh
  name = 'Refresh'
  puts "[INFO] '#{name}' configuration..."
  system "sudo dhclient -r eth0"
end

def change_network_configuration
  puts "==================================="
  puts "chnet: CHange NETwork configuration"
  puts "==================================="
  puts " r. Reset"
  puts " 1. Classroom 109"
  puts " 2. My home"
  puts " 3. Refresh"
  print "\n Select option [Enter=exit]: "
  option = gets.chop

  reset if option == 'r'
  set_classroom109 if option == '1'
  set_myhome if option == '2'
end

change_network_configuration

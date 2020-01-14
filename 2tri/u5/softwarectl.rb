#!/usr/bin/env ruby


#
option = ARGV[0]
filename = ARGV[1]

def check(f_package)
  status = `whereis #{f_package[0]} |grep bin |wc -l`.to_i
    if status == 0
      puts "#{f_package[0]} ->  (U) uninstalled"
    elsif status == 1
      puts "#{f_package[0]} ->  (I) installed"
    end
end

#[ Instala el software. ]
def install(f_package)
  status = `whereis #{f_package[0]} |grep bin |wc -l`.to_i
  action = "#{f_package[1]}".to_s

#[ Install the software. ]
  if action == "install"
    if status == 0
      `apt-get install -y #{f_package[0]}`
      puts "#{f_package[0]} -> (I) installing📥"
    elsif status == 1
      puts "#{f_package[0]} -> (I) is already installed"
    end
#[ Uninstall the software. ]
  elsif action == "remove"
      if status == 1
        `apt-get remove -y  #{f_package[0]}`
        puts "#{f_package[0]} -> (U) uninstalling"
      elsif status == 0
        puts "#{f_package[0]} -> (U) isn't installed🙄"
      end
  end
end
# [ Show this help. ]
if option == '--help'
  puts 'Usage:
        systemctml [OPTIONS] [FILENAME]
Options:
        --help, 🌏 Show this help.
        --version, 📍 Show information about the author of the script and creation date.
        --status FILENAME.txt, ⏪ Check if you can install / uninstall.
        --run FILENAME.txt, 🚐 Install / uninstall the indicated software.
Description :
        This script is responsible for installing / uninstalling
        the software indicated in the FILENAME file ✍.
        FILENAME example:
        tree:install
        nmap:install
        atomix:remove'
# [ Show information about the author of the script and creation date.]
elsif option == '--version'
  puts 'Author: Iria Rodríguez Hernández
Date: 14/01/20'
#[ Check if you can install / uninstall.]
elsif option == '--status'
  puts 'Status:'
  file = `cat #{filename}`
  f_lines = file.split("\n")
  f_lines.each do |a|
    f_package = a.split(":")
    check(f_package)
  end

elsif option.nil?
  puts 'The use of "--help" is recommended to see the help.😉'

#[ Install / uninstall the indicated software.]
elsif option == '--run'
  user = `id -u`.to_i
  if user == 0
    puts "Run.#{filename} :"
    file = `cat #{filename}`
    f_lines = file.split("\n")
    f_lines.each do |a|
      f_package = a.split(":")
      install(f_package)
    end

  elsif user != 0
    puts "You need the root user to run script.🔑 "
    exit 1
  end
end

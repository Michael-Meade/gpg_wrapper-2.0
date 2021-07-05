require_relative '../gpg'
require 'colorize'
class Key
	def self.list_keys
		puts Utils.run_command("gpg --list-keys")
	end
	def self.export_publickey(username)
		if !username.nil?
			Utils.run_command("gpg --export -a --default-key #{username} > public.key")
		else
			Utils.run_command("gpg --export -a  > public.key")
		end
	end
	def self.import(filename)
		out = Utils.run_command("gpg --import  --textmode #{filename}")
		
	end
	def self.export_key(username, output=nil)
		if !output.nil?
			Utils.run_command("gpg --export -a '#{username}' > #{output}")
		else 
			Utils.run_command("gpg --export -a #{username} > output/#{username}.key")
		end
	end
end

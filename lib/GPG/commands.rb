require_relative '../gpg'
class Commands
	def self.sign_file(username, file, passphrase)
		# Signs file. if username is not nil it will use
		# username
		Utils.run_command("gpg --sign --passphrase #{passphrase} --default-key #{username} #{file}")
	end
	def self.verify(username=nil, file)
		# Verify the file
		if username.nil?
			results = Utils.run_command("gpg --verify #{file}")
		else
			results = Utils.run_command("gpg --default-keys #{username} --verify #{file}")
		end
		puts results
	end
	def self.encrypt_w_recipient(recipient_uid, file)
		Utils.run_command(" gpg -a -e -r #{recipient_uid} #{file}")
	end
	def self.encrypt_file(recipient_uid, file)
		# encrypt a plaintext file with the recipient's public key
		Utils.run_command("gpg -a --yes -e -r #{recipient_uid} #{file} ")
	end
	def self.sign_encrypt(recipient_uid, username, passphrase, file)
		Utils.run_command("gpg -se --yes --always-trust --passphrase #{passphrase} --default-key #{username}  -r #{recipient_uid} #{file}")
	end
	def self.clear_sign(username, file)
		# Sign a  plaintext file with your secret key and have the output
		# readable to people without running GPG
		if !username.nil?
			Utils.run_command("gpg --default-key #{username} --clearsign #{file}")
		else
			Utils.run_command("gpg --clearsign #{file}")
		end
	end
end

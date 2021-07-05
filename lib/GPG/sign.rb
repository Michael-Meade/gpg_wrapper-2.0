require_relative '../gpg'
class Sign
	def self.sign_file(username, file, passphrase)
		# Signs file. if username is not nil it will use
		# username
		Utils.run_command("gpg --sign --passphrase #{passphrase} --default-key #{username} #{file}")
	end
	def self.sign_encrypt(recipient_uid, username, passphrase, file)
		# this will sign AND encrpyt the file.
		Utils.run_command("gpg -se --yes --always-trust --passphrase #{passphrase} --default-key #{username}  -r #{recipient_uid} #{file}")
	end
end
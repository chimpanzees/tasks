## aTech Identity Configuration & Initialization File
## This file contains the information required to set this application up to 
## authenticate and manage aTech identities.

require 'atech_identity'

case Rails.env
when 'development'
  AtechIdentity.application = '09c90df8-8a10-de6c-0912-233e9866c433'
  AtechIdentity.application_key = File.read(File.join(Rails.root, 'config', 'identity.development.key'))
  AtechIdentity.endpoint = 'sandbox.identity.atechmedia.com'
else
  AtechIdentity.application = '{enter your product key here when you have it}'
  AtechIdentity.application_key = File.read(File.join(Rails.root, 'config', 'identity.key'))
end

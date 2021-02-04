class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  routing /standups\.[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}@/i => :standups
end

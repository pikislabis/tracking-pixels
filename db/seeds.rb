unless User.any?
  User.create(email: ENV['ADMIN_EMAIL'],
              password: ENV['ADMIN_PASSWORD'],
              confirmed_at: DateTime.now)
end

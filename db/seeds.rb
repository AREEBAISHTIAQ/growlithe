User.create!(name:  "Admin User",
    email: "admin@admins.com",
    password:              "foobar",
    password_confirmation: "foobar",
    admin: true,
    activated: true,
    activated_at: Time.zone.now)

class AccountManager < User
  default_scope where(role_id: 1)
end

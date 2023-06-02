class User < ApplicationRecord
end

class User < ApplicationRecord
  has_secure_password
end

class User < ApplicationRecord
  has_many :posts
end


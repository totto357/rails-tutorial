class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true,
                    length: {maximum: 255},
                    format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}

  before_save { email.downcase! }

  has_secure_password

  # 渡された文字列のハッシュ値を返す
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? Bcrypt::Engine::MIN_COST : Bcrypt::Engine.cost
    Bcrypt::Password.create(string, cost: cost)
  end
end

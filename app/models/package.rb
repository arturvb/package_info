class Package < ApplicationRecord
  has_many :versions
  has_many :vulnerabilities
end

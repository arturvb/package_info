class Version < ApplicationRecord
  belongs_to :package
  has_many :vulnerabilities
end

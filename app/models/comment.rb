class Comment < ApplicationRecord
  # active record association to the article db:
  belongs_to :article
end

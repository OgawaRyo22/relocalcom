require 'bundler/setup'

require './image_uploader.rb'


Bundler.require




if development?
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL']||"sqlite3:db/development.db")
end


class User < ActiveRecord::Base

has_secure_password

validates :name, presence: true
validates :email, presence: true
validates :password_digest, presence: true
validates :user_name, presence: true
validates :location, presence: true
validates :user_name, uniqueness: true
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
validates :password_digest,    length: { minimum: 8 }

has_many :tasks
has_many :user_tags

    has_many :ustags, through: :user_tags
end

class Ustag < ActiveRecord::Base
    has_many :user_tags

    has_many :users, through: :user_tags
end

class UserTag < ActiveRecord::Base
    belongs_to :user
    belongs_to :ustag

end

class Task < ActiveRecord::Base

    has_many :task_tags

    has_many :tags, through: :task_tags

belongs_to :user
end

class TaskTag < ActiveRecord::Base
    belongs_to :tag
    belongs_to :task
end

class Tag < ActiveRecord::Base


has_many :task_tags


    has_many :tasks, through: :task_tags



end
